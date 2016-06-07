---
layout: documentation
title: ReactiveX - Scheduler
id: scheduler
---

<h1>스케줄러</h1>
<p>
 만약 Observable의 연산자 체인에 멀티스레딩을 적용하고 싶다면, 특정 <dfn>스케줄러</dfn>를 통해 연산자(또는 특정 Observable)들을 실행하면 된다.
</p>
<p>
 ReactiveX의 일부 Observable 연산자 중에는 스케줄러를 파라미터로 받기도 하는데, 이런 형태의 연산자들은 자신이 처리할 연산의 일부 또는 전체를 특정 스케줄러 내에서 실행한다.
</p>
<figure>
 <figcaption>
 <p>
  기본적으로, Observable과 연산자 체인은 이같이 동작하며 <code>Subscribe</code> 메서드가 호출되는 스레드와 동일한 스레드 상에서 옵저버에게 알림을 보낸다.
  <span class="operator">SubscribeOn</span> 연산자는 앞에서 실행 중인 Observable 위에 스케러를 명시함으로써 동작을 변경한다.
  <span class="operator">ObserveOn</span> 연산자는 Observable이 옵저버에게 알림을 보낼때 사용 할 다른 스케줄러를 명시한다.
 </p>
 <p>
  위에서 말했듯이, <span class="operator">SubscribeOn</span> 연산자는 Observable이 연산자 처리에 시용할 스레드를 할당하며 연산자 체인 중 어디에서 호출되는지 문제되지 않는다.
  하지만, 반대로 <span class="operator">ObserveOn</span> 연산자는 연산자 체인 중 Observable이 사용할 스레드가 호출 체인 중 어느 시점에 호출되는지에 따라 <em>그 이후</em>에 호출되는 연산자에 영향을 미친다. 이런 이유 때문에, 아마도 여러분은 특정 연산자를 별도의 스레드 상에서 실행 시키도록 연산자 호출 체인 중 여러 곳에서<span class="operator">ObserveOn</span>를 호출하기도 할 것이다.
 </p>
 </figcaption>
 <img src="../operators/images/schedulers.png" style="width:100%;" alt="ObserveOn and SubscribeOn" />
</figure>

<h4>참고</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/15_SchedulingAndThreading.html"><cite>Introduction to Rx</cite>: Scheduling and Threading</a></li>
 <li><a href="http://channel9.msdn.com/Series/Rx-Workshop/Rx-Workshop-Schedulers"><cite>Rx Workshop</cite>: Schedulers</a></li>
 <li><a href="http://xgrommx.github.io/rx-book/content/getting_started_with_rxjs/scheduling_and_concurrency.html">Using Schedulers</a> by Dennis Stoyanov</li>
</ul>

