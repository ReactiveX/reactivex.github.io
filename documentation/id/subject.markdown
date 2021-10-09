---
layout: documentation
title: ReactiveX - Subject
lang: id
id: subject
---

<h1>Subject</h1>
<p>
 Sebuah Subject adalah semacam jembatan atau proksi yang bisa digunakan di beberapa implementasi ReactiveX yang berperan sebagai sebuah observer sekaligus sebagai sebuah Observable. Dikarenakan Subject merupakan sebuah observer, Subject mampu melakukan subscribe kepada satu atau lebih Observable. Dan karena Subject juga merupakan sebuah observer, Subject juga mampu melewatkan item-item yang di-observe olehnya dengan cara memancarkan mereka kembali, dan Subject juga bisa memancarkan item-item baru.
</p><p>
 Dikarenakan sebuah Subject melakukan subscribe kepada sebuah Obervable, dia akan memicu Observable tersebut untuk memulai memancarkan item-item (Jika observable tersebut merupakan Observable yang "dingin", yang dimana artinya jika Observable tersebut menunggu sebuah subscription sebelum memancarkan item-item). Ini bisa mengakibatkan Subject tersebut menjadi sebuah Observable yang "panas", varian yang lain dari Observable yang "dingin".
</p>
<h4>Lihat Juga</h4>
<ul>
 <li><a href="http://davesexton.com/blog/post/To-Use-Subject-Or-Not-To-Use-Subject.aspx">To Use or Not to Use Subject</a> dari <cite>Blog Dave Sexton</cite></li>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#Subject"><cite>Introduction to Rx</cite>: Subject</a></li>
 <li><a href="http://rxwiki.wikidot.com/101samples#toc44"><cite>101 Rx Samples</cite>: ISubject&lt;T&gt; and ISubject&lt;T1,T2&gt;</a></li>
 <li><a href="http://akarnokd.blogspot.hu/2015/06/subjects-part-1.html">Advanced RxJava: Subject</a> oleh Dávid Karnok</li>
 <li><a href="http://xgrommx.github.io/rx-book/content/getting_started_with_rxjs/subjects.html">Using Subjects</a> oleh Dennis Stoyanov</li>
</ul>
<h2>Jenis-jenis Subject</h2>
<p>
 Ada 4 jenis dari <code>Subject</code> yang didesain untuk penggunaan tertentu. Tidak semua dari 4 jenis tersebut tersedia di seluruh implementasi, dan beberapa implementasi juga mempunyai nama yang lain untuk Subject (contohnya, di RxScala, apa yang dikenal sebagai "PublishSubject" dikenal sebagai "Subject" disini):
</p>
<h3>AsyncSubject</h3>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.AsyncSubject.png" style="width:100%;" />
 <figcaption><p>
  Sebuah <code>AsyncSubject</code> memancarkan nilai terakhir (dan hanya nilai terakhir) yang dipancarkan dari Observable sumber,
  dan hanya ketika Observable sumber tersebut sudah selesai. (Jika Observable sumber tidak memancarkan nilai apapun, 
  <code>AsyncSubject</code> juga langsung selesai tanpa memancarkan nilai apapun.)
 </p></figcaption>
</figure>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.AsyncSubject.e.png" style="width:100%;" />
 <figcaption><p>
  <code>AsyncSubject</code> juga akan memancarkan nilai terakhir ini kepada semua observer yang baru melakukan subscription. Bagaimanapun, jika Observable sumber terhenti dengan sebuah error, <code>AsyncSubject</code> tidak akan memancarkan item apapun, tapi hanya akan meneruskan notifikasi error tersebut dari Observable sumber.
 </p></figcaption>
