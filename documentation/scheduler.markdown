---
layout: documentation
title: ReactiveX - Scheduler
id: scheduler
---

<h1>Scheduler</h1>
<p>
 If you want to introduce multithreading into your cascade of Observable operators, you can do so by instructing
 those operators (or particular Observables) to operate on particular <dfn>Schedulers</dfn>.
</p><p>
 Some ReactiveX Observable operators have variants that take a Scheduler as a parameter. These instruct the
 operator to do some or all of its work on a particular Scheduler.
</p>
<figure>
 <figcaption><p>
  By default, an Observable and the chain of operators that you apply to it will do its work, and will notify
  its observers, on the same thread on which its <code>Subscribe</code> method is called. The
  <span class="operator">SubscribeOn</span> operator changes this behavior by specifying a different Scheduler
  on which the Observable should operate. The <span class="operator">ObserveOn</span> operator specifies a
  different Scheduler that the Observable will use to send notifications to its observers.
 </p><p>
  As shown in this illustration, the <span class="operator">SubscribeOn</span> operator designates which thread
  the Observable will begin operating on, no matter at what point in the chain of operators that operator is
  called.  <span class="operator">ObserveOn</span>, on the other hand, affects the thread that the Observable
  will use <em>below</em> where that operator appears.  For this reason, you may call 
  <span class="operator">ObserveOn</span> multiple times at various points during the chain of Observable
  operators in order to change on which threads certain of those operators operate.
 </p></figcaption>
 <img src="operators/images/schedulers.png" style="width:100%;" alt="ObserveOn and SubscribeOn" />
</figure>

<h4>See Also</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/15_SchedulingAndThreading.html"><cite>Introduction to Rx</cite>: Scheduling and Threading</a></li>
 <li><a href="https://learn.microsoft.com/en-us/shows/rx-workshop/schedulers"><cite>Rx Workshop</cite>: Schedulers</a></li>
 <li><a href="http://xgrommx.github.io/rx-book/content/getting_started_with_rxjs/scheduling_and_concurrency.html">Using Schedulers</a> by Dennis Stoyanov</li>
</ul>

