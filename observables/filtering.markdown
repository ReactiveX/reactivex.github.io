---
layout: documentation
title: ReactiveX - Filtering Observables
id: filtering-observables
---

#Filtering Observables

This section explains operators you can use to filter and select items emitted by Observables.

* [**`filter( )`**](Filtering-Observables#wiki-filter) — filter items emitted by an Observable
* [**`takeLast( )`**](Filtering-Observables#wiki-takelast) — only emit the last _n_ items emitted by an Observable
* [**`last( )`**](Filtering-Observables#wiki-last) — emit only the last item emitted by an Observable
* [**`lastOrDefault( )`**](Filtering-Observables#wiki-lastOrDefault) — emit only the last item emitted by an Observable, or a default value if the source Observable is empty
* [**`takeLastBuffer( )`**](Filtering-Observables#wiki-takelastbuffer) — emit the last _n_ items emitted by an Observable, as a single list item
* [**`skip( )`**](Filtering-Observables#wiki-skip) — ignore the first _n_ items emitted by an Observable
* [**`skipLast( )`**](Filtering-Observables#wiki-skiplast) — ignore the last _n_ items emitted by an Observable
* [**`take( )`**](Filtering-Observables#wiki-take) — emit only the first _n_ items emitted by an Observable
* [**`first( )` and `takeFirst( )`**](Filtering-Observables#wiki-first-and-takefirst) — emit only the first item emitted by an Observable, or the first item that meets some condition
* [**`firstOrDefault( )`**](Filtering-Observables#wiki-firstordefault) — emit only the first item emitted by an Observable, or the first item that meets some condition, or a default value if the source Observable is empty
* [**`elementAt( )`**](Filtering-Observables#wiki-elementat) — emit item _n_ emitted by the source Observable
* [**`elementAtOrDefault( )`**](Filtering-Observables#wiki-elementatordefault) — emit item _n_ emitted by the source Observable, or a default item if the source Observable emits fewer than _n_ items
* [**`sample( )` or `throttleLast( )`**](Filtering-Observables#wiki-sample-or-throttlelast) — emit the most recent items emitted by an Observable within periodic time intervals
* [**`throttleFirst( )`**](Filtering-Observables#wiki-throttlefirst) — emit the first items emitted by an Observable within periodic time intervals
* [**`throttleWithTimeout( )` or `debounce( )`**](Filtering-Observables#wiki-throttlewithtimeout-or-debounce) — only emit an item from the source Observable after a particular timespan has passed without the Observable emitting any other items
* [**`timeout( )`**](Filtering-Observables#wiki-timeout) — emit items from a source Observable, but issue an exception if no item is emitted in a specified timespan
* [**`distinct( )`**](Filtering-Observables#wiki-distinct) — suppress duplicate items emitted by the source Observable
* [**`distinctUntilChanged( )`**](Filtering-Observables#wiki-distinctuntilchanged) — suppress duplicate consecutive items emitted by the source Observable
* [**`ofType( )`**](Filtering-Observables#wiki-oftype) — emit only those items from the source Observable that are of a particular class
* [**`ignoreElements( )`**](Filtering-Observables#wiki-ignoreelements) — discard the items emitted by the source Observable and only pass through the error or completed notification

***

## filter( )
#### filter items emitted by an Observable
<img src="{{ site.url }}/assets/operators/filter.png" width="640" height="310" />​

You can filter an Observable, discarding any items that do not meet some test, by passing a filtering function into the `filter( )` method. For example, the following code filters a list of integers, emitting only those that are even (that is, where the remainder from dividing the number by two is zero):

```groovy
numbers = Observable.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);

numbers.filter({ 0 == (it % 2) }).subscribe(
  { println(it); },                          // onNext
  { println("Error: " + it.getMessage()); }, // onError
  { println("Sequence complete"); }          // onCompleted
);
```
```
2
4
6
8
Sequence complete
```

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#filter(rx.functions.Func1)">`filter(predicate)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.where.aspx">`Where`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypefilterpredicate-thisarg">`filter`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/05_Filtering.html#Where">Introduction to Rx: Where</a>

***

## takeLast( )
#### only emit the last _n_ items emitted by an Observable
<img src="{{ site.url }}/assets/operators/takeLast.n.png" width="640" height="310" />​

To convert an Observable that emits several items into one that only emits the last _n_ of these items before completing, use the `takeLast( )` method. For instance, in the following code, `takeLast( )` emits only the last integer in the list of integers represented by `numbers`:

```groovy
numbers = Observable.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);

numbers.takeLast(1).subscribe(
  { println(it); },                          // onNext
  { println("Error: " + it.getMessage()); }, // onError
  { println("Sequence complete"); }          // onCompleted
);
```
```
9
Sequence complete
```

There are also versions of `takeLast( )` that emit the items that were emitted by the source Observable during a specified window of time before the Observable completed, or that emit a maximum of _n_ items from such a window.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#takeLast(int)">`takeLast(count)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#takeLast(long, java.util.concurrent.TimeUnit)">`takeLast(time, unit)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#takeLast(long, java.util.concurrent.TimeUnit, rx.Scheduler)">`takeLast(time, unit, scheduler)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#takeLast(int, long, java.util.concurrent.TimeUnit)">`takeLast(count, time, unit)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#takeLast(int, long, java.util.concurrent.TimeUnit, rx.Scheduler)">`takeLast(count, time, unit, scheduler)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh212114.aspx">`TakeLast`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypetakelastcount">`takeLast`</a> and <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypetakelastwithtimeduration-timescheduler-loopscheduler">`takeLastWithTime`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/07_Aggregation.html#Last">Introduction to Rx: Last</a>

***

## last( )
#### only emit the last item emitted by an Observable
<img src="{{ site.url }}/assets/operators/last.png" width="640" height="305" />​

The `last( )` operator is equivalent to `takeLast(1)` except that it will throw an `NoSuchElementException` if the source Observable does not emit at least one item. Note that there is also [a `BlockingObservable` implementation of `last( )`](Blocking-Observable-Operators#wiki-last-and-lastordefault).

> **Note:** in the scala language adaptor for RxJava, this method is called `takeRight( )`.

#### see also:
* [Table of similar blocking and non-blocking operators](Blocking-Observable-Operators#wiki-appendix-similar-blocking-and-non-blocking-operators)
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#last()">`last( )`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#last(rx.functions.Func1)">`last(predicate)`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypelastpredicate-thisarg">`last`</a>
* Linq: `lastAsync`

***

## lastOrDefault( )
#### emit only the last item emitted by an Observable, or a default value if the source Observable is empty
<img src="{{ site.url }}/assets/operators/lastOrDefault.png" width="640" height="305" />​

The `lastOrDefault( )` operator returns an Observable that emits the last item emitted by the source Observable, or a default item if the source Observable does not emit at least one item. Note that there is also [a `BlockingObservable` implementation of `lastOrDefault( )`](Blocking-Observable-Operators#wiki-last-and-lastordefault).

#### see also:
* [Table of similar blocking and non-blocking operators](Blocking-Observable-Operators#wiki-appendix-similar-blocking-and-non-blocking-operators)
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#lastOrDefault(T)">`lastOrDefault(default)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#lastOrDefault(T, rx.functions.Func1)">`lastOrDefault(default, predicate)`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypelastordefaultpredicate-defaultvalue-thisarg">`lastOrDefault`</a>
* Linq: `lastOrDefaultAsync`

***

## takeLastBuffer( )
#### emit the last _n_ items emitted by an Observable, as a single list item
<img src="{{ site.url }}/assets/operators/takeLastBuffer.png" width="640" height="310" />​

To convert an Observable that emits several items into one that emits the last _n_ of these items as a single list before completing, use the `takeLastBuffer( )` method. There are also versions of `takeLastBuffer( )` that emit a list containing the items that were emitted by the source Observable during a specified window of time before the Observable completed, or a maximum of _n_ items from such a window.

```groovy
def numbers = Observable.from([1, 2, 3, 4, 5, 6, 7, 8]);

numbers.takeLastBuffer(3).subscribe(
  { println(it); },                          // onNext
  { println("Error: " + it.getMessage()); }, // onError
  { println("Sequence complete"); }          // onCompleted
);
```
```
[6, 7, 8]
Sequence complete
```

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#takeLastBuffer(int)">`takeLastBuffer(count)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#takeLastBuffer(long, java.util.concurrent.TimeUnit)">`takeLastBuffer(time, timeunit)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#takeLastBuffer(long, java.util.concurrent.TimeUnit, rx.Scheduler)">`takeLastBuffer(time, timeunit, scheduler)`</a>
* javadoc: <a hrtef="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#takeLastBuffer(int, long, java.util.concurrent.TimeUnit)">`takeLastBuffer(count, time, timeunit)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#takeLastBuffer(int, long, java.util.concurrent.TimeUnit, rx.Scheduler)">`takeLastBuffer(count, time, timeunit, scheduler)`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypetakelastbuffercount">`takeLastBuffer`</a> and <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypetakelastbufferwithtimeduration-scheduler">`takeLastBufferWithTime`</a>

***

## skip()
#### ignore the first _n_ items emitted by an Observable
<img src="{{ site.url }}/assets/operators/skip.png" width="640" height="305" />​

You can ignore the first _n_ items emitted by an Observable and attend only to those items that come after, by modifying the Observable with the `skip(n)` method.

```groovy
numbers = Observable.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);

numbers.skip(3).subscribe(
  { println(it); },                          // onNext
  { println("Error: " + it.getMessage()); }, // onError
  { println("Sequence complete"); }          // onCompleted
);
```
```
4
5
6
7
8
9
Sequence complete
```

There are also versions of `skip()` that ignore the items emitted by an Observable during a specified period of time after the Observable is subscribed to.

> **Note:** in the scala language adaptor for RxJava, this method is called `drop( )`.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#skip(int)">`skip(num)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#skip(long, java.util.concurrent.TimeUnit)">`skip(time, timeunit)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#skip(long, java.util.concurrent.TimeUnit, rx.Scheduler)">`skip(time, timeunit, scheduler)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh229847.aspx">`Skip`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypeskipcount">`skip`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/05_Filtering.html#SkipAndTake">Introduction to Rx: Skip and Take</a>

***

## skipLast()
#### ignore the last _n_ items emitted by an Observable
<img src="{{ site.url }}/assets/operators/skipLast.png" width="640" height="305" />​

You can ignore the last _n_ items emitted by an Observable and attend only to those items that preced them, by modifying the Observable with the `skipLast(n)` method. Note that the mechanism by which this is implemented will delay the emission of any item from the source Observable until _n_ additional items have been emitted by that Observable.

There are also versions of `skipLast()` that ignore the items emitted by an Observable during a specified period of time before the Observable completes.

> **Note:** in the scala language adaptor for RxJava, this method is called `dropRight( )`.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#skipLast(int)">`skipLast(count)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#skipLast(long, java.util.concurrent.TimeUnit)">`skipLast(time, timeunit)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#skipLast(long, java.util.concurrent.TimeUnit, rx.Scheduler)">`skipLast(time, timeunit, scheduler)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh211750.aspx">`SkipLast`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypeskiplastcount">`skipLast`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/05_Filtering.html#SkipLastTakeLast">Introduction to Rx: SkipLast and TakeLast</a>

***

## take( )
#### emit only the first _n_ items emitted by an Observable
<img src="{{ site.url }}/assets/operators/take.png" width="640" height="305" />​

You can choose to pay attention only to the first _n_ items emitted by an Observable by calling its `take(n)` method. That method returns an Observable that will invoke an Subscriber’s `onNext` method a maximum of _n_ times before invoking `onCompleted`. For example,

```groovy
numbers = Observable.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);

numbers.take(3).subscribe(
  { println(it); },                          // onNext
  { println("Error: " + it.getMessage()); }, // onError
  { println("Sequence complete"); }          // onCompleted
);
```
```
1
2
3
Sequence complete
```

If you call `take(n)` on an Observable, and that Observable emits _fewer_ than _n_ items before completing, the new, `take`-modified Observable will _not_ throw an exception or invoke `onError()`, but will merely emit this same fewer number of items before it completes.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#take(int)">`take(num)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#take(long, java.util.concurrent.TimeUnit)">`take(time, timeunit)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#take(long, java.util.concurrent.TimeUnit, rx.Scheduler)">`take(time, timeunit, scheduler)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh229852.aspx">`Take`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypetakecount-scheduler">`take`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/05_Filtering.html#SkipAndTake">Introduction to Rx: Skip and Take</a>

***

## first( ) and takeFirst( )
#### emit only the first item emitted by an Observable, or the first item that meets some condition

<img src="{{ site.url }}/assets/operators/first.png" width="640" height="310" />​

To create an Observable that emits only the first item emitted by a source Observable (if any), use the `first( )` method.

<img src="{{ site.url }}/assets/operators/firstN.png" width="640" height="320" />​

You can also pass a function to this method that evaluates items as they are emitted by the source Observable, in which case `first( )` will create an Observable that emits the first such item for which your function returns `true` (if any).

`takeFirst( )` behaves very similarly to `first( )` with the exception of how they behave when the source Observable emits no items (or no items that match the predicate). In such a case, `first( )` will throw an `NoSuchElementException` while `takeFirst( )` will return an empty Observable (one that calls `onCompleted( )` but never calls `onNext( )`).

<img src="{{ site.url }}/assets/operators/first.takeFirst.png" width="640" height="455" />​

#### see also:
* [Table of similar blocking and non-blocking operators](Blocking-Observable-Operators#wiki-appendix-similar-blocking-and-non-blocking-operators)
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#first()">`first()`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#first(rx.functions.Func1)">`first(predicate)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#takeFirst(rx.functions.Func1)">`takeFirst(predicate)`</a>
* Linq: `firstAsync`
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypefirstpredicate-thisarg">`first`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/07_Aggregation.html#First">Introduction to Rx: First</a>

***

## firstOrDefault( )
#### emit only the first item emitted by an Observable, or the first item that meets some condition, or a default value if the source Observable is empty

<img src="{{ site.url }}/assets/operators/firstOrDefault.png" width="640" height="305" />​

To create an Observable that emits only the first item emitted by a source Observable (or a default value if the source Observable is empty), use the `firstOrDefault( )` method.

<img src="{{ site.url }}/assets/operators/firstOrDefaultN.png" width="640" height="310" />​

You can also pass a function to this method that evaluates items as they are emitted by the source Observable, in which case `firstOrDefault( )` will create an Observable that emits the first such item for which your function returns `true` (or the supplied default value if no such item is emitted).

> **Note:** in the scala language adaptor for RxJava, this method is called `firstOrElse( )` or `headOrElse( )`.

#### see also:
* [Table of similar blocking and non-blocking operators](Blocking-Observable-Operators#wiki-appendix-similar-blocking-and-non-blocking-operators)
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#firstOrDefault(T)">`firstOrDefault(default)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#firstOrDefault(T, rx.functions.Func1)">`firstOrDefault(default, predicate)`</a>
* Linq: `firstOrDefaultAsync`
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypefirstordefaultpredicate-defaultvalue-thisarg">`firstOrDefault`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/07_Aggregation.html#First">Introduction to Rx: First</a>

***

## elementAt( )
#### emit item _n_ emitted by the source Observable
<img src="{{ site.url }}/assets/operators/elementAt.png" width="640" height="310" />​

Pass `elementAt( )` a zero-based index value and it will emit the solitary item from the source Observable's sequence that matches that index value (for example, if you pass the index value 5, `elementAt( )` will emit the sixth item emitted by the source Observable).  If you pass in a negative index value, or if the source Observable emits fewer than _index value_ + 1 items, `elementAt( )` will throw an <code>IndexOutOfBoundsException</code>.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#elementAt(int)">`elementAt(index)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh229725.aspx">`ElementAt`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypeelementatindex">`elementAt`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/06_Inspection.html#ElementAt">Introduction to Rx: ElementAt</a>

***

## elementAtOrDefault( )
#### emit item _n_ emitted by the source Observable, or a default item if the source Observable emits fewer than _n_ items
<img src="{{ site.url }}/assets/operators/elementAtOrDefault.png" width="640" height="310" />​

Pass `elementAtOrDefault( )` a zero-based index value and it will emit the solitary item from the source Observable's sequence that matches that index value (for example, if you pass the index value 5, `elementAtOrDefault( )` will emit the sixth item emitted by the source Observable).  If you pass in a negative index value, `elementAtOrDefault( )` will throw an <code>IndexOutOfBoundsException</code>. If the source Observable emits fewer than _index value_ + 1 items, `elementAtOrDefault( )` will emit the default value you pass in (you must also pass in a type for this value that is appropriate to what type your Subscribers expect to observe).

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#elementAtOrDefault(int, T)">`elementAtOrDefault(index,default)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh229845.aspx">`ElementAtOrDefault`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypeelementatordefaultindex-defaultvalue">`elementAtOrDefault`</a>

***

## sample( ) or throttleLast( )
#### emit the most recent items emitted by an Observable within periodic time intervals
<img src="{{ site.url }}/assets/operators/sample.png" width="640" height="305" />​

Use the `sample( )` method to periodically look at an Observable to see what item it has most recently emitted since the previous sampling.  Note that if the source Observable has emitted no items since the last time it was sampled, the Observable that results from the `sample( )` operator will emit no item for that sampling period.

The following code constructs an Observable that emits the numbers between one and a million, and then samples that Observable every ten milliseconds to see what number it is emitting at that moment.
```groovy
def numbers = Observable.range( 1, 1000000 );
 
numbers.sample(10, java.util.concurrent.TimeUnit.MILLISECONDS).subscribe(
  { println(it); },                          // onNext
  { println("Error: " + it.getMessage()); }, // onError
  { println("Sequence complete"); }          // onCompleted
);
```
```
339707
547810
891282
Sequence complete
```

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#sample(long, java.util.concurrent.TimeUnit)">`sample(period,unit)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#sample(long, java.util.concurrent.TimeUnit, rx.Scheduler)">`sample(period,unit,scheduler)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#sample(rx.Observable)">`sample(sampler)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#throttleLast(long, java.util.concurrent.TimeUnit)">`throttleLast(period,unit)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#throttleLast(long, java.util.concurrent.TimeUnit, rx.Scheduler)">`throttleLast(period,unit,scheduler)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.sample.aspx">`Sample`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypesampleinterval--sampleobservable">`sample`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/13_TimeShiftedSequences.html#Sample">Introduction to Rx: Sample</a>

***

## throttleFirst( )
#### emit the first items emitted by an Observable within periodic time intervals
<img src="{{ site.url }}/assets/operators/throttleFirst.png" width="640" height="305" />​

Use the `throttleFirst( )` method to periodically look at an Observable to see what item it emitted first during a particular time span. The following code shows how an Observable can be modified by `throttleFirst( )`:

```groovy
Scheduler s = new TestScheduler();
PublishSubject<Integer> o = PublishSubject.create();
o.throttleFirst(500, TimeUnit.MILLISECONDS, s).subscribe(
  { println(it); },                          // onNext
  { println("Error: " + it.getMessage()); }, // onError
  { println("Sequence complete"); }          // onCompleted
);
// send events with simulated time increments
s.advanceTimeTo(0, TimeUnit.MILLISECONDS);
o.onNext(1); // deliver
o.onNext(2); // skip
s.advanceTimeTo(501, TimeUnit.MILLISECONDS);
o.onNext(3); // deliver
s.advanceTimeTo(600, TimeUnit.MILLISECONDS);
o.onNext(4); // skip
s.advanceTimeTo(700, TimeUnit.MILLISECONDS);
o.onNext(5); // skip
o.onNext(6); // skip
s.advanceTimeTo(1001, TimeUnit.MILLISECONDS);
o.onNext(7); // deliver
s.advanceTimeTo(1501, TimeUnit.MILLISECONDS);
o.onCompleted();
```
```
1
3
7
Sequence complete
```
#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#throttleFirst(long, java.util.concurrent.TimeUnit)">`throttleFirst(windowDuration,unit)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#throttleFirst(long, java.util.concurrent.TimeUnit, rx.Scheduler)">`throttleFirst(windowDuration,unit,scheduler)`</a>

***

## throttleWithTimeout( ) or debounce( )
#### only emit an item from the source Observable after a particular timespan has passed without the Observable emitting any other items
<img src="{{ site.url }}/assets/operators/throttleWithTimeout.png" width="640" height="305" />​

Use the `throttleWithTimeout( )` method to select only those items emitted by a source Observable that are not quickly superceded by other items.

Note that the last item emitted by the source Observable will be emitted in turn by `throttleWithTimeout( )` even if the source Observable's `onCompleted` notification is issued within the time window you specify since that item's emission. That is to say: an `onCompleted` notification will not trigger a throttle.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#throttleWithTimeout(long, java.util.concurrent.TimeUnit)">`throttleWithTimeout(timeout,unit)`</a> or <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#debounce(long, java.util.concurrent.TimeUnit)">`debounce(timeout,unit)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#throttleWithTimeout(long, java.util.concurrent.TimeUnit, rx.Scheduler)">`throttleWithTimeout(timeout,unit,scheduler)`</a> or <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#debounce(long, java.util.concurrent.TimeUnit, rx.Scheduler)">`debounce(timeout,unit,scheduler)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#debounce(rx.functions.Func1)">`debounce(debounceSelector)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.throttle.aspx">`Throttle`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypethrottleduetime-scheduler">`throttle`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/13_TimeShiftedSequences.html#Throttle">Introduction to Rx: Throttle</a>

***

## timeout( )
#### emit items from a source Observable, but issue an exception if no item is emitted in a specified timespan
<img src="{{ site.url }}/assets/operators/timeout.1.png" width="640" height="305" />​

The `timeout( )` operator emits the items emitted by a source Observable unless the source Observable fails to emit an item within a specified period of time since the previous item it emitted, in which case `timeout( )` will call `onError( )` with a `TimeoutException`.

Another version of `timeout( )` does not call `onError( )` but instead switches to emitting items from an alternative Observable if the original Observable fails to emit an item within the specified timeout period:

<img src="{{ site.url }}/assets/operators/timeout.2.png" width="640" height="305" />​

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#timeout(long, java.util.concurrent.TimeUnit)">`timeout(time,unit)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#timeout(long, java.util.concurrent.TimeUnit, rx.Scheduler)">`timeout(time,unit,scheduler)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#timeout(long, java.util.concurrent.TimeUnit, rx.Observable)">`timeout(time,unit,fallback)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#timeout(long, java.util.concurrent.TimeUnit, rx.Observable, rx.Scheduler)">`timeout(time,unit,fallback,scheduler)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.timeout.aspx">`Timeout`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypetimeoutduetime-other-scheduler">`timeout`</a> and <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypetimeoutwithselectorfirsttimeout-timeoutdurationselector-other">`timeoutWithSelector`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/13_TimeShiftedSequences.html#Timeout">Introduction to Rx: Timeout</a>

***

## distinct( )
#### suppress duplicate items emitted by the source Observable
<img src="{{ site.url }}/assets/operators/distinct.png" width="640" height="310" />​

Use the `distinct( )` method to remove duplicate items from a source Observable and only emit single examples of those items.

<img src="{{ site.url }}/assets/operators/distinct.key.png" width="640" height="310" />​

You can also pass a function or a comparator into `distinct( )` that customizes how it distinguishes between distinct and non-distinct items.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#distinct()">`distinct()`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#distinct(rx.functions.Func1)">`distinct(keySelector)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.distinct.aspx">`Distinct`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypedistinctkeyselector-keyserializer">`distinct`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/05_Filtering.html#Distinct">Introduction to Rx: Distinct and DistinctUntilChanged</a>

***

## distinctUntilChanged( )
#### suppress duplicate consecutive items emitted by the source Observable
<img src="{{ site.url }}/assets/operators/distinctUntilChanged.png" width="640" height="310" />​

Use the `distinctUntilChanged( )` method to remove duplicate consecutive items from a source Observable and only emit single examples of such items.

<img src="{{ site.url }}/assets/operators/distinctUntilChanged.key.png" width="640" height="310" />​

You can also pass a function or a comparator into `distinctUntilChanged( )` that customizes how it distinguishes between distinct and non-distinct items.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#distinctUntilChanged()">`distinctUntilChanged()`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#distinctUntilChanged(rx.functions.Func1)">`distinctUntilChanged(keySelector)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.distinctuntilchanged.aspx">`DistinctUntilChanged`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypedistinctuntilchangedkeyselector-comparer">`distinctUntilChanged`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/05_Filtering.html#Distinct">Introduction to Rx: Distinct and DistinctUntilChanged</a>

***

## ofType( )
#### emit only those items from the source Observable that are of a particular class
<img src="{{ site.url }}/assets/operators/ofClass.png" width="640" height="310" />​

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#ofType(java.lang.Class)">`ofType(class)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh229380.aspx">`OfType`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/08_Transformation.html#CastAndOfType">Introduction to Rx: Cast and OfType</a>

***

## ignoreElements( )
#### discard the items emitted by the source Observable and only pass through the error or completed notification
<img src="{{ site.url }}/assets/operators/ignoreElements.png" width="640" height="305" />​

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#ignoreElements()">`ignoreElements()`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh229242.aspx">`IgnoreElements`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypeignoreelements">`ignoreElements`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/05_Filtering.html#IgnoreElements">Introduction to Rx: IgnoreElements</a>