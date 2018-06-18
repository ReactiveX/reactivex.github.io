---
layout: documentation
title: ReactiveX - Single
id: single
---

<h1>Single</h1>
<p>
 RxJava (and its derivatives like RxGroovy &amp; RxScala) has developed an
 <a href="observable.html">Observable</a> variant called &ldquo;Single.&rdquo;
</p><p>
 A Single is something like an Observable, but instead of emitting a series of values &mdash; anywhere from none
 at all to an infinite number &mdash; it always either emits one value or an error notification.
</p><p>
 For this reason, instead of subscribing to a Single with the three methods you use to respond to notifications
 from an Observable (<tt>onNext</tt>, <tt>onError</tt>, and <tt>onCompleted</tt>), you only use two methods to
 subscribe:
</p><dl>
 <dt>onSuccess</dt>
  <dd>a Single passes this method the sole item that the Single emits</dd>
 <dt>onError</dt>
  <dd>a Single passes this method the Throwable that caused the Single to be unable to emit an item</dd>
</dl><p>
 A Single will call only one of these methods, and will only call it once. Upon calling either method, the
 Single terminates and the subscription to it ends.
</p>

<h1>Composition via Single Operators</h1>
<p>
 Like Observables, Singles can be manipulated by means of a variety of operators. Some operators also allow
 for an interface between the Observable world and the Single world so that you can mix the two varieties:
</p>
<table class="table table-striped">
 <thead>
  <tr><th>operator</th><th>returns</th><th>description</th></tr>
 </thead>
 <tbody>
  <tr><td><tt>compose</tt></td><td><tt>Single</tt></td><td>allows you create a custom operator</td></tr>
  <tr><td><tt>concat</tt> and <tt>concatWith</tt></td><td><tt>Observable</tt></td><td>concatenates the items emitted by multiple Singles as Observable emissions</td></tr>
  <tr><td><tt>create</tt></td><td><tt>Single</tt></td><td>create a Single from scratch by calling subscriber methods explicitly</td></tr>
  <tr><td><tt>delay</tt></td><td><tt>Single</tt></td><td>move the emission of an item from a Single forward in time</td></tr>
  <tr><td><tt>doOnError</tt></td><td><tt>Single</tt></td><td>returns a Single that also calls a method you specify when it calls onError</td></tr>
  <tr><td><tt>doOnSuccess</tt></td><td><tt>Single</tt></td><td>returns a Single that also calls a method you specify when it calls onSuccess</td></tr>
  <tr><td><tt>error</tt></td><td><tt>Single</tt></td><td>returns a Single that immediately notifies subscribers of an error</td></tr>
  <tr><td><tt>flatMap</tt></td><td><tt>Single</tt></td><td>returns a Single that is the result of a function applied to an item emitted by a Single</td></tr>
  <tr><td><tt>flatMapObservable</tt></td><td><tt>Observable</tt></td><td>returns an Observable that is the result of a function applied to an item emitted by a Single</td></tr>
  <tr><td><tt>from</tt></td><td><tt>Single</tt></td><td>converts a Future into a Single</td></tr>
  <tr><td><tt>just</tt></td><td><tt>Single</tt></td><td>returns a Single that emits a specified item</td></tr>
  <tr><td><tt>map</tt></td><td><tt>Single</tt></td><td>returns a Single that emits the result of a function applied to the item emitted by the source Single</td></tr>
  <tr><td><tt>merge</tt></td><td><tt>Single</tt></td><td>converts a Single that emits a second Single into a Single that emits the item emitted by the second Single</td></tr>
  <tr><td><tt>merge</tt> and <tt>mergeWith</tt></td><td><tt>Observable</tt></td><td>merges the items emitted by multiple Singles as Observable emissions</td></tr>
  <tr><td><tt>observeOn</tt></td><td><tt>Single</tt></td><td>instructs the Single to call the subscriber methods on a particular <a href="scheduler.html">Scheduler</a></td></tr>
  <tr><td><tt>onErrorReturn</tt></td><td><tt>Single</tt></td><td>converts a Single that makes an error notification into a Single that emits a specified item</td></tr>
  <tr><td><tt>subscribeOn</tt></td><td><tt>Single</tt></td><td>instructs the Single to operate on a particular <a href="scheduler.html">Scheduler</a></td></tr>
  <tr><td><tt>timeout</tt></td><td><tt>Single</tt></td><td>returns a Single that makes an error notification if the source Single does not emit a value in a specified time period</td></tr>
  <tr><td><tt>toSingle</tt></td><td><tt>Single</tt></td><td>converts an Observable that emits a single item into a Single that emits that item</td></tr>
  <tr><td><tt>toObservable</tt></td><td><tt>Observable</tt></td><td>converts a Single into an Observable that emits the item emitted by the Single and then completes</td></tr>
  <tr><td><tt>zip</tt> and <tt>zipWith</tt></td><td><tt>Single</tt></td><td>returns a Single that emits an item that is the result of a function applied to items emitted by two or more other Singles</td></tr>
 </tbody>
</table>
<p>
 The following sections of this page will give marble diagrams that explain these operators schematically. This
 diagram explains how Singles are represented in marble diagrams:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.legend.png" width="100%" />
<h2>compose</h2>
<h2>concat and concatWith</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.concat.png" width="100%" />
<p>
 There is also an instance version of this operator:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.concatWith.png" width="100%" />
<h2>create</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.create.png" width="100%" />
<h2>delay</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.delay.png" width="100%" />
<p>
 There is also a version of this operator that allows you to perform the delay on a particular
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
<p>There is also a variety that takes a <a href="scheduler.html">Scheduler</a> as an argument:
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.from.Future.s.png" width="100%" />
<h2>just</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.just.png" width="100%" />
<h2>map</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.map.png" width="100%" />
<h2>merge and mergeWith</h2>
<p>
 One version of merge takes a Single that emits a second Single and converts it into a Single that emits the
 item emitted by that second Single:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.merge.oo.png" width="100%" />
<p>
 Another version takes two or more Singles and merges them into an Observable that emits the items emitted by
 the source Singles (in an arbitrary order):
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
 Timeout will cause a Single to abort with an error notification if it does not emit an item in a specified
 period of time after it is subscribed to. One version allows you to set this time out by means of a number of
 specified time units:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.timeout.1.png" width="100%" />
<p>
 You can also specify a particular <a href="scheduler.html">Scheduler</a> for the timer to operate on:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.timeout.1s.png" width="100%" />
<p>
 A version of the timeout operator allows you to switch to a backup Single rather than sending an error
 notification if the timeout expires:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.timeout.2.png" width="100%" />
<p>
 This, too, has a <a href="scheduler.html">Scheduler</a>-specific version:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.timeout.2s.png" width="100%" />
<h2>toObservable</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.toObservable.png" width="100%" />
<h2>zip and zipWith</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.zip.png" width="100%" />
