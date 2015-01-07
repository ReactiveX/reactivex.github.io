---
layout: documentation
title: ReactiveX - Observable
id: observable
---

#Observable

In ReactiveX an <dfn>observer</dfn> <dfn>subscribes</dfn> to an <dfn>Observable</dfn>. Then that observer reacts to whatever item or sequence of items the Observable object <dfn>emits</dfn>. This pattern facilitates concurrent operations because it does not need to block while waiting for the Observable to emit objects, but instead it creates a sentry in the form of an observer that stands ready to react appropriately at whatever future time the Observable does so.

This page explains what the reactive pattern is and what Observables and observers are (and how observers subscribe to Observables). Subsequent child pages (as shown in sidebar) show how you use the variety of Observable operators to link Observables together and change their behaviors.

> This documentation accompanies its explanations with &ldquo;marble diagrams.&rdquo; Here is how marble diagrams represent Observables and transformations of Observables:
<img src="{{ site.url }}/assets/operators/legend.png" width="640" height="301" />

#### see also
* <a href="http://channel9.msdn.com/Series/Rx-Workshop/Rx-Workshop-Introduction"><cite>Rx Workshop</cite>: Introduction</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#IObservable"><cite>Introduction to Rx</cite>: IObservable</a>
* <a href="http://docs.couchbase.com/developer/java-2.0/observables.html"><cite>Mastering observables</cite></a> (from the Couchbase Server documentation)
* <a href="https://medium.com/@andrestaltz/2-minute-introduction-to-rx-24c8ca793877"><cite>2 minute introduction to Rx</cite></a> by Andre Staltz (&ldquo;Think of an Observable as an asynchronous immutable array.&rdquo;)

# Background

In many software programming tasks, you more or less expect that the instructions you write will execute and complete incrementally, one-at-a-time, in order as you have written them. But in the Rx paradigm, many instructions may execute in parallel and their results are later captured, in arbitrary order, by “observers.” In these cases, rather than _calling_ a method, you define a mechanism for retrieving and transforming the data, in the form of an “Observable,” and then _subscribe_ an observer to it, at which point the previously-defined mechanism fires into action with the observer standing sentry to capture and respond to its emissions whenever they arrive.

An advantage of this approach is that when you have a bunch of tasks to do that are not dependent on each other, you can start them all at the same time rather than waiting for each one to finish before starting the next one --- that way, your entire bundle of tasks only takes as long to complete as the longest task in the bundle.

There are many terms used to describe this model of asynchronous programming and design. This document will use the following terms: An <dfn>observer</dfn> <dfn>subscribes<dfn> to an <dfn>Observable</dfn>. An Observable <dfn>emits</dfn> <dfn>items</dfn> or sends <dfn>notifications</dfn> to its observers by invoking the observers’ methods.