</figure>
<h4>Lihat Juga</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#AsyncSubject"><cite>Introduction to Rx</cite>: AsyncSubject</a></li>
</ul>
<h3>BehaviorSubject</h3>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.BehaviorSubject.png" style="width:100%;" />
 <figcaption><p>
  Ketika sebuah observer melakukan subscribe kepada sebuah <code>BehaviorSubject</code>, dia akan memulai memancarkan item yang paling baru dipancarkan Observable sumber tersebut (atau sebuah default value jika belum memancarkan item apapun) dan kemudian akan memancarkan item-item yang dipancarkan oleh Observable sumber tersebut.
 </p></figcaption>
</figure>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.BehaviorSubject.e.png" style="width:100%;" />
 <figcaption><p>
  Bagaimanapun, jika Observable sumber terhenti dengan sebuah error <code>BehaviorSubject</code> tidak akan memancarkan items apapun ke observer-observer yang akan melakukan subscribe, tetapi hanya akan meneruskan notifikasn error dari Observable sumber tersebut.
 </p></figcaption>
</figure>
<h4>Lihat Juga</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#BehaviorSubject"><cite>Introduction to Rx</cite>: BehaviorSubject</a></li>
</ul>
<h3>PublishSubject</h3>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.PublishSubject.png" style="width:100%;" />
 <figcaption><p>
  <code>PublishSubject</code> memancarkan item kepada sebuah observer hanya jika item tersebut dipancarkan dari Observable sumber dan setelah observer tersebut sudah melakukan subscription.
 </p><p>
  Perhatikan bahwa sebuah <code>PublishSubject</code> bisa langsung memulai memancarkan item segera setelah dibuat (kecuali jika anda telah mempunyai beberapa cara tertentu untuk mencegah ini), jadi ada resiko satu atau lebih item bisa hilang diantara waktu Subject terbuat dan ketika observer melakukan subscribe kepadanya. Jika anda perlu untuk menjamin penerimaan dari semua items dari Observable sumbernya, anda harus membuat Observable tersebut dengan <a href="operators/create.html"><code>Create</code></a> sehingga Observable yang dibuat dapat memiliki ciri khas Observable "dingin" (yaitu harus melakukan pengecekan untuk mengetahui apakah semua observer sudah melakukan subscribe kepadanya sebelum memulai memancarkan item), atau bisa juga menggantinya dengan sebuah <a>ReplaySubject</a>.
 </p></figcaption>
</figure>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.PublishSubject.e.png" style="width:100%;" />
 <figcaption><p>
  Jika Observable sumber terhenti dikarenakan sebuah error, <code>PublishSubject</code> tidak akan memancarkan item apappun ke observer yang akan melakukan subscribe, tetapi hanya akan meneruskan notifikasi error dari Observable sumber tersebut.
 </p></figcaption>
</figure>
<h3>ReplaySubject</h3>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.ReplaySubject.png" style="width:100%;" />
 <figcaption><p>
  <code>ReplaySubject</code> memancarkan kepada observer semua item yang sudah dipancarkan oleh Observable sumber sebelumnya, tidak peduli kapan observer tersebut melakukan subscribe.
 </p><p>
  Ada juga beberapa versi dari <code>ReplaySubject</code> yang akan membuang item dari yang paling lama ketika kapasitas pengulangan item tersebut sudah melewati batas tertentu, atau ketika sebuah jeda waktu tertentu sudah lewat sejak item-item tersebut dipancarkan.
 </p><p>
  jika anda menggunakan sebuah <code>ReplaySubject</code> sebagai sebuah observer, anda harus memperhatikan bahwa anda tidak boleh memanggil method <code>onNext</code> nya (atau method <code>on</code> lainnya) dari thread yang berbeda-beda, dimana ini bisa menimbulkan pemanggilan di saat yang sama (tidak berurutan) yang melanggar <a href="contract.html">Kontrak Observable</a> dan menghasilkan ambiguitas di Subject yang dihasilkan untuk menentukan item atau notifikasi yang mana yang harus di-replay terlebih dahulu
 </p></figcaption>
