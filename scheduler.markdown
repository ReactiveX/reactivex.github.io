---
layout: documentation
title: ReactiveX - Scheduler
id: scheduler
---

#Scheduler

If you want to introduce multithreading into your cascade of Observable operators, you can do so by instructing those operators (or particular Observables) to operate on particular Schedulers.

Many of the RxJava Observable operators have varieties that take a Scheduler as a parameter. These instruct the operator to do some or all of its work on a particular Scheduler.

You can make an Observable act on a particular Scheduler by means of the <a href="https://github.com/Netflix/RxJava/wiki/Observable-Utility-Operators#wiki-observeon">`observeOn`</a> or <a href="https://github.com/Netflix/RxJava/wiki/Observable-Utility-Operators#wiki-subscribeon">`subscribeOn`</a> operators.  `observeOn` instructs an Observable to call its observer's `onNext`, `onError`, and `onCompleted` methods on a particular Scheduler; `subscribeOn` takes this a step further and instructs the Observable to do all of its processing (including the sending of items and notifications to observers) on a particular Scheduler.

You can also split an operator that works on an Observable onto multiple threads with the <a href="https://github.com/Netflix/RxJava/wiki/Observable-Utility-Operators#wiki-parallel">`parallel`</a> operator.

#### See also:
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/15_SchedulingAndThreading.html">Intro to Rx: Scheduling and Threading</a>
* <a href="http://channel9.msdn.com/Series/Rx-Workshop/Rx-Workshop-Schedulers">Rx Workshop: Schedulers</a>

## Varieties of Scheduler

You obtain a Scheduler from the factory methods described in the `Schedulers` class. The following table shows the varieties of Scheduler that are available to you by means of these methods:

