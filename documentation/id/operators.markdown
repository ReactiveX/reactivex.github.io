---
layout: documentation
title: ReactiveX - Operators
lang: id
id: operators
---

<h1>Pengenalan</h1>

Setiap implementasi yang spesifik dengan bahasa tertentu dari ReactiveX menerapkan sebuah set dari operator-operator. Meskipun terdapat kemungkinan tumpang tindih diantara implementasi-implementasinya, ada juga beberapa operator yang hanya diterapkan pada implementasi tertentu. Dan juga, tiap implementasi cenderung untuk menamai operatornya sendiri agar mirip dengan beberapa method yang sudah diterapkan di konteks lainnya pada bahasa tersebut.

<h2>Menggabungkan Operator</h2>
<p>
 Kebanyakan operator beroperasi pada sebuah Observable dan mengembalikan sebuah Observable. Ini memungkinkan anda untuk mengaplikasikan operator-operator tersebut satu demi satu, seperti sebuah rantai. Masing-masing operator pada rantai tersebut mengubah Observable yang merupakan hasil dari operasi yang dilakukan operator sebelumnya.
</p><p>
 Ada beberapa pattern yang lain, seperti Builder Pattern, yang dimana beberapa method dari sebuah class tertentu beroperasi pada sebuah item pada class yang sama dengan cara mengubah obyeknya melalui operasi method tersebut. Pattern seperti itu juga memungkinkan anda untuk menggabungkan method-method dengan cara yang hampir sama. Tetapi di Builder Pattern, urutan dari method apa yang dipakai di rantai pemanggilan method biasanya tidak berpengaruh, sedangkan pada operator Observable, <em>urutan berpengaruh</em>.
</p><p>
 Sebuah rantai operator Observable tidak beroperasi secara indenpenden terhadap Observable asalnya yang memulai rantai tersebut, tetapi beroperasi secara <em>bergantian</em>, masing-masing beroperasi pada Observable yang dibentuk oleh operator sebelumnya dalam rantai tersebut.
</p>

<h2>Operator-operator dari ReactiveX</h2>

Halaman ini mempunyai daftar yang bisa dianggap sebagai operator &ldquo;inti&rdquo; di ReactiveX, dan memiliki tautan dengan halaman-halaman yang memiliki informasi yang lebih lengkap bagaimana operator tersebut bekerja dan bagaimana versi dari bahasa-bahasa yang menerapkan operator-operator tersebut.

Kemudian ada sebuah &ldquo;decision tree&rdquo; yang mungkin bisa membantu anda menentukan operator apa yang paling cook anda gunakan sesuai kebutuhan anda.

Dan akhirnya, ada sebuah daftar yang disusun menurut abjad tentang hampir setiap operator yang dapat dipakai di bahasa-bahasa yang menerapkan ReactiveX. Daftar tersebut akan memiliki tautan ke halaman yang berisi operator inti yang paling miirp dengan operator masing-masing bahasa tersebut (contohnya, Rx.NET & operator &ldquo;SelectMany&rdquo; terhubung ke dokumentasi Operator ReactiveX <span class="operator">FlatMap</span>, yang dimana 
&ldquo;SelectMany&rdquo; adalah implementasi dari Rx.NET).

Jika anda ingin mengimplementasi operator anda sendiri, lihat <a href="implement-operator.html">Menerapkan Operator Anda Sendiri</a>.

<h4>Konten</h4> 
<ol>
 <li><a href="#categorized">Operators berdasarkan Kategori</a></li>
 <li><a href="#tree">Sebuah Decision Tree dari Operator Observable</a></li>
 <li><a href="#alphabetical">Sebuah Daftar Operator Observable yang Disusun Menurut Abjad</a></li>
</ol>

<h1 id="categorized">Operators berdasarkan Kategori</h1>

<h2 id="creating">Membuat Observable</h2>

Operator yang membuat Observable baru.

* [**`Create`**]({{ site.url }}/documentation/operators/create.html) — membuat sebuah Observable dari awal dengan memanggil method observer secara terprogram
* [**`Defer`**]({{ site.url }}/documentation/operators/defer.html) — jangan membuat Observable sampai observer melakukan subscribe, dan membuat sebuah Observable baru untuk tiap observer
* [**`Empty`/`Never`/`Throw`**]({{ site.url }}/documentation/operators/empty-never-throw.html) — membuat Observable yang memiliki perilaku yang tepat dan terbatas
* [**`From`**]({{ site.url }}/documentation/operators/from.html) — mengubah beberapa obyek atau struktur data menjadi sebuah Observable
* [**`Interval`**]({{ site.url }}/documentation/operators/interval.html) — membuat sebuah Observable yang memancarkan sebuah deret yang terjeda oleh suatu satuan waktu tertentu
* [**`Just`**]({{ site.url }}/documentation/operators/just.html) — mengubah sebuah obyek atau sebuah set dari obyek menjadi sebuah Observable yang memancarkan obyek tersebut.
* [**`Range`**]({{ site.url }}/documentation/operators/range.html) — membuat sebuah Observable yang memancarkan sebuah deret bilangan dalam batasan tertentu
* [**`Repeat`**]({{ site.url }}/documentation/operators/repeat.html) — membuat sebuah Observable yang memancarkan item atau deret tertentu secara berulang-ulang
* [**`Start`**]({{ site.url }}/documentation/operators/start.html) — membuat sebuah Observable yang memancarkan hasil dari sebuah fungsi
* [**`Timer`**]({{ site.url }}/documentation/operators/timer.html) — membuat sebuah Observable yang memancarkan tepat satu item setelah jangka waktu tertentu

<h2 id="transforming">Mengubah Observable</h2>

Operator yang mengubah item yang dipancarkan oleh suatu Observable.

* [**`Buffer`**]({{ site.url }}/documentation/operators/buffer.html) — mengumpulkan item dari sebuah Observable secara berkala menjadi sebuah kumpulan/ bundel dan memancarkan bundel tersebut daripada memancarkan item satu per satu
* [**`FlatMap`**]({{ site.url }}/documentation/operators/flatmap.html) — mengubah item yang diemit oleh sebuah Observable menjadi beberapa Observable, kemudian meratakan emisi-emisi tersebut menjadi sebuah Observable
* [**`GroupBy`**]({{ site.url }}/documentation/operators/groupby.html) — membagi sebuah Observable menjadi beberapa set Observable yang dimana masing masing memancarkan grup item yang berbeda dari Observable asalnya, diatur dengan sebuah key
* [**`Map`**]({{ site.url }}/documentation/operators/map.html) — mengubah item-item yang dipancarkan oleh sebuah Observable dengan menerapkan sebuah fungsi ke masing-masing item
* [**`Scan`**]({{ site.url }}/documentation/operators/scan.html) — menerapkan sebuah fungsi kepada masing-masing item yang dipancarkan oleh sebuah Observable, secara berurutan, dan memancarkan nilainya
* [**`Window`**]({{ site.url }}/documentation/operators/window.html) — secara berkala membagi item dari sebuah Observable menjadi jendela Obervable dan memancarkan jendela tersebut daripada item satu per satuows and emit these windows rather than emitting the items one at a time

<h2 id="filtering">Menyaring Observable</h2>

Operator yang secara selektif memancarkam item dari sumber Observable.

* [**`Debounce`**]({{ site.url }}/documentation/operators/debounce.html) — hanya memancakan sebuah item dari sebuah Observable jika sudah melewati jangka waktu tertentu tanpa memancarkan item lainnya
* [**`Distinct`**]({{ site.url }}/documentation/operators/distinct.html) — menahan item duplikat yang dipancarkan oleh sebuah Observable
* [**`ElementAt`**]({{ site.url }}/documentation/operators/elementat.html) — hanya memancarkan item <i>n</i> yang dipancarkan oleh sebuah Observable
* [**`Filter`**]({{ site.url }}/documentation/operators/filter.html) — hanya memancarkan item yang sudah melewati uji predikat
* [**`First`**]({{ site.url }}/documentation/operators/first.html) — hanya memancarkan item pertama, atau item pertama yang memenuhi kondisi tertentu, dari sebuah Observable
* [**`IgnoreElements`**]({{ site.url }}/documentation/operators/ignoreelements.html) — tidak memancarkan item apapun dari sebuah Observable tetapi hanya mengikutinya memancarkan notifikasi berhenti
* [**`Last`**]({{ site.url }}/documentation/operators/last.html) — memancarkan hanya item terakhir yang dipancarkan oleh Observable
* [**`Sample`**]({{ site.url }}/documentation/operators/sample.html) — memancarkan item terbaru yang dipancarkan oleh sebuah Observable dalam jangka waktu tertentu
* [**`Skip`**]({{ site.url }}/documentation/operators/skip.html) — menahan <i>n</i> item pertama yang dipancarkan oleh sebuah Observable
* [**`SkipLast`**]({{ site.url }}/documentation/operators/skiplast.html) — menahant<i>n</i> item terakhir yang dipancarkan oleh sebuah Observable
* [**`Take`**]({{ site.url }}/documentation/operators/take.html) — memancarkan hanya <i>n</i> items pertama yang dipancarkan oleh sebuah Observable
* [**`TakeLast`**]({{ site.url }}/documentation/operators/takelast.html) — memancarkan hanya <i>n</i> items terakhir yang dipancarkan oleh sebuah Observable

