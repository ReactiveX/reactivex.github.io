---
layout: documentation
title: ReactiveX - Observable
lang: id
id: observable
---

<h1>Observable</h1>
<p>
 Dalam ReactiveX sebuah <dfn>observer</dfn> <dfn>melakukan subscribe</dfn> terhadap sebuah <dfn>Observable</dfn>. Kemudian observer itu akan bereaksi terhadap apapun item atau urutan dari item-item yang <dfn>dipancarkan</dfn> oleh Observable tersebut. Pola seperti ini memfasilitasi operasi-operasi yang berjalan secara konkuren ( berbarengan ) dikarenakan tidak perlu untuk memblokir ketika menunggu Observable untuk memancarkan obyek-obyek, tetapi cara seperti ini malah membentuk sebuah penjaga dalam bentuk sebuah observer yang siap bereaksi terhadap apapun pada waktu kapanpun di masa depan ketika Observable melakukannya.
</p><p>
 Halaman ini menjelaskan apa itu pola reactive dan apa sebenarnya Observable dan observer itu (dan bagaimana observer melakukan subscribe kepada Observable). Halaman lainnya menunjukkan bagaimana anda menggunakan <a href="operators.html">berbagai jenis dari operator Observable</a> untuk menghubungkan beberapa Observable dan mengubah perilaku mereka.
</p>
<figure>
 <figcaption><p>Dokumentasi ini akan ditemani oleh &ldquo;marble diagrams.&rdquo; Berikut adalah bagaimana diagram kelereng merepresentasikan Observables dan perubahan dari Observables:</p></figcaption>
 <img src="{{ site.url }}/assets/operators/legend.png" style="width:100%;" />
</figure>
<h4>Lihat Juga</h4>
<ul>
 <li><a href="single.html"><tt>Single</tt></a> &mdash; Sebuah versi Observable yang dibuat khusus untuk memancarkan tepat satu buah item</li>
 <li><a href="http://channel9.msdn.com/Series/Rx-Workshop/Rx-Workshop-Introduction"><cite>Rx Workshop</cite>: Introduction</a></li>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#IObservable"><cite>Introduction to Rx</cite>: IObservable</a></li>
 <li><a href="http://docs.couchbase.com/developer/java-2.0/observables.html"><cite>Mastering observables</cite></a> (from the Couchbase Server documentation)</li>
 <li><a href="https://medium.com/@andrestaltz/2-minute-introduction-to-rx-24c8ca793877"><cite>2 minute introduction to Rx</cite></a> oleh Andre Staltz (&ldquo;Anggap sebuah Observable sebagai sebuah array asynchronous yang tidak dapat diubah.&rdquo;)</li>
 <li><a href="https://egghead.io/lessons/javascript-introducing-the-observable">Introducing the Observable</a> by Jafar Husain (JavaScript Video Tutorial)</li>
 <li><a href="http://xgrommx.github.io/rx-book/content/observable/index.html">Observable object</a> (RxJS) by Dennis Stoyanov</li>
 <li><a href="https://afterecho.uk/blog/turning-a-callback-into-an-rx-observable.html">Turning a callback into an Rx Observable</a> by @afterecho</li>
</ul>
<h1>Latar Belakang</h1>
<p>
 Dalam berbagai tugas dalam pemrograman perangkat lunak, instruksi yang anda tulis akan dikerjakan secara bertahap, satu-per-satu, dan berurutan sesuai apa yang anda tulis. Tetapi dalam ReactiveX, banyak instruksi bisa saja dijalankan secara paralel dan hasilnya akan diambil nantinya, dalam suatu urutan yang acak, oleh "observers." Daripada <em>memanggil</em> sebuah method, anda mendefinisikan sebuah mekanisme untuk mendapatkan dan mengubah data-nya, dalam sebuah bentuk "Observable," dan kemudian membuat sebuah observer melakukan <em>subscribe</em> kepadanya, yang dimana mekanisme yang sudah didefinisikan sebelumnya melakukan aksi-nya dengan observer tersebut berdiri sebagai penjaga untuk menangkapnya dan merespon kepada pancarannya kapanpun mereka siap.