</figure>
<h4>Lihat Juga</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#ReplaySubject"><cite>Introduction to Rx</cite>: ReplaySubject</a></li>
</ul>

<h2>Informasi Terkait masing-masing bahasa:</h2>

<div class="panel-group operators-by-language" id="accordion" role="tablist" aria-multiselectable="true">

  {% lang_operator RxClojure %}
    <p>
     <span style="color:#f00">TBD</span>
    </p>
  {% endlang_operator %}

  {% lang_operator RxCpp %}
    <p>
     <span style="color:#f00">TBD</span>
    </p>
  {% endlang_operator %}

  {% lang_operator RxGroovy %}
   <p>
    Jika anda mempunyai sebuah <code>Subject</code> dan ingin meneruskannya ke agen-agen lainnya tanpa mengekspos interface <code>Subscriber-nya</code>, anda bisa menutupinya dengan memanggil method <code>asObservable-nya</code>, yang akan mengembalikan Subject tersebut sebagai sebuah <code>Observable</code> yang murni.
   </p>
   <h4>Lihat Juga</h4>
   <ul>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/AsyncSubject.html"><code>AsyncSubject</code></a></li>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/BehaviorSubject.html"><code>BehaviorSubject</code></a></li>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/PublishSubject.html"><code>PublishSubject</code></a></li>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/ReplaySubject.html"><code>ReplaySubject</code></a></li>
   </ul>
  {% endlang_operator %}

  {% lang_operator RxJava&nbsp;1․x %}
   <p>
    Jika anda mempunyai sebuah <code>Subject</code> dan ingin meneruskannya ke agen-agen lainnya tanpa mengekspos interface <code>Subscriber-nya</code>, anda bisa menutupinya dengan memanggil method <code>asObservable-nya</code>, yang akan mengembalikan Subject tersebut sebagai sebuah <code>Observable</code> yang murni.
   </p>
   <h4>Lihat Juga</h4>
   <ul>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/AsyncSubject.html"><code>AsyncSubject</code></a></li>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/BehaviorSubject.html"><code>BehaviorSubject</code></a></li>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/PublishSubject.html"><code>PublishSubject</code></a></li>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/ReplaySubject.html"><code>ReplaySubject</code></a></li>
   </ul>
  {% endlang_operator %}

  {% lang_operator RxJS %}
    <p>
     <span style="color:#f00">TBD</span>
    </p>
    <h4>Lihat Juga</h4>
    <ul>
     <li><a href="http://xgrommx.github.io/rx-book/content/subjects/index.html">Subjects</a> oleh Denis Stoyanov</li>
    </ul>
  {% endlang_operator %}

  {% lang_operator RxKotlin %}
    <p>
     <span style="color:#f00">TBD</span>
    </p>
  {% endlang_operator %}

  {% lang_operator Rx.NET %}
    <p>
     <span style="color:#f00">TBD</span>
    </p>
    <h4>Lihat Juga</h4>
    <ul>
     <li>Reactive Extensions: <a href="http://msdn.microsoft.com/en-us/library/hh229363.aspx"><code>AsyncSubject</code></a></li>
     <li>Reactive Extensions: <a href="http://msdn.microsoft.com/en-us/library/hh211949.aspx"><code>BehaviorSubject</code></a></li>
     <li>Reactive Extensions: <a href="http://msdn.microsoft.com/en-us/library/hh211810.aspx"><code>ReplaySubject</code></a></li>
    </ul>
  {% endlang_operator %}

  {% lang_operator RxPY %}
    <p>
     <span style="color:#f00">TBD</span>
    </p>
  {% endlang_operator %}

  {% lang_operator Rx.rb %}
    <p>
     <span style="color:#f00">TBD</span>
    </p>
  {% endlang_operator %}

  {% lang_operator RxScala %}
    <p>
     <span style="color:#f00">TBD</span>
    </p>
  {% endlang_operator %}

</div>
