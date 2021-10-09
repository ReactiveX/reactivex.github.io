---
layout: documentation
title: ReactiveX - Single
lang: id
id: single
---

<h1>Single</h1>
<p>
 RxJava (and turunannya seperti RxGroovy &amp; RxScala) telah mengembangkan sebuah varian <a href="observable.html">Observable</a> yang disebut &ldquo;Single.&rdquo;
</p><p>
 Sebuah Single merupakan sesuatu yang mirip seperti Observable. tetapi berbeda dengan Observable yang memancarkan sebuah runtutan nilai &mdash; dari tidak ada sama sekali hingga tidak terhingga &mdash;, sebuah Single selalu memancarkan tepat satu nilai atau sebuah notifikasi error.
</p><p>
 Untuk alasan ini, daripada melakukan subscribe ke sebuah Single dengan tiga cara yang anda lakukan untuk merespon kepada notifikasi dari sebuah Observable (<tt>onNext</tt>, <tt>onError</tt>, and <tt>onCompleted</tt>), anda hanya akan menggunakan dua method untuk melakukan subscribe:
</p><dl>
 <dt>onSuccess</dt>
  <dd>sebuah Single meneruskan method ini dengan satu satunya item yang akan dipancarkan oleh Single tersebut</dd>
 <dt>onError</dt>
  <dd>sebuah Single meneruskan method ini dengan Throwable yang menyebabkan Single tidak bisa memancarkan item</dd>
</dl><p>
 Sebuah Single hanya akan memanggil salah satu dari 2 method ini, dan hanya akan memanggilnya sekali. Setelah selai melakukan pemanggilan salah satu dari 2 method tersebut, Single tersebut akan berhenti secara otomatis dan semua subscription kepada Single tersebut juga akan berhenti.
</p>

<h1>Komposisi melalui Operator Single</h1>
<p>
 Seperti Observable, Single bisa dimanipulasi dengan berbagai operator. Beberapa operator juga memungkinkan penggunaan interface diantara Observable dan Single sehingga anda dapat menggabungkan keduanya:
</p>
<table class="table table-striped">
 <thead>
  <tr><th>operator</th><th>tipe</th><th>deskripsi</th></tr>
 </thead>
 <tbody>
  <tr><td><tt>compose</tt></td><td><tt>Single</tt></td><td>membuat anda bisa membuat operator kustom</td></tr>
  <tr><td><tt>concat</tt> dan <tt>concatWith</tt></td><td><tt>Observable</tt></td><td>menggabungkan item yang dipancarkan oleh beberapa Single sebagai pancaran Observable</td></tr>
  <tr><td><tt>create</tt></td><td><tt>Single</tt></td><td>membuat sebuah Single dari awal dengan cara memanggil method subscriber</td></tr>
  <tr><td><tt>delay</tt></td><td><tt>Single</tt></td><td>move the emission of an item from a Single forward in time</td></tr>
  <tr><td><tt>doOnError</tt></td><td><tt>Single</tt></td><td>mengembalikan sebuah Single yang juga memanggil sebuah method yang anda tentukan ketika onError dipanggil</td></tr>
  <tr><td><tt>doOnSuccess</tt></td><td><tt>Single</tt></td><td>mengembalikan sebuah Single yang juga memanggil sebuah method yang anda tentukan ketika onSuccess dipanggil</td></tr>
  <tr><td><tt>error</tt></td><td><tt>Single</tt></td><td>mengembalikan sebuah Single yang langsung memberitahu subscriber-subscribernya jika terjadi error</td></tr>
  <tr><td><tt>flatMap</tt></td><td><tt>Single</tt></td><td>mengembalikan sebuah Single yang dimana merupakan hasil dari fungsi yang diaplikasikan kepada satu item yang dipancarkan oleh Singke</td></tr>
  <tr><td><tt>flatMapObservable</tt></td><td><tt>Observable</tt></td><td>mengembalikan sebuah Observable yang merupakan hasil dari fungsi yang diaplikasikan ke sebuah item yang dipancarkan oleh Single</td></tr>
  <tr><td><tt>from</tt></td><td><tt>Single</tt></td><td>mengubah sebuah Future menjadi sebuah Single</td></tr>
  <tr><td><tt>just</tt></td><td><tt>Single</tt></td><td>mengembalikan sebuah Single yang memancarkan suatu item tertentu</td></tr>
  <tr><td><tt>map</tt></td><td><tt>Single</tt></td><td>mengembalikan sebuah Single yang memancarkan hasil dari sebuah fungsi yang diaplikasikan ke item yang dipancarkan oleh Single sumber</td></tr>
  <tr><td><tt>merge</tt></td><td><tt>Single</tt></td><td>mengubah sebuah Single yang memancarkan sebuah Single kedua menjadi sebuah Single yang memancarkan item-item yang dipancarkan oleh Single kedua tersebut</td></tr>
  <tr><td><tt>merge</tt> and <tt>mergeWith</tt></td><td><tt>Observable</tt></td><td>menggabungkan item-item yang dipancarkan oleh beberapa Single menjadi pancaran-pancaran Observable</td></tr>
  <tr><td><tt>observeOn</tt></td><td><tt>Single</tt></td><td>menginstruksikan Single untuk memanggil method subscriber pada <a href="scheduler.html">Scheduler</a> tertentu</td></tr>
  <tr><td><tt>onErrorReturn</tt></td><td><tt>Single</tt></td><td>mengubah sebuah Single yang membuat suatu notifikasi error menjadi sebuah Single yang memancarkan item tertentu</td></tr>
  <tr><td><tt>subscribeOn</tt></td><td><tt>Single</tt></td><td>menginstruksikan Single untuk beroperasi pada <a href="scheduler.html">Scheduler</a> tertentu</td></tr>
  <tr><td><tt>timeout</tt></td><td><tt>Single</tt></td><td>mengembalikan sebuah Single yang membuat notifikasi error jika Single sumber tidak memancarkan apapun dalam jangka waktu tertentu</td></tr>
  <tr><td><tt>toSingle</tt></td><td><tt>Single</tt></td><td>mengubah sebuah Observable yang memancrkan sebuah item menjadi sebuah Single yang memancarkan item tersebut</td></tr>
  <tr><td><tt>toObservable</tt></td><td><tt>Observable</tt></td><td>mengubah sebuah Single menjadi sebuah Observable yang memancarkan item yang dipancarkan oleh Single tersebut lalu kemudian akan selesai</td></tr>
  <tr><td><tt>zip</tt> and <tt>zipWith</tt></td><td><tt>Single</tt></td><td>mengembalikan sebuah Single yang memancarkan sebuah item, dimana item tersebut merupakan hasil dari sebuah fungsi yang diaplikasikan ke item-item yang dipancarkan oleh dua atau lebih Single</td></tr>
 </tbody>