</p><p>
 Keuntungan dari pendekatan ini adalah ketika anda memmiliki berbagai tugas yang tidak tergantung satu sama lain, anda bisa memulai mereka pada saat yang sama daripada harus menunggu satu per satu dari mereka untuk menyelesaikan tugasnya sebelum memulai tugas berikutnya 
 An advantage of this approach is that when you have a bunch of tasks that are not dependent on each other, you
 can start them all at the same time rather than waiting for each one to finish before starting the next one &mdash; dengan cara begitu, kumpulan tugas anda hanya akan memakan waktu paling lama setara dengan tugas yang memerlukan waktu paling banyak untuk diselesaikan.
</p><p>
 Ada beberapa istilah yang digunakan untuk mendeskripsikan model pemrograman dan desain asynchronous. Dokumen ini akan menggunakan istilah berikut: Sebuah <dfn>observer</dfn> melakukan <dfn>subscribe</dfn> kepada sebuah <dfn>Observable</dfn>. Sebuah Observable <dfn>memancarkan</dfn> <dfn>item-item</dfn> atau mengirim <dfn>notifikasi-notifikasi</dfn> kepada observer-nya dengan memanggil method-method dari observer tersebut.
</p><p>
 Dalam dokumen dan konteks yang lain, apa yang kita sebut sebagai "observer" kadang-kadang juga disebut sebagai "subsriber," "watcher," atau "reactor." Model seperti ini secara umumnya disebut juga sebagai <a href="http://en.wikipedia.org/wiki/Reactor_pattern">“reactor pattern”</a>.
</p>
<h1>Pembuatan Observer</h1>
<p>
 Halaman ini menggunakan pseudocode yang mirip seperti Groovy untuk contoh-contohnya, tetapi ada banyak implementasi ReactiveX dalam bahasa lain juga.
</p><p>
 Dalam sebuah pemanggilan method pada biasanya — yang dimana, <em>tidak</em> berjenis pemanggilan asynchronous , dan paralel seperti di ReactiveX — alurnya akan berjalan seperti berikut:
</p><ol>
 <li>Panggil sebuah method.</li>
 <li>Menyimpan hasil dari method tersebut ke dalam sebuah variable.</li>
 <li>Menggunakan variable itu dan nilai-nilai nya yang baru untuk sesuatu yang berguna.</li>
</ol>
<p>
 Atau, sesuatu seperti ini:
</p>
<div class="code groovy"><pre>
// melakukan pemanggilan, menetapkan hasilnya ke `returnVal`
returnVal = someMethod(itsParameters);
// melakukan sesuatu yang berguna dengan returnVal</pre></div>
<p>
 Pada model asynchronous, alurnya akan seperti ini:
</p><ol>
 <li>Mendefinisikan sebuah method yang melakukan sesuatu yang berguna dengan hasil yang dikembalikanya dari sebuah pemanggilan asynchronous; method seperti ini adalah
     bagian dari <i>observer</i>.</li>
 <li>Mendefinisikan pemanggilan asynchronous itu sendiri sebagai sebuah <i>Observable</i>.</li>
 <li>Melekatkan observer ke Observable tersebut dengan cara melakukan <i>subscribe</i> kepadanya (dimana ini juga memulai aksi-aksi dari Observable).</li>
 <li>Lanjutkan pekerjaan anda; kapanpun panggilan tersebut sudah mengembalikan hasil, method dari observer tersebut akan memulai beroperasi pada nilai tersebut - yaitu <i>item</i> yang diemit oleh Observable tersebut.</li>
</ol>
<p>
 Dimana akan mirip sesuatu seperti ini:
