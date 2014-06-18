---
layout: documentation
title: ReactiveX - Creating Observables
id: creating-observables
---

#Creating Observables

This section explains methods that create Observables.

* [**`just( )`**](Creating-Observables#wiki-just) — convert an object into an Observable that emits that object
* [**`from( )`**](Creating-Observables#wiki-from) — convert an Iterable, a Future, or an Array into an Observable
* [**`repeat( )`**](Creating-Observables#wiki-repeat) — create an Observable that emits a particular item or sequence of items repeatedly
* [**`create( )`**](Creating-Observables#wiki-create) — create an Observable from scratch by means of a function
* [**`defer( )`**](Creating-Observables#wiki-defer) — do not create the Observable until a Subscriber subscribes; create a fresh Observable on each subscription
* [**`range( )`**](Creating-Observables#wiki-range) — create an Observable that emits a range of sequential integers
* [**`interval( )`**](Creating-Observables#wiki-interval) — create an Observable that emits a sequence of integers spaced by a given time interval
* [**`timer( )`**](Creating-Observables#wiki-timer) — create an Observable that emits a single item after a given delay
* [**`empty( )`**](Creating-Observables#wiki-empty-error-and-never) — create an Observable that emits nothing and then completes
* [**`error( )`**](Creating-Observables#wiki-empty-error-and-never) — create an Observable that emits nothing and then signals an error
* [**`never( )`**](Creating-Observables#wiki-empty-error-and-never) — create an Observable that emits nothing at all

***

## just( )
#### convert an object into an Observable that emits that object
<img src="/Netflix/RxJava/wiki/images/rx-operators/just.png" width="640" height="310" />

To convert any object into an Observable that emits that object and then completes, pass that object into the `just( )` method.

```groovy
// Observable emits "some string" as a single item
def observableThatEmitsAString = Observable.just("some string"); 
// Observable emits the list [1, 2, 3, 4, 5] as a single item
def observableThatEmitsAList = Observable.just([1, 2, 3, 4, 5]); 
```

This has some similarities to the `from( )` method, but note that if you pass an iterable to `from( )`, it will convert the iterable into an Observable that emits each of the items in the iterable, one at a time, while the `just( )` method would convert the iterable into an Observable that emits the entire iterable as a single item.

Note that if you pass `null` to `just( )`, the resulting Observable will _not_ merely call `onCompleted( )` without calling `onNext( )`. It will instead call `onNext( null )` before calling `onCompleted( )`.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#just(T)">`just(value)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#just(T, rx.Scheduler)">`just(value, scheduler)`</a>

***

## from( )
#### convert an Iterable, a Future, or an Array into an Observable
<img src="/Netflix/RxJava/wiki/images/rx-operators/from.png" width="640" height="315" />

You can convert an object that supports `Iterable` into an Observable that emits each iterable item in the object, or an object that supports `Future` into an Observable that emits the result of the `get` call, simply by passing the object into the `from( )` methods, for example:

```groovy
myObservable = Observable.from(myIterable);
```

You can also do this with arrays, for example:

```groovy
myArray = [1, 2, 3, 4, 5];
myArrayObservable = Observable.from(myArray);
```

This converts the sequence of values in the iterable object or array into a sequence of items emitted, one at a time, by an Observable.

You can convert an empty iterable (or array) into an Observable in this way. The resulting Observable will invoke `onCompleted()` without first invoking `onNext()`.

Note that when the `from( )` method transforms a `Future` into an Observable, such an Observable will be effectively blocking, as its underlying `Future` blocks.

> **Note:** in the scala language adaptor for RxJava, the version of this method that works with sequences (arrays) is called `items( )`.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#from(java.util.concurrent.Future)">`from(future)`</a>, <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#from(java.util.concurrent.Future, long, java.util.concurrent.TimeUnit)">`from(future, timeout, unit)`</a>, and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#from(java.util.concurrent.Future, rx.Scheduler)">`from(future, scheduler)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#from(java.lang.Iterable)">`from(iterable)`</a>, and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#from(java.lang.Iterable, rx.Scheduler)">`from(iterable, scheduler)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#from(T...)">`from(array)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#from(T[], rx.Scheduler)">`from(array, scheduler)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#from(T)">`from(item)`</a> (or <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#from(T, T)">two</a>, <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#from(T, T, T)">three</a>, <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#from(T, T, T, T)">four</a>, <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#from(T, T, T, T, T)">five</a>, <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#from(T, T, T, T, T, T)">six</a>, <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#from(T, T, T, T, T, T, T)">seven</a>, <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#from(T, T, T, T, T, T, T, T)">eight</a>, <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#from(T, T, T, T, T, T, T, T, T)">nine</a>, or <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#from(T, T, T, T, T, T, T, T, T, T)">ten</a> items)
* RxJS: [`fromArray`](https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservablefromarrayarray-scheduler)
* RxJS: [`fromPromise`](https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservablefrompromisepromise)
* Linq: [`ToObservable`](http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.toobservable.aspx)

***

## repeat( )
#### create an Observable that emits the sequence of items emitted by the source Observable repeatedly
<img src="/Netflix/RxJava/wiki/images/rx-operators/repeat.o.png" width="640" height="309" />

There are also versions of `repeat( )` that operate on a scheduler that you specify, and that repeat only a certain number of times before terminating.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#repeat()">`repeat( )`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#repeat(rx.Scheduler)">`repeat(scheduler)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#repeat(long)">`repeat(count)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#repeat(long, rx.Scheduler)">`repeat(count, scheduler)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.repeat.aspx">`Repeat`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservablerepeatvalue-repeatcount-scheduler">`repeat`</a>

***

## create( )
#### create an Observable from scratch by means of a function
<img src="/Netflix/RxJava/wiki/images/rx-operators/create.png" width="640" height="200" />

You can create an Observable from scratch by using the `create( )` method. You pass this method a function that accepts as its parameter the Subscriber that is passed to an Observable’s `subscribe( )` method (or that is derived from the `Observerer` that is passed to that method). Write the function you pass to `create( )` so that it behaves as an Observable — calling the passed-in Subscriber’s `onNext( )`, `onError( )`, and `onCompleted( )` methods appropriately. For example:

```groovy
def myObservable = Observable.create({ aSubscriber ->
  try {
    for (int i = 1; i < 1000000; i++) {
      if (true == aSubscriber.isUnsubscribed()) {
        return;
      }
      aSubscriber.onNext(i);
    }
    if (false == aSubscriber.isUnsubscribed()) {
      aSubscriber.onCompleted();
    }
  } catch(Throwable t) {
    if (false == aSubscriber.isUnsubscribed()) {
      aSubscriber.onError(t);
    }
  }
})
```

**NOTE:** A well-formed finite Observable must attempt to call either the Subscriber’s `onCompleted( )` method exactly once or its `onError( )` method exactly once, and must not thereafter attempt to call any of the Subscriber’s other methods. It is good practice to check the Subscriber’s `isUnsubscribed( )` state so that your Observable can stop emitting items or doing expensive calculations when there is no longer an interested Subscriber.

> **Note:** in the scala language adaptor for RxJava, this method is called `apply( )`.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#create(rx.Observable.OnSubscribe)">`create(OnSubscribe)`</a>
* RxJS: [`create`](https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservablecreatesubscribe)
* Linq: [`Create`](http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.create.aspx)

***

## defer( )
#### do not create the Observable until a Subscriber subscribes; create a fresh Observable on each subscription
<img src="/Netflix/RxJava/wiki/images/rx-operators/defer.png" width="640" height="340" />

Pass `defer( )` an Observable factory function (a function that generates Observables), and `defer( )` will return an Observable that will call this function to generate its Observable sequence afresh each time a new Subscriber subscribes.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#defer(rx.functions.Func0)">`defer(observableFactory)`</a>
* RxJS: [`defer`](https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservabledeferobservablefactory)
* Linq: [`Defer`](http://msdn.microsoft.com/en-us/library/hh229160.aspx)

***

## range( )
#### create an Observable that emits a range of sequential integers
<img src="/Netflix/RxJava/wiki/images/rx-operators/range.png" width="640" height="195" />

To create an Observable that emits a range of sequential integers, pass the starting integer and the number of integers to emit to the `range( )` method.
```groovy
// myObservable emits the integers 5, 6, and 7 before completing:
def myObservable = Observable.range(5, 3);
```

In calls to `range(n,m)`, a value of zero for _m_ will result in no numbers being emitted (values less than zero will cause an exception). _n_ may be any integer that can be represented as a `BigDecimal` — posititve, negative, or zero.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#range(int, int)">`range(start, count)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#range(int, int, rx.Scheduler)">`range(start, count, scheduler)`</a>
* RxJS: [`range`](https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservablerangestart-count-scheduler)
* Linq: [`Range`](http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.range.aspx)
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/04_CreatingObservableSequences.html#ObservableRange">Introduction to Rx: Range</a>

***

## interval( )
#### create an Observable that emits a sequence of integers spaced by a given time interval
<img src="/Netflix/RxJava/wiki/images/rx-operators/interval.png" width="640" height="195" />

To create an Observable that emits items spaced by a particular interval of time, pass the time interval and the units of time that interval is measured in (and, optionally, a scheduler) to the `interval( )` method.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#interval(long, java.util.concurrent.TimeUnit)">`interval(interval,unit)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#interval(long, java.util.concurrent.TimeUnit, rx.Scheduler)">`interval(interval,unit,scheduler)`</a>
* RxJS: [`interval`](https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableintervalperiod-scheduler)
* Linq: [`Interval`](http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.interval.aspx)
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/04_CreatingObservableSequences.html#ObservableInterval">Introduction to Rx: Interval</a>

***

## timer( )
#### create an Observable that emits a single item after a given delay
<img src="/Netflix/RxJava/wiki/images/rx-operators/timer.png" width="640" height="200" />

The `timer( )` method returns an Observable that, when subscribed to, waits for a span of time that you have defined, then emits a single zero and completes.

There is also a version of `timer( )` that emits a single zero after a specified delay, and then emits incrementally increasing numbers periodically thereafter on a specified periodicity:
<img src="/Netflix/RxJava/wiki/images/rx-operators/timer.p.png" width="640" height="200" />

For both of these versions of `timer( )` you can optionally specify a Scheduler on which the timing will take place.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#timer(long, java.util.concurrent.TimeUnit)">`timer(delay, unit)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#timer(long, java.util.concurrent.TimeUnit, rx.Scheduler)">`timer(delay, unit, scheduler)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#timer(long, long, java.util.concurrent.TimeUnit)">`timer(delay, period, unit)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#timer(long, long, java.util.concurrent.TimeUnit, rx.Scheduler)">`timer(delay, period, unit, scheduler)`</a>
* RxJS: [`timer`](https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservabletimerduetime-period-scheduler)
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.timer.aspx">`Timer`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/04_CreatingObservableSequences.html#ObservableTimer">Introduction to Rx: Timer</a>

***

## empty( ), error( ), and never( )
#### Observables that can be useful for testing purposes

* `empty( )` creates an Observable that does not emit any items but instead immediately calls the Subscriber’s `onCompleted( )` method.<br /><img src="/Netflix/RxJava/wiki/images/rx-operators/empty.png" width="610" height="181" />
* `error( )` creates an Observable that does not emit any items but instead immediately calls the Subscriber’s `onError( )` method.<br /><img src="/Netflix/RxJava/wiki/images/rx-operators/error.png" width="610" height="181" />
* `never( )` creates an Observable that does not emit any items, nor does it call either the Subscriber’s `onCompleted( )` or `onError( )` methods.<br /><img src="/Netflix/RxJava/wiki/images/rx-operators/never.png" width="610" height="176" />

```groovy
import rx.Observable;
import rx.Observer;
import rx.Subscription;
import rx.subscriptions.Subscriptions;
import rx.util.functions.Func1;

println("*** empty() ***");
Observable.empty().subscribe(
  { println("empty: " + it); },             // onNext
  { println("empty: error - " + it.getMessage()); }, // onError
  { println("empty: Sequence complete"); }  // onCompleted
);

println("*** error() ***");
Observable.error(new Throwable("badness")).subscribe(
  { println("error: " + it); },             // onNext
  { println("error: error - " + it.getMessage()); }, // onError
  { println("error: Sequence complete"); }  // onCompleted
);

println("*** never() ***");
Observable.never().subscribe(
  { println("never: " + it); },             // onNext
  { println("never: error - " + it.getMessage()); }, // onError
  { println("never: Sequence complete"); }  // onCompleted
);
println("*** END ***");
```
```
*** empty() ***
empty: Sequence complete
*** error() ***
error: error - badness
*** never() ***
*** END ***
```

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#empty()">`empty()`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#empty(rx.Scheduler)">`empty(scheduler)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#error(java.lang.Throwable)">`error(throwable)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#error(java.lang.Throwable, rx.Scheduler)">`error(throwable, scheduler)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#never()">`never()`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableemptyscheduler">`empty`</a> and <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservablenever">`never`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.empty.aspx">`Empty`</a> and <a href="http://msdn.microsoft.com/en-us/library/hh211979.aspx">`Never`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/04_CreatingObservableSequences.html#SimpleFactoryMethods">Introduction to Rx: Simple factory methods</a>