<h2>Language-Specific Information:</h2>
<div class="panel-group operators-by-language" id="accordion" role="tablist" aria-multiselectable="true">

  {% lang_operator RxClojure %}
    <p>
     <span style="color:#f00">TBD</span>
    </p>
  {% endlang_operator %}

  {% lang_operator RxCpp %}
    <p>
     <span style="color:#f00">TBD</span>
    </p>
  {% endlang_operator %}

  {% lang_operator RxGroovy %}
    <h2>Varieties of Scheduler</h2>
    <p>
     You obtain a Scheduler from the factory methods described in
     <a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html">the
     <code>Schedulers</code> class</a>. The following table shows the varieties of Scheduler that
     are available to you by means of these methods in RxGroovy:
    </p>
    <table class="table">
     <thead>
      <tr><th>Scheduler</th><th>purpose</th></tr>
     </thead>
     <tbody>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#computation()"><code>Schedulers.computation(&#8239;)</code></a></td><td>meant for computational work such as event-loops and callback processing; do not use this scheduler for I/O (use <code>Schedulers.io(&#8239;)</code> instead); the number of threads, by default, is equal to the number of processors</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#from(java.util.concurrent.Executor)"><code>Schedulers.from(executor)</code></a></td><td>uses the specified <code>Executor</code> as a Scheduler</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#immediate()"><code>Schedulers.immediate(&#8239;)</code></a></td><td>schedules work to begin immediately in the current thread</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#io()"><code>Schedulers.io(&#8239;)</code></a></td><td>meant for I/O-bound work such as asynchronous performance of blocking I/O, this scheduler is backed by a thread-pool that will grow as needed; for ordinary computational work, switch to <code>Schedulers.computation(&#8239;)</code>; <code>Schedulers.io(&#8239)</code> by default is a <code>CachedThreadScheduler</code>, which is something like a new thread scheduler with thread caching</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#newThread()"><code>Schedulers.newThread(&#8239;)</code></a></td><td>creates a new thread for each unit of work</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#trampoline()"><code>Schedulers.trampoline(&#8239;)</code></a></td><td>queues work to begin on the current thread after any already-queued work</td></tr>
     </tbody>
    </table>
    <h2>Default Schedulers for RxGroovy Observable Operators</h2>
    <p>
     Some Observable operators in RxGroovy have alternate forms that allow you to set which Scheduler the
     operator will use for (at least some part of) its operation. Others do not operate on any particular
     Scheduler, or operate on a particular default Scheduler. Those that have a particular default Scheduler
     include:
    </p>
    <table class="table">
     <thead>
      <tr><th>operator</th><th>Scheduler</th></tr>
     </thead>
     <tbody>
      <tr><td><a href="operators/buffer.html"><code>buffer(timespan)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/buffer.html"><code>buffer(timespan,&#8239;count)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/buffer.html"><code>buffer(timespan,&#8239;timeshift)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/debounce.html"><code>debounce(timeout,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/delay.html"><code>delay(delay,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/delay.html"><code>delaySubscription(delay,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/interval.html"><code>interval</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/repeat.html"><code>repeat</code></a></td><td><code>trampoline</code></td></tr>
      <tr><td><a href="operators/replay.html"><code>replay(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/replay.html"><code>replay(buffersize,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/replay.html"><code>replay(selector,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/replay.html"><code>replay(selector,&#8239;buffersize,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/retry.html"><code>retry</code></a></td><td><code>trampoline</code></td></tr>
      <tr><td><a href="operators/sample.html"><code>sample(period,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/skip.html"><code>skip(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/skiplast.html"><code>skipLast(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/take.html"><code>take(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/takelast.html"><code>takeLast(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/takelast.html"><code>takeLast(count,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/takelast.html"><code>takeLastBuffer(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/takelast.html"><code>takeLastBuffer(count,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/sample.html"><code>throttleFirst</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/sample.html"><code>throttleLast</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/debounce.html"><code>throttleWithTimeout</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/timeinterval.html"><code>timeInterval</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(timeoutSelector)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(firstTimeoutSelector,&#8239;timeoutSelector)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(timeoutSelector,&#8239;other)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(timeout,&#8239;timeUnit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(firstTimeoutSelector,&#8239;timeoutSelector,&#8239;other)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(timeout,&#8239;timeUnit,&#8239;other)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/timer.html"><code>timer</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/timestamp.html"><code>timestamp</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/window.html"><code>window(timespan)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/window.html"><code>window(timespan,&#8239;count)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/window.html"><code>window(timespan,&#8239;timeshift)</code></a></td><td><code>computation</code></td></tr>
     </tbody>
    </table>
    <h2>Test Scheduler</h2>
    <p>
     <a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html">The
     <code>TestScheduler</code></a> allows you to exercise fine-tuned manual control over how the
     Scheduler’s clock behaves. This can be useful for testing interactions that depend on precise
     arrangements of actions in time. This Scheduler has three additional methods:
    </p>
    <dl>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#advanceTimeTo(long,%20java.util.concurrent.TimeUnit)"><code>advanceTimeTo(time,unit)</code></a></dt>
      <dd>advances the Scheduler’s clock to a particular point in time</dd>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#advanceTimeBy(long,%20java.util.concurrent.TimeUnit)"><code>advanceTimeBy(time,unit)</code></a></dt>
      <dd>advances the Scheduler’s clock forward by a particular amount of time</dd>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#triggerActions()"><code>triggerActions( )</code></a></dt>
      <dd>start any unstarted actions that have been scheduled for a time equal to or earlier than the present
          time according to the Scheduler’s clock</dd>
    </dl>
    <h4>See Also</h4>
    <ul>
     <li><a href="https://speakerdeck.com/benjchristensen/applying-rxjava-to-existing-applications-at-philly-ete-2015">Testing Reactive Applications</a> by Ben Christensen</li>
     <li><a href="http://www.grahamlea.com/2014/07/rxjava-threading-examples/"><cite>RxJava Threading Examples</cite></a> by Graham Lea</li>
     <li>Advanced RxJava: Schedulers (<a href="http://akarnokd.blogspot.hu/2015/05/schedulers-part-1.html">part 1</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-2.html">part 2</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-3.html">part 3</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-4-final.html">part 4</a>) by Dávid Karnok</li>
    </ul>
  {% endlang_operator %}

  {% lang_operator RxJava&nbsp;1․x %}
    <h2>Varieties of Scheduler</h2>
    <p>
     You obtain a Scheduler from the factory methods described in
     <a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html">the
     <code>Schedulers</code> class</a>. The following table shows the varieties of Scheduler that
     are available to you by means of these methods in RxJava:
    </p>
    <table class="table">
     <thead>
      <tr><th>Scheduler</th><th>purpose</th></tr>
     </thead>
     <tbody>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#computation()"><code>Schedulers.computation(&#8239;)</code></a></td><td>meant for computational work such as event-loops and callback processing; do not use this scheduler for I/O (use <code>Schedulers.io(&#8239;)</code> instead); the number of threads, by default, is equal to the number of processors</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#from(java.util.concurrent.Executor)"><code>Schedulers.from(executor)</code></a></td><td>uses the specified <code>Executor</code> as a Scheduler</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#immediate()"><code>Schedulers.immediate(&#8239;)</code></a></td><td>schedules work to begin immediately in the current thread</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#io()"><code>Schedulers.io(&#8239;)</code></a></td><td>meant for I/O-bound work such as asynchronous performance of blocking I/O, this scheduler is backed by a thread-pool that will grow as needed; for ordinary computational work, switch to <code>Schedulers.computation(&#8239;)</code>; <code>Schedulers.io(&#8239)</code> by default is a <code>CachedThreadScheduler</code>, which is something like a new thread scheduler with thread caching</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#newThread()"><code>Schedulers.newThread(&#8239;)</code></a></td><td>creates a new thread for each unit of work</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#trampoline()"><code>Schedulers.trampoline(&#8239;)</code></a></td><td>queues work to begin on the current thread after any already-queued work</td></tr>
     </tbody>
    </table>
    <h2>Default Schedulers for RxJava 1.x Observable Operators</h2>
    <p>
     Some Observable operators in RxJava have alternate forms that allow you to set which Scheduler the operator
     will use for (at least some part of) its operation. Others do not operate on any particular Scheduler, or
     operate on a particular default Scheduler. Those that have a particular default Scheduler include:
    </p>
    <table class="table">
     <thead>
      <tr><th>operator</th><th>Scheduler</th></tr>
     </thead>
     <tbody>
      <tr><td><a href="operators/buffer.html"><code>buffer(timespan)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/buffer.html"><code>buffer(timespan,&#8239;count)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/buffer.html"><code>buffer(timespan,&#8239;timeshift)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/debounce.html"><code>debounce(timeout,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/delay.html"><code>delay(delay,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/delay.html"><code>delaySubscription(delay,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/interval.html"><code>interval</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/repeat.html"><code>repeat</code></a></td><td><code>trampoline</code></td></tr>
      <tr><td><a href="operators/replay.html"><code>replay(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/replay.html"><code>replay(buffersize,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/replay.html"><code>replay(selector,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/replay.html"><code>replay(selector,&#8239;buffersize,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/retry.html"><code>retry</code></a></td><td><code>trampoline</code></td></tr>
      <tr><td><a href="operators/sample.html"><code>sample(period,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/skip.html"><code>skip(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/skiplast.html"><code>skipLast(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/take.html"><code>take(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/takelast.html"><code>takeLast(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/takelast.html"><code>takeLast(count,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/takelast.html"><code>takeLastBuffer(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/takelast.html"><code>takeLastBuffer(count,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/sample.html"><code>throttleFirst</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/sample.html"><code>throttleLast</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/debounce.html"><code>throttleWithTimeout</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/timeinterval.html"><code>timeInterval</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(timeoutSelector)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(firstTimeoutSelector,&#8239;timeoutSelector)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(timeoutSelector,&#8239;other)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(timeout,&#8239;timeUnit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(firstTimeoutSelector,&#8239;timeoutSelector,&#8239;other)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/timeout.html"><code>timeout(timeout,&#8239;timeUnit,&#8239;other)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/timer.html"><code>timer</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/timestamp.html"><code>timestamp</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="operators/window.html"><code>window(timespan)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/window.html"><code>window(timespan,&#8239;count)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="operators/window.html"><code>window(timespan,&#8239;timeshift)</code></a></td><td><code>computation</code></td></tr>
     </tbody>
    </table>
    <h2>Using Schedulers</h2>
    <p>
     Aside from passing these Schedulers in to RxJava Observable operators, you can also use them to
     schedule your own work on Subscriptions. The following example uses
     <a href="http://reactivex.io/RxJava/javadoc/rx/Scheduler.Worker.html#schedule(rx.functions.Action0)">the <code>schedule</code> method</a> of
     <a href="http://reactivex.io/RxJava/javadoc/rx/Scheduler.Worker.html">the <code>Scheduler.Worker</code> class</a> to schedule work on the <code>newThread</code> Scheduler:
    <div class="code java"><pre>
worker = Schedulers.newThread().createWorker();
worker.schedule(new Action0() {

    @Override
    public void call() {
        yourWork();
    }

});
// some time later...
worker.unsubscribe();</pre></div>
    <h3>Recursive Schedulers</h3>
    <p>
     To schedule recursive calls, you can use <code>schedule</code> and then <code>schedule(this)</code> on the
     Worker object:
    </p>
    <div class="code java"><pre>
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
worker.unsubscribe();</pre></div>
    <h3>Checking or Setting Unsubscribed Status</h3>
    <p>
     Objects of the <code>Worker</code> class implement
     <a href="http://reactivex.io/RxJava/javadoc/rx/Subscription.html">the <code>Subscription</code>
     interface</a>, with its <a href="http://reactivex.io/RxJava/javadoc/rx/Subscription.html#isUnsubscribed()"><code>isUnsubscribed</code></a>
     and <a href="http://reactivex.io/RxJava/javadoc/rx/Subscription.html#unsubscribe()"><code>unsubscribe</code></a>
     methods, so you can stop work when a subscription is cancelled, or you can cancel the
     subscription from within the scheduled task:
    <div class="code java"><pre>
Worker worker = Schedulers.newThread().createWorker();
Subscription mySubscription = worker.schedule(new Action0() {

    @Override
    public void call() {
        while(!worker.isUnsubscribed()) {
            status = yourWork();
            if(QUIT == status) { worker.unsubscribe(); }
        }
    }

});</pre></div>
    <p>
     The <code>Worker</code> is also a <code>Subscription</code> and so you can (and should, eventually) call
     its <code>unsubscribe</code> method to signal that it can halt work and release resources:
    </p>
    <div class="code java"><pre>
worker.unsubscribe();</pre></div>
    <h3>Delayed and Periodic Schedulers</h3>
    <p>
     You can also use <a href="http://reactivex.io/RxJava/javadoc/rx/Scheduler.Worker.html#schedule(rx.functions.Action0,%20long,%20java.util.concurrent.TimeUnit)">a version of <code>schedule</code></a>
     that delays your action on the given Scheduler until a certain timespan has passed. The
     following example schedules <code>someAction</code> to be performed on
     <code>someScheduler</code> after 500ms have passed according to that Scheduler&#8217;s clock:
    </p>
    <div class="code java"><pre>
someScheduler.schedule(someAction, 500, TimeUnit.MILLISECONDS);</pre></div>
    <p>
     <a href="http://reactivex.io/RxJava/javadoc/rx/Scheduler.Worker.html#schedulePeriodically(rx.functions.Action0,%20long,%20long,%20java.util.concurrent.TimeUnit)">Another <code>Scheduler</code> method</a>
     allows you to schedule an action to take place at regular intervals. The following example
     schedules <code>someAction</code> to be performed on <code>someScheduler</code> after 500ms
     have passed, and then every 250ms thereafter:
    </p>
    <div class="code java"><pre>
someScheduler.schedulePeriodically(someAction, 500, 250, TimeUnit.MILLISECONDS);</pre></div>
    <h2>Test Scheduler</h2>
    <p>
     <a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html">The
     <code>TestScheduler</code></a> allows you to exercise fine-tuned manual control over how the
     Scheduler’s clock behaves. This can be useful for testing interactions that depend on precise
     arrangements of actions in time. This Scheduler has three additional methods:
    </p>
    <dl>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#advanceTimeTo(long,%20java.util.concurrent.TimeUnit)"><code>advanceTimeTo(time,unit)</code></a></dt>
      <dd>advances the Scheduler’s clock to a particular point in time</dd>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#advanceTimeBy(long,%20java.util.concurrent.TimeUnit)"><code>advanceTimeBy(time,unit)</code></a></dt>
      <dd>advances the Scheduler’s clock forward by a particular amount of time</dd>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#triggerActions()"><code>triggerActions( )</code></a></dt>
      <dd>start any unstarted actions that have been scheduled for a time equal to or earlier than the present
          time according to the Scheduler’s clock</dd>
    </dl>
    <h4>See Also</h4>
    <ul>
     <li><a href="http://www.grahamlea.com/2014/07/rxjava-threading-examples/"><cite>RxJava Threading Examples</cite></a> by Graham Lea</li>
     <li><a href="https://speakerdeck.com/benjchristensen/applying-rxjava-to-existing-applications-at-philly-ete-2015">Testing Reactive Applications</a> by Ben Christensen</li> 
     <li>Advanced RxJava: Schedulers (<a href="http://akarnokd.blogspot.hu/2015/05/schedulers-part-1.html">part 1</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-2.html">part 2</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-3.html">part 3</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-4-final.html">part 4</a>) by Dávid Karnok</li>
    </ul>
  {% endlang_operator %}

  {% lang_operator RxJS %}
    <p>
     In RxJS you obtain Schedulers from the <code>Rx.Scheduler</code> object or as independently-implemented
     objects. The following table shows the varieties of Scheduler that are available to you in RxJS:.
    </p>
    <table class="table">
     <thead>
      <tr><th>Scheduler</th><th>purpose</th></tr>
     </thead>
     <tbody>
      <tr><td><code>Rx.Scheduler.currentThread</code></td><td>schedules work as soon as possible on the current thread</td></tr>
      <tr><td><code>Rx.HistoricalScheduler</code></td><td>schedules work as though it were occurring at an arbitrary historical time</td></tr>
      <tr><td><code>Rx.Scheduler.immediate</code></td><td>schedules work immediately on the current thread</td></tr>
      <tr><td><code>Rx.TestScheduler</code></td><td>for unit testing; this allows you to manually manipulate the movement of time</td></tr>
      <tr><td><code>Rx.Scheduler.timeout</code></td><td>schedules work by means of a timed callback</td></tr>
     </tbody>
    </table>
    <h4>See Also</h4>
    <ul>
     <li><a href="http://stackoverflow.com/questions/28145890/what-is-a-scheduler-in-rxjs"><cite>StackOverflow</cite>: What is a &ldquo;Scheduler&rdquo; in RxJS</a></li>
     <li><a href="http://xgrommx.github.io/rx-book/content/schedulers/index.html">Schedulers</a> by Dennis Stoyanov</a></li>
     <li><a href="http://www.grahamlea.com/2014/07/rxjava-threading-examples/">RxJava Threading Examlpes</a> by Graham Lea</li>
    </ul>
  {% endlang_operator %}

  {% lang_operator RxKotlin %}
    <p>
     <span style="color:#f00">TBD</span>
    </p>
  {% endlang_operator %}

  {% lang_operator Rx.NET %}
    <p>
     <span style="color:#f00">TBD</span>
    </p>
  {% endlang_operator %}

  {% lang_operator RxPY %}
    <p>
     <span style="color:#f00">TBD</span>
    </p>
  {% endlang_operator %}

  {% lang_operator Rx.rb %}
    <p>
     <span style="color:#f00">TBD</span>
    </p>
  {% endlang_operator %}

  {% lang_operator RxScala %}
    <p>
     <span style="color:#f00">TBD</span>
    </p>
  {% endlang_operator %}

</div>