<table class="table">
 <thead>
  <tr><th><code>Scheduler</cote></th><th>purpose</th></tr>
 </thead>
 <tbody>
  <tr><td><code>Schedulers.computation(&#8239;)</code></td><td>meant for computational work such as event-loops and callback processing; do not use this scheduler for I/O (use <code>Schedulers.io(&#8239;)</code> instead)</td></tr>
  <tr><td><code>Schedulers.from(executor)</code></td><td>uses the specified `Executor` as a Scheduler</td></tr>
  <tr><td><code>Schedulers.immediate(&#8239;)</code></td><td>schedules work to begin immediately in the current thread</td></tr>
  <tr><td><code>Schedulers.io(&#8239;)</code></td><td>meant for I/O-bound work such as asynchronous performance of blocking I/O, this scheduler is backed by a thread-pool that will grow as needed; for ordinary computational work, switch to <code>Schedulers.computation(&#8239;)</code></td></tr>
  <tr><td><code>Schedulers.newThread(&#8239;)</code></td><td>creates a new thread for each unit of work</td></tr>
  <tr><td><code>Schedulers.trampoline(&#8239;)</code></td><td>queues work to begin on the current thread after any already-queued work</td></tr>
 </tbody>
</table>

## Default Schedulers for RxJava Observable operators

Some Observable operators in RxJava have alternate forms that allow you to set which Scheduler the operator will use for (at least some part of) its operation. Others do not operate on any particular Scheduler, or operate on a particular default Scheduler. Those that have a particular default Scheduler include:

<table class="table">
 <thead>
  <tr><th>operator</th><th>Scheduler</th></tr>
 </thead>
 <tbody>
  <tr><td><code>buffer(timespan)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>buffer(timespan,&#8239;count)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>buffer(timespan,&#8239;timeshift)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>debounce(timeout,&#8239;unit)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>delay(delay,&#8239;unit)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>delaySubscription(delay,&#8239;unit)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>interval</code></td><td><code>computation</code></td></tr>
  <tr><td><code>parallel</code></td><td><code>computation</code></td></tr>
  <tr><td><code>parallelMerge</code></td><td><code>immediate</code></td></tr>
  <tr><td><code>repeat</code></td><td><code>trampoline</code></td></tr>
  <tr><td><code>replay(time,&#8239;unit)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>replay(buffersize,&#8239;time,&#8239;unit)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>replay(selector,&#8239;time,&#8239;unit)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>replay(selector,&#8239;buffersize,&#8239;time,&#8239;unit)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>retry</code></td><td><code>trampoline</code></td></tr>
  <tr><td><code>sample(period,&#8239;unit)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>skip(time,&#8239;unit)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>skipLast(time,&#8239;unit)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>take(time,&#8239;unit)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>takeLast(time,&#8239;unit)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>takeLast(count,&#8239;time,&#8239;unit)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>takeLastBuffer(time,&#8239;unit)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>takeLastBuffer(count,&#8239;time,&#8239;unit)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>throttleFirst</code></td><td><code>computation</code></td></tr>
  <tr><td><code>throttleLast</code></td><td><code>computation</code></td></tr>
  <tr><td><code>throttleWithTimeout</code></td><td><code>computation</code></td></tr>
  <tr><td><code>timeInterval</code></td><td><code>immediate</code></td></tr>
  <tr><td><code>timeout(timeoutSelector)</code></td><td><code>immediate</code></td></tr>
  <tr><td><code>timeout(firstTimeoutSelector,&#8239;timeoutSelector)</code></td><td><code>immediate</code></td></tr>
  <tr><td><code>timeout(timeoutSelector,&#8239;other)</code></td><td><code>immediate</code></td></tr>
  <tr><td><code>timeout(timeout,&#8239;timeUnit)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>timeout(firstTimeoutSelector,&#8239;timeoutSelector,&#8239;other)</code></td><td><code>immediate</code></td></tr>
  <tr><td><code>timeout(timeout,&#8239;timeUnit,&#8239;other)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>timer</code></td><td><code>computation</code></td></tr>
  <tr><td><code>timestamp</code></td><td><code>immediate</code></td></tr>
  <tr><td><code>window(timespan)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>window(timespan,&#8239;count)</code></td><td><code>computation</code></td></tr>
  <tr><td><code>window(timespan,&#8239;timeshift)</code></td><td><code>computation</code></td></tr>
 </tbody>
</table>

## Using Schedulers

Aside from passing these Schedulers in to RxJava Observable operators, you can also use them to schedule your own work on Subscriptions. The following example uses the `schedule( )` method of the `Scheduler` class to schedule work on the `newThread` Scheduler:

```java
worker = Schedulers.newThread().createWorker();
worker.schedule(new Action0() {

    @Override
    public void call() {
        yourWork();
    }

});
// some time later...
worker.unsubscribe();
```
### Recursive Schedulers
To schedule recursive calls, you can use `schedule( )` and then `schedule(this)` on the Worker object:
```java
worker = Schedulers.newThread().createWorker();
worker.schedule(new Action0() {

    @Override
    public void call() {
        yourWork();
        // recurse until unsubscribed (schedule will do nothing if unsubscribed)
        worker.schedule(this);
    }

});
// some time later...
worker.unsubscribe();
```

### Checking or Setting Unsubscribed Status
Objects of the `Worker` class implement the `Subscription` interface, with its `isUnsubscribed( )` and `unsubscribe( )` methods, so you can stop work when a subscription is cancelled, or you can cancel the subscription from within the scheduled task:
```java
Worker worker = Schedulers.newThread().createWorker();
Subscription mySubscription = worker.schedule(new Action0() {

    @Override
    public void call() {
        while(!worker.isUnsubscribed()) {
            status = yourWork();
            if(QUIT == status) { worker.unsubscribe(); }
        }
    }

});
```
The `Worker` is also a `Subscription` and so you can (and should, eventually) call its `unsubscribe( )` method to signal that it can halt work and release resources:
```java
worker.unsubscribe();
```

### Delayed and Periodic Schedulers
You can also use a version of `schedule( )` that delays your action on the given Scheduler until a certain timespan has passed. The following example schedules `someAction` to be performed on `someScheduler` after 500ms have passed according to that Scheduler's clock:
```java
someScheduler.schedule(someAction, 500, TimeUnit.MILLISECONDS);
```
Another `Scheduler` method allows you to schedule an action to take place at regular intervals. The following example schedules `someAction` to be performed on `someScheduler` after 500ms have passed, and then every 250ms thereafter:
```java
someScheduler.schedulePeriodically(someAction, 500, 250, TimeUnit.MILLISECONDS);
```
