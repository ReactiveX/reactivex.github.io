---
layout: documentation
title: ReactiveX - Scheduler
lang: id
id: scheduler
---

<h1>Scheduler</h1>
<p>
 Jika anda ingin menerapkan multithreading pada operator-operator Obsevable anda, anda bisa melakukannya dengan cara menginstruksikan operator-operator tersebut (atau Observable tertentu) untuk beroperasi pada <dfn>Scheduler</dfn> tertentu.
</p><p>
 Beberapa operator Observable ReactiveX mempunyai beberapa tipe operator yang memerlukan sebuah Scheduler sebagai paramter. Hal tersebut menginstruksikan operator untuk melakukan beberapa atau semua pekerjaannya dalam Scheduler tertentu.
</p>
<figure>
 <figcaption><p>
  Standarnya, sebuah Observable dan rantai operator yang anda aplikasikan kepadanya akan melakukan pekerjaannya, dan akan mengirim notifikasi kepada observernya, dalam thread yang sama dengan tempat dia melakukan <code>Subscribe</code>. Operator <span class="operator">SubscribeOn</span> mengubah perilaku ini dengan menspesifikasikan sebuah Scheduler yang berbeda sebagai tempat Obervabler beroperasi. Operator <span class="operator">ObserveOn</span> operator menspesifikasikan sebuah Scheduler yang berbeda yang akan digunakan observable untuk mengirimkan notifikasi kepada observernya.
 </p><p>
  Seperti ditunjukkan pada ilustrasi berikut, operator <span class="operator">SubscribeOn</span> menentukan thread tempat Observable tersebut akan berporeasi, tidak peduli di titik rantai operator yang mana operator ini dipanggil. Pada sisi lainnya, <span class="operator">ObserveOn</span>, mempengaruhi thread yang akan dipakai Observable <em>dibawah</em> dimana operator-nya muncul. Untuk alasan ini, anda bisa memanggil 
  <span class="operator">ObserveOn</span> beberapa kali pada titik yang berbeda-beda dalam rantai operator Observable untuk mengubah thread mana yang akan dipakai operator untuk beroperasi.
 </p></figcaption>
 <img src="operators/images/schedulers.png" style="width:100%;" alt="ObserveOn and SubscribeOn" />
</figure>