</table>
<p>
 Bagian dibawah dari halaman ini akan menampilan diagram kelereng yang akan menjelaskan operator-operator tersebut
 The following sections of this page will give marble diagrams that explain these operators secara berurutan. Diagram ini menjelaskan bagaimana Single direpresentasikan dalam diagram kelereng:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.legend.png" width="100%" />
<h2>compose</h2>
<h2>concat and concatWith</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.concat.png" width="100%" />
<p>
 Ada juga versi contoh dari operator ini:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.concatWith.png" width="100%" />
<h2>create</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.create.png" width="100%" />
<h2>delay</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.delay.png" width="100%" />
<p>
  Ada juga versi dari operator ini yang memungkinkan anda untuk melakukan penundaan pada waktu tertentu
 <a href="scheduler.html">Scheduler</a>:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.delay.s.png" width="100%" />
<h2>doOnError</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.doOnError.png" width="100%" />
<h2>doOnSuccess</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.doOnSuccess.png" width="100%" />
<h2>error</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.error.png" width="100%" />
<h2>flatMap</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.flatMap.png" width="100%" />
<h2>flatMapObservable</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.flatMapObservable.png" width="100%" />
<h2>from</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.from.Future.png" width="100%" />
<p>Ada juga jenis yang memerlukan sebuah <a href="scheduler.html">Scheduler</a> sebagai argumen:
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.from.Future.s.png" width="100%" />
<h2>just</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.just.png" width="100%" />
<h2>map</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.map.png" width="100%" />
<h2>merge and mergeWith</h2>
<p>
 Satu versi dari merge yang mengambil Single yang memancarkan sebuah Single kedua dan kemudian mengubahnya menjadi sebuah Single yang memancarkan item-item yang dipancarkan oleh Single kedua:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.merge.oo.png" width="100%" />
<p>
 Versi lainnya mengambil dua atau lebih Single dan menggabungkan mereka manjadi sebuah Observable yang memancarkan item-item yang sebelumnya dipancarkan oleh Single sumbernya (dalam urutan yang acak):
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.merge.png" width="100%" />
<h2>observeOn</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.observeOn.png" width="100%" />
<h2>onErrorReturn</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.onErrorReturn.png" width="100%" />
<h2>subscribeOn</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.subscribeOn.png" width="100%" />
<h2>timeout</h2>
<p>
 Timeout akan menyebabkan sebuah Single untuk membatalkan dengan sebuah notifikasi error jika Single tersebut tidak memancarkan sebuah item dalam jangka waktu tertentu setelah di-subscribe. Salah satu versi memungkinkan anda untuk mengatur timeout menggunakan beberapa satuan waktu:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.timeout.1.png" width="100%" />
<p>
 Anda juga bisa menentukan <a href="scheduler.html">Scheduler</a> tertentu sebagai tempat timer tersebut akan beroperasi:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.timeout.1s.png" width="100%" />
<p>
 Sebuah versi dari operator timeout yang memungkinkan anda untuk berubah menjadi sebuah Single cadangan daripada mengirimkan notifikasi error jika timout tersebut sudah melewati batas waktu yang ditentukan:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.timeout.2.png" width="100%" />
<p>
 Ini, juga, mempunyai sebuah <a href="scheduler.html">Scheduler</a> yang spesifik sesuai versinya:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.timeout.2s.png" width="100%" />
<h2>toObservable</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.toObservable.png" width="100%" />
<h2>zip dan zipWith</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.zip.png" width="100%" />