<h2>언어별 명세:</h2>
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
    <h2>다양한 스케줄러</h2>
    <p>
     <a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html">the
     <code>Schedulers</code> 클래스에 명시된 팩토리 메서드를 통해 스케쥴러를 생성할 수 있다. 아래의 테이블은 RxGroovy에서 지원하는 메서드를 통해 사용 가능한 스케줄러들을 보여준다;
    </p>
    <table class="table">
     <thead>
      <tr><th>스케줄러</th><th>용도</th></tr>
     </thead>
     <tbody>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#computation()"><code>Schedulers.computation(&#8239;)</code></a></td>
      <td>
      이벤트-루프와 콜백 처리 같은 연산 중심적인 작업을 위해 사용된다; I/O를 위한 용도로 사용하지 말아야 한다(대신 <code>Schedulers.io(&#8239;)</code>를 사용); 기본적으로 스레드의 수는 프로세서의 수와 같다
      </td>
      </tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#from(java.util.concurrent.Executor)"><code>Schedulers.from(executor)</code></a></td>
      <td>지정된 <code>Executor</code>를 스케줄러로 사용한다</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#immediate()"><code>Schedulers.immediate(&#8239;)</code></a></td>
      <td>현재 스레드에서 즉시 실행할 작업을 스케줄링 한다</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#io()"><code>Schedulers.io(&#8239;)</code></a></td>
      <td>블러킹 I/O의 비동기 연산 같은 I/O 바운드 작업을 처리하며, 필요에 따라 증가하는 스레드-풀을 통해 실행된다; 일반적인 연산이 필요한 작업은 <code>Schedulers.computation(&#8239;)</code>를 사용하면 된다; 기본적으로 <code>Schedulers.io(&#8239)는 <code>CachedThreadScheduler</code>로, <code>CachedThreadScheduler</code>는 스레드 캐싱을 통한 새로운 스레드 스케줄러로 생각하면 된다</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#newThread()"><code>Schedulers.newThread(&#8239;)</code></a></td>
      <td>각각의 단위 작업을 위한 새로운 스레드를 생성한다</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#trampoline()"><code>Schedulers.trampoline(&#8239;)</code></a></td>
      <td>대기 중인 완료된 후에 현재 스레드에서 실행 될 작업 큐를 만든다</td></tr>
     </tbody>
    </table>
    <h2>RxGroovy Observable 연산자를 위한 기본 스케줄러</h2>
    <p>
     RvGroovy에 있는 일부 Observable 연산자들은 연산자가 자신의 연산(또는 최소한 연산의 일부)을 위해 사용할 스케줄러를 설정할 수 있는 기능을 제공한다. 그 외에는 특정 스케줄러 상에서 동작할 수 없거나 또는 특정 기본 스케줄러 상에서만 동작한다. 여기서 설명하는 특정 기본 스케줄러는 아래와 같다:
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
    <h2>테스트 스케줄러</h2>
    <p>
     이 <a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html">
     <code>TestScheduler</code></a>는 스케줄러의 시간 동작을 정교하게 제어할 수 있는 방법들을 제공한다. 원하는 시점에 기대하는 동작에 따라 상호작용할 수 있는 테스트에 유용하게 사용될 수 있다. 이 스케줄러는 세 개의 메서드를 제공한다:
    </p>
    <dl>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#advanceTimeTo(long,%20java.util.concurrent.TimeUnit)"><code>advanceTimeTo(time,unit)</code></a></dt>
      <dd>특정 시간대로 스케줄러의 시간을 앞당긴다</dd>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#advanceTimeBy(long,%20java.util.concurrent.TimeUnit)"><code>advanceTimeBy(time,unit)</code></a></dt>
      <dd>특정 시간만큼 스케줄러의 시간을 앞으로 당긴다</dd>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#triggerActions()"><code>triggerActions( )</code></a></dt>
      <dd>스케줄러가 가리키는 시간보다 이전에 또는 동일 시간에 예약된, 아직 실행되지 않은 동작들을 시작시킨다.</dd>
    </dl>
    <h4>참고</h4>
    <ul>
     <li><a href="https://speakerdeck.com/benjchristensen/applying-rxjava-to-existing-applications-at-philly-ete-2015">Testing Reactive Applications</a> by Ben Christensen</li>
     <li><a href="http://www.grahamlea.com/2014/07/rxjava-threading-examples/"><cite>RxJava Threading Examples</cite></a> by Graham Lea</li>
     <li>Advanced RxJava: Schedulers (<a href="http://akarnokd.blogspot.hu/2015/05/schedulers-part-1.html">part 1</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-2.html">part 2</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-3.html">part 3</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-4-final.html">part 4</a>) by Dávid Karnok</li>
    </ul>
  {% endlang_operator %}

  {% lang_operator RxJava %}
    <h2>다양한 스케줄러</h2>
    <p>
     <a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html">the
     <code>Schedulers</code> 클래스</a>에 명시된 팩토리 메서드를 통해 스케줄러를 생성할 수 있다. 아래의 테이블은 RxJava가 제공하는 메서드를 통해 사용 가능한 스케줄러들을 보여준다:
    </p>
    <table class="table">
     <thead>
      <tr><th>스케줄러</th><th>용도</th></tr>
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
    <h2>Default Schedulers for RxJava Observable Operators</h2>
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
