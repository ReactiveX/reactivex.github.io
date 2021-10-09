---
layout: documentation
title: ReactiveX - Menerapkan Operator Anda Sendiri
lang: id
id: implement-operator
---

#Menerapkan Operator Anda Sendiri

Anda bisa menerapkan operator Observable anda sendiri. Halaman ini akan mengajarkan anda bagaimana caranya.

Jika operator anda didesain untuk lebih ke arah *inisiasi* sebuah Observable daripada untuk merubah atau bereaksi terhadap Observable sumber, anda dianjurkan untuk memakai method [`create( )`](Operators/create) daripada mencoba untuk menerapkan `Observable` secara manual. Jika tidak, ikuti petunjuk dibawah ini.

# Menambatkan Operator Kustom dengan Operator Standar RxJava

Contoh berikut ini menunjukkan kepada anda bagaimana caranya untuk menambatkan sebuah operator kustom (dalam kasus ini: `myOperator`) dengan sebuah operator standar RxJava dengan menggunakan operator `lift( )`:

```groovy
Observable foo = barObservable.ofType(Integer).map({it*2}).lift(new myOperator<T>()).map({"transformed by myOperator: " + it});
```
Bagian dibawah ini akan menunjukkan kepada anda bagaimana caranya untuk membentuk kerangka operator anda agar bisa bekerja dengan baik dengan `lift( )`.

# Menerapkan Operator Anda 

Definisikan operator anda sebagai suatu public class yang mengimplementasi interface [`Operator`](http://reactivex.io/RxJava/javadoc/rx/Observable.Operator.html), seperti berikut:

```java
public class myOperator<T> implements Operator<T> {
  public myOperator( /* any necessary params here */ ) {
    /* any necessary initialization here */
  }

  @Override
  public Subscriber<? super T> call(final Subscriber<? super T> s) {
    return new Subscriber<t>(s) {
      @Override
      public void onCompleted() {
        /* add your own onCompleted behavior here, or just pass the completed notification through: */
        if(!s.isUnsubscribed()) {
          s.onCompleted();
        }
      }

      @Override
      public void onError(Throwable t) {
        /* add your own onError behavior here, or just pass the error notification through: */
        if(!s.isUnsubscribed()) {
          s.onError(t);
        }
      }

      @Override
      public void onNext(T item) {
        /* this example performs some sort of simple transformation on each incoming item and then passes it along */
        if(!s.isUnsubscribed()) {
          transformedItem = myOperatorTransformOperation(item);
          s.onNext(transformedItem);
        }
      }
    };
  }
}
``` 

# Beberapa Pertimbangan Lainnya

* Operator anda harus mengecek [status `isUnsubscribed( )` dari subsriber-subscribernya](Observable#unsubscribing) sebelum memancarkan item apapun kepada (atau mengirim notifikasi apapun) ke subscriber tersebut. Jangan membuat waktu untuk membuat item yang tidak diperhatikan oleh subscriber manapun.
* Operator anda harus mematuhi prinsip utama dari kontrak Observable::
  * Dapat memanggil fungsi [`onNext( )`](Observable#onnext-oncompleted-and-onerror) dari sebuah subscriber tidak peduli berapa kali pun, namun pemanggilan tersebut tidak boleh saling tumpang tindih.
  * Dapat memanggil baik fungsi [`onCompleted( )`](Observable#onnext-oncompleted-and-onerror) atau [`onError( )`](Observable#onnext-oncompleted-and-onerror) dari sebuah subscriber, tetapi tidak keduanya, hanya sekali, dan tidak memanggil fungsi [`onNext( )`](Observable#onnext-oncompleted-and-onerror) dari subscriber tersebut setelahnya.
  * Jika anda tidak dapat menjamin operator anda memenuhi dua prinsip diatas, anda dapat menambahkan operator [`serialize( )`](Observable-Utility-Operators#serialize) kepadanya untuk memaksa agar mematuhi aturan dengan benar.
* Jangan melakukan hal yang dapat memblokir didalam operator anda.
* Biasanya cara terbaik adalah anda membuat operator baru dengan cara menggabungkan operator-operator yang sudah ada, daripada harus membuat sesuatu dari awal lagi. RxJava sendiri juga menerapkan hal ini, contohnya:
  * [`first( )`](Filtering-Observables#wiki-first-and-takefirst) didefinisikan sebagai [`take(1)`](Filtering-Observables#wiki-take)`.`[`single( )`](Observable-Utility-Operators#wiki-single-and-singleordefault)
  * [`ignoreElements( )`](Filtering-Observables#wiki-ignoreelements) didefinisikan sebagai [`filter(alwaysFalse( ))`](Filtering-Observables#wiki-filter)
  * [`reduce(a)`](Mathematical-and-Aggregate-Operators#wiki-reduce) didefinisikan sebagai [`scan(a)`](Transforming-Observables#wiki-scan)`.`[`last( )`](Filtering-Observables#wiki-last)
* Jika operaator anda menggunakan fungsi atau lambda yang diteruskan sebagai parameter (predikat, contohnya), perhatikan bahwa fungsi atau lambda tersebut bisa menjadi sumber exceptions, dan bersiaplah untuk menangkap exceptions tersebut dan memberitahu subscriber anda melalui `onError( )`.
* Secara umum, beritahu subscriber anda akan kondisi error yang terjadi sesegera mungkin, daripada mencoba untuk memancarkan lebih banyak item lagi.
* Dalam beberapa implementasi ReactiveX, operator anda mungkin harus sensitif terhadap strategi &ldquo;backpressure&rdquo; dari implementasinya. (Lihat, contohnya: <a href="http://akarnokd.blogspot.hu/2015/05/pitfalls-of-operator-implementations_14.html">Pitfalls of Operator Implementations (part 2)</a> oleh D&aacute;vid Karnok.)

# Lihat Juga
* <a href="http://akarnokd.blogspot.hu/2015/05/pitfalls-of-operator-implementations.html">Pitfalls of Operator Implementations (part 1)</a> dan <a href="http://akarnokd.blogspot.hu/2015/05/pitfalls-of-operator-implementations_14.html">(part 2)</a> oleh D&aacute;vid Karnok.
* <a href="http://xgrommx.github.io/rx-book/content/getting_started_with_rxjs/implementing_your_own_operators.html">Implementing Your Own Observable Operators</a> (dalam RxJS) oleh Dennis Stoyanov