<h4>Lihat Juga</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/15_SchedulingAndThreading.html"><cite>Introduction to Rx</cite>: Scheduling and Threading</a></li>
 <li><a href="http://channel9.msdn.com/Series/Rx-Workshop/Rx-Workshop-Schedulers"><cite>Rx Workshop</cite>: Schedulers</a></li>
 <li><a href="http://xgrommx.github.io/rx-book/content/getting_started_with_rxjs/scheduling_and_concurrency.html">Using Schedulers</a> oleh Dennis Stoyanov</li>
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
    <h2>Jenis-jenis Scheduler</h2>
    <p>
     Anda mendapatkan sebuah Scheduler dari sebuah factory method yang dijelaskan di class
     <a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html">
     <code>Schedulers</code></a>. Table berikut menunjukkan berbagai jenis Scheduler yang bisa anda pakai di RxGroovy:
    </p>
    <table class="table">
     <thead>
      <tr><th>Scheduler</th><th>Tujuan</th></tr>
     </thead>
     <tbody>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#computation()"><code>Schedulers.computation(&#8239;)</code></a></td><td>digunakan untuk komputasi seperti event-loops dan callback; jangan memakai scheduler ini untuk I/O (pakai <code>Schedulers.io(&#8239;)</code>); jumlah thread, standarnya, sama dengan jumlah processor</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#from(java.util.concurrent.Executor)"><code>Schedulers.from(executor)</code></a></td><td>menggunakan <code>Executor</code> yang dispesifikasi sebagai sebuah Scheduler</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#immediate()"><code>Schedulers.immediate(&#8239;)</code></a></td><td>scheduler bekerja secara langsung di thread itu juga</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#io()"><code>Schedulers.io(&#8239;)</code></a></td><td>digunakan untuk pekerjaan yang berhubungan dengan I/O seperti asynchronous perfomance pada I/0 blocking, scheduler ini dijaga oleh sebuah thread-pool yang akan meningkatkan kapasitasnya jika diperlukan; untuk pekerjaan komputasi biasa, pakailah <code>Schedulers.computation(&#8239;)</code>; <code>Schedulers.io(&#8239)</code> secara standar merupakan sebuah <code>CachedThreadScheduler</code>, dimana seperti sebuah thread scheduler baru dengan thread caching</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#newThread()"><code>Schedulers.newThread(&#8239;)</code></a></td><td>membuat sebuah thread baru untuk tiap unit kerja</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#trampoline()"><code>Schedulers.trampoline(&#8239;)</code></a></td><td>memasukkan pekerjaan yang perlu dilakukan dalam sebuah antrian pada thread saat itu juga</td></tr>
     </tbody>
    </table>
    <h2>Scheduler default untuk Operator Observable RxGroovy</h2>
    <p>
     Beberapa operator Observable di RxGroovy memiliki beberapa bentuk lain yang memungkinkan anda untuk mengatur Scheduler tempat operator tersebut akan bekerja. Yang lainnya tidak akan beroperasi pada Scheduler tertentu, atau beroperasi pada Scheduler default tertentu. Untuk yang memiliki Scheduler default tertentu termasuk:
    </p>
    <table class="table">
     <thead>
      <tr><th>operator</th><th>Scheduler</th></tr>
     </thead>
     <tbody>
      <tr><td><a href="operators/buffer.html"><code>buffer(timespan)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/buffer.html"><code>buffer(timespan,&#8239;count)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/buffer.html"><code>buffer(timespan,&#8239;timeshift)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/debounce.html"><code>debounce(timeout,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/delay.html"><code>delay(delay,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/delay.html"><code>delaySubscription(delay,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/interval.html"><code>interval</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/repeat.html"><code>repeat</code></a></td><td><code>trampoline</code></td></tr>
      <tr><td><a href="operators/replay.html"><code>replay(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/replay.html"><code>replay(buffersize,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/replay.html"><code>replay(selector,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/replay.html"><code>replay(selector,&#8239;buffersize,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/retry.html"><code>retry</code></a></td><td><code>trampoline</code></td></tr>
      <tr><td><a href="operators/sample.html"><code>sample(period,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/skip.html"><code>skip(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/skiplast.html"><code>skipLast(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/take.html"><code>take(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/takelast.html"><code>takeLast(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/takelast.html"><code>takeLast(count,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/takelast.html"><code>takeLastBuffer(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/takelast.html"><code>takeLastBuffer(count,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/sample.html"><code>throttleFirst</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/sample.html"><code>throttleLast</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/debounce.html"><code>throttleWithTimeout</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/timeinterval.html"><code>timeInterval</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(timeoutSelector)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(firstTimeoutSelector,&#8239;timeoutSelector)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(timeoutSelector,&#8239;other)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(timeout,&#8239;timeUnit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(firstTimeoutSelector,&#8239;timeoutSelector,&#8239;other)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(timeout,&#8239;timeUnit,&#8239;other)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/timer.html"><code>timer</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/timestamp.html"><code>timestamp</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/window.html"><code>window(timespan)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/window.html"><code>window(timespan,&#8239;count)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/window.html"><code>window(timespan,&#8239;timeshift)</code></a></td><td><code>computation</code></td></tr>
     </tbody>
    </table>
    <h2>Test Scheduler</h2>
    <p>
     <a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html">
     <code>TestScheduler</code></a> memungkinkan anda untuk melakukan kontrol manual yang dapat disesuaikan dengan bagaimana waktu Scheduler bekerja. Ini dapat berguna untuk menguji interaksi yang bergantung pada penyusunan aksi sesuai waktunya. Scheduler ini mempunyai tiga method tambahan:
    </p>
    <dl>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#advanceTimeTo(long,%20java.util.concurrent.TimeUnit)"><code>advanceTimeTo(time,unit)</code></a></dt>
      <dd>memajukan waktu scheduler ke suatu titik waktu tertentu</dd>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#advanceTimeBy(long,%20java.util.concurrent.TimeUnit)"><code>advanceTimeBy(time,unit)</code></a></dt>
      <dd>memajukan waktu scheduler ke depan dengan suatu unit waktu tertentu</dd>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#triggerActions()"><code>triggerActions( )</code></a></dt>
      <dd>memulai aksi yang belum dimulai yang sudah dijadwalkan pada suatu waktu pada saat sekarang ataupun di masa lalu sesuai waktu Scheduler</dd>
    </dl>
    <h4>Lihat Juga</h4>
    <ul>
     <li><a href="https://speakerdeck.com/benjchristensen/applying-rxjava-to-existing-applications-at-philly-ete-2015">Testing Reactive Applications</a> oleh Ben Christensen</li>
     <li><a href="http://www.grahamlea.com/2014/07/rxjava-threading-examples/"><cite>RxJava Threading Examples</cite></a> oleh Graham Lea</li>
     <li>Advanced RxJava: Schedulers (<a href="http://akarnokd.blogspot.hu/2015/05/schedulers-part-1.html">part 1</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-2.html">part 2</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-3.html">part 3</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-4-final.html">part 4</a>) oleh Dávid Karnok</li>
    </ul>
  {% endlang_operator %}

  {% lang_operator RxJava&nbsp;1․x %}
    <h2>Jenis-jenis Scheduler</h2>
    <p>
     Anda mendapatkan sebuah Scheduler dari factory method yang dideskripsikan di class <a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html">
     <code>Schedulers</code></a>. Table berikut menunjukkan jenis Scheduler yang dapat dipakai di RxJava::
    </p>
    <table class="table">
     <thead>
      <tr><th>Scheduler</th><th>Tujuan</th></tr>
     </thead>
     <tbody>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#computation()"><code>Schedulers.computation(&#8239;)</code></a></td><td>digunakan untuk komputasi seperti event-loops dan callback; jangan memakai scheduler ini untuk I/O (pakai <code>Schedulers.io(&#8239;)</code>); jumlah thread, standarnya, sama dengan jumlah processor</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#from(java.util.concurrent.Executor)"><code>Schedulers.from(executor)</code></a></td><td>menggunakan Executor yang dispesifikasi sebagai sebuah Scheduler</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#immediate()"><code>Schedulers.immediate(&#8239;)</code></a></td><td>scheduler bekerja secara langsung di thread itu juga</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#io()"><code>Schedulers.io(&#8239;)</code></a></td><td>digunakan untuk pekerjaan yang berhubungan dengan I/O seperti asynchronous perfomance pada I/0 blocking, scheduler ini dijaga oleh sebuah thread-pool yang akan meningkatkan kapasitasnya jika diperlukan; untuk pekerjaan komputasi biasa, pakailah Schedulers.computation( ); Schedulers.io( ) secara standar merupakan sebuah CachedThreadScheduler, dimana seperti sebuah thread scheduler baru dengan thread caching</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#newThread()"><code>Schedulers.newThread(&#8239;)</code></a></td><td>membuat sebuah thread baru untuk tiap unit kerja</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#trampoline()"><code>Schedulers.trampoline(&#8239;)</code></a></td><td>memasukkan pekerjaan yang perlu dilakukan dalam sebuah antrian pada thread saat itu juga</td></tr>
     </tbody>
    </table>
    <h2>Scheduler Default untuk Operator Observable RxJava 1.x</h2>
    <p>
     Beberapa operator Observable di RxJava memiliki bentuk lain yang memungkinkan anda untuk mengatur Scheduler yang akan dipakai operator untuk (setidaknya beberapa bagian) dari operasinya. Yang lainnya tidak beroperasi pada Scheduler tertentu, atau beroperasi pada Scheduler default tertentu. Operator yang memiliki Scheduler default tertentu termasuk:
    </p>
    <table class="table">
     <thead>
      <tr><th>operator</th><th>Scheduler</th></tr>
     </thead>
     <tbody>
      <tr><td><a href="operators/buffer.html"><code>buffer(timespan)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/buffer.html"><code>buffer(timespan,&#8239;count)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/buffer.html"><code>buffer(timespan,&#8239;timeshift)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/debounce.html"><code>debounce(timeout,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/delay.html"><code>delay(delay,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/delay.html"><code>delaySubscription(delay,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/interval.html"><code>interval</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/repeat.html"><code>repeat</code></a></td><td><code>trampoline</code></td></tr>
      <tr><td><a href="operators/replay.html"><code>replay(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/replay.html"><code>replay(buffersize,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/replay.html"><code>replay(selector,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/replay.html"><code>replay(selector,&#8239;buffersize,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/retry.html"><code>retry</code></a></td><td><code>trampoline</code></td></tr>
      <tr><td><a href="operators/sample.html"><code>sample(period,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/skip.html"><code>skip(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/skiplast.html"><code>skipLast(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/take.html"><code>take(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/takelast.html"><code>takeLast(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/takelast.html"><code>takeLast(count,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/takelast.html"><code>takeLastBuffer(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/takelast.html"><code>takeLastBuffer(count,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/sample.html"><code>throttleFirst</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/sample.html"><code>throttleLast</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/debounce.html"><code>throttleWithTimeout</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/timeinterval.html"><code>timeInterval</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(timeoutSelector)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(firstTimeoutSelector,&#8239;timeoutSelector)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(timeoutSelector,&#8239;other)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(timeout,&#8239;timeUnit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(firstTimeoutSelector,&#8239;timeoutSelector,&#8239;other)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(timeout,&#8239;timeUnit,&#8239;other)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/timer.html"><code>timer</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/timestamp.html"><code>timestamp</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/window.html"><code>window(timespan)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/window.html"><code>window(timespan,&#8239;count)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/window.html"><code>window(timespan,&#8239;timeshift)</code></a></td><td><code>computation</code></td></tr>
     </tbody>
    </table>
    <h2>Memakai Scheduler</h2>
    <p>
     Selain dari meneruskan Scheduler tersebut kedalam operator Observable RxJava, anda juga bisa menggunakan mereka untuk menjadwalkan pekerjaan anda pada Subscription. Contoh berikut menggunakan method <a href="http://reactivex.io/RxJava/javadoc/rx/Scheduler.Worker.html#schedule(rx.functions.Action0)"> <code>schedule</code></a> dari class <a href="http://reactivex.io/RxJava/javadoc/rx/Scheduler.Worker.html"><code>Scheduler.Worker</code></a> untuk menjadwalka pekerjaan pada scheduler <code>newThread</code>:
    <div class="code java"><pre>
worker = Schedulers.newThread().createWorker();
worker.schedule(new Action0() {

    @Override
    public void call() {
        yourWork();
    }

});
// some time later...
worker.unsubscribe();</pre></div>
    <h3>Scheduler Rekursif</h3>
    <p>
     Untuk menjadwalkan pemanggilan schedule rekursif, anda bisa menggunakan <code>schedule</code> dan kemudian <code>schedule(this)</code> pada object Worker:
    </p>
    <div class="code java"><pre>
worker = Schedulers.newThread().createWorker();
worker.schedule(new Action0() {

    @Override
    public void call() {
        yourWork();
        // recurse until unsubscribed (schedule will do nothing if unsubscribed)
        worker.schedule(this);
    }

});
// some time later...
worker.unsubscribe();</pre></div>
    <h3>Mengecek atau Menyetel Status Unsubscribed</h3>
    <p>
     Obyek-obyek dari class <code>Worker</code> class mengimplementasi
     <a href="http://reactivex.io/RxJava/javadoc/rx/Subscription.html">inteface <code>Subscription</code></a>, dengan method <a href="http://reactivex.io/RxJava/javadoc/rx/Subscription.html#isUnsubscribed()"><code>isUnsubscribed</code></a>
     dan <a href="http://reactivex.io/RxJava/javadoc/rx/Subscription.html#unsubscribe()"><code>unsubscribe</code></a>, sehingga anda bisa berhenti bekerja ketika sebuah subscription dibatalkan, atau anda juga bisa membatalkan subscription tersebut dari dalam task yang sudah dijadwalkan:
    <div class="code java"><pre>
Worker worker = Schedulers.newThread().createWorker();
Subscription mySubscription = worker.schedule(new Action0() {

    @Override
    public void call() {
        while(!worker.isUnsubscribed()) {
            status = yourWork();
            if(QUIT == status) { worker.unsubscribe(); }
        }
    }

});</pre></div>
    <p>
    <code>Worker</code> juga merupakan sebuah <code>Subscription</code> sehingga anda juga bisa (dan harus, pada akhirnya) memanggil method <code>unsubscribe</code> nya untuk memberitahukan bahwa itu bisa menghentikan pekerjaannya dan melepaskan sumber dayanya:
    </p>
    <div class="code java"><pre>
worker.unsubscribe();</pre></div>
    <h3>Scheduler Delayed dan Periodic</h3>
    <p>
     Anda juga bisa menggunakan <a href="http://reactivex.io/RxJava/javadoc/rx/Scheduler.Worker.html#schedule(rx.functions.Action0,%20long,%20java.util.concurrent.TimeUnit)">sebuah versi dari <code>schedule</code></a>
     yang menunda aksi dari Scheduler sampai melewati jangka waktu tertentu. Contoh berikut menjadwalkan <code>someAction</code> untuk dijalankan pada <code>someScheduler</code> setelah 500ms telah berlalu pada waktu Scheduler tersebut:
    </p>
    <div class="code java"><pre>
someScheduler.schedule(someAction, 500, TimeUnit.MILLISECONDS);</pre></div>
    <p>
     <a href="http://reactivex.io/RxJava/javadoc/rx/Scheduler.Worker.html#schedulePeriodically(rx.functions.Action0,%20long,%20long,%20java.util.concurrent.TimeUnit)">Method Another <code>Scheduler</code></a> memungkinkan anda untuk menjadwalkan sebuah aksi untuk berjalan pada sebuah interval yang teratur. Contoh berikut menjadwalkan <code>someAction</code> untuk dikerjakan pada  <code>someScheduler</code> setelah 500ms telah berlalu, dan kemudian setiap 250ms setelahnya:
    </p>
    <div class="code java"><pre>
someScheduler.schedulePeriodically(someAction, 500, 250, TimeUnit.MILLISECONDS);</pre></div>
    <h2>Test Scheduler</h2>
    <p>
     <a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html">
     <code>TestScheduler</code></a> memungkinkan anda untuk melakukan kontrol manual yang dapat disesuaikan dengan bagaimana waktu Scheduler bekerja. Ini dapat berguna untuk menguji interaksi yang bergantung pada penyusunan aksi sesuai waktunya. Scheduler ini mempunyai tiga method tambahan:
    </p>
    <dl>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#advanceTimeTo(long,%20java.util.concurrent.TimeUnit)"><code>advanceTimeTo(time,unit)</code></a></dt>
      <dd>memajukan waktu scheduler ke suatu titik waktu tertentu</dd>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#advanceTimeBy(long,%20java.util.concurrent.TimeUnit)"><code>advanceTimeBy(time,unit)</code></a></dt>
      <dd>advances the Scheduler’s clock forward by a particular amount of time</dd>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#triggerActions()"><code>triggerActions( )</code></a></dt>
      <dd>memulai aksi yang belum dimulai yang sudah dijadwalkan pada suatu waktu pada saat sekarang ataupun di masa lalu sesuai waktu Scheduler</dd>
    </dl>
    <h4>Lihat Juga</h4>
    <ul>
     <li><a href="http://www.grahamlea.com/2014/07/rxjava-threading-examples/"><cite>RxJava Threading Examples</cite></a> oleh Graham Lea</li>
     <li><a href="https://speakerdeck.com/benjchristensen/applying-rxjava-to-existing-applications-at-philly-ete-2015">Testing Reactive Applications</a> oleh Ben Christensen</li> 
     <li>Advanced RxJava: Schedulers (<a href="http://akarnokd.blogspot.hu/2015/05/schedulers-part-1.html">part 1</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-2.html">part 2</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-3.html">part 3</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-4-final.html">part 4</a>) oleh Dávid Karnok</li>
    </ul>
  {% endlang_operator %}

  {% lang_operator RxJS %}
    <p>
     Dalam RxJS anda mendapatkan Scheduler dari obyek <code>Rx.Scheduler</code> atau anda juga bisa mengimplementasinya sendiri.
     Table berikut menunjukkan berbagai jenis Scheduler yang bisa anda pakai di RxJS:
    </p>
    <table class="table">
     <thead>
      <tr><th>Scheduler</th><th>Tujuan</th></tr>
     </thead>
     <tbody>
      <tr><td><code>Rx.Scheduler.currentThread</code></td><td>menjadwalkan pekerjaan sesegera mungkin pada thread itu juga</td></tr>
      <tr><td><code>Rx.HistoricalScheduler</code></td><td>schedules bekerja seakan-akan telah terjadi pada saat waktu yang tidak tetap</td></tr>
      <tr><td><code>Rx.Scheduler.immediate</code></td><td>schedules yang bekerja langsung pada thread saat itu juga</td></tr>
      <tr><td><code>Rx.TestScheduler</code></td><td>untuk unit testing; mengizinkan anda untuk secara manual memanipulasi pergerakan waktu</td></tr>
      <tr><td><code>Rx.Scheduler.timeout</code></td><td>schedules bekerja dengan sebuah callback yang sudah dijadwalkan</td></tr>
     </tbody>
    </table>
    <h4>Lihat Juga</h4>
    <ul>
     <li><a href="http://stackoverflow.com/questions/28145890/what-is-a-scheduler-in-rxjs"><cite>StackOverflow</cite>: What is a &ldquo;Scheduler&rdquo; in RxJS</a></li>
     <li><a href="http://xgrommx.github.io/rx-book/content/schedulers/index.html">Schedulers</a> oleh Dennis Stoyanov</a></li>
     <li><a href="http://www.grahamlea.com/2014/07/rxjava-threading-examples/">RxJava Threading Examlpes</a> oleh Graham Lea</li>
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
