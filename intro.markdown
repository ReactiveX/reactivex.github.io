---
layout: simple
title: ReactiveX - Intro
id: intro
---

<h1>ReactiveX</h1>
<p>
 ReactiveX is a library for composing asynchronous and event-based programs by using observable sequences.
<p><p>
 It extends <a href="http://en.wikipedia.org/wiki/Observer_pattern">the observer pattern</a> to support
 sequences of data and/or events and adds operators that allow you to compose sequences together declaratively
 while abstracting away concerns about things like low-level threading, synchronization, thread-safety,
 concurrent data structures, and non-blocking I/O.
</p>
<center><table class="table table-striped">
 <thead>
  <tr><th colspan="3">Observables fill the gap by being the ideal way to access asynchronous sequences of multiple items</th></tr>
 </thead><tbody>
  <tr><th></th><th>single items</th><th>multiple items</th></tr>
  <tr><th>synchronous</th><td><code>T getData()</code></td><td><code>Iterable&lt;T&gt; getData()</code></td></tr>
  <tr><th>asynchronous</th><td><code>Future&lt;T&gt; getData()</code></td><td><code>Observable&lt;T&gt; getData()</code></td></tr>
 </tbody>
</table></center>

<h1>Why Use Observables?</h1>
<p>
 The ReactiveX Observable model allows you to treat streams of asynchronous events with the same sort of
 simple, composable operations that you use for collections of data items like arrays. It frees you from
 tangled webs of callbacks, and thereby makes your code more readable and less prone to bugs.
</p>
<h2>Observables Are Composable</h2>
<p>
 Techniques like <a href="http://docs.oracle.com/javase/7/docs/api/java/util/concurrent/Future.html">Java
 Futures</a> are straightforward to use for <a href="https://gist.github.com/4670979">a single level of
 asynchronous execution</a> but they start to add <a href="https://gist.github.com/4671081">non-trivial
 complexity</a> when they’re nested.
</p><p>
 It is <a href="https://gist.github.com/4671081#file-futuresb-java-L163">difficult to use Futures to optimally
 compose conditional asynchronous execution flows</a> (or impossible, since latencies of each request vary at
 runtime). This <a href="http://www.amazon.com/gp/product/0321349601?ie=UTF8&amp;tag=none0b69&amp;linkCode=as2&amp;camp=1789&amp;creative=9325&amp;creativeASIN=0321349601">can be done</a>,
 of course, but it quickly becomes complicated (and thus error-prone) or it prematurely blocks on
 <code>Future.get()</code>, which eliminates the benefit of asynchronous execution.
</p><p>
 ReactiveX Observables, on the other hand, are <em>intended</em> for
 <a href="https://github.com/Netflix/RxJava/wiki/How-To-Use#composition">composing flows and sequences of
 asynchronous data</a>.
</p>
<h2>Observables Are Flexible</h2>
<p>
 ReactiveX Observables support not just the emission of single scalar values (as Futures do), but also of
 sequences of values or even infinite streams. <code>Observable</code> is a single abstraction that can be used
 for any of these use cases. An Observable has all of the flexibility and elegance associated with its
 mirror-image cousin the Iterable.
</p>
<table class="table table-striped">
 <thead>
  <tr><th colspan="3">An Observable is the asynchronous/push <a href="http://en.wikipedia.org/wiki/Dual_(category_theory)">&ldquo;dual&rdquo;</a> to the synchronous/pull Iterable</th></tr>
  <tr><th>event</th><th>Iterable (pull)</th><th>Observable (push)</th></tr>
 </thead>
 <tbody>
  <tr><td>retrieve data</td><td><code>T next()</code></td><td><code>onNext(T)</code></td></tr>
  <tr><td>discover error</td><td>throws <code>Exception</code></td><td><code>onError(Exception)</code></td></tr>
  <tr><td>complete</td><td><code>!hasNext()</code></td><td><code>onCompleted()</code></td></tr>
 <tbody>
</table>
<h2>Observables Are Less Opinionated</h2>
<p>
 ReactiveX is not biased toward some particular source of concurrency or asynchronicity. Observables can be
 implemented using thread-pools, event loops, non-blocking I/O, actors (such as from Akka), or whatever
 implementation suits your needs, your style, or your expertise. Client code treats all of its interactions with
 Observables as asynchronous, whether your underlying implementation is blocking or non-blocking and however you
 choose to implement it.
