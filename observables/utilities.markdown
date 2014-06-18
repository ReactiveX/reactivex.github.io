---
layout: default
title: ReactiveX - Observable Utility Operators
id: utility-operators
---

#Observable Utility Operators

This section explains various utility operators for working with Observables.

* [**`materialize( )`**](Observable-Utility-Operators#materialize) — convert an Observable into a list of Notifications
* [**`dematerialize( )`**](Observable-Utility-Operators#dematerialize) — convert a materialized Observable back into its non-materialized form
* [**`timestamp( )`**](Observable-Utility-Operators#timestamp) — attach a timestamp to every item emitted by an Observable
* [**`serialize( )`**](Observable-Utility-Operators#serialize) — force an Observable to make serialized calls and to be well-behaved
* [**`cache( )`**](Observable-Utility-Operators#cache) — remember the sequence of items emitted by the Observable and emit the same sequence to future Subscribers
* [**`observeOn( )`**](Observable-Utility-Operators#observeon) — specify on which Scheduler a Subscriber should observe the Observable
* [**`subscribeOn( )`**](Observable-Utility-Operators#subscribeon) — specify which Scheduler an Observable should use when its subscription is invoked
* [**`parallel( )`**](Observable-Utility-Operators#parallel) — split the work done on the emissions from an Observable into multiple Observables each operating on its own parallel thread
* [**`doOnEach( )`**](Observable-Utility-Operators#dooneach) — register an action to take whenever an Observable emits an item
* [**`doOnCompleted( )`**](Observable-Utility-Operators#dooncompleted) — register an action to take when an Observable completes successfully
* [**`doOnError( )`**](Observable-Utility-Operators#doonerror) — register an action to take when an Observable completes with an error
* [**`doOnTerminate( )`**](Observable-Utility-Operators#doonterminate) — register an action to take when an Observable completes, either successfully or with an error
* [**`finallyDo( )`**](Observable-Utility-Operators#finallydo) — register an action to take when an Observable completes
* [**`delay( )`**](Observable-Utility-Operators#delay) — shift the emissions from an Observable forward in time by a specified amount
* [**`delaySubscription( )`**](Observable-Utility-Operators#delaysubscription) — hold an Subscriber's subscription request for a specified amount of time before passing it on to the source Observable
* [**`timeInterval( )`**](Observable-Utility-Operators#timeinterval) — emit the time lapsed between consecutive emissions of a source Observable
* [**`using( )`**](Observable-Utility-Operators#using) — create a disposable resource that has the same lifespan as an Observable
* [**`single( )`**](Observable-Utility-Operators#single-and-singleordefault) — if the Observable completes after emitting a single item, return that item, otherwise throw an exception
* [**`singleOrDefault( )`**](Observable-Utility-Operators#single-and-singleordefault) — if the Observable completes after emitting a single item, return that item, otherwise return a default item

***

## materialize( )
#### convert an Observable into a list of Notifications
<img src="/Netflix/RxJava/wiki/images/rx-operators/materialize.png" width="640" height="315" />​

A well-formed Observable will invoke its Subscriber’s `onNext` method zero or more times, and then will invoke either the `onCompleted` or `onError` method exactly once. The `materialize( )` method converts this series of invocations into a series of items emitted by an Observable, where it emits each such invocation as a `Notification` object.

For example:

```groovy
numbers = Observable.from([1, 2, 3]);

numbers.materialize().subscribe(
  { if(rx.Notification.Kind.OnNext == it.kind) { println("Next: " + it.value); }
    else if(rx.Notification.Kind.OnCompleted == it.kind) { println("Completed"); }
    else if(rx.Notification.Kind.OnError == it.kind) { println("Error: " + it.exception); } },
  { println("Error: " + it.getMessage()); }, // onError
  { println("Sequence complete"); }          // onCompleted
);
```
```
Next: 1
Next: 2
Next: 3
Completed
Sequence complete
```

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#materialize()">`materialize()`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh229453.aspx">`Materialize`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/08_Transformation.html#MaterializeAndDematerialize">Introduction to Rx: Materialize and Dematerialize</a>

***

## dematerialize( )
#### convert a materialized Observable back into its non-materialized form
<img src="/Netflix/RxJava/wiki/images/rx-operators/dematerialize.png" width="640" height="335" />​

You can undo the effects of `materialize( )` by means of the `dematerialize( )` method, which will emit the items from the Observable as though `materialize( )` had not been applied to it. The following example dematerializes the materialized Observable from the previous section:
```groovy
numbers = Observable.from([1, 2, 3]);

numbers.materialize().dematerialize().subscribe(
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

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#dematerialize()">`dematerialize()`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypedematerialize">`dematerialize`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh229047.aspx">`Dematerialize`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/08_Transformation.html#MaterializeAndDematerialize">Introduction to Rx: Materialize and Dematerialize</a>

***

## timestamp( )
#### attach a timestamp to every item emitted by an Observable
<img src="/Netflix/RxJava/wiki/images/rx-operators/timestamp.png" width="640" height="310" />​

The `timestamp( )` method converts an Observable that emits items of type _T_ into one that emits objects of type [`Timestamped<T>`](http://netflix.github.io/RxJava/javadoc/rx/util/Timestamped.html), where each such object is stamped with the time at which it was emitted.

```groovy
def myObservable = Observable.range(1, 1000000).filter({ 0 == (it % 200000) });

myObservable.timestamp().subscribe(
  { println(it.toString()); },               // onNext
  { println("Error: " + it.getMessage()); }, // onError
  { println("Sequence complete"); }          // onCompleted
);
```
```
Timestamped(timestampMillis = 1369252582698, value = 200000)
Timestamped(timestampMillis = 1369252582740, value = 400000)
Timestamped(timestampMillis = 1369252582782, value = 600000)
Timestamped(timestampMillis = 1369252582823, value = 800000)
Timestamped(timestampMillis = 1369252582864, value = 1000000)
Sequence complete
```

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#timestamp()">`timestamp()`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#timestamp(rx.Scheduler)">`timestamp(scheduler)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.timestamp.aspx">`Timestamp`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypetimestampscheduler">`timestamp`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/08_Transformation.html#TimeStampAndTimeInterval">Introduction to Rx: TimeStamp and TimeInterval</a>

***

## serialize( )
#### force an Observable to make serialized calls and to be well-behaved
<img src="/Netflix/RxJava/wiki/images/rx-operators/synchronize.png" width="640" height="400" />​

It is possible for an Observable to invoke its Subscribers' methods asynchronously, perhaps from different threads. This could make such an Observable poorly-behaved, in that it might try to invoke`onCompleted` or `onError` before one of its `onNext` invocations, or it might call `onNext` from two different threads concurrently. You can force such an Observable to be well-behaved and synchronous by applying the `serialize( )` method to it.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#serialize()">`serialize()`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.synchronize.aspx">`Synchronize`</a>

***

## cache( )
#### remember the sequence of items emitted by the Observable and emit the same sequence to future Subscribers
<img src="/Netflix/RxJava/wiki/images/rx-operators/cache.png" width="640" height="410" />​

By default, an Observable will generate its sequence of emitted items afresh for each new Subscriber that subscribes. You can force it to generate its sequence only once and then to emit this identical sequence to every Subscriber by using the `cache( )` method. Compare the behavior of the following two sets of sample code, the first of which does _not_ use `cache( )` and the second of which does:
```groovy
def myObservable = Observable.range(1, 1000000).filter({ 0 == (it % 400000) }).timestamp();

myObservable.subscribe(
  { println(it.toString()); },              // onNext
  { println("Error:" + it.getMessage()); }, // onError
  { println("Sequence complete"); }         // onCompleted
);
myObservable.subscribe(
  { println(it.toString()); },              // onNext
  { println("Error:" + it.getMessage()); }, // onError
  { println("Sequence complete"); }         // onCompleted
);
```
```
Timestamped(timestampMillis = 1369252832871, value = 400000)
Timestamped(timestampMillis = 1369252832951, value = 800000)
Sequence complete
Timestamped(timestampMillis = 1369252833074, value = 400000)
Timestamped(timestampMillis = 1369252833154, value = 800000)
Sequence complete
```
```groovy
def myObservable = Observable.range(1, 1000000).filter({ 0 == (it % 400000) }).timestamp().cache();

myObservable.subscribe(
  { println(it.toString()); },              // onNext
  { println("Error:" + it.getMessage()); }, // onError
  { println("Sequence complete"); }         // onCompleted
);
myObservable.subscribe(
  { println(it.toString()); },              // onNext
  { println("Error:" + it.getMessage()); }, // onError
  { println("Sequence complete"); }         // onCompleted
);
```
```
Timestamped(timestampMillis = 1369252924548, value = 400000)
Timestamped(timestampMillis = 1369252924630, value = 800000)
Sequence complete
Timestamped(timestampMillis = 1369252924548, value = 400000)
Timestamped(timestampMillis = 1369252924630, value = 800000)
Sequence complete
```
Note that in the second example the timestamps are identical for both of the Subscribers, whereas in the first example they differ.

The `cache( )` method will not itself trigger the execution of the source Observable; an initial Subscriber must subscribe to the Observable returned from `cache( )` before it will begin emitting items.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#cache()">`cache()`</a>

***

## observeOn( )
#### specify on which Scheduler a Subscriber should observe the Observable
<img src="/Netflix/RxJava/wiki/images/rx-operators/observeOn.png" width="640" height="308" />​

To specify in which Scheduler (thread) the Observable should invoke the Subscribers' `onNext( )`, `onCompleted( )`, and `onError( )` methods, call the Observable's `observeOn( )` method, passing it the appropriate `Scheduler`.

There is a complication with using `observeOn( )` on a <a href="https://github.com/Netflix/RxJava/wiki/Subject#wiki-publishsubject">`PublishSubject`</a> or on one of the Observables emitted as a result of the <a href="https://github.com/Netflix/RxJava/wiki/Transforming-Observables#wiki-groupby-and-groupbyuntil">`groupBy( )`</a> operator: it is possible that such Observables will begin emitting items before the subscription fully takes hold, and therefore that some of those items will never be observed. For this reason, there is a version of `observeOn( )` that takes a `buffersize` parameter; this parameter allows you to establish a buffer that will collect any items emitted between the time of the subscription and the time the scheduled observer begins observing, so that no items will be lost.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#observeOn(rx.Scheduler)">`observeOn(scheduler)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#observeOn(rx.Scheduler,%20int)">`observeOn(scheduler, buffersize)`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypeobserveonscheduler">`observeOn`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.observeon.aspx">`ObserveOn`</a>
* <a href="http://channel9.msdn.com/Series/Rx-Workshop/Rx-Workshop-Schedulers">Rx Workshop: Schedulers</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/15_SchedulingAndThreading.html#SubscribeOnObserveOn">Introduction to Rx: SubscribeOn and ObserveOn</a>

***

## subscribeOn( )
#### specify which Scheduler an Observable should use when its subscription is invoked
<img src="/Netflix/RxJava/wiki/images/rx-operators/subscribeOn.png" width="640" height="305" />​

To specify that the work done by the Observable should be done on a particular Scheduler (thread), call the Observable's `subscribeOn( )` method, passing it the appropriate `Scheduler`. By default (that is, unless you modify the Observable also with `observeOn( )`) the Observable will invoke the Subscribers' `onNext( )`, `onCompleted( )`, and `onError( )` methods in this same thread.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#subscribeOn(rx.Scheduler)">`subscribeOn(scheduler)`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypesubscribeonscheduler">`subscribeOn`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.subscribeon.aspx">`SubscribeOn`</a>
* <a href="http://channel9.msdn.com/Series/Rx-Workshop/Rx-Workshop-Schedulers">Rx Workshop: Schedulers</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/15_SchedulingAndThreading.html#SubscribeOnObserveOn">Introduction to Rx: SubscribeOn and ObserveOn</a>

***

## parallel( )
#### split the work done on the emissions from an Observable into multiple Observables each operating on its own parallel thread
<img src="/Netflix/RxJava/wiki/images/rx-operators/parallel.png" width="640" height="475" />​

You can use the `parallel( )` method to split an Observable into as many Observables as there are available processors, and to do work in parallel on each of these Observables. `parallel( )` will then merge the results of these parallel computations back into a single, well-behaved Observable sequence.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#parallel(rx.functions.Func1)">`parallel(function)`</a> and <a href=http://netflix.github.io/RxJava/javadoc/rx/Observable.html#parallel(rx.functions.Func1, rx.Scheduler)">`parallel(function,scheduler)`</a>

***

## doOnEach( )
#### register an action to take whenever an Observable emits an item
<img src="/Netflix/RxJava/wiki/images/rx-operators/doOnEach.png" width="640" height="310" />​

Use the `doOnEach( )` method to register an `Action` that RxJava will perform each time the Observable emits an item. This action takes the item as a parameter.

There are also `doOnEach( )` variants that allow you to register actions to perform if the Observable completes or informs of a throwable.  The `doOnNext( )` method is equivalent to the version of `doOnEach( )` that registers an action to be performed only for each emitted item.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#doOnEach(rx.functions.Action1)">`doOnEach(action)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#doOnEach(rx.Observer)">`doOnEach(observer)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.do.aspx">`Do`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypedoobserver--onnext-onerror-oncompleted">`do` and `doAction`</a>

***

## doOnCompleted( )
#### register an action to take when an Observable completes successfully
<img src="/Netflix/RxJava/wiki/images/rx-operators/doOnCompleted.png" width="640" height="305" />​

Use the `doOnCompleted( )` method to register an `Action` that RxJava will perform if the Observable completes normally (not by means of an error).

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#doOnCompleted(rx.functions.Action0)">`doOnCompleted(action)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.do.aspx">`Do`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypedoobserver--onnext-onerror-oncompleted">`do` and `doAction`</a>

***

## doOnError( )
#### register an action to take when an Observable completes with an error
<img src="/Netflix/RxJava/wiki/images/rx-operators/doOnError.png" width="640" height="305" />​

Use the `doOnError( )` method to register an `Action` that RxJava will perform if the Observable terminates with an error. This action takes the Throwable representing the error as a parameter.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#doOnError(rx.functions.Action1)">`doOnError(action)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.do.aspx">`Do`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypedoobserver--onnext-onerror-oncompleted">`do` and `doAction`</a>

***

## doOnTerminate( )
#### register an action to take when an Observable completes, either successfully or with an error
<img src="/Netflix/RxJava/wiki/images/rx-operators/doOnTerminate.png" width="640" height="305" />​

Use the `doOnTerminate( )` method to register an `Action` that RxJava will perform just before the Observable calls `onComplete` or `onError`.

#### see also:
* <a href="https://github.com/Netflix/RxJava/wiki/Observable-Utility-Operators#wiki-finallydo">`finallyDo`</a> - a similar operator that performs the action _after_ calling `onCompleted` or `onError`
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#doOnTerminate(rx.functions.Action0)">`doOnTerminate(action)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.do.aspx">`Do`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypedoobserver--onnext-onerror-oncompleted">`do` and `doAction`</a>

***

## finallyDo( )
#### register an action to take when an Observable completes
<img src="/Netflix/RxJava/wiki/images/rx-operators/finallyDo.png" width="640" height="310" />​

You can use the `finallyDo( )` method of an Observable to register an action that RxJava will invoke after that Observable invokes either the `onCompleted( )` or `onError( )` method of its Subscriber.

```groovy
def numbers = Observable.from([1, 2, 3, 4, 5]);

numbers.finallyDo({ println('Finally'); }).subscribe(
   { println(it); },                          // onNext
   { println("Error: " + it.getMessage()); }, // onError
   { println("Sequence complete"); }          // onCompleted
);
```
```
1
2
3
4
5
Sequence complete
Finally
```

#### see also:
* <a href="https://github.com/Netflix/RxJava/wiki/Observable-Utility-Operators#wiki-doonterminate">`doOnTerminate`</a> - a similar operator that performs the action _before_ calling `onCompleted` or `onError`
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#finallyDo(rx.functions.Action0)">`finallyDo(action)`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypefinallyaction">`finally` / `finallyAction`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh212133.aspx">`Finally`</a>

***

## delay( )
#### shift the emissions from an Observable forward in time by a specified amount
<img src="/Netflix/RxJava/wiki/images/rx-operators/delay.png" width="640" height="310" />​

The `delay( )` operator modifies its source Observable by pausing for a particular increment of time (that you specify) before emitting each of the source Observable's items. This has the effect of shifting the entire sequence of items emitted by the Observable forward in time by that specified increment.

Note that `delay( )` will _not_ time-shift an `onError( )` call in this fashion but it will forward such a call immediately to its subscribers. It will however time shift an `onCompleted( )` call.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#delay(long, java.util.concurrent.TimeUnit)">`delay(delay,unit)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#delay(long, java.util.concurrent.TimeUnit, rx.Scheduler)">`delay(delay,unit,scheduler)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#delay(rx.functions.Func0, rx.functions.Func1)">`delay(subscriptionDelay, itemDelay)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#defer(rx.functions.Func0)">`delay(observableFactory)`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypedelayduetime-scheduler">`delay`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.delay.aspx">`Delay`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/13_TimeShiftedSequences.html#Delay">Introduction to Rx: Delay</a>

***

## delaySubscription( )
#### hold a Subscriber's subscription request for a specified amount of time before passing it on to the source Observable
<img src="/Netflix/RxJava/wiki/images/rx-operators/delaySubscription.png" width="640" height="310" />​

The `delaySubscription( )` operator shifts waits for a specified period of time after receiving a subscription request before subscribing to the source Observable.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#delaySubscription(long, java.util.concurrent.TimeUnit)">`delaySubscription(delay,unit)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#delaySubscription(long, java.util.concurrent.TimeUnit, rx.Scheduler)">`delaySubscription(delay,unit,scheduler)`</a>

***

## timeInterval( )
#### emit the time lapsed between consecutive emissions of a source Observable
<img src="/Netflix/RxJava/wiki/images/rx-operators/timeInterval.png" width="640" height="310" />​

The `timeInterval( )` operator converts a source Observable into an Observable that emits the amount of time lapsed between consecutive emissions of the source Observable. The first emission is the amount of time lapsed between the time the Subscriber subscribed to the Observable and the time the source Observable emitted its first item. There is no corresponding emission marking the amount of time lapsed between the last emission of the source Observable and the subsequent call to `onCompleted( )`.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#timeInterval()">`timeInterval()`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#timeInterval(rx.Scheduler)">`timeInterval(scheduler)`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypetimeintervalscheduler">`timeInterval`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.timeinterval.aspx">`TimeInterval`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/08_Transformation.html#TimeStampAndTimeInterval">Introduction to Rx: TimeStamp and TimeInterval</a>

***

## using( )
#### create a disposable resource that has the same lifespan as an Observable
<img src="/Netflix/RxJava/wiki/images/rx-operators/using.png" width="640" height="400" />​

Pass the `using( )` method two factory functions: the first creates a disposable resource, the second creates an Observable. When a Subscriber subscribes to the resulting Observable, `using( )` will use the Observable factory function to create the Observable the Subscriber will observe, while at the same time using the resource factory function to create a resource. When the Subscriber unsubscribes from the Observable, or when the Observable terminates (normally or with an error), `using( )` will dispose of the resource it created.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#using(rx.functions.Func0, rx.functions.Func1)">`using(resourceFactory,observableFactory)`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableusingresourcefactory-observablefactory">`using`</a>

***

## single( ) and singleOrDefault( )
#### if the Observable completes after emitting a single item, return that item, otherwise throw an exception (or return a default item)
<img src="/Netflix/RxJava/wiki/images/rx-operators/single.png" width="640" height="315" />​

Use the `single( )` method to retrieve the only item emitted by an Observable. `single( )` will notify of a `NoSuchElementException` if the source Observable does not emit exactly one item.

You can also use this method to retrieve the only item emitted by an Observable that meets some particular condition (or `null` if the Observable method emits no such item). To do this, pass a function to `single( )` that returns `true` if the item meets the condition. In such a case, `single( )` will again notify of a `NoSuchElementException` unless the source Observable emits exactly one item that meets the condition.

<img src="/Netflix/RxJava/wiki/images/rx-operators/single.p.png" width="640" height="315" />​

The `singleOrDefault( )` method is similar, except that while it will still notify of an exception if the underlying Observable emits _more than_ one item, if the underlying Observable does not emit any items at all, rather than notifying of an exception, the Observable returned by `singleOrDefault( )` will emit a default item that you specify. Specify that default item by passing it as the first parameter to `singleOrDefault( )`.

<img src="/Netflix/RxJava/wiki/images/rx-operators/singleOrDefault.png" width="640" height="315" />

​<img src="/Netflix/RxJava/wiki/images/rx-operators/singleOrDefault.p.png" width="640" height="315" />​

#### see also:
* [Table of similar blocking and non-blocking operators](Blocking-Observable-Operators#wiki-appendix-similar-blocking-and-non-blocking-operators)
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#single()">`single( )`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#single(rx.functions.Func1)">`single(predicate)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#singleOrDefault(T)">`singleOrDefault(default)`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#singleOrDefault(T, rx.functions.Func1)">`singleOrDefault(default,predicate)`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypesinglepredicate-thisarg">`single`</a> and <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypesingleordefaultpredicate-defaultvalue-thisarg">`singleOrDefault`</a>
* Linq: `singleAsync` and `singleOrDefaultAsync`
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/07_Aggregation.html#Single">Introduction to Rx: Single</a>