In other documents and other contexts, what we are calling an “observer” is sometimes called a “subscriber,” “watcher” or “reactor.” This model in general is often referred to as the [“reactor pattern”](http://en.wikipedia.org/wiki/Reactor_pattern).

# Establishing Observers

This document usually uses Groovy for code examples, but there are ReactiveX implementations in many languages.

In an ordinary method call — that is, _not_ the sort of asynchronous, parallel calls typical in reactive programming — the flow is something like this:

1. Call a method.  
1. Store the return value from that method in a variable.  
1. Use that variable and its new value to do something useful.  

Or, something like this:

```groovy
// make the call, assign its return value to `returnVal`
returnVal = someMethod(itsParameters);
// do something useful with returnVal
```

In the asynchronous model the flow goes more like this:

1. Define a method that does something useful with the return value from the asynchronous call, this method is part of the _observer_.  
1. Define the asynchronous call itself as an object of the _Observable_ class.
1. Attach the observer to that Observable by _subscribing_ it (this also initiates the method call).  
1. Go on with your business; whenever the call returns, the observer’s method will begin to operate on its return value or values — the _items_ emitted by the Observable.  

Which looks something like this:

```groovy
// defines, but does not invoke, the Subscriber's onNext handler
// (in this example, the observer is very simple and has only an onNext handler)
def myOnNext = { it -> do something useful with it };
// defines, but does not invoke, the Observable
def myObservable = someObservable(itsParameters);
// subscribes the Subscriber to the Observable, and invokes the Observable
myObservable.subscribe(myOnNext);
// go on about my business
```

## onNext, onCompleted, and onError

The `subscribe()` method may accept one to three methods, or it may accept an object that implements the `Observer` interface (which includes these three methods):

**onNext**: An Observable will call this method of its observers whenever the Observable emits an item. This method takes as a parameter the item emitted by the Observable.

**onError**: An Observable will call this method of its observers to indicate that it has failed to generate the expected data or has encountered some other error. This stops the Observable and it will not make further calls to `onNext` or `onCompleted`. The `onError` method takes as its parameter an indication of what caused the error.

**onCompleted**: An Observable will invoke this method of its observers after it has called `onNext` for the final time, if it has not encountered any errors.

A more complete `subscribe()` example would therefore look like this:

```groovy
def myOnNext     = { item -> /* do something useful with item */ };
def myError      = { throwable -> /* react sensibly to a failed call */ };
def myComplete   = { /* clean up after the final response */ };
def myObservable = someMethod(itsParameters);
myObservable.subscribe(myOnNext, myError, myComplete);
// go on about my business
```

#### see also:
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#IObserver"><cite>Introduction to Rx</cite>: IObserver</a>

## Unsubscribing

In some ReactiveX implementations, there is a specialized observer interface, `Subscriber`, that implements an `unsubscribe()` method. You can call this method to indicate that the Subscriber is no longer interested in any of the Observables it is currently subscribed to. Those Observables can then (if they have no other interested observers) choose to stop generating new items to emit.

The results of this unsubscription will cascade back through the chain of operators that applies to the Observable that the Subscriber subscribed to, and this will cause each link in the chain to stop emitting items. This is not guaranteed to happen immediately, however, and it is possible for an Observable to generate and attempt to emit items for a while even after no Subscribers remain to observe these emissions.

## Some Notes on Naming Conventions

Each language-specific implementation of ReactiveX has its own naming quirks. There is no canonical naming standard, though there are many commonalities between implementations.

Furthermore, some of these names have different implications in other contexts, or seem awkward in the idiom of a particular implementing language.

For example there is the `onEvent` naming pattern (e.g. `onNext`, `onCompleted`, `onError`). In many contexts such names would indicate methods by means of which event handlers are _registered_. In ReactiveX, however, they name the event handlers themselves.

# &ldquo;Hot&rdquo; and &ldquo;Cold&rdquo; Observables

When does an Observable begin emitting its sequence of items? It depends on the Observable. A &ldquo;hot&rdquo; Observable may begin emitting items as soon as it is created, and so any observer who subscribes to that Observable may start observing the sequence somewhere in the middle. A &ldquo;cold&rdquo; Observable, on the other hand, waits until an observer subscribes to it before it begins to emit items, and so such an observer is guaranteed to see the whole sequence from the beginning.

In some implementations of ReactiveX, there is also something called a &ldquo;Connectable&rdquo; Observable. Such an Observable does not begin emitting items until its [`connect`]({{ site.url }}/documentation/operators/connect.html) method is called, whether or not any observers have subscribed to it.

# Composition via Observable Operators

Observables and observers are only the start of ReactiveX. By themselves they’d be nothing more than a slight extension of the standard observer pattern, better suited to handling a sequence of events rather than a single callback.

The real power comes with the “reactive extensions” (hence “ReactiveX”) — operators that allow you to transform, combine, manipulate, and work with the sequences of items emitted by Observables.

These Rx operators allow you to compose asynchronous sequences together in a declarative manner with all the efficiency benefits of callbacks but without the drawbacks of nesting callback handlers that are typically associated with asynchronous systems.

This documentation groups information about [the various operators]({{ site.url }}/documentation/operators.html#alphabetical) and examples of their usage into the following pages:

  * [Creating]({{ site.url }}/documentation/operators.html#creating)
  * [Transforming]({{ site.url }}/documentation/operators.html#transforming)
  * [Filtering]({{ site.url }}/documentation/operators.html#filtering)
  * [Combining]({{ site.url }}/documentation/operators.html#combining)
  * [Error Handling]({{ site.url }}/documentation/operators.html#error)
  * [Utility]({{ site.url }}/documentation/operators.html#utility)
  * [Conditional and Boolean]({{ site.url }}/documentation/operators.html#conditional)
  * [Mathematical and Aggregate]({{ site.url }}/documentation/operators.html#mathematical)
  * [Backpressure]({{ site.url }}/documentation/operators.html#backpressure)
  * [Connectable Observables]({{ site.url }}/documentation/operators.html#connectable)
  * [Blocking Observables]({{ site.url }}/documentation/operators.html#blocking)

These pages include information about some operators that are not part of the core of ReactiveX but are implemented in the variety of language-specific implementations and/or optional modules.
