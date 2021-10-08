---
layout: documentation
title: ReactiveX - Kontrak Observable
lang: id
id: contract
---

<h1>Kontrak Observable</h1>
<p>
 "Kontrak Observable,” yang anda lihat direferensikan di beberapa tempat pada dokumentasi dan halaman-halaman di web ini, adalah sebuah percobaan untuk mendefinisikan sebuah observable secara formal, berdasarkan dokumen tahun 2010 <a href="https://go.microsoft.com/fwlink/?LinkID=205219"><cite>Rx Design Guidelines</cite></a> dari Microsoft yang mendeskripsikan implementasi Rx.NET dari ReactiveX.</p><p>
 Halaman ini akan meringkas apa itu Kontrak Observable.
</p>
<h2>Notifikasi</h2>
<p>
 Sebuah Observable berkomunikasi dengan observer-observernya dengan <i>notifikasi-notifikasi</i> sebagai berikut:
</p>
<dl>
 <dt>OnNext</dt>
  <dd>menunjukkan bahwa sebuah <i>item</i> yang telah <i>dipancarkan</i> oleh Observable ke observer</dd>
 <dt>OnCompleted</dt>
  <dd>menunjukkan bahwa Observable telah berhasil selesai dan tidak akan memancarkan item apapun lagi</dd>
 <dt>OnError</dt>
  <dd>menunjukkan bahwa Observable telah dihentikan dengan sebuah kondisi error dan tidak akan memancarkan item apapun lagi</dd>
 <dt>OnSubscribe (opsional)</dt>
  <dd>menunjukkan bahwa Observable siap untuk menerima notifikasi-notifikasi Request dari observer (lihat <i>Backpressure</i> di bawah)</dd>
</dl>
<p>
 Sebuah observer berkomunikasi dengan Observable-nya dengan notifikasi-notifikasi berikut:
</p>
<dl>
 <dt>Subscribe</dt>
  <dd>menunjukkan bahwa observer tersebut siap untuk menerima notifikasi dari Observable</dd>
 <dt>Unsubscribe</dt>
  <dd>menunjukkan bahwa observer tersebut tidak lagi ingin menerima notifikasi dari Observable</dd>
 <dt>Request (opsional)</dt>
  <dd>menunjukkan bahwa observer tersebut tidak ingin menerima notifikasi-notifikasi lebih dari jumlah notifikasi onNext tertentu dari Observable (lihat <i>Backpressure</i> di bawah)</dd>
</dl>
<h2>Kontrak Pemberitahuan Notifikasi</h2>
<p>
 Sebuah Observable bisa membuat nol atau lebih notifikasi OnNext, dimana masing-masing onNext tersebut merepresentasikan sebuah item yang dipancarkan, dan dimana pancaran tersebut bisa diikuti oleh notifikasi OnCompleted atau OnError, namun tidak keduanya dalam waktu yang bersamaan.
 Ketika sudah memancarkan sebuah notifikasi OnCompleted atau OnError, Observable tersebut tidak akan memancarkan notifikasi apapun lagi.
</p><p>
 Sebuah Observable bisa saja tidak memancarkan item apapun. Sebuah Observable juga bisa saja tidak terhenti dengan baik sebuah notifikasi OnCompleted atau OnError.  Hal ini bertujuan untuk menjelaskan bahwa lumrah bagi sebuah Observable untuk tidak memancarkan item apapun, atau hanya memancarkan sebuah notifikasi OnCompleted atau OnError, atau hanya memancarkan notifikasi OnNext.
</p><p>
 Observable-observable harus memancarkan notifikasi kepada observernya secara serial ( bukan paralel ). Mereka bisa saja memancarkan notifikasi tersebut dari thread yang berbuda, tetapi harus ada sebuah hubungan <i>terjadi-sebelumnya</i> diantara notifikasi-notifikasi tersebut.
</p>
<h2>Pemberhentian Observable</h2>
<p>
 Jika sebuah Observable belum memancarkan sebuah notifikasi OnCompleted atau OnError, sebuah observer bisa menganggap bahwa observable tersebut masih aktif (bahkan jika observable tersebut sedang tidak memancarkan item apapun) dan observer juga bisa mengirimkan notifikasi-notifikasi (seperti notifikasi Unsubscribe atau Request). Ketika sebuah Observable sudah memancarkan notifikasi OnCompleted atau OnError, Observable tersebut akan melepaskan sumber dayanya dan berhenti memancarkan item, dan observer-observernya harus tidak mencoba untuk berkomunikasi dengannya lebih lanjut.
</p><p>
 Sebuah notifikasi OnError harus mengandung sebab dari error yang terjadi (dimana, tidak boleh untuk memanggil OnError dengan sebuah value yang bernilai <code>null</code>).