<h2 id="combining">Menggabungkan Observables</h2>

Operator yang bekerja dengan lebih dari sumber Observable untuk membuat satu Observable

* [**`And`/`Then`/`When`**]({{ site.url }}/documentation/operators/and-then-when.html) — menggabungkan set dari item yang dipancarkan oleh dua atau lebih Observable melalui suatu `Pola` atau `Rencana`
* [**`CombineLatest`**]({{ site.url }}/documentation/operators/combinelatest.html) — ketika sebuah item dipancarkan oleh salah satu dari dua Observable, menggabungkan item paling terbaru yang dipancarkan oleh masing-masing Observable melalui sebuah fungsi yang sudah didefinisikan berdasarkan hasil dari fungsi ini
* [**`Join`**]({{ site.url }}/documentation/operators/join.html) — menggabungkan item yang dipancarkan oleh dua Observable kapanpun sebuah item dari satu Observable dipancarkan selama sebuah jangka waktu yang ditentukan tergantung dari item yang dipancarkan Observable yang lainnya
* [**`Merge`**]({{ site.url }}/documentation/operators/merge.html) — menggabungkan beberapa Observable menjadi satu dengan cara menggabungkan emisi mereka
* [**`StartWith`**]({{ site.url }}/documentation/operators/startwith.html) — memancarkan sebuah deret yang sudah ditentukan sebelum mulai untuk memancarkan item dari Observable sumber
* [**`Switch`**]({{ site.url }}/documentation/operators/switch.html) — mengubah sebuah Observable yang memancarkan Observable menjadi sebuah Observable yang memancarkan item dari Observable terbaru yang memancarkan item
* [**`Zip`**]({{ site.url }}/documentation/operators/zip.html) — menggabungkan emisi-emisi dari lebih dari satu Observable bersama-sama melalui sebuah fungsi yang sudah ditentukan dan memancarkan satu item untuk setiap kombinasi berdasarkan hasil dari fungsi ini

<h2 id="error">Operator Penanganan Error</h2>

Operator yang membantu untuk pulih dari notifikasi error dari sebuah Observable

* [**`Catch`**]({{ site.url }}/documentation/operators/catch.html) — pulih dari sebuah notifikasi `onError` dengan melanjutkan deret tanpa error
* [**`Retry`**]({{ site.url }}/documentation/operators/retry.html) — jika sebuah Observable sumber mengirim sebuah notifikasi `onError`, akan dilakukan proses subscribe ulang dengan harapan itu akan berhasil dan selesai tanpa ada error

<h2 id="utility">Operator Observable Utilitas</h2>

Sekumpulan Operator yang berguna ketika bekerja dengan Observables

* [**`Delay`**]({{ site.url }}/documentation/operators/delay.html) — menggeser emisi ke beberapa saat di waktu yang akan datang
* [**`Do`**]({{ site.url }}/documentation/operators/do.html) — mendaftarkan sebuah aksi untuk dieksekusi dalam beberapa kejadian sepanjang masa hidupnya
* [**`Materialize`/`Dematerialize`**]({{ site.url }}/documentation/operators/materialize-dematerialize.html) — merepresentasikan baik item yang dipancarkan dan notifikasi yang dikirimkan sebagai item yang dipancarkan, atau membalikkan proses ini
* [**`ObserveOn`**]({{ site.url }}/documentation/operators/observeon.html) — menentukan scheduler tempat dimana observer akan mengamati Observable ini
* [**`Serialize`**]({{ site.url }}/documentation/operators/serialize.html) — memaksa sebuah Observable untuk membuat beberapa panggilan secara serial dan untuk menormalkan Observable tersebut
* [**`Subscribe`**]({{ site.url }}/documentation/operators/subscribe.html) — beroperasi terhadap emisi-emisi dan notifikasi-notifikasi dari sebuah Observable
* [**`SubscribeOn`**]({{ site.url }}/documentation/operators/subscribeon.html) — menentukan scheduler tempat yang akan digunakan sebuah Observable ketika dilakukan subscribe kepadanya
* [**`TimeInterval`**]({{ site.url }}/documentation/operators/timeinterval.html) — mengubah sebuah Observable yang memancarkan item menjadi Observable yang memancarkan indikasi waktu yang telah berlalu diantara emisi-emisi tersebut
* [**`Timeout`**]({{ site.url }}/documentation/operators/timeout.html) — mencerminkan Observable sumber, tetapi membuat sebuah notifikasi error jika sudah melewati jangka waktu tertentu tanpa memancarkan item apapun
* [**`Timestamp`**]({{ site.url }}/documentation/operators/timestamp.html) — melampirkan sebuah stempel waktu kepada masing-masing item yang dipancarkan oleh sebuah Observabke
* [**`Using`**]({{ site.url }}/documentation/operators/using.html) — membuat sebuah sumber daya yang dapat dibuang yang memiliki masa hidup sama seperti sebuah Observable

<h2 id="conditional">Operator Conditional dan Boolean</h2>

Operator yang mengevaluasi satu atau lebih Observable atau item yang dipancarkan oleh beberapa Observable

* [**`All`**]({{ site.url }}/documentation/operators/all.html) — menentukan apakah semua item yang dipancarkan oleh sebuah Observable memenuhi kriteria tertentu
* [**`Amb`**]({{ site.url }}/documentation/operators/amb.html) — diberikan dua atau lebih Observable sumber, pancarkan semua item dari Observable yang paling dulu memancarkan item diantara  Observable-observable tersebut
* [**`Contains`**]({{ site.url }}/documentation/operators/contains.html) — menentukan apakah sebuah Observable memancarkan item tertentu atau tidak
* [**`DefaultIfEmpty`**]({{ site.url }}/documentation/operators/defaultifempty.html) — memancarkan item dari Observable sumber, atau sebuah nilai tertentu jika Observable tersebut tidak memancarkan apapun
* [**`SequenceEqual`**]({{ site.url }}/documentation/operators/sequenceequal.html) — menentukan apakah dua observable memancarkan deretan item yang sama
* [**`SkipUntil`**]({{ site.url }}/documentation/operators/skipuntil.html) — membuang item yang dipancarkan oleh sebuah Observable sampai sebuah Observable kedua memancarkan sebuah item
* [**`SkipWhile`**]({{ site.url }}/documentation/operators/skipwhile.html) — membuang item yang dipancarkan oleh sebuah Observable sampai sebuah kondisi yang ditentukan menjadi false
* [**`TakeUntil`**]({{ site.url }}/documentation/operators/takeuntil.html) — mengambil item yang dipancarkan oleh sebuah Observable sampai sebuah Observable kedua memancarkan sebuah item atau berhenti
* [**`TakeWhile`**]({{ site.url }}/documentation/operators/takewhile.html) — mengambil item yang dipancarkan oleh sebuah Observable sebelum kondisi yang ditentukan menjadi false

<h2 id="mathematical">Operator Matematika and Agregat</h2>

Operator yang beroperasi pada pada seluruh deret item yang dipancarkan Observable

* [**`Average`**]({{ site.url }}/documentation/operators/average.html) — menghitung rata-rata dari angka yang dipancarkan oleh sebuah Observable dan memancarkan hasilnya
* [**`Concat`**]({{ site.url }}/documentation/operators/concat.html) — memancarkan emisi dari dua atau lebih Observable tanpa menyisipkan mereka
* [**`Count`**]({{ site.url }}/documentation/operators/count.html) — menghitung jumlah angka yang dipancarkan oleh Observable sumber lalu memancarkan hasilnya
* [**`Max`**]({{ site.url }}/documentation/operators/max.html) — menentukan, dan memancarkan, nilai maksimal dari item yang dipancarkan Observable
* [**`Min`**]({{ site.url }}/documentation/operators/min.html) — menentukan, dan memancarkan, nilai minimal dari item yang dipancarkan Observable
* [**`Reduce`**]({{ site.url }}/documentation/operators/reduce.html) — menerapkan sebuah fungsi ke tiap item yang dipancarkan oleh sebuah Observable secara berurutan dan memancarkan nilai akhirnya
* [**`Sum`**]({{ site.url }}/documentation/operators/sum.html) — menghitung jumlah dari angka-angka yang dipancarkan oleh sebuah Observable dan memancarkan hasilnya

<h2 id="backpressure">Operator Backpressure</h2>

* [**operator backpressure**]({{ site.url }}/documentation/operators/backpressure.html) — strategi yang digunakan untuk mengatasi Observable yang menghasilkan item jauh lebih cepat dari yang dikonsumsi observer

<h2 id="connectable">Operator Observable Connectable</h2>

Observable khusus yang memiliki dinamika subscription yang lebih terkontrol dengan tepat

* [**`Connect`**]({{ site.url }}/documentation/operators/connect.html) — menginstruksikan sebuah Observable connectable untuk mulai memancarkan item kepada subscriber-nya
* [**`Publish`**]({{ site.url }}/documentation/operators/publish.html) — mengubah sebuah Observable biasa menjadi sebuah Observable connectable
* [**`RefCount`**]({{ site.url }}/documentation/operators/refcount.html) — membuat sebuah Observable connectable berperilaku seperti sebuah Observable biasa
* [**`Replay`**]({{ site.url }}/documentation/operators/replay.html) — memastikan semua observer melihat deret yang sama dari item yang dipancarkan, bahkan jika mereka baru melakukan subscribe setelah Observable tersebut sudah mulai memancarkan item