</p>
<div class="code groovy"><pre>
// mendefinisikan, tetapi tidak menjalan fungsi onNext dari Subscriber
// (dalam contoh ini, observer yang digunakan sangat sederhana dan hanya mempunyai sebuah fungsi onNext)
def myOnNext = { it -> do something useful with it };
// mendefinisikan, tetapi tidak menjalankan, Observable-nya
def myObservable = someObservable(itsParameters);
// Subsriber melakukan subscribe ke Observable, dan menjalankan fungsi 
myObservable.subscribe(myOnNext) dari Observable;
// lanjutkan hal yang anda perlu kerjakan</pre></div>
<h2>onNext, onCompleted, and onError</h2>
<p>
 <a href="operators/subscribe.html"><code>Subscribe</code></a> adalah cara agar anda bisa menghubungkan sebuah observer dengan sebuah Observable. Observer anda menerapkan beberapa  how you connect an observer to an
 Observable. Your observer implements some bagian dari method-method berikut:
</p>
<dl>
 <dt><code>onNext</code></dt>
  <dd>Sebuah Observable memanggil method ini kapanpun Observable tersebut memancarkan sebuah item. Method ini memerlukan sebuah parameter item yang dipancarkan oleh Observable.</dd>
 <dt><code>onError</code></dt>
  <dd>Sebuah Observable memanggil method ini untuk menandakan bahwa terjadi kegagalan untuk membentuk data yang diharapkan atau telah terjadi error tertentu. Observable tidak akan memanggil <code>onNext</code> atau <code>onCompleted</code> lagi.
  Method <code>onError</code> memerlukan parameter sesuatu yang menandakan apa yang menyebabkan error tersebut.</dd>
 <dt><code>onCompleted</code></dt>
  <dd>Sebuah Observable memanggil method ini setelah sudah memanggil <code>onNext</code> untuk terakhir kalinya, jika belum terjadi error apapun.</dd>
</dl>
<p>
 Dengan ketentuan dari <a href="contract.html">Kontrak Observable</a>, Observable bisa memanggil <code>onNext</code> sebanyak beberapa kali atau tidak sama sekali, dan kemudian bisa melanjutkan memanggil baik  <code>onCompleted</code> atau
 <code>onError</code> tetapi tidak keduanya, yang dimana akan menjadi panggilannya yang terakhir. Dengan perjanjian, dalam dokumen ini, pemanggil ke <code>onNext</code> biasanya disebut &ldquo;pancaran&rdquo; dari item-item, dimana pemanggilan ke <code>onCompleted</code> atau <code>onError</code> disebut &ldquo;notifikasi.&rdquo;
</p><p>
 Berikut merupakan contoh dari sebuah pemanggilan <code>subscribe</code> yang lebih lengkap:
</p>
<div class="code groovy"><pre>
def myOnNext     = { item -> /* lakukan sesuatu dengan item */ };
def myError      = { throwable -> /* bereaksi terhadap suatu pemanggilan yang gagal */ };
def myComplete   = { /* membersihkan respon terakhir */ };
def myObservable = someMethod(itsParameters);
myObservable.subscribe(myOnNext, myError, myComplete);
// lanjut mengerjakan proses bisnis</pre></div>
<h4>Lihat Juga</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#IObserver"><cite>Introduction to Rx</cite>: IObserver</a></li>
</ul>
<h2>Proses Unsubscribe</h2>
<p>
 Dalam beberapa implementasi ReactiveX, ada sebuah interface obsever khusus, <code>Subscriber</code>, yang mengimplementasi sebuah method <code>unsubscribe</code>. Anda bisa memanggil method ini untuk menunjukkan bahwa Subsciber tersebut tidak lagi tertarik dengan Observable yang sedang dia subscribe. Observable-observable tersebut kemudian (jika mereka tidak mempunyai observer lain yang masih tertarik kepada mereka) berhenti membuat item-item baru untuk dipancarkan.
</p><p>
 Hasil dari unsubscription ini akan mengalir kembali melalui rantai operator-operator yang berlaku ke Observable yang disubscribe oleh observer tersebut, dan ini akan menyebabkan masing-masing instansi didalam rantai untuk berhenti memancarkan item.
 Walaupun tidak dijamin akan langsung terjadi, tetap mungkin bagi sebuah Observable untuk membuat dan mencoba untuk memancarkan item selama beberapa saat bahkan setelah tidak ada observer yang mengamati emisi-emisi tersebut.
