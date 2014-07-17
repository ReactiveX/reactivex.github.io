---
layout: documentation
title: ReactiveX - Connectable Observable Operators
id: connectable
---

#Connectable Observable Operators

This section explains the [`ConnectableObservable`](http://netflix.github.io/RxJava/javadoc/rx/observables/ConnectableObservable.html) subclass and its operators:

* [**`ConnectableObservable.connect( )`**](Connectable-Observable-Operators#wiki-connectableobservableconnect) — instructs a Connectable Observable to begin emitting items
* [**`Observable.publish( )` and `Observable.multicast( )`**](Connectable-Observable-Operators#wiki-observablepublish-and-observablemulticast) — represents an Observable as a Connectable Observable
* [**`Observable.publishLast( )`**](Connectable-Observable-Operators#wiki-observablepublishlast) — represent an Observable as a Connectable Observable that emits only the last item emitted by the source Observable
* [**`Observable.replay( )`**](Connectable-Observable-Operators#wiki-observablereplay) — ensures that all Subscribers see the same sequence of emitted items, even if they subscribe after the Observable begins emitting the items
* [**`ConnectableObservable.refCount( )`**](Connectable-Observable-Operators#wiki-connectableobservablerefcount) — makes a Connectable Observable behave like an ordinary Observable

A Connectable Observable resembles an ordinary Observable, except that it does not begin emitting items when it is subscribed to, but only when its `connect()` method is called. In this way you can wait for all intended Subscribers to subscribe to the Observable before the Observable begins emitting items.

<img src="{{ site.url }}/assets/operators/publishConnect.png" width="640" height="510" />

The following example code shows two Subscribers subscribing to the same Observable. In the first case, they subscribe to an ordinary Observable; in the second case, they subscribe to a Connectable Observable that only connects after both Subscribers subscribe. Note the difference in the output:

**Example #1:**

```groovy
def firstMillion  = Observable.range( 1, 1000000 ).sample(7, java.util.concurrent.TimeUnit.MILLISECONDS);

firstMillion.subscribe(
   { println("Subscriber #1:" + it); },       // onNext
   { println("Error: " + it.getMessage()); }, // onError
   { println("Sequence #1 complete"); }       // onCompleted
);

firstMillion.subscribe(
    { println("Subscriber #2:" + it); },       // onNext
    { println("Error: " + it.getMessage()); }, // onError
    { println("Sequence #2 complete"); }       // onCompleted
);
```
```
Subscriber #1:211128
Subscriber #1:411633
Subscriber #1:629605
Subscriber #1:841903
Sequence #1 complete
Subscriber #2:244776
Subscriber #2:431416
Subscriber #2:621647
Subscriber #2:826996
Sequence #2 complete
```

**Example #2:**

```groovy
def firstMillion  = Observable.range( 1, 1000000 ).sample(7, java.util.concurrent.TimeUnit.MILLISECONDS).publish();

firstMillion.subscribe(
   { println("Subscriber #1:" + it); },       // onNext
   { println("Error: " + it.getMessage()); }, // onError
   { println("Sequence #1 complete"); }       // onCompleted
);

firstMillion.subscribe(
   { println("Subscriber #2:" + it); },       // onNext
   { println("Error: " + it.getMessage()); }, // onError
   { println("Sequence #2 complete"); }       // onCompleted
);

firstMillion.connect();
```
```
Subscriber #2:208683
Subscriber #1:208683
Subscriber #2:432509
Subscriber #1:432509
Subscriber #2:644270
Subscriber #1:644270
Subscriber #2:887885
Subscriber #1:887885
Sequence #2 complete
Sequence #1 complete
```

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/ConnectableObservable.html">`ConnectableObservable`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/14_HotAndColdObservables.html#PublishAndConnect">Introduction to Rx: Publish and Connect</a>

***

## ConnectableObservable.connect( )
#### instructs a Connectable Observable to begin emitting items
Call a Connectable Observable's `connect( )` method to instruct it to begin emitting the items from its underlying Observable to its Subscribers.

The `connect( )` method returns a `Subscription`. You can call that object's `unsubscribe( )` method to instruct the Observable to stop emitting items to its Subscribers.

You can also use the `connect( )` method to instruct an Observable to begin emitting items (or, to begin generating items that would be emitted) even before any Subscriber has subscribed to it.

#### see also
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/ConnectableObservable.html#connect()">`connect()`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#connectableobservableprototypeconnect">`connect`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh211748.aspx">`Connect`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/14_HotAndColdObservables.html#PublishAndConnect">Introduction to Rx: Publish and Connect</a>

***

## Observable.publish( ) and Observable.multicast( )
#### represents an Observable as a Connectable Observable
To represent an Observable as a Connectable Observable, use the `publish( )` or `multicast()` method.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#multicast(rx.subjects.Subject)">`multicast(subject)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#publish()">`publish()`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypemulticastsubject--subjectselector-selector">`multicast`</a> and <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypepublishselector">`publish`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.multicast.aspx">`Multicast`</a> and <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.publish.aspx">`Publish`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/14_HotAndColdObservables.html#PublishAndConnect">Introduction to Rx: Publish and Connect</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/14_HotAndColdObservables.html#Multicast">Introduction to Rx: Multicast</a>

***

## Observable.publishLast( )
#### represent an Observable as a Connectable Observable that emits only the last item emitted by the source Observable
<img src="{{ site.url }}/assets/operators/publishLast.png" width="640" height="310" />

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#publishLast()">`publishLast()`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypepublishlatestselector">`publishLast`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.publishlast.aspx">`PublishLast`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/14_HotAndColdObservables.html#PublishLast">Introduction to Rx: PublishLast</a>

***

## Observable.replay( )
#### ensures that all Subscribers see the same sequence of emitted items, even if they subscribe after the Observable begins emitting items
There are varieties of `replay( )` that return a ConnectableObservable that you then must use the `publish( )` operator on so that Subscribers may connect to it:

<img src="{{ site.url }}/assets/operators/replay.png" width="640" height="515" />

And there are also varieties of `replay( )` that accept a selector argument and return a simple Observable:

<img src="{{ site.url }}/assets/operators/replay.f.png" width="640" height="450" />

In each variety there are versions with which you can limit the number of replayable items either by quantity or by whether or not they were emitted within a particular timespan.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#replay()">`replay()`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypereplayselector-buffersize-window-scheduler">`replay`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.replay.aspx">`Replay`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/14_HotAndColdObservables.html#Replay">Introduction to Rx: Replay</a>

***

## ConnectableObservable.refCount( )
#### makes a Connectable Observable behave like an ordinary Observable
<img src="{{ site.url }}/assets/operators/publishRefCount.png" width="640" height="510" />

You can represent a Connectable Observable so that it behaves much like an ordinary Observable by using the `refCount( )` operator. This operator keeps track of how many Subscribers are subscribed to the resulting Observable and refrains from disconnecting from the source ConnectableObservable until all such Observables unsubscribe.

> *Note:* The `share( )` operator is equivalent to `publish( ).refCount( )`

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/observables/ConnectableObservable.html#refCount()">`refCount( )`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#connectableobservableprototyperefcount">`refCount`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh211664.aspx">`RefCount`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/14_HotAndColdObservables.html#RefCount">Introduction to Rx: RefCount</a>