</p>
<center><table class="table table-striped">
 <thead>
  <tr><th>How is this Observable implemented?</th></tr>
  <tr><th><code>public Observable&lt;data&gt; getData();</code></th></tr>
 </thead>
 <tfoot>
  <tr><th>From the Observer&#8217;s point of view, it doesn&#8217;t matter!</th></tr>
 </tfoot>
 <tbody>
  <tr><td><ul>
    <li>does it work synchronously on the same thread as the caller?</li>
    <li>does it work asynchronously on a distinct thread?</li>
    <li>does it divide its work over multiple threads that may return data to the caller in any order?</li>
    <li>does it use an Actor (or multiple Actors) instead of a thread pool?</li>
    <li>does it use NIO with an event-loop to do asynchronous network access?</li>
    <li>does it use an event-loop to separate the work thread from the callback thread?</li>
  </ul></td></tr>
 </tbody>
</table></center>
<p>
 And importantly: with ReactiveX you can later change your mind, and radically change the underlying nature of
 your Observable implementation, without breaking the consumers of your Observable.
</p>
<h2>Callbacks Have Their Own Problems</h2>
<p>
 Callbacks solve the problem of premature blocking on <code>Future.get()</code> by not allowing anything to
 block. They are naturally efficient because they execute when the response is ready.
</p><p>
 But as with Futures, while callbacks are easy to use with a single level of asynchronous execution,
 <a href="https://gist.github.com/4677544">with nested composition they become unwieldy</a>.
</p>
<h2>ReactiveX Is a Polyglot Implementation</h2>
<p>
 ReactiveX is currently implemented in a variety of languages, in ways that respect those languages&#8217;
 idioms, and more languages are being added at a rapid clip.
</p>

<h1>Reactive Programming</h1>
<p>
 ReactiveX provides <a href="documentation/operators.html">a collection of operators</a> with which you can
 filter, select, transform, combine, and compose Observables. This allows for efficient execution and
 composition.
</p><p>
 You can think of the Observable class as a “push” equivalent to
 <a href="http://docs.oracle.com/javase/7/docs/api/java/lang/Iterable.html">Iterable</a>, which is a “pull.”
 With an Iterable, the consumer pulls values from the producer and the thread blocks until those values arrive.
 By contrast, with an Observable the producer pushes values to the consumer whenever values are available. This
 approach is more flexible, because values can arrive synchronously or asynchronously.
</p>
<center><table class="table table-striped">
 <thead>
  <tr><th colspan="2">Example code showing how similar high-order functions can be applied to an Iterable and an Observable</th></tr>
  <tr><th><code>Iterable</code></th><th><code>Observable</code></th></tr>
 </thead>
 <tbody>
  <tr><td><pre><code>getDataFromLocalMemory()
  .skip(10)
  .take(5)
  .map({ s -> return s + " transformed" })
  .forEach({ println "next => " + it })</code></pre></td>
  <td><pre><code>getDataFromNetwork()
  .skip(10)
  .take(5)
  .map({ s -> return s + " transformed" })
  .subscribe({ println "onNext => " + it })</code></pre></td></tr>
 </tbody>
</table></center>
<p>
 The Observable type adds two missing semantics to <a href="http://en.wikipedia.org/wiki/Observer_pattern">the
 Gang of Four’s Observer pattern</a>, to match those that are available in the Iterable type:
</p><ol>
 <li>the ability for the producer to signal to the consumer that there is no more data available (a foreach loop
     on an Iterable completes and returns normally in such a case; an Observable calls its observer&#8217;s
     <code>onCompleted</code> method)</li>
 <li>the ability for the producer to signal to the consumer that an error has occurred (an Iterable throws an
     exception if an error takes place during iteration; an Observable calls its observer&#8217;s
     <code>onError</code> method)</li>
</ol><p>
 With these additions, ReactiveX harmonizes the Iterable and Observable types. The only difference between them
 is the direction in which the data flows. This is very important because now any operation you can perform on
 an Iterable, you can also perform on an Observable.
</p>