<h2 id="conversion">Operators untuk Mengubah Observables</h2>

* [**`To`**]({{ site.url }}/documentation/operators/to.html) — mengubah sebuah Observable menjadi obyek atau struktur data yang lain

<div id="tree">
<style>
   div#tree dl { margin-top: 0;
                 margin-bottom: 1.5em;
                 margin-left: 1.5em; }
   div#tree dl#outer>dt { font-weight: bold;
                          margin-right: -1.5em;
                          margin-top: .5em; }
   div#tree dl#outer>dd { margin-top: .5em; }
   div#tree dt { font-weight: normal;
                 margin-right: -1.5em; }
   div#tree dl > dt::before { content: "…"; }
   div#tree dl#outer > dt::before { content: ""; }
   div#tree dd::before { content: ": "; }
   div#tree dd.sub::before { content: ""; }

   div#tree dt { float: left; clear: left; }
   div#tree dd { float: left;
                 margin-start: 0;
                 -webkit-margin-start: 0;
                 margin-left: 1.5em; }
   div#tree dd.sub { float: none;
                     margin-left: 0; }
</style>
  <h1>Sebuah Decision Tree dari Operator Observable</h1>
  <p>
   Tree ini dapat mmbantu anda menemukan operator yang sedang anda cari.
  </p>
