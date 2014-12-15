---
layout: documentation
title: ReactiveX - Subject
id: subject
---

#Subject

A <a href="http://netflix.github.io/RxJava/javadoc/rx/subjects/Subject.html">`Subject`</a> is a sort of bridge or proxy that acts both as an `Subscriber` and as an `Observable`. Because it is a Subscriber, it can subscribe to one or more Observables, and because it is an Observable, it can pass through the items it observes by reemitting them, and it can also emit new items.

Because a Subject subscribes to an Observable, it will trigger that Observable to begin emitting items (if that Observable is “cold” — that is, if it waits for a subscription before it begins to emit items). This can have the effect of making the resulting Subject a "hot" Observable variant of the original “cold” Observable.

If you have a `Subject` and you want to pass it along to some other agent without exposing its `Subscriber` interface, you can mask it by calling its `asObservable` method, which will return the Subject as a pure `Observable`.

#### see also:
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#Subject">Introduction to Rx: Subject</a>

There are four subclasses of ``Subject`` that are designed for particular use cases:
# AsyncSubject
<a href="http://netflix.github.io/RxJava/javadoc/rx/subjects/AsyncSubject.html">`AsyncSubject`</a> emits the last value (and only the last value) emitted by the source Observable, and only after that source Observable completes. (If the source Observable does not emit any values, the `AsyncSubject` also completes without emitting any values.)

<img src="{{ site.url }}/assets/subject/S.AsyncSubject.png" width="640" height="405" />

It will also emit this same final value to any subsequent Subscribers. However, if the source Observable terminates with an error, the `AsyncSubject` will not emit any items, but will simply pass along the error notification from the source Observable.

<img src="{{ site.url }}/assets/subject/S.AsyncSubject.e.png" width="640" height="395" />

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/subjects/AsyncSubject.html">`AsyncSubject`</a>
* Reactive Extensions: <a href="http://msdn.microsoft.com/en-us/library/hh229363(v=vs.103).aspx">`AsyncSubject`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#AsyncSubject">Introduction to Rx: AsyncSubject</a>

# BehaviorSubject
When an Subscriber subscribes to a <a href="http://netflix.github.io/RxJava/javadoc/rx/subjects/BehaviorSubject.html">`BehaviorSubject`</a>, it begins by emitting the item most recently emitted by the source Observable (or a seed/default value if none has yet been emitted) and then continues to emit any other items emitted later by the source Observable(s).

<img src="{{ site.url }}/assets/subject/S.BehaviorSubject.png" width="640" height="415" />

However, if the source Observable terminates with an error, the `BehaviorSubject` will not emit any items to subsequent Subscribers, but will simply pass along the error notification from the source Observable.

<img src="{{ site.url }}/assets/subject/S.BehaviorSubject.e.png" width="640" height="405" />

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/subjects/BehaviorSubject.html">`BehaviorSubject`</a>
* Reactive Extensions: <a href="http://msdn.microsoft.com/en-us/library/hh211949(v=vs.103).aspx">`BehaviorSubject`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#BehaviorSubject">Introduction to Rx: BehaviorSubject</a>

# PublishSubject
<a href="http://netflix.github.io/RxJava/javadoc/rx/subjects/PublishSubject.html">``PublishSubject``</a> emits to a subscriber only those items that are emitted by the source Observable(s) subsequent to the time of the subscription.

<img src="{{ site.url }}/assets/subject/S.PublishSubject.png" width="640" height="405" />

Note that a `PublishSubject` may begin emitting items immediately upon creation (unless you have taken steps to prevent this), and so there is a risk that one or more items may be lost between the time the Subject is created and the Subscriber subscribes to it. If you need to guarantee delivery of all items from the source Observable, you'll need either to form that Observable with `create` so that you can manually reintroduce “cold” Observable behavior (checking to see that all subscribers have subscribed before beginning to emit items), or switch to a `ReplaySubject`.

If the source Observable terminates with an error, the `PublishSubject` will not emit any items to subsequent Subscribers, but will simply pass along the error notification from the source Observable.

<img src="{{ site.url }}/assets/subject/S.PublishSubject.e.png" width="640" height="395" />

Note: In RxJava's Scala language adaptor, you instantiate a `PublishSubject` via `Subject`.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/subjects/PublishSubject.html">`PublishSubject`</a>

# ReplaySubject
<a href="http://netflix.github.io/RxJava/javadoc/rx/subjects/ReplaySubject.html">``ReplaySubject``</a> emits to any subscriber all of the items that were emitted by the source Observable(s), regardless of when the subscriber subscribes.

<img src="{{ site.url }}/assets/subject/S.ReplaySubject.png" width="640" height="405" />

There are also versions of `ReplaySubject` that will throw away old items once the replay buffer threatens to grow beyond a certain size, or when a specified timespan has passed since the items were originally emitted.

When using ``ReplaySubject`` as a Subscriber, take care not to call its ``onNext( )`` method (or its other ``on`` methods) from multiple threads, as this could lead to coincident (non-sequential) calls, which violates the Observable contract and creates an ambiguity in the resulting Subject as to which item or emission should be replayed first.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/subjects/ReplaySubject.html">`ReplaySubject`</a>
* Reactive Extensions: <a href="http://msdn.microsoft.com/en-us/library/hh211810(v=vs.103).aspx">`ReplaySubject`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#ReplaySubject">Introduction to Rx: ReplaySubject</a>