</p>
<h2>Beberapa Catatan tentang Aturan Penamaan</h2>
<p>
 Tiap implementasi yang spesifik kepada bahasa tertentu dari ReactiveX memiliki penamaannya sendiri. Tidak ada aturan penamaan yang standar, meskipun banyak kesamaan diantara implementasi-implementasi tersebut.
</p><p>
 Lebih lanjut, beberapa dari nama tersebut memiliki implementasi yang berbeda di konteks lainnya, yang bisa kelihatan seperti kata yang canggung dalam kosa kata bahasa tertentu yang menerapkannya.
</p><p>
 Contohnya ada pola penamaan <code>on<i>Event</i></code> (contohnya <code>onNext</code>,
 <code>onCompleted</code>, <code>onError</code>). Dalam beberapa konteks, nama-nama tersebut merupakan method yang memiliki arti penanganan event yang <em>terdaftar</em>. Dalam ReactiveX, bagaimanapun, mereka menamai penanganan event tersebut sendiri.
</p>
<h1>Observable &ldquo;Hot&rdquo; dan &ldquo;Cold&rdquo;</h1>
<p>
 Kapan sebuah Observable mulai memancarkan untaian dari item? Tergantung pada Observable itu sendiri. Sebuah Obsevable &ldquo;hot&rdquo; bisa mulai memancarkan item segera setelah dibentuk, sehingga observer apapun yang akan melakukan subscribe ke Observable tersebut bisa saja sedang melakukan observasi untaian tersebut di bagian tengah dari untaian tersebut. Di sisi lainnya, Sebuah Observable &ldquo;cold&rdquo;, menunggu sampai terdapat sebuah observer yang melakukan subscribe kepadanya sebelum mulai memancarkan item-item, jadi observer tersebut dijamin akan mendapatkan seluruh untaian dari awal.
</p><p>
 Pada beberapa implementasi dari ReactiveX, ada sesuatu yang juga disebut sebagai sebuah Observable &ldquo;Connectable&rdquo;.
 Observable tersebut tidak akan mulai memancarkan item sampai method
 <a href="operators/connect.html"><span class="operator">Connect</span></a> nya dipanggil, tidak peduli ada observer yang melakukan subscribe kepadanya atau tidak.
</p>
<h1>Komposisi melalui Operator Observable</h1>
<p>
 Observable dan observer merupakan permulaan dari ReactiveX. Mereka tidak lebih dari ekstensi observer pattern, yang lebih cocok untuk mengurus urutan dari suatu event daripada hanya sebuah callback.
</p><p>
 Kekuatan sesungguhnya berasal dari "reactive extensions" (asal nama "ReactiveX") - operator-operator yang memungkinkan anda untuk melakukan perubahan, menggabungkan, memanipulasi, dan bekerja dengan untaian item-item yang dipancarkan oleh Observable.
</p><p>
 Operator Rx tersebut memungkinkan anda untuk membentuk sebuah untaian asynchronous dengan cara declarative dengan semua keuntungan efisiensi dari callbacks tanpa kelemahan dari penanganan callback yang berasarang yang biasanya diasosiasikan dengan sistem asynchronous.
</p><p>
 Dokumentasi berikut menggabungkan informasi tentang <a href="operators.html#alphabetical">berbagai jenis operator</a> dan contoh-contoh penggunaannya ke dalam beberapa halaman berikut:
</p><dl>
 <dt><a href="operators.html#creating">Membuat Observable</a></dt>
  <dd><code>Create</code>, <code>Defer</code>, <code>Empty</code>/<code>Never</code>/<code>Throw</code>,
      <code>From</code>, <code>Interval</code>, <code>Just</code>, <code>Range</code>, <code>Repeat</code>,
      <code>Start</code>, dan <code>Timer</code></dd>
 <dt><a href="operators.html#transforming">Merubah Item Observable</a></dt>
  <dd><code>Buffer</code>, <code>FlatMap</code>, <code>GroupBy</code>, <code>Map</code>, <code>Scan</code>, dan
      <code>Window</code></dd>
 <dt><a href="operators.html#filtering">Menyaring Observable</a></dt>
  <dd><code>Debounce</code>, <code>Distinct</code>, <code>ElementAt</code>, <code>Filter</code>,
      <code>First</code>, <code>IgnoreElements</code>, <code>Last</code>, <code>Sample</code>,
      <code>Skip</code>, <code>SkipLast</code>, <code>Take</code>, dan <code>TakeLast</code></dd>
 <dt><a href="operators.html#combining">Menggabungkan Observable</a></dt>
  <dd><code>And</code>/<code>Then</code>/<code>When</code>, <code>CombineLatest</code>, <code>Join</code>,
      <code>Merge</code>, <code>StartWith</code>, <code>Switch</code>, dan <code>Zip</code></dd>
 <dt><a href="operators.html#error"> Operator Penanganan Error</a></dt>
  <dd><code>Catch</code> dan <code>Retry</code></dd>
 <dt><a href="operators.html#utility">Beberapa Operator Lainnya</a></dt>
  <dd><code>Delay</code>, <code>Do</code>, <code>Materialize</code>/<code>Dematerialize</code>,
      <code>ObserveOn</code>, <code>Serialize</code>, <code>Subscribe</code>, <code>SubscribeOn</code>,
      <code>TimeInterval</code>, <code>Timeout</code>, <code>Timestamp</code>, dan <code>Using</code></dd>
 <dt><a href="operators.html#conditional">Operator Kondisional dan Boolean</a></dt>
  <dd><code>All</code>, <code>Amb</code>, <code>Contains</code>, <code>DefaultIfEmpty</code>,
      <code>SequenceEqual</code>, <code>SkipUntil</code>, <code>SkipWhile</code>, <code>TakeUntil</code>,
      dan <code>TakeWhile</code></dd>
 <dt><a href="operators.html#mathematical">Operator Matematika dan Agregasi</a></dt>
  <dd><code>Average</code>, <code>Concat</code>, <code>Count</code>, <code>Max</code>, <code>Min</code>,
      <code>Reduce</code>, dan <code>Sum</code></dd>
 <dt><a href="operators.html#conversion">Mengubah Observable</a></dt>
  <dd><code>To</code></dd>
 <dt><a href="operators.html#connectable">Operator Obervable Connectable</a></dt>
  <dd><code>Connect</code>, <code>Publish</code>, <code>RefCount</code>, dan <code>Replay</code></dd>
 <dt><a href="operators/backpressure.html">Operator Backpressure</a></dt>
  <dd>jenis dari operator-operator yang menerapkan aturan flow-control tertentu</dd>
</dl>
<p>
 Halaman-halaman tersebut juga berisi informasi mengenai beberapa operator yang tidak termasuk operator inti dari ReactiveX tetapi diimplementasikan di satu atau lebih dari bahasa atau modul tersebut.
</p>
<h2>Menggabungkan Operator</h2>
<p>
 Kebanyakan operator beroperasi pada sebuah Observable dan mengembalikan sebuah Observable. Ini memungkinkan anda untuk mengaplikasikan operator-operator tersebut satu demi satu, seperti sebuah rantai. Masing-masing operator pada rantai tersebut mengubah Observable yang merupakan hasil dari operasi yang dilakukan operator sebelumnya.
</p><p>
 Ada beberapa pattern yang lain, seperti Builder Pattern, yang dimana beberapa method dari sebuah class tertentu beroperasi pada sebuah item pada class yang sama dengan cara mengubah obyeknya melalui operasi method tersebut. Pattern seperti itu juga memungkinkan anda untuk menggabungkan method-method dengan cara yang hampir sama. Tetapi di Builder Pattern, urutan dari method apa yang dipakai di rantai pemanggilan method biasanya tidak berpengaruh, sedangkan pada operator Observable, <em>urutan berpengaruh</em>.
</p><p>
 Sebuah rantai operator Observable tidak beroperasi secara indenpenden terhadap Observable asalnya yang memulai rantai tersebut, tetapi beroperasi secara <em>bergantian</em>, masing-masing beroperasi pada Observable yang dibentuk oleh operator sebelumnya dalam rantai tersebut.
</p>