<dl id="outer">
 <dt>Saya ingin membuat sebuah Observable yang baru</dt>
  <dd class="sub"><dl>
   <dt>yang memancarkan hanya sebuah item</dt>
    <dd><a href="operators/just.html">Just</a></dd>
    <dd class="sub"><dl>
     <dt>yang dikembalikan dari sebuah fungsi yang dipanggil saat sedang disubscribe</dt>
      <dd><a href="operators/start.html">Start</a></dd>
     <dt>yang dikembalikan dari sebuah <code>Action</code>, <code>Callable</code>, <code>Runnable</code>, atau sejenisnya, yang dipanggil saat sedang disubscribe</dt>
      <dd><a href="operators/from.html">From</a></dd>
     <dt>setelah jeda waktu tertentu</dt>
      <dd><a href="operators/timer.html">Timer</a></dd>
     </dl></dd>
   <dt>yang menarik emisinya dari sebuah <code>Array</code>, <code>Iterable</code>, atau sejenisnya</dt>
    <dd><a href="operators/from.html">From</a></dd>
   <dt>dengan mengambilnya dari sebuah Future</dt>
    <dd><a href="operators/start.html">Start</a></dd>
   <dt>yang mendapatkan deretnya dari sebuah Future</dt>
    <dd><a href="operators/from.html">From</a></dd>
   <dt>yang memancarkan deret item secara berulang-ulang</dt>
    <dd><a href="operators/repeat.html">Repeat</a></dd>
   <dt>yang dibuat dari awal, dengan logika tertentu</dt>
    <dd><a href="operators/create.html">Create</a></dd>
   <dt>untuk setiap observer yang melakukan subscribe</dt>
    <dd><a href="operators/defer.html">Defer</a></dd>
   <dt>yang memancarkan sederet angka</dt>
    <dd><a href="operators/range.html">Range</a></dd>
    <dd class="sub"><dl>
     <dt>pada interval tertentu</dt>
      <dd><a href="operators/interval.html">Interval</a></dd>
      <dd class="sub"><dl>
       <dt>setelah jeda waktu tertentu</dt>
       <dd><a href="operators/timer.html">Timer</a></dd>
      </dl></dd>
    </dl></dd>
   <dt>yang langsung selesai tanpa memancarkan apapun</dt>
    <dd><a href="operators/empty-never-throw.html">Empty</a></dd>
   <dt>yang tidak melakukan apapun</dt>
    <dd><a href="operators/empty-never-throw.html">Never</a></dd>
  </dl></dd>

 <dt>Saya ingin membuat sebuah Observable dengan cara menggabungkannya dengan Observable lainnya</dt>
  <dd class="sub"><dl>
   <dt>dan memancarkan semua item dari semua Observable tidak peduli urutan kapan mereka diterima</dt>
    <dd><a href="operators/merge.html">Merge</a></dd>
   <dt>dan memancarkan semua item dari semua Observable, satu per satu</dt>
    <dd><a href="operators/concat.html">Concat</a></dd>
   <dt>dengan mengombinasikan item dari dua atau lebih Observable secara berurutan untuk menghasilkan item baru untuk dipancarkan</dt>
    <dd class="sub"><dl>
     <dt>kapanpun <em>setiap</em> Observable telah memancarkan sebuah item baru</dt>
      <dd><a href="operators/zip.html">Zip</a></dd>
     <dt>kapanpun <em>salah satu dari</em> Observables telah memancarkan item baru</dt>
      <dd><a href="operators/combinelatest.html">CombineLatest</a></dd>
     <dt>kapanpun sebuah item dipancarkan oleh satu Observable dalam jangka waktu yang sudah ditentukan oleh sebuah item yang dipancarkan oleh Observable yang lain</dt>
      <dd><a href="operators/join.html">Join</a></dd>
     <dt>melalui  <code>Pola</code> dan <code>Rencana</code></dt>
      <dd><a href="operators/and-then-when.html">And/Then/When</a></dd>
    </dl></dd>
   <dt>dan memancarkan item hanya dari Observable terbaru yang memancarkan item</dt>
    <dd><a href="operators/switch.html">Switch</a></dd>
  </dl></dd>

 <dt>Saya ingin memancarkan item dari sebuah Observable setelah mengubah mereka</dt>
  <dd class="sub"><dl>
   <dt>satu per satu menggunakan sebuah fungsi</dt>
    <dd><a href="operators/map.html">Map</a></dd>
   <dt>dengan memancarkan semua item yang dipancarkan Observable yang bersangkutan</dt>
    <dd><a href="operators/flatmap.html">FlatMap</a></dd>
    <dd class="sub"><dl>
     <dt>satu per satu Observable, dengan urutan kapan mereka dipancarkan</dt>
      <dd><a href="operators/flatmap.html">ConcatMap</a></dd>
    </dl></dd>
   <dt>berdasarkan semua item yang mendahului mereka</dt>
    <dd><a href="operators/scan.html">Scan</a></dd>
   <dt>dengan menyertakan sebuah stempel waktu kepada mereka</dt>
    <dd><a href="operators/timestamp.html">Timestamp</a></dd>
   <dt>menjadi sebuah indikasi dari waktu yang telah berlalu sebelum pancaran item tersebut</dt>
    <dd><a href="operators/timeinterval.html">TimeInterval</a></dd>
  </dl></dd>

 <dt>Saya ingin menunda pancaran yang dilakukan oleh sebuah Observable untuk beberapa saat sebelum memulai memancarkannya kembali</dt>
  <dd><a href="operators/delay.html">Delay</a></dd>

 <dt>Saya ingin mengubah item <em>dan</em> notifikasi dari sebuah Observable menjadi item baru dan kemudian memancarkan mereka kembali</dt>
  <dd class="sub"><dl>
   <dt>dengan membungkus mereka dalam obyek <code>Notifikasi</code></dt>
    <dd><a href="operators/materialize-dematerialize.html">Materialize</a></dd>
    <dd class="sub"><dl>
     <dt>yang dimana bisa dibuka kembali</dt>
      <dd><a href="operators/materialize-dematerialize.html">Dematerialize</a></dd>
    </dl></dd>
  </dl></dd>

 <dt>Saya ingin mengabaikan semua item yang dipancarkan oleh sebuah Observable dan hanya mengirimkan notifikasi completed/error-nya</dt>
  <dd><a href="operators/ignoreelements.html">IgnoreElements</a></dd>

 <dt>Saya ingin mencerminkan sebuah Observable tetapi ingin menambahkan beberapa item sebelum pancarannya</dt>
  <dd><a href="operators/startwith.html">StartWith</a></dd>
  <dd class="sub"><dl>
   <dt>hanya jika pancaran tersebut merupakan pancaran kosong</dt>
    <dd><a href="operators/defaultifempty.html">DefaultIfEmpty</a></dd>
  </dl></dd>

 <dt>Saya ingin mengumpulkan item dari sebuah Observable dan memancarkan mereka kembali buffer dari item-item</dt>
  <dd><a href="operators/buffer.html">Buffer</a></dd>
  <dd class="sub"><dl>
   <dt>yang hanya mengandung item terakhir yang dipancarkan</dt>
    <dd><a href="operators/takelast.html">TakeLastBuffer</a></dd>
  </dl></dd>

 <dt>Saya ingin memisahkan satu Observable menjadi beberapa Observable</dt>
  <dd><a href="operators/window.html">Window</a></dd>
  <dd class="sub"><dl>
   <dt>hingga beberapa item yang mirip akan tergabung menjadi Observable yang sama</dt>
    <dd><a href="operators/groupby.html">GroupBy</a></dd>
  </dl></dd>

 <dt>Saya hanya ingin mengambil item tertentu yang dipancarkan oleh sebuah Observable:</dt>
  <dd class="sub"><dl>
   <dt>item terakhir yang dipancarkan sebelum Observable tersebut menyelesaikan pancarannya</dt>
    <dd><a href="operators/last.html">Last</a></dd>
   <dt>satu-satunya item yang dipancarkan</dt>
    <dd><a href="operators/first.html">Single</a></dd>
   <dt>item pertama yang dipancarkan</dt>
    <dd><a href="operators/first.html">First</a></dd>
  </dl></dd>

 <dt>Saya ingin memancarkan kembali beberapa item tertentu dari sebuah Observable</dt>
  <dd class="sub"><dl>
   <dt>dengan menyaring item yang tidak sesuai dengan predikat tertentu</dt>
    <dd><a href="operators/filter.html">Filter</a></dd>
   <dt>yang merupakan item paling pertama</dt>
    <dd><a href="operators/first.html">First</a></dd>
   <dt>yang merupakan <em>beberapa</em> item pertama</dt>
    <dd><a href="operators/take.html">Take</a></dd>
   <dt>yang merupakan item terakhir</dt>
    <dd><a href="operators/last.html">Last</a></dd>
   <dt>yang merupakan item <i>n</i></dt>
    <dd><a href="operators/elementat.html">ElementAt</a></dd>
   <dt>yang merupakan item setelah beberapa item pertama</dt>
    <dd class="sub"><dl>
     <dt>setelah <i>n</i> item</dt>
      <dd><a href="operators/skip.html">Skip</a></dd>
     <dt>sampai satu atau lebih item cocok dengan predikat</dt>
      <dd><a href="operators/skipwhile.html">SkipWhile</a></dd>
     <dt>setelah jeda waktu tertentu</dt>
      <dd><a href="operators/skip.html">Skip</a></dd>
     <dt>setelah Observable kedua memancarkan sebuah item</dt>
      <dd><a href="operators/skipuntil.html">SkipUntil</a></dd>
    </dl></dd>
   <dt>yang merupakan semua item kecuali beberapa item terakhir</dt>
    <dd class="sub"><dl>
     <dt>kecuali <i>n</i> item terakhir</dt>
      <dd><a href="operators/skiplast.html">SkipLast</a></dd>
     <dt>sampai satu atau lebih item cocok dengan predikat</dt>
      <dd><a href="operators/takewhile.html">TakeWhile</a></dd>
     <dt>kecuali item yang dipancarkan selama jeda waktu tertentu sebelum sumbernya menyelesaikan pancarannya</dt>
      <dd><a href="operators/skiplast.html">SkipLast</a></dd>
     <dt>kecuali item yang dipancarkan setelah sebuah Observable kedua mulai memancarkan item</dt>
      <dd><a href="operators/takeuntil.html">TakeUntil</a></dd>
    </dl></dd>
   <dt>dengan mencontoh Observable secara berkala</dt>
    <dd><a href="operators/sample.html">Sample</a></dd>
   <dt>dengan hanya memancarkan item yang tidak diikuti oleh item lainnya dalam jangka waktu tertentu</dt>
    <dd><a href="operators/debounce.html">Debounce</a></dd>
   <dt>dengan menahan item yang merupakan duplikasi dari item yang sudah dipancarkan</dt>
    <dd><a href="operators/distinct.html">Distinct</a></dd>
    <dd class="sub"><dl>
     <dt>jika kemudian mereka diikuti langsung oleh item yang merupakan duplikatnya</dt>
      <dd><a href="operators/distinct.html">DistinctUntilChanged</a></dd>
    </dl></dd>
   <dt>dengan menahan subscription untuk jangka waktu tertentu setelah dia mulai memancarkan item</dt>
    <dd><a href="operators/delay.html">DelaySubscription</a></dd>
  </dl></dd>

 <dt>Saya ingin memancarkan kembali item dari sebuah Observable jika dan hanya jika itu merupakan Observable pertama dari sekumpulan Observable yang memancarkan item</dt>
  <dd><a href="operators/amb.html">Amb</a></dd>

 <dt>Saya ingin mengevaluasi seluruh deret item yang dipancarkan oleh sebuah Observable</dt>
  <dd class="sub"><dl>
   <dt>dan memancarkan sebuah boolean jika <em>semua</em> item telah melewati suatu proses uji tertentu</dt>
    <dd><a href="operators/all.html">All</a></dd>
   <dt>dan memancarkan sebuah boolean yang menandakan bahwa Observable telah memancarkan item <em>apapun</em> (yang telah melewati suatu proses uji tertentu)</dt>
    <dd><a href="operators/contains.html">Contains</a></dd>
   <dt>dan memancarkan sebuah boolean yang menandakan bahwa Observable tersebut <em>tidak</em> memancarkan item apapun</dt>
    <dd><a href="operators/contains.html">IsEmpty</a></dd>
   <dt>dan memancarkan sebuah boolean yang menandakan deret tersebut sama dengan yang dipancarkan oleh sebuah Observable kedua</dt>
    <dd><a href="operators/sequenceequal.html">SequenceEqual</a></dd>
   <dt>dan memancarkan rata-rata dari semua nilai mereka</dt>
    <dd><a href="operators/average.html">Average</a></dd>
   <dt>dan memancarkan jumlah dari semua nilai mereka</dt>
    <dd><a href="operators/sum.html">Sum</a></dd>
   <dt>dan memancarkan sebuah angka yang menyimbolkan jumlah item dalam deret tersebut</dt>
    <dd><a href="operators/count.html">Count</a></dd>
   <dt>dan memancarkan sebuah item dengan nilai paling maksimal</dt>
    <dd><a href="operators/max.html">Max</a></dd>
   <dt>dan memancarkan sebuah item dengan nilai paling minimal</dt>
    <dd><a href="operators/min.html">Min</a></dd>
   <dt>dengan menerapkan sebuah fungsi agregasi kepada masing-masing item lalu kemudian memancarkan hasilnya</dt>
    <dd><a href="operators/scan.html">Scan</a></dd>
  </dl></dd>

 <dt>Saya ingin mengubah seluruh bagian dari deret item yang dipancarkan oleh sebuah Observable menjadi struktur data yang lain</dt>
  <dd><a href="operators/to.html">To</a></dd>

 <dt>Saya ingin sebuah operator yang bisa digunakan untuk beroperasi pada <a href="../scheduler.html">Scheduler</a> tertentu</dt>
  <dd><a href="operators/subscribeon.html">SubscribeOn</a></dd>
  <dd class="sub"><dl>
   <dt>ketika memberi notifikasi kepada observer</dt>
    <dd><a href="operators/observeon.html">ObserveOn</a></dd>
  </dl></dd>

 <dt>Saya ingin sebuah Observable yang bisa melakukan suatu aksi jika event tertentu terjadi</dt>
  <dd><a href="operators/do.html">Do</a></dd>

 <dt>Saya ingin sebuah Observable yang akan memberitahu observer jika terjadi suatu error</dt>
  <dd><a href="operators/empty-never-throw.html">Throw</a></dd>
  <dd class="sub"><dl>
   <dt>jika sudah melewati jangka waktu tertentu dengan tidak memancarkan item apapun</dt>
    <dd><a href="operators/timeout.html">Timeout</a></dd>
  </dl></dd>

 <dt>Saya ingin Observable yang bisa pulih dengan lancar</dt>
  <dd class="sub"><dl>
   <dt>dari sebuah timeout dengan menggantinya dengan sebuah Observable cadangan</dt>
    <dd><a href="operators/timeout.html">Timeout</a></dd>
   <dt>dari sebuah notifikasi error yang akan datang</dt>
    <dd><a href="operators/catch.html">Catch</a></dd>
    <dd class="sub"><dl>
     <dt>dengan mencoba untuk melakukan subscribe ulang ke Observable</dt>
      <dd><a href="operators/retry.html">Retry</a></dd>
    </dl></dd>
  </dl></dd>

 <dt>Saya ingin membuat suatu sumber yang memiliki masa hidup yang sama dengan Observable-nya</dt>
  <dd><a href="operators/using.html">Using</a></dd>

 <dt>Saya ingin untuk melakukan subscribe kepada sebuah Observable dan menerima sebuah <code>Future</code> yang melakukan blok sampai Observable tersebut selesai</dt>
  <dd><a href="operators/start.html">Start</a></dd>

 <dt>Saya ingin sebuah Obervable yang tidak akan mulai memancarkan item ke subscriber sampai diminta oleh subscribernya</dt>
  <dd><a href="operators/publish.html">Publish</a></dd>
  <dd class="sub"><dl>
   <dt>dan kemudian memancarkan item terakhir di deret itemnya</dt>
    <dd><a href="operators/publish.html">PublishLast</a></dd>
   <dt>dan kemudian memancarkan deret tersebut secara lengkap, bahkan kepada subscriber yang baru melakukan subscribe ketika observer sudah memancarkan item-item sebelumnya</dt>
    <dd><a href="operators/replay.html">Replay</a></dd>
   <dt>tetapi saya ingin item-item tersebut untuk ditiadakan ketika semua subscriber nya melakukan unsubscribe</dt>
    <dd><a href="operators/refcount.html">RefCount</a></dd>
   <dt>kemudian saya ingin memintanya untuk mulai</dt>
    <dd><a href="operators/connect.html">Connect</a></dd>
  </dl></dd>
