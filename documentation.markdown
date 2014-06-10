---
layout: default
title: ReactiveX - Documentation
id: documentation
---

#Documentation

RxJava is a Java VM implementation of [Reactive Extensions](https://rx.codeplex.com): a library for composing asynchronous and event-based programs by using observable sequences.

It extends the [observer pattern](http://en.wikipedia.org/wiki/Observer_pattern) to support sequences of data/events and adds operators that allow you to compose sequences together declaratively while abstracting away concerns about things like low-level threading, synchronization, thread-safety, concurrent data structures, and non-blocking I/O.

It supports Java 5 or higher and JVM-based languages such as [Groovy](https://github.com/Netflix/RxJava/tree/master/language-adaptors/rxjava-groovy), [Clojure](https://github.com/Netflix/RxJava/tree/master/language-adaptors/rxjava-clojure), [JRuby](https://github.com/Netflix/RxJava/tree/master/language-adaptors/rxjava-jruby), [Kotlin](https://github.com/Netflix/RxJava/tree/master/language-adaptors/rxjava-kotlin) and [Scala](https://github.com/Netflix/RxJava/tree/master/language-adaptors/rxjava-scala).

<center><table>
 <thead>
  <tr><th colspan="3">Observables fill the gap by being the ideal way to access asynchronous sequences of multiple items</th></tr>
  <tr><th></th><th>single items</th><th>multiple items</th></tr>
 </thead>
 <tbody>
  <tr><th>synchronous</th><td><code>T getData()</code></td><td><code>Iterable&lt;T&gt; getData()</code></td></tr>
  <tr><th>asynchronous</th><td><code>Future&lt;T&gt; getData()</code></td><td><code>Observable&lt;T&gt; getData()</code></td></tr>
 </tbody>
</table></center>

# Why?

### Observables are Composable

<a href="http://docs.oracle.com/javase/7/docs/api/java/util/concurrent/Future.html">Java Futures</a> are straightforward to use for a <a href="https://gist.github.com/4670979">single level of asynchronous execution</a> but they start to add <a href="https://gist.github.com/4671081">non-trivial complexity</a> when they’re nested.

It is <a href="https://gist.github.com/4671081#file-futuresb-java-L163">difficult to use Futures to optimally compose conditional asynchronous execution flows</a> (or impossible, since latencies of each request vary at runtime). This <a href="http://www.amazon.com/gp/product/0321349601?ie=UTF8&tag=none0b69&linkCode=as2&camp=1789&creative=9325&creativeASIN=0321349601">can be done</a>, of course, but it quickly becomes complicated (and thus error-prone) or it prematurely blocks on `Future.get()`, which eliminates the benefit of asynchronous execution.

RxJava Observables on the other hand are intended for [composing flows and sequences of asynchronous data](https://github.com/Netflix/RxJava/wiki/How-To-Use#composition).

### Observables are Flexible

RxJava’s Observables support not just the emission of single scalar values (as Futures do), but also of sequences of values or even infinite streams. ``Observable`` is a single abstraction that can be used for any of these use cases. An Observable has all of the flexibility and elegance associated with its mirror-image cousin the Iterable.

<center><table>
 <thead>
  <tr><th colspan="3">An Observable is the asynchronous/push <a href="http://en.wikipedia.org/wiki/Dual_(category_theory)">"dual"</a> to the synchronous/pull Iterable</th></tr>
  <tr><th>event</th><th>Iterable (pull)</th><th>Observable (push)</th></tr>
 </thead>
 <tbody>
  <tr><td>retrieve data</td><td><code>T next()</code></td><td><code>onNext(T)</code></td></tr>
  <tr><td>discover error</td><td>throws <code>Exception</code></td><td><code>onError(Exception)</code></td></tr>
  <tr><td>complete</td><td>returns</td><td><code>onCompleted()</code></td></tr>
 <tbody>
</table></center>

### Observables are Less Opinionated

The RxJava implementation is not biased toward some particular source of concurrency or asynchronicity. Observables in RxJava can be implemented using thread-pools, event loops, non-blocking I/O, actors (such as from Akka), or whatever implementation suits your needs, your style, or your expertise. Client code treats all of its interactions with Observables as asynchronous, whether your underlying implementation is blocking or non-blocking and however you choose to implement it.

RxJava also tries to be very lightweight. It is implemented as a single JAR that is focused on just the Observable abstraction and related higher-order functions. You could implement a composable Future that is similarly unbiased, but <a href="http://doc.akka.io/docs/akka/2.2.0/java.html">Akka Futures</a> for example come tied in with an Actor library and a lot of other stuff.)

<center><table>
 <thead>
  <tr><th>How is this Observable implemented?</th></tr>
  <tr><th><code>public Observable<data> getData();</code></th></tr>
 </thead>
 <tfoot>
  <tr><th>From the Observer's point of view, it doesn't matter!</Th.></tr>
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

And importantly: with RxJava you can later change your mind, and radically change the underlying nature of your Observable implementation, without breaking the consumers of your Observable.

### Callbacks Have Their Own Problems

Callbacks solve the problem of premature blocking on ``Future.get()`` by not allowing anything to block. They are naturally efficient because they execute when the response is ready.

But as with Futures, while callbacks are easy to use with a single level of asynchronous execution, <a href="https://gist.github.com/4677544">with nested composition they become unwieldy</a>.

### RxJava is a Polyglot Implementation

RxJava is meant for a more polyglot environment than just Java/Scala, and it is being designed to respect the idioms of each JVM-based language. (<a href="https://github.com/Netflix/RxJava/pull/304">This is something we’re still working on.</a>)

# Reactive Programming

RxJava provides a collection of operators with which you can filter, select, transform, combine, and compose Observables. This allows for efficient execution and composition.

You can think of the Observable class as a “push” equivalent to <a href="http://docs.oracle.com/javase/7/docs/api/java/lang/Iterable.html">Iterable</a>, which is a “pull.” With an Iterable, the consumer pulls values from the producer and the thread blocks until those values arrive. By contrast, with an Observable the producer pushes values to the consumer whenever values are available. This approach is more flexible, because values can arrive synchronously or asynchronously.

<center><table>
 <thead>
  <tr><th colspan="2">Example code showing how similar high-order functions can be applied to an Iterable and an Observable</th></tr>
  <tr><th>Iterable</th><th>Observable</th></tr>
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

The Observable type adds two missing semantics to the Gang of Four’s <a href="http://en.wikipedia.org/wiki/Observer_pattern">Observer pattern</a>, to match those that are available in the Iterable type:  

1. the ability for the producer to signal to the consumer that there is no more data available (a foreach loop on an Iterable completes and returns normally in such a case; an Observable calls its observer's ``onCompleted()`` method)
1. the ability for the producer to signal to the consumer that an error has occurred (an Iterable throws an exception if an error takes place during iteration; an Observable calls its observer's ``onError()`` method)

With these additions, RxJava harmonizes the Iterable and Observable types. The only difference between them is the direction in which the data flows. This is very important because now any operation you can perform on an Iterable, you can also perform on an Observable.

We sometimes call this approach Functional Reactive Programming because it applies functions (lambdas/closures) in a reactive (asynchronous/push) manner to asynchronous sequences of data. (This is not meant to be an implementation of the similar but more restrictive “functional reactive programming” model used in languages like <a href="http://conal.net/fran/">Fran</a>.)