</p><p>
 Sebelum sebuah Observable berhenti, dia harus terlebih dahulu memancarkan sebuah notifikasi OnCompleted atau OnError kepada semua observers yang melakukan subscribe kepadanya.
</p>
<h2>Subscribing dan Unsubscribing</h2>
<p>
 Sebuah Observable bisa memulai memancarkan notifikasi kepada sebuah observer segera setelah Observable tersebut menerima notifikasi Subscribe dari observer tersebut.
</p><p>
 Ketika sebuah observer mengirimkan notifikasi Unsubscribe kepada Observable, Observable tersebut akan mencoba untuk berhenti memancarkan notifikasi lagi ke observer tersebut. Proses ini tidak terjamin, bagaimanapun, Observable tersebut <em>tidak</em> akan memancarkan notifikasi apapun ke observer setelah sebuah observer mengirimkan notifikasi Unsubscribe.
</p><p>
 Ketika sebuah Observable memancarkan notifikasi OnError atau OnCompleted kepada observernya, ini akan mengakhiri subscription-nya.
 Observer-observer tidak perlu untuk mengirimkan notifikasi Unsubscribe untuk menghentikan subscription-nya karena sudah dihentikan oleh Observable dengan cara ini.
</p>
<h2>Multiple Observers ( Observer yang berjumlah lebih dari 1 )</h2>
<p>
 Jika sebuah observer kedua melakukan subscribe kepada sebuah Observable yang sudah memancarkan item kepada observer pertama, akan tergantung kepada Observable tersebut untuk mengirimkan ulang item yang sama kepada masing-masing observer, atau mengulang kembali item-item yang sudah dipancarkan dari awal kepada observer kedua, atau akan memancarkan sebuah urutan item yang berbeda kepada observer kedua. Tidak ada jaminan bahwa dua observer dari Observable yang sama tersebut akan mendapatkan urutan item yang sama.
</p>
<h2>Backpressure</h2>
<p>
 Backpressure itu opsional; tidak semua implementasi ReactiveX memasukkan backpressure ke dalam implementasi mereka, dan bagi yang memasukkannya, tidak semua Observable atau operator membutukan backpressure. Sebuah Observable <em>bisa saja</em> mengimplementasi backpressure jika observable tersebut mendeteksi bahwa observer-observernya mengimplementasi notifikasi <i>Request</i> dan mengerti notifikasi <i>OnSubscribe</i>.
</p><p>
 Jika sebuah Observable menerapkan backpressure dan observer-observernya melakukan backpressure, Observable tersebut tidak akan memulai untuk memancarkan item-itemnya kepada observer segera setelah subscription. Melainkan, observable tersebut akan memancarkan sebuah notifikasi OnSubscribe kepada observernya.
</p><p>
 Kapanpun setelah menerima sebuah notifikasi OnSubscribe, sebuah observer bisa membuat sebuah notifikasi Request kepada Observable yang dia subscribe. Notikasi tersebut melakukan request sejumlah item. Observable tersebut kemudian merespon kepada Request tersebut dengan memancarkan item tepat sebanyak apa yang observer tersebut minta. Namun Observable tersebut bisa, dengan tambahan, memancarkan sebuah notifikasi OnCompleted atau OnError, dan bahkan bisa membuat notifikasi tersebut sebelum observer sempat melakukan permintaan atas items apappun.
</p><p>
 Sebuah Observable yang tidak menerapkan backpressure harus merespon ke sebuah notifikasi Request dari sebuah observer dengan cara membuat sebuah notifikasi onError yang menunujukkan bahwa backpressure tidak didukung
</p><p>
 Requests itu bersifat kumulatif. Contohnya, jika sebuah observer melakukan notifikasi Request kepada Observable, untuk 3, 5, dan 10 item secara berurutan, Observable tersebut dapat memancarkan sebanyak 18 item kepada observer tersebut, tidak peduli kapan notifikasi Request tersebut tiba yang relatif terhadap kapan Observable tersebut memancarkan item-item sebagai response-nya.
</p><p>
 Jika Observable tersebut memproduksi item dengan jumlah yang lebih banyak daripada yang diminta oleh observer, akan tergantung oleh Observable-nya sendiri apakah akan membuang item berlebih tersebut, menyimpannya untuk kemudian dipancarkan di lain waktu, atau memakai strategi lain untuk mengurus kelebihan pancarannya.
</p>
<h2>Lihat Juga</h2>
<ul>
 <li><a href="https://go.microsoft.com/fwlink/?LinkID=205219"><cite>Panduan Desain Rx</cite></a></li>
 <li><a href="http://xgrommx.github.io/rx-book/content/guidelines/index.html"><cite>Panduan Desain RxJS</cite></a></li>
</ul>