</dl>
</div>
<h4 style="clear:both;">Lihat Juga</h4>
<ul>
 <li><a href="http://xgrommx.github.io/rx-book/content/which_operator_do_i_use/index.html">Which Operator do I use?</a> oleh Dennis Stoyanov (mirip seperti decision tree, tetapi terbatas pada operator RxJS)</li>
</ul>

<h1 id="alphabetical" style="clear: left;">Sebuah Daftar Operator Observable yang Disusun Menurut Abjad</h1>

Secara resmi, operator inti ditandai dengan **cetakan tebal**. Sisanya merepresentasikan jenis operator yang diimplementasi oleh bahasa-bahasa tersendiri atau operator khusus diluar dari operator-operator utama dari ReactiveX.

* [`Aggregate`]({{ site.url }}/documentation/operators/reduce.html)
* [**`All`**]({{ site.url }}/documentation/operators/all.html)
* [**`Amb`**]({{ site.url }}/documentation/operators/amb.html)
* [`ambArray`]({{ site.url }}/documentation/operators/amb.html)
* [`ambWith`]({{ site.url }}/documentation/operators/amb.html)
* [`and_`]({{ site.url }}/documentation/operators/and-then-when.html)
* [**`And`**]({{ site.url }}/documentation/operators/and-then-when.html)
* [`Any`]({{ site.url }}/documentation/operators/contains.html)
* [`apply`]({{ site.url }}/documentation/operators/create.html)
* [`as_blocking`]({{ site.url }}/documentation/operators/to.html)
* [`asObservable`]({{ site.url }}/documentation/operators/from.html)
* [`AssertEqual`]({{ site.url }}/documentation/operators/sequenceequal.html)
* [`asyncAction`]({{ site.url }}/documentation/operators/start.html)
* [`asyncFunc`]({{ site.url }}/documentation/operators/start.html)
* [**`Average`**]({{ site.url }}/documentation/operators/average.html)
* [`averageDouble`]({{ site.url }}/documentation/operators/average.html)
* [`averageFloat`]({{ site.url }}/documentation/operators/average.html)
* [`averageInteger`]({{ site.url }}/documentation/operators/average.html)
* [`averageLong`]({{ site.url }}/documentation/operators/average.html)
* [`blocking`]({{ site.url }}/documentation/operators/to.html)
* [`blockingFirst`]({{ site.url }}/documentation/operators/first.html)
* [`blockingForEach`]({{ site.url }}/documentation/operators/subscribe.html)
* [`blockingIterable`]({{ site.url }}/documentation/operators/to.html)
* [`blockingLast`]({{ site.url }}/documentation/operators/last.html)
* [`blockingLatest`]({{ site.url }}/documentation/operators/to.html)
* [`blockingMostRecent`]({{ site.url }}/documentation/operators/to.html)
* [`blockingNext`]({{ site.url }}/documentation/operators/to.html)
* [`blockingSingle`]({{ site.url }}/documentation/operators/first.html)
* [`blockingSubscribe`]({{ site.url }}/documentation/operators/subscribe.html)
* [**`Buffer`**]({{ site.url }}/documentation/operators/buffer.html)
* [`bufferWithCount`]({{ site.url }}/documentation/operators/buffer.html)
* [`bufferWithTime`]({{ site.url }}/documentation/operators/buffer.html)
* [`bufferWithTimeOrCount`]({{ site.url }}/documentation/operators/buffer.html)
* [`byLine`]({{ site.url }}/documentation/operators/map.html)
* [`cache`]({{ site.url }}/documentation/operators/replay.html)
* [`cacheWithInitialCapacity`]({{ site.url }}/documentation/operators/replay.html)
* [`case`]({{ site.url }}/documentation/operators/defer.html)
* [`Cast`]({{ site.url }}/documentation/operators/map.html)
* [**`Catch`**]({{ site.url }}/documentation/operators/catch.html)
* [`catchError`]({{ site.url }}/documentation/operators/catch.html)
* [`catchException`]({{ site.url }}/documentation/operators/catch.html)
* [`collect`]({{ site.url }}/documentation/operators/reduce.html)
* [`collect`]({{ site.url }}/documentation/operators/filter.html) (versi RxScala dari **`Filter`**)
* [`collectInto`]({{ site.url }}/documentation/operators/reduce.html)
* [**`CombineLatest`**]({{ site.url }}/documentation/operators/combinelatest.html)
* [`combineLatestDelayError`]({{ site.url }}/documentation/operators/combinelatest.html)
* [`combineLatestWith`]({{ site.url }}/documentation/operators/combinelatest.html)
* [**`Concat`**]({{ site.url }}/documentation/operators/concat.html)
* [`concat_all`]({{ site.url }}/documentation/operators/flatmap.html)
* [`concatAll`]({{ site.url }}/documentation/operators/concat.html)
* [`concatArray`]({{ site.url }}/documentation/operators/concat.html)
* [`concatArrayDelayError`]({{ site.url }}/documentation/operators/concat.html)
* [`concatArrayEager`]({{ site.url }}/documentation/operators/concat.html)
* [`concatDelayError`]({{ site.url }}/documentation/operators/concat.html)
* [`concatEager`]({{ site.url }}/documentation/operators/concat.html)
* [`concatMap`]({{ site.url }}/documentation/operators/flatmap.html)
* [`concatMapDelayError`]({{ site.url }}/documentation/operators/flatmap.html)
* [`concatMapEager`]({{ site.url }}/documentation/operators/flatmap.html)
* [`concatMapEagerDelayError`]({{ site.url }}/documentation/operators/flatmap.html)
* [`concatMapIterable`]({{ site.url }}/documentation/operators/flatmap.html)
* [`concatMapObserver`]({{ site.url }}/documentation/operators/flatmap.html)
* [`concatMapTo`]({{ site.url }}/documentation/operators/flatmap.html)
* [`concatWith`]({{ site.url }}/documentation/operators/concat.html)
* [**`Connect`**]({{ site.url }}/documentation/operators/connect.html)
* [`connect_forever`]({{ site.url }}/documentation/operators/connect.html)
* [`cons`]({{ site.url }}/documentation/operators/startwith.html)
* [**`Contains`**]({{ site.url }}/documentation/operators/contains.html)
* [`controlled`]({{ site.url }}/documentation/operators/backpressure.html)
* [**`Count`**]({{ site.url }}/documentation/operators/count.html)
* [`countLong`]({{ site.url }}/documentation/operators/count.html)
* [**`Create`**]({{ site.url }}/documentation/operators/create.html)
* [`cycle`]({{ site.url }}/documentation/operators/repeat.html)
* [**`Debounce`**]({{ site.url }}/documentation/operators/debounce.html)
* [`decode`]({{ site.url }}/documentation/operators/from.html)
* [**`DefaultIfEmpty`**]({{ site.url }}/documentation/operators/defaultifempty.html)
* [**`Defer`**]({{ site.url }}/documentation/operators/defer.html)
* [`deferFuture`]({{ site.url }}/documentation/operators/start.html)
* [**`Delay`**]({{ site.url }}/documentation/operators/delay.html)
* [`delaySubscription`]({{ site.url }}/documentation/operators/delay.html)
* [`delayWithSelector`]({{ site.url }}/documentation/operators/delay.html)
* [**`Dematerialize`**]({{ site.url }}/documentation/operators/materialize-dematerialize.html)
* [**`Distinct`**]({{ site.url }}/documentation/operators/distinct.html)
* [`distinctKey`]({{ site.url }}/documentation/operators/distinct.html)
* [`distinctUntilChanged`]({{ site.url }}/documentation/operators/distinct.html)
* [`distinctUntilKeyChanged`]({{ site.url }}/documentation/operators/distinct.html)
* [**`Do`**]({{ site.url }}/documentation/operators/do.html)
* [`doAction`]({{ site.url }}/documentation/operators/do.html)
* [`doAfterTerminate`]({{ site.url }}/documentation/operators/do.html)
* [`doOnComplete`]({{ site.url }}/documentation/operators/do.html)
* [`doOnCompleted`]({{ site.url }}/documentation/operators/do.html)
* [`doOnDispose`]({{ site.url }}/documentation/operators/do.html)
* [`doOnEach`]({{ site.url }}/documentation/operators/do.html)
* [`doOnError`]({{ site.url }}/documentation/operators/do.html)
* [`doOnLifecycle`]({{ site.url }}/documentation/operators/do.html)
* [`doOnNext`]({{ site.url }}/documentation/operators/do.html)
* [`doOnRequest`]({{ site.url }}/documentation/operators/do.html)
* [`doOnSubscribe`]({{ site.url }}/documentation/operators/do.html)
* [`doOnTerminate`]({{ site.url }}/documentation/operators/do.html)
* [`doOnUnsubscribe`]({{ site.url }}/documentation/operators/do.html)
* [`doseq`]({{ site.url }}/documentation/operators/subscribe.html)
* [`doWhile`]({{ site.url }}/documentation/operators/repeat.html)
* [`drop`]({{ site.url }}/documentation/operators/skip.html)
* [`dropRight`]({{ site.url }}/documentation/operators/skiplast.html)
* [`dropUntil`]({{ site.url }}/documentation/operators/skipuntil.html)
* [`dropWhile`]({{ site.url }}/documentation/operators/skipwhile.html)
* [**`ElementAt`**]({{ site.url }}/documentation/operators/elementat.html)
* [`ElementAtOrDefault`]({{ site.url }}/documentation/operators/elementat.html)
* [**`Empty`**]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [`emptyObservable`]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [`empty?`]({{ site.url }}/documentation/operators/contains.html)
* [`encode`]({{ site.url }}/documentation/operators/map.html)
* [`ensures`]({{ site.url }}/documentation/operators/do.html)
* [`error`]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [`every`]({{ site.url }}/documentation/operators/all.html)
* [`exclusive`]({{ site.url }}/documentation/operators/switch.html)
* [`exists`]({{ site.url }}/documentation/operators/contains.html)
* [`expand`]({{ site.url }}/documentation/operators/flatmap.html)
* [`failWith`]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [**`Filter`**]({{ site.url }}/documentation/operators/filter.html)
* [`filterNot`]({{ site.url }}/documentation/operators/filter.html)
* [`Finally`]({{ site.url }}/documentation/operators/do.html)
* [`finallyAction`]({{ site.url }}/documentation/operators/do.html)
* [`finallyDo`]({{ site.url }}/documentation/operators/do.html)
* [`find`]({{ site.url }}/documentation/operators/contains.html)
* [`findIndex`]({{ site.url }}/documentation/operators/contains.html)
* [**`First`**]({{ site.url }}/documentation/operators/first.html)
* [`firstElement`]({{ site.url }}/documentation/operators/first.html)
* [`FirstOrDefault`]({{ site.url }}/documentation/operators/first.html)
* [`firstOrElse`]({{ site.url }}/documentation/operators/first.html)
* [**`FlatMap`**]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapFirst`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapIterable`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapIterableWith`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapLatest`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapObserver`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapWith`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapWithMaxConcurrent`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flat_map_with_index`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatten`]({{ site.url }}/documentation/operators/merge.html)
* [`flattenDelayError`]({{ site.url }}/documentation/operators/merge.html)
* [`foldl`]({{ site.url }}/documentation/operators/reduce.html)
* [`foldLeft`]({{ site.url }}/documentation/operators/reduce.html)
* [`for`]({{ site.url }}/documentation/operators/flatmap.html)
* [`forall`]({{ site.url }}/documentation/operators/all.html)
* [`ForEach`]({{ site.url }}/documentation/operators/subscribe.html)
* [`forEachFuture`]({{ site.url }}/documentation/operators/start.html)
* [`forEachWhile`]({{ site.url }}/documentation/operators/subscribe.html)
* [`forIn`]({{ site.url }}/documentation/operators/flatmap.html)
* [`forkJoin`]({{ site.url }}/documentation/operators/zip.html)
* [**`From`**]({{ site.url }}/documentation/operators/from.html)
* [`fromAction`]({{ site.url }}/documentation/operators/from.html)
* [`fromArray`]({{ site.url }}/documentation/operators/from.html)
* [`FromAsyncPattern`]({{ site.url }}/documentation/operators/from.html)
* [`fromCallable`]({{ site.url }}/documentation/operators/from.html)
* [`fromCallback`]({{ site.url }}/documentation/operators/from.html)
* [`FromEvent`]({{ site.url }}/documentation/operators/from.html)
* [`FromEventPattern`]({{ site.url }}/documentation/operators/from.html)
* [`fromFunc0`]({{ site.url }}/documentation/operators/from.html)
* [`fromFuture`]({{ site.url }}/documentation/operators/from.html)
* [`fromIterable`]({{ site.url }}/documentation/operators/from.html)
* [`fromIterator`]({{ site.url }}/documentation/operators/from.html)
* [`from_list`]({{ site.url }}/documentation/operators/from.html)
* [`fromNodeCallback`]({{ site.url }}/documentation/operators/from.html)
* [`fromPromise`]({{ site.url }}/documentation/operators/from.html)
* [`fromPublisher`]({{ site.url }}/documentation/operators/from.html)
* [`fromRunnable`]({{ site.url }}/documentation/operators/from.html)
* [`Generate`]({{ site.url }}/documentation/operators/create.html)
* [`generateWithAbsoluteTime`]({{ site.url }}/documentation/operators/create.html)
* [`generateWithRelativeTime`]({{ site.url }}/documentation/operators/create.html)
* [`generator`]({{ site.url }}/documentation/operators/create.html)
* [`GetEnumerator`]({{ site.url }}/documentation/operators/to.html)
* [`getIterator`]({{ site.url }}/documentation/operators/to.html)
* [**`GroupBy`**]({{ site.url }}/documentation/operators/groupby.html)
* [`GroupByUntil`]({{ site.url }}/documentation/operators/groupby.html)
* [`GroupJoin`]({{ site.url }}/documentation/operators/join.html)
* [`head`]({{ site.url }}/documentation/operators/first.html)
* [`headOption`]({{ site.url }}/documentation/operators/first.html)
* [`headOrElse`]({{ site.url }}/documentation/operators/first.html)
* [`if`]({{ site.url }}/documentation/operators/defer.html)
* [`ifThen`]({{ site.url }}/documentation/operators/defer.html)
* [**`IgnoreElements`**]({{ site.url }}/documentation/operators/ignoreelements.html)
* [`indexOf`]({{ site.url }}/documentation/operators/contains.html)
* [`interleave`]({{ site.url }}/documentation/operators/merge.html)
* [`interpose`]({{ site.url }}/documentation/operators/to.html)
* [**`Interval`**]({{ site.url }}/documentation/operators/interval.html)
* [`intervalRange`]({{ site.url }}/documentation/operators/range.html)
* [`into`]({{ site.url }}/documentation/operators/reduce.html)
* [`isEmpty`]({{ site.url }}/documentation/operators/contains.html)
* [`items`]({{ site.url }}/documentation/operators/just.html)
* [**`Join`**]({{ site.url }}/documentation/operators/join.html)
* [`join`]({{ site.url }}/documentation/operators/sum.html) (string)
* [`jortSort`]({{ site.url }}/documentation/operators/all.html)
* [`jortSortUntil`]({{ site.url }}/documentation/operators/all.html)
* [**`Just`**]({{ site.url }}/documentation/operators/just.html)
* [`keep`]({{ site.url }}/documentation/operators/map.html)
* [`keep-indexed`]({{ site.url }}/documentation/operators/map.html)
* [**`Last`**]({{ site.url }}/documentation/operators/last.html)
* [`lastElement`]({{ site.url }}/documentation/operators/last.html)
* [`lastOption`]({{ site.url }}/documentation/operators/last.html)
* [`LastOrDefault`]({{ site.url }}/documentation/operators/last.html)
* [`lastOrElse`]({{ site.url }}/documentation/operators/last.html)
* [`Latest`]({{ site.url }}/documentation/operators/first.html)
* [`latest`]({{ site.url }}/documentation/operators/switch.html) (versi Rx.rb dari **`Switch`**)
* [`length`]({{ site.url }}/documentation/operators/count.html)
* [`let`]({{ site.url }}/documentation/operators/publish.html)
* [`letBind`]({{ site.url }}/documentation/operators/publish.html)
* [`lift`]({{ site.url }}/documentation/implement-operator.html)
* [`limit`]({{ site.url }}/documentation/operators/take.html)
* [`LongCount`]({{ site.url }}/documentation/operators/count.html)
* [`ManySelect`]({{ site.url }}/documentation/operators/flatmap.html)
* [**`Map`**]({{ site.url }}/documentation/operators/map.html)
* [`map`]({{ site.url }}/documentation/operators/zip.html) (versi RxClojure dari **`Zip`**)
* [`MapCat`]({{ site.url }}/documentation/operators/flatmap.html)
* [`mapCat`]({{ site.url }}/documentation/operators/zip.html) (versi RxClojure dari **`Zip`**)
* [`map-indexed`]({{ site.url }}/documentation/operators/map.html)
* [`mapTo`]({{ site.url }}/documentation/operators/map.html)
* [`mapWithIndex`]({{ site.url }}/documentation/operators/map.html)
* [**`Materialize`**]({{ site.url }}/documentation/operators/materialize-dematerialize.html)
* [**`Max`**]({{ site.url }}/documentation/operators/max.html)
* [`MaxBy`]({{ site.url }}/documentation/operators/max.html)
* [**`Merge`**]({{ site.url }}/documentation/operators/merge.html)
* [`mergeAll`]({{ site.url }}/documentation/operators/merge.html)
* [`mergeArray`]({{ site.url }}/documentation/operators/merge.html)
* [`mergeArrayDelayError`]({{ site.url }}/documentation/operators/merge.html)
* [`merge_concurrent`]({{ site.url }}/documentation/operators/merge.html)
* [`mergeDelayError`]({{ site.url }}/documentation/operators/merge.html)
* [`mergeObservable`]({{ site.url }}/documentation/operators/merge.html)
* [`mergeWith`]({{ site.url }}/documentation/operators/merge.html)
* [**`Min`**]({{ site.url }}/documentation/operators/min.html)
* [`MinBy`]({{ site.url }}/documentation/operators/min.html)
* [`MostRecent`]({{ site.url }}/documentation/operators/first.html)
* [`Multicast`]({{ site.url }}/documentation/operators/publish.html)
* [`multicastWithSelector`]({{ site.url }}/documentation/operators/publish.html)
* [`nest`]({{ site.url }}/documentation/operators/to.html)
* [**`Never`**]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [`Next`]({{ site.url }}/documentation/operators/takelast.html)
* [`Next`]({{ site.url }}/documentation/operators/first.html) (versi BlockingObservable)
* [`none`]({{ site.url }}/documentation/operators/contains.html)
* [`nonEmpty`]({{ site.url }}/documentation/operators/contains.html)
* [`nth`]({{ site.url }}/documentation/operators/elementat.html)
* [**`ObserveOn`**]({{ site.url }}/documentation/operators/observeon.html)
* [`ObserveOnDispatcher`]({{ site.url }}/documentation/operators/observeon.html)
* [`observeSingleOn`]({{ site.url }}/documentation/operators/observeon.html)
* [`of`]({{ site.url }}/documentation/operators/from.html)
* [`of_array`]({{ site.url }}/documentation/operators/from.html)
* [`ofArrayChanges`]({{ site.url }}/documentation/operators/from.html)
* [`of_enumerable`]({{ site.url }}/documentation/operators/from.html)
* [`of_enumerator`]({{ site.url }}/documentation/operators/from.html)
* [`ofObjectChanges`]({{ site.url }}/documentation/operators/from.html)
* [`OfType`]({{ site.url }}/documentation/operators/filter.html)
* [`ofWithScheduler`]({{ site.url }}/documentation/operators/from.html)
* [`onBackpressureBlock`]({{ site.url }}/documentation/operators/backpressure.html)
* [`onBackpressureBuffer`]({{ site.url }}/documentation/operators/backpressure.html)
* [`onBackpressureDrop`]({{ site.url }}/documentation/operators/backpressure.html)
* [`OnErrorResumeNext`]({{ site.url }}/documentation/operators/catch.html)
* [`onErrorReturn`]({{ site.url }}/documentation/operators/catch.html)
* [`onErrorReturnItem`]({{ site.url }}/documentation/operators/catch.html)
* [`onExceptionResumeNext`]({{ site.url }}/documentation/operators/catch.html)
* [`onTerminateDetach`]({{ site.url }}/documentation/operators/do.html)
* [`orElse`]({{ site.url }}/documentation/operators/defaultifempty.html)
* [`pairs`]({{ site.url }}/documentation/operators/from.html)
* [`pairwise`]({{ site.url }}/documentation/operators/buffer.html)
* [`partition`]({{ site.url }}/documentation/operators/groupby.html)
* [`partition-all`]({{ site.url }}/documentation/operators/window.html)
* [`pausable`]({{ site.url }}/documentation/operators/backpressure.html)
* [`pausableBuffered`]({{ site.url }}/documentation/operators/backpressure.html)
* [`pluck`]({{ site.url }}/documentation/operators/map.html)
* [`product`]({{ site.url }}/documentation/operators/sum.html)
* [**`Publish`**]({{ site.url }}/documentation/operators/publish.html)
* [`PublishLast`]({{ site.url }}/documentation/operators/publish.html)
* [`publish_synchronized`]({{ site.url }}/documentation/operators/replay.html)
* [`publishValue`]({{ site.url }}/documentation/operators/publish.html)
* [`raise_error`]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [**`Range`**]({{ site.url }}/documentation/operators/range.html)
* [**`Reduce`**]({{ site.url }}/documentation/operators/reduce.html)
* [`reduceWith`]({{ site.url }}/documentation/operators/reduce.html)
* [`reductions`]({{ site.url }}/documentation/operators/scan.html)
* [**`RefCount`**]({{ site.url }}/documentation/operators/refcount.html)
* [**`Repeat`**]({{ site.url }}/documentation/operators/repeat.html)
* [`repeat_infinitely`]({{ site.url }}/documentation/operators/repeat.html)
* [`repeatUntil`]({{ site.url }}/documentation/operators/repeat.html)
* [`repeatWhen`]({{ site.url }}/documentation/operators/repeat.html)
* [**`Replay`**]({{ site.url }}/documentation/operators/replay.html)
* [`rescue_error`]({{ site.url }}/documentation/operators/catch.html)
* [`rest`]({{ site.url }}/documentation/operators/first.html)
* [**`Retry`**]({{ site.url }}/documentation/operators/retry.html)
* [`retry_infinitely`]({{ site.url }}/documentation/operators/retry.html)
* [`retryUntil`]({{ site.url }}/documentation/operators/retry.html)
* [`retryWhen`]({{ site.url }}/documentation/operators/retry.html)
* [`Return`]({{ site.url }}/documentation/operators/just.html)
* [`returnElement`]({{ site.url }}/documentation/operators/just.html)
* [`returnValue`]({{ site.url }}/documentation/operators/just.html)
* [`runAsync`]({{ site.url }}/documentation/operators/from.html)
* [`safeSubscribe`]({{ site.url }}/documentation/operators/subscribe.html)
* [**`Sample`**]({{ site.url }}/documentation/operators/sample.html)
* [**`Scan`**]({{ site.url }}/documentation/operators/scan.html)
* [`scanWith`]({{ site.url }}/documentation/operators/scan.html)
* [`scope`]({{ site.url }}/documentation/operators/using.html)
* [`Select`]({{ site.url }}/documentation/operators/map.html) (nama lain dari **`Map`**)
* [`select`]({{ site.url }}/documentation/operators/filter.html) (nama lain dari **`Filter`**)
* [`selectConcat`]({{ site.url }}/documentation/operators/flatmap.html)
* [`selectConcatObserver`]({{ site.url }}/documentation/operators/flatmap.html)
* [`SelectMany`]({{ site.url }}/documentation/operators/flatmap.html)
* [`selectManyObserver`]({{ site.url }}/documentation/operators/flatmap.html)
* [`select_switch`]({{ site.url }}/documentation/operators/switch.html)
* [`selectSwitch`]({{ site.url }}/documentation/operators/flatmap.html)
* [`selectSwitchFirst`]({{ site.url }}/documentation/operators/flatmap.html)
* [`selectWithMaxConcurrent`]({{ site.url }}/documentation/operators/flatmap.html)
* [`select_with_index`]({{ site.url }}/documentation/operators/filter.html)
* [`seq`]({{ site.url }}/documentation/operators/from.html)
* [**`SequenceEqual`**]({{ site.url }}/documentation/operators/sequenceequal.html)
* [`sequence_eql?`]({{ site.url }}/documentation/operators/sequenceequal.html)
* [`SequenceEqualWith`]({{ site.url }}/documentation/operators/sequenceequal.html)
* [**`Serialize`**]({{ site.url }}/documentation/operators/serialize.html)
* [`share`]({{ site.url }}/documentation/operators/refcount.html)
* [`shareReplay`]({{ site.url }}/documentation/operators/replay.html)
* [`shareValue`]({{ site.url }}/documentation/operators/refcount.html)
* [`Single`]({{ site.url }}/documentation/operators/first.html)
* [`singleElement`]({{ site.url }}/documentation/operators/first.html)
* [`SingleOrDefault`]({{ site.url }}/documentation/operators/first.html)
* [`singleOption`]({{ site.url }}/documentation/operators/first.html)
* [`singleOrElse`]({{ site.url }}/documentation/operators/first.html)
* [`size`]({{ site.url }}/documentation/operators/count.html)
* [**`Skip`**]({{ site.url }}/documentation/operators/skip.html)
* [**`SkipLast`**]({{ site.url }}/documentation/operators/skiplast.html)
* [`skipLastWithTime`]({{ site.url }}/documentation/operators/skiplast.html)
* [**`SkipUntil`**]({{ site.url }}/documentation/operators/skipuntil.html)
* [`skipUntilWithTime`]({{ site.url }}/documentation/operators/skipuntil.html)
* [**`SkipWhile`**]({{ site.url }}/documentation/operators/skipwhile.html)
* [`skipWhileWithIndex`]({{ site.url }}/documentation/operators/skipwhile.html)
* [`skip_with_time`]({{ site.url }}/documentation/operators/skip.html)
* [`slice`]({{ site.url }}/documentation/operators/filter.html)
* [`sliding`]({{ site.url }}/documentation/operators/window.html)
* [`slidingBuffer`]({{ site.url }}/documentation/operators/buffer.html)
* [`some`]({{ site.url }}/documentation/operators/contains.html)
* [`sort`]({{ site.url }}/documentation/operators/to.html)
* [`sorted`]({{ site.url }}/documentation/operators/to.html)
* [`sort-by`]({{ site.url }}/documentation/operators/to.html)
* [`sorted-list-by`]({{ site.url }}/documentation/operators/to.html)
* [`split`]({{ site.url }}/documentation/operators/flatmap.html)
* [`split-with`]({{ site.url }}/documentation/operators/groupby.html)
* [**`Start`**]({{ site.url }}/documentation/operators/start.html)
* [`startAsync`]({{ site.url }}/documentation/operators/start.html)
* [`startFuture`]({{ site.url }}/documentation/operators/start.html)
* [**`StartWith`**]({{ site.url }}/documentation/operators/startwith.html)
* [`startWithArray`]({{ site.url }}/documentation/operators/startwith.html)
* [`stringConcat`]({{ site.url }}/documentation/operators/sum.html)
* [`stopAndWait`]({{ site.url }}/documentation/operators/backpressure.html)
* [`subscribe`]({{ site.url }}/documentation/operators/subscribe.html)
* [`subscribeActual`]({{ site.url }}/documentation/operators/subscribe.html)
* [**`SubscribeOn`**]({{ site.url }}/documentation/operators/subscribeon.html)
* [`SubscribeOnDispatcher`]({{ site.url }}/documentation/operators/subscribeon.html)
* [`subscribeOnCompleted`]({{ site.url }}/documentation/operators/subscribe.html)
* [`subscribeOnError`]({{ site.url }}/documentation/operators/subscribe.html)
* [`subscribeOnNext`]({{ site.url }}/documentation/operators/subscribe.html)
* [`subscribeWith`]({{ site.url }}/documentation/operators/subscribe.html)
* [**`Sum`**]({{ site.url }}/documentation/operators/sum.html)
* [`sumDouble`]({{ site.url }}/documentation/operators/sum.html)
* [`sumFloat`]({{ site.url }}/documentation/operators/sum.html)
* [`sumInteger`]({{ site.url }}/documentation/operators/sum.html)
* [`sumLong`]({{ site.url }}/documentation/operators/sum.html)
* [**`Switch`**]({{ site.url }}/documentation/operators/switch.html)
* [`switchCase`]({{ site.url }}/documentation/operators/defer.html)
* [`switchIfEmpty`]({{ site.url }}/documentation/operators/defaultifempty.html)
* [`switchLatest`]({{ site.url }}/documentation/operators/switch.html)
* [`switchMap`]({{ site.url }}/documentation/operators/flatmap.html)
* [`switchMapDelayError`]({{ site.url }}/documentation/operators/flatmap.html)
* [`switchOnNext`]({{ site.url }}/documentation/operators/switch.html)
* [`switchOnNextDelayError`]({{ site.url }}/documentation/operators/switch.html)
* [`Synchronize`]({{ site.url }}/documentation/operators/serialize.html)
* [**`Take`**]({{ site.url }}/documentation/operators/take.html)
* [`take_with_time`]({{ site.url }}/documentation/operators/take.html)
* [`takeFirst`]({{ site.url }}/documentation/operators/first.html)
* [**`TakeLast`**]({{ site.url }}/documentation/operators/takelast.html)
* [`takeLastBuffer`]({{ site.url }}/documentation/operators/takelast.html)
* [`takeLastBufferWithTime`]({{ site.url }}/documentation/operators/takelast.html)
* [`takeLastWithTime`]({{ site.url }}/documentation/operators/takelast.html)
* [`takeRight`]({{ site.url }}/documentation/operators/last.html) (see also: [**`TakeLast`**]({{ site.url }}/documentation/operators/takelast.html))
* [**`TakeUntil`**]({{ site.url }}/documentation/operators/takeuntil.html)
* [`takeUntilWithTime`]({{ site.url }}/documentation/operators/takeuntil.html)
* [**`TakeWhile`**]({{ site.url }}/documentation/operators/takewhile.html)
* [`takeWhileWithIndex`]({{ site.url }}/documentation/operators/takewhile.html)
* [`tail`]({{ site.url }}/documentation/operators/takelast.html)
* [`tap`]({{ site.url }}/documentation/operators/do.html)
* [`tapOnCompleted`]({{ site.url }}/documentation/operators/do.html)
* [`tapOnError`]({{ site.url }}/documentation/operators/do.html)
* [`tapOnNext`]({{ site.url }}/documentation/operators/do.html)
* [**`Then`**]({{ site.url }}/documentation/operators/and-then-when.html)
* [`thenDo`]({{ site.url }}/documentation/operators/and-then-when.html)
* [`Throttle`]({{ site.url }}/documentation/operators/debounce.html)
* [`throttleFirst`]({{ site.url }}/documentation/operators/sample.html)
* [`throttleLast`]({{ site.url }}/documentation/operators/sample.html)
* [`throttleWithSelector`]({{ site.url }}/documentation/operators/debounce.html)
* [`throttleWithTimeout`]({{ site.url }}/documentation/operators/debounce.html)
* [**`Throw`**]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [`throwError`]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [`throwException`]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [**`TimeInterval`**]({{ site.url }}/documentation/operators/timeinterval.html)
* [**`Timeout`**]({{ site.url }}/documentation/operators/timeout.html)
* [`timeoutWithSelector`]({{ site.url }}/documentation/operators/timeout.html)
* [**`Timer`**]({{ site.url }}/documentation/operators/timer.html)
* [**`Timestamp`**]({{ site.url }}/documentation/operators/timestamp.html)
* [**`To`**]({{ site.url }}/documentation/operators/to.html)
* [`to_a`]({{ site.url }}/documentation/operators/to.html)
* [`ToArray`]({{ site.url }}/documentation/operators/to.html)
* [`ToAsync`]({{ site.url }}/documentation/operators/start.html)
* [`toBlocking`]({{ site.url }}/documentation/operators/to.html)
* [`toBuffer`]({{ site.url }}/documentation/operators/to.html)
* [`to_dict`]({{ site.url }}/documentation/operators/to.html)
* [`ToDictionary`]({{ site.url }}/documentation/operators/to.html)
* [`ToEnumerable`]({{ site.url }}/documentation/operators/to.html)
* [`ToEvent`]({{ site.url }}/documentation/operators/to.html)
* [`ToEventPattern`]({{ site.url }}/documentation/operators/to.html)
* [`ToFlowable`]({{ site.url }}/documentation/operators/to.html)
* [`ToFuture`]({{ site.url }}/documentation/operators/to.html)
* [`to_h`]({{ site.url }}/documentation/operators/to.html)
* [`toIndexedSeq`]({{ site.url }}/documentation/operators/to.html)
* [`toIterable`]({{ site.url }}/documentation/operators/to.html)
* [`toIterator`]({{ site.url }}/documentation/operators/to.html)
* [`ToList`]({{ site.url }}/documentation/operators/to.html)
* [`ToLookup`]({{ site.url }}/documentation/operators/to.html)
* [`toMap`]({{ site.url }}/documentation/operators/to.html)
* [`toMultiMap`]({{ site.url }}/documentation/operators/to.html)
* [`ToObservable`]({{ site.url }}/documentation/operators/from.html)
* [`toSet`]({{ site.url }}/documentation/operators/to.html)
* [`toSortedList`]({{ site.url }}/documentation/operators/to.html)
* [`toStream`]({{ site.url }}/documentation/operators/to.html)
* [`ToTask`]({{ site.url }}/documentation/operators/to.html)
* [`toTraversable`]({{ site.url }}/documentation/operators/to.html)
* [`toVector`]({{ site.url }}/documentation/operators/to.html)
* [`tumbling`]({{ site.url }}/documentation/operators/window.html)
* [`tumblingBuffer`]({{ site.url }}/documentation/operators/buffer.html)
* [`unsafeCreate`]({{ site.url }}/documentation/operators/create.html)
* [`unsubscribeOn`]({{ site.url }}/documentation/operators/subscribeon.html)
* [**`Using`**]({{ site.url }}/documentation/operators/using.html)
* [**`When`**]({{ site.url }}/documentation/operators/and-then-when.html)
* [`Where`]({{ site.url }}/documentation/operators/filter.html)
* [`while`]({{ site.url }}/documentation/operators/repeat.html)
* [`whileDo`]({{ site.url }}/documentation/operators/repeat.html)
* [**`Window`**]({{ site.url }}/documentation/operators/window.html)
* [`windowWithCount`]({{ site.url }}/documentation/operators/window.html)
* [`windowWithTime`]({{ site.url }}/documentation/operators/window.html)
* [`windowWithTimeOrCount`]({{ site.url }}/documentation/operators/window.html)
* [`windowed`]({{ site.url }}/documentation/operators/backpressure.html)
* [`withFilter`]({{ site.url }}/documentation/operators/filter.html)
* [`withLatestFrom`]({{ site.url }}/documentation/operators/combinelatest.html)
* [**`Zip`**]({{ site.url }}/documentation/operators/zip.html)
* [`zipArray`]({{ site.url }}/documentation/operators/zip.html)
* [`zipIterable`]({{ site.url }}/documentation/operators/zip.html)
* [`zipWith`]({{ site.url }}/documentation/operators/zip.html)
* [`zipWithIndex`]({{ site.url }}/documentation/operators/zip.html)
* [`++`]({{ site.url }}/documentation/operators/concat.html)
* [`+:`]({{ site.url }}/documentation/operators/startwith.html)
* [`:+`]({{ site.url }}/documentation/operators/just.html)