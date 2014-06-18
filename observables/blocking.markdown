---
layout: documentation
title: ReactiveX - Blocking Observable Operators
id: blocking
---

#Blocking Observable Operators

This section explains the [`BlockingObservable`](http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html) subclass. A Blocking Observable extends the ordinary Observable class by providing a set of operators on the items emitted by the Observable that block.

To transform an `Observable` into a `BlockingObservable`, use the [`Observable.toBlocking( )`](http://netflix.github.io/RxJava/javadoc/rx/Observable.html#toBlocking%28%29) method or the [`BlockingObservable.from( )`](http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#from%28rx.Observable%29) method.

* [**`forEach( )`**](Blocking-Observable-Operators#wiki-foreach) — invoke a function on each item emitted by the Observable; block until the Observable completes
* [**`first( )`**](Blocking-Observable-Operators#wiki-first-and-firstordefault) — block until the Observable emits an item, then return the first item emitted by the Observable
* [**`firstOrDefault( )`**](Blocking-Observable-Operators#wiki-first-and-firstordefault) — block until the Observable emits an item or completes, then return the first item emitted by the Observable or a default item if the Observable did not emit an item
* [**`last( )`**](Blocking-Observable-Operators#wiki-last-and-lastordefault) — block until the Observable completes, then return the last item emitted by the Observable
* [**`lastOrDefault( )`**](Blocking-Observable-Operators#wiki-last-and-lastordefault) — block until the Observable completes, then return the last item emitted by the Observable or a default item if there is no last item
* [**`mostRecent( )`**](Blocking-Observable-Operators#wiki-mostrecent) — returns an iterable that always returns the item most recently emitted by the Observable
* [**`next( )`**](Blocking-Observable-Operators#wiki-next) — returns an iterable that blocks until the Observable emits another item, then returns that item
* [**`latest( )`**](Blocking-Observable-Operators#wiki-latest) — returns an iterable that blocks until or unless the Observable emits an item that has not been returned by the iterable, then returns that item
* [**`single( )`**](Blocking-Observable-Operators#wiki-single-and-singleordefault) — if the Observable completes after emitting a single item, return that item, otherwise throw an exception
* [**`singleOrDefault( )`**](Blocking-Observable-Operators#wiki-single-and-singleordefault) — if the Observable completes after emitting a single item, return that item, otherwise return a default item
* [**`toFuture( )`**](Blocking-Observable-Operators#wiki-transformations-tofuture-toiterable-and-toiteratorgetiterator) — convert the Observable into a Future
* [**`toIterable( )`**](Blocking-Observable-Operators#wiki-transformations-tofuture-toiterable-and-toiteratorgetiterator) — convert the sequence emitted by the Observable into an Iterable
* [**`getIterator( )` or `toIterator( )`**](Blocking-Observable-Operators#wiki-transformations-tofuture-toiterable-and-toiteratorgetiterator) — convert the sequence emitted by the Observable into an Iterator

> This documentation accompanies its explanations with a modified form of "marble diagrams." Here is how these marble diagrams represent Blocking Observables:

<img src="/Netflix/RxJava/wiki/images/rx-operators/B.legend.png" width="640" height="301" />

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html">`BlockingObservable`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#toBlocking()">`toBlocking()`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#from(rx.Observable)">`BlockingObservable.from()`</a>

***

## forEach( )
#### invoke a function on each item emitted by the Observable; block until the Observable completes
<img src="/Netflix/RxJava/wiki/images/rx-operators/B.forEach.png" width="640" height="330" />

The `forEach(someFunction)` method is the blocking equivalent of `subscribe(someFunction)`. When you pass a function to this method, `forEach( )` will invoke your function for each item emitted by the Observable, but will only return control to you once the Observable completes (it will not otherwise indicate that the Observable has completed; there is no `forEach( )` equivalent of the `onError` or `onCompleted` methods).

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#forEach(rx.functions.Action1)">`forEach(action)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh211815.aspx">`ForEach`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/10_LeavingTheMonad.html#ForEach">Introduction to Rx: ForEach</a>

***

## first( ) and firstOrDefault( )
#### block until the Observable emits an item, then return the first item emitted by the Observable
<img src="/Netflix/RxJava/wiki/images/rx-operators/B.first.png" width="640" height="315" />

Use the `first( )` method to retrieve the first item emitted by an Observable, at the time the Observable emits it (it will throw an `IllegalArgumentException` if the source Observable completes without emitting any items).

You can also use this method to retrieve the first item emitted by an Observable that meets some particular condition. To do this, pass a function to `first( )` that returns `true` if the item meets the condition.

<img src="/Netflix/RxJava/wiki/images/rx-operators/B.first.p.png" width="640" height="315" />

The `firstOrDefault( )` method is similar to `first( )`, except that instead of throwing an exception when there is no first item (or no first item that meets the specified condition), in such a case it will instead return a default item that you specify. Specify that default item by passing it as the first parameter to `firstOrDefault( )`.

<img src="/Netflix/RxJava/wiki/images/rx-operators/B.firstOrDefault.png" width="640" height="305" />

<img src="/Netflix/RxJava/wiki/images/rx-operators/B.firstOrDefault.p.png" width="640" height="310" />

#### see also:
* [Table of similar blocking and non-blocking operators](Blocking-Observable-Operators#wiki-appendix-similar-blocking-and-non-blocking-operators)
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#first()">`first()`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#first(rx.functions.Func1)">`first(predicate)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#firstOrDefault(T)">`firstOrDefault(default)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#firstOrDefault(T, rx.functions.Func1)">`firstOrDefault(default, predicate)`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypefirstpredicate-thisarg">`first`</a> and <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypefirstordefaultpredicate-defaultvalue-thisarg">`firstOrDefault`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.first.aspx">`First`</a> and <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.firstordefault.aspx">`FirstOrDefault`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/07_Aggregation.html#First">Introduction to Rx: First</a>

***

## last( ) and lastOrDefault( )
#### block until the Observable completes, then return the last item emitted by the Observable
<img src="/Netflix/RxJava/wiki/images/rx-operators/B.last.png" width="640" height="315" />

Use the `last( )` method to retrieve the last item emitted by an Observable, at the time the Observable completes (it will throw an `IllegalArgumentException` if the source Observable completes without emitting any items).

You can also use this method to retrieve the last item emitted by an Observable that meets some particular condition. To do this, pass a function to `last( )` that returns `true` if the item meets the condition.

<img src="/Netflix/RxJava/wiki/images/rx-operators/B.last.p.png" width="640" height="315" />

The `lastOrDefault( )` method is similar to `last( )`, except that instead of throwing an exception when there is no last item (or no last item that meets the specified condition), in such a case it will instead return a default item that you specify. Specify that default item by passing it as the first parameter to `lastOrDefault( )`.

<img src="/Netflix/RxJava/wiki/images/rx-operators/B.lastOrDefault.png" width="640" height="310" />

<img src="/Netflix/RxJava/wiki/images/rx-operators/B.lastOrDefault.p.png" width="640" height="315" />

#### see also:
* [Table of similar blocking and non-blocking operators](Blocking-Observable-Operators#wiki-appendix-similar-blocking-and-non-blocking-operators)
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#last()">`last()`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#last(rx.functions.Func1)">`last(predicate)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#lastOrDefault(T)">`lastOrDefault(default)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#lastOrDefault(T, rx.functions.Func1)">`lastOrDefault(default, predicate)`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypelastpredicate-thisarg">`last`</a> and <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypelastordefaultpredicate-defaultvalue-thisarg">`lastOrDefault`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.last.aspx">`Last`</a> and <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.lastordefault.aspx">`LastOrDefault`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/07_Aggregation.html#Last">Introduction to Rx: Last</a>

***

## mostRecent( )
#### returns an iterable that always returns the item most recently emitted by the Observable
<img src="/Netflix/RxJava/wiki/images/rx-operators/B.mostRecent.png" width="640" height="490" />

The `mostRecent()` method returns an iterable that on each iteration returns the item that was most recently emitted by the underlying Observable (or `null` if the Observable has not yet emitted an item or has completed without emitting any).

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#mostRecent(T)">`mostRecent(initialValue)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh229751.aspx">`MostRecent`</a>

***

## next( )
#### returns an iterable that blocks until the Observable emits another item, then returns that item
<img src="/Netflix/RxJava/wiki/images/rx-operators/B.next.png" width="640" height="490" />

The `next( )` method returns an iterable that on each iteration blocks in `Iterator.hasNext( )` or `Iterator.next( )` until the underlying Observable emits another item; `Iterator.next( )` then returns that item.

If the Observable emits an error then `Iterator.hasNext( )` will return `true` and `Iterator.next()` will re-throw the exception.

If the Observable finishes without emitting another item then `Iterator.hasNext( )` call will return `false`, and `Iterator.next( )` will throw a `NoSuchElementException`.

If you only use the `next( )` method, that method will block until the new value arrives, but if you use `hasNext( )` and `next( )` together, `hasNext( )` will block until the first value arrives. After that, however, before you call the corresponding `next( )` method, `hasNext( )` returns the same result without being blocked. After you call the corresponding `next( )` method (which returns the cached value), a subsequent call to `hasNext( )` will block.

If the Iterator reaches the final item emitted by the source Observable, a subsequent call to `hasNext( )` will always return `false`, and a subsequent call to `next( )` will throw `NoSuchElementException`. If the source Observable issues an error, any subsequent `hasNext( )` or `next( )` will throw the error.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#next()">`next()`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh211897.aspx">`Next`</a>

***

## latest( )
#### returns an iterable that blocks until or unless the Observable emits an item that has not been returned by the iterable, then returns that item
<img src="/Netflix/RxJava/wiki/images/rx-operators/B.latest.png" width="640" height="490" />

The `latest( )` operator is very similar to `Observable.next( )` except that when you call `Iterator.next( )` on the resulting Iterator, it will not block if a item has been emitted by the source Observable since the item returned by the previous `Iterator.next( )` -- instead, it will return the most recent such item.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#latest()">`latest( )`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh212115.aspx">`Latest`</a>

***

## single( ) and singleOrDefault( )
#### if the Observable completes after emitting a single item, return that item, otherwise throw an exception (or return a default item)
<img src="/Netflix/RxJava/wiki/images/rx-operators/B.single.png" width="640" height="315" />

Use the `single( )` method to retrieve the only item emitted by an Observable. `single( )` will throw an exception if the Observable does not emit exactly one item.

You can also use this method to retrieve the only item emitted by an Observable that meets some particular condition (or `null` if the Observable method emits no such item). To do this, pass a function to `single( )` that returns `true` if the item meets the condition. In such a case, `single( )` will again throw an exception unless the Observable emits exactly one item that meets the condition.

<img src="/Netflix/RxJava/wiki/images/rx-operators/B.single.p.png" width="640" height="315" />

The `singleOrDefault( )` method is similar, except that while it will still throw an exception if the underlying Observable emits _more than_ one item, if the underlying Observable does not emit any items at all, rather than throwing an exception `singleOrDefault( )` will return a default item that you specify. Specify that default item by passing it as the first parameter to `singleOrDefault( )`.

<img src="/Netflix/RxJava/wiki/images/rx-operators/B.singleOrDefault.png" width="640" height="315" />

<img src="/Netflix/RxJava/wiki/images/rx-operators/B.singleOrDefault.p.png" width="640" height="315" />

#### see also:
* [Table of similar blocking and non-blocking operators](Blocking-Observable-Operators#wiki-appendix-similar-blocking-and-non-blocking-operators)
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#single()">`single()`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#single(rx.functions.Func1)">`single(predicate)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#singleOrDefault(T)">`singleOrDefault(default)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#singleOrDefault(T, rx.functions.Func1)">`singleOrDefault(default, predicate)`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypesinglepredicate-thisarg">`single`</a> and <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypesingleordefaultpredicate-defaultvalue-thisarg">`singleOrDefault`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.single.aspx">`Single`</a> and <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.singleordefault.aspx">`SingleOrDefault`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/07_Aggregation.html#Single">Introduction to Rx: Single</a>

***

## transformations: toFuture( ), toIterable( ), and toIterator( )/getIterator( )
#### transform an Observable into a Future, an Iterable, or an Iterator
<img src="/Netflix/RxJava/wiki/images/rx-operators/B.toIterator.png" width="640" height="315" />
<br /><img src="/Netflix/RxJava/wiki/images/rx-operators/B.toIterable.png" width="640" height="315" />
<br /><img src="/Netflix/RxJava/wiki/images/rx-operators/B.toFuture.png" width="640" height="395" />

Use these methods to transform a Blocking Observable into a `Future`, an `Iterable`, or an `Iterator`. Note that `toFuture( )` will only work on Blocking Observables that emit one or fewer items. To convert Blocking Observables that emit two or more items into Futures, instead use `.toList( ).toFuture( )` to reduce the items emitted by the Observable to a single (list) item.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#toIterable()">`toIterable()`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#toFuture()">`toFuture()`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/BlockingObservable.html#getIterator()">`getIterator()`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh212132.aspx">`toEnumerable`</a> and <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.toevent.aspx">`toEvent`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/10_LeavingTheMonad.html#LeavingTheMonad">Introduction to Rx: Leaving the monad</a>

***

## Appendix: similar blocking and non-blocking operators

<table class="table">
 <thead>
  <tr><th rowspan="2">operator</th><th colspan="3">result when it acts on</th><th rowspan="2">equivalent in Rx.NET</th></tr>
  <tr><th>Observable that emits multiple items</th><th>Observable that emits one item</th><th>Observable that emits no items</th></tr>
 </thead>
 <tbody>
  <tr><td><code>Observable.first</code></td><td>the first item</td><td>the single item</td><td><i>NoSuchElement</i></td><td><code>firstAsync</code></td></tr>
  <tr><td><code>BlockingObservable.first</code></td><td>the first item</td><td>the single item</td><td><i>NoSuchElement</i></td><td><code>first</code></td></tr>
  <tr><td><code>Observable.firstOrDefault</code></td><td>the first item</td><td>the single item</td><td>the default item</td><td><code>firstOrDefaultAsync</code></td></tr>
  <tr><td><code>BlockingObservable.firstOrDefault</code></td><td>the first item</td><td>the single item</td><td>the default item</td><td><code>firstOrDefault</code></td></tr>
  <tr><td><code>Observable.last</code></td><td>the last item</td><td>the single item</td><td><i>NoSuchElement</i></td><td><code>lastAsync</code></td></tr>
  <tr><td><code>BlockingObservable.last</code></td><td>the last item</td><td>the single item</td><td><i>NoSuchElement</i></td><td><code>last</code></td></tr>
  <tr><td><code>Observable.lastOrDefault</code></td><td>the last item</td><td>the single item</td><td>the default item</td><td><code>lastOrDefaultAsync</code></td></tr>
  <tr><td><code>BlockingObservable.lastOrDefault</code></td><td>the last item</td><td>the single item</td><td>the default item</td><td><code>lastOrDefault</code></td></tr>
  <tr><td><code>Observable.single</code></td><td><i>Illegal Argument</i></td><td>the single item</td><td><i>NoSuchElement</i></td><td><code>singleAsync</code></td></tr>
  <tr><td><code>BlockingObservable.single</code></td><td><i>Illegal Argument</i></td><td>the single item</td><td><i>NoSuchElement</i></td><td><code>single</code></td></tr>
  <tr><td><code>Observable.singleOrDefault</code></td><td><i>Illegal Argument</i></td><td>the single item</td><td>the default item</td><td><code>singleOrDefaultAsync</code></td></tr>
  <tr><td><code>BlockingObservable.singleOrDefault</code></td><td><i>Illegal Argument</i></td><td>the single item</td><td>the default item</td><td><code>singleOrDefault</code></td></tr>
 </tbody>
</table>