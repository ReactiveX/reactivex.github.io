---
layout: documentation
title: ReactiveX - Scheduler
lang: ko
id: scheduler
---

<h1>스케줄러</h1>
<p>
 Observable 연산자 체인에 멀티스레딩을 적용하고 싶다면, 특정 <dfn>스케줄러</dfn>를 사용해서 연산자(또는 특정 Observable)를 실행하면 된다.
</p>
<p>
 ReactiveX의 일부 Observable 연산자는 사용할 스케줄러를 파라미터로 전달 받기도 하는데, 이 연산자들은 자신이 처리할 연산의 일부 또는 전체를 전달된 스케줄러 내에서 실행한다.
</p>
<figure>
 <figcaption>
 <p>
  기본적으로, Observable과 연산자 체인은 이처럼 스케줄러를 통해 동작하고 <code>Subscribe</code> 메서드가 호출되는 스레드를 사용해서 옵저버에게 알림을 보낸다. 
  <span class="operator">SubscribeOn</span> 연산자는 다른 스케줄러를 지정해서 Observable이 처리해야 할 연산자들을 실행 시킨다. 그리고, 
  <span class="operator">ObserveOn</span> 연산자는 Observable이 옵저버에게 알림을 보낼때 사용 할 스케줄러를 명시한다.
 </p>
 <p>
  아래 그림이 보여주듯, <span class="operator">SubscribeOn</span> 연산자는 Observable이 연산을 위해 사용할 스레드를 지정하며, 연산자 체인 중 아무 곳에서 호출해도 문제되지 않는다.
  하지만, <span class="operator">ObserveOn</span> 연산자는 연산자 체인 중 Observable이 사용할 스레드가 호출 체인 중 어느 시점에서 할당되는지에 따라 <em>그 후</em>에 호출되는 연산자는 영향을 받는다. 그렇기 때문에, 어쩌면 여러분은 특정 연산자를 별도의 스레드에서 실행 시키기 위해 연산자 체인 중 한 군데 이상에서<span class="operator">ObserveOn</span>을 호출하게 될 것이다.
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
     <a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html">
     <code>Schedulers</code></a> 클래스의 팩토리 메서드를 사용해서 스케쥴러를 생성한다. 아래의 테이블은 RxGroovy에서 제공하는 메서드와 사용 가능한 스케줄러들을 보여준다;
    </p>
    <table class="table">
     <thead>
      <tr><th>스케줄러</th><th>용도</th></tr>
     </thead>
     <tbody>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#computation()"><code>Schedulers.computation(&#8239;)</code></a></td>
      <td>
      이벤트-루프와 콜백 처리 같은 연산 중심적인 작업을 위해 사용된다; 그렇기 때문에 I/O를 위한 용도로는 사용하지 않아야 한다(대신 <code>Schedulers.io(&#8239;)</code>를 사용); 기본적으로 스레드의 수는 프로세서의 수와 같다
      </td>
      </tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#from(java.util.concurrent.Executor)"><code>Schedulers.from(executor)</code></a></td>
      <td>명시한 <code>Executor</code>를 스케줄러로 사용한다</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#immediate()"><code>Schedulers.immediate(&#8239;)</code></a></td>
      <td>현재 스레드에서 즉시 실행할 작업을 스케줄링 한다</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#io()"><code>Schedulers.io(&#8239;)</code></a></td>
      <td>블러킹 I/O의 비동기 연산 같은 I/O 바운드 작업을 처리한다. 이 스케줄러는 필요한 만큼 증가하는 스레드-풀을 통해 실행된다; 일반적인 연산이 필요한 작업은 <code>Schedulers.computation(&#8239;)</code>를 사용하면 된다; 기본적으로 <code>Schedulers.io(&#8239)는 <code>CachedThreadScheduler</code>이며, <code>CachedThreadScheduler</code>는 스레드 캐싱을 사용하는 새로운 스레드 스케줄러라고 생각하면 된다</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#newThread()"><code>Schedulers.newThread(&#8239;)</code></a></td>
      <td>각각의 단위 작업을 위한 새로운 스레드를 생성한다</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#trampoline()"><code>Schedulers.trampoline(&#8239;)</code></a></td>
      <td>대기 중인 큐를 처리한 후에 현재 스레드에서 실행 할 작업 큐를 만든다</td></tr>
     </tbody>
    </table>
    <h2>RxGroovy Observable 연산자를 위한 기본 스케줄러</h2>
    <p>
     RxGroovy의 일부 Observable 연산자들은 자신이 처리할 연산(또는 최소한 연산의 일부)을 위해 사용할 스케줄러를 지정할 수 있는 기능을 제공한다. 그 외에는 특정 스케줄러 상에서 동작할 수 없거나 또는 특정 기본 스케줄러 상에서만 동작한다. 여기서 설명하는 기본 스케줄러는 아래와 같다:
    </p>
    <table class="table">
     <thead>
      <tr><th>연산자</th><th>스케줄러</th></tr>
     </thead>
     <tbody>
      <tr><td><a href="../operators/buffer.html"><code>buffer(timespan)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/buffer.html"><code>buffer(timespan,&#8239;count)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/buffer.html"><code>buffer(timespan,&#8239;timeshift)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/debounce.html"><code>debounce(timeout,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/delay.html"><code>delay(delay,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/delay.html"><code>delaySubscription(delay,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/interval.html"><code>interval</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/repeat.html"><code>repeat</code></a></td><td><code>trampoline</code></td></tr>
      <tr><td><a href="../operators/replay.html"><code>replay(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/replay.html"><code>replay(buffersize,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/replay.html"><code>replay(selector,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/replay.html"><code>replay(selector,&#8239;buffersize,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/retry.html"><code>retry</code></a></td><td><code>trampoline</code></td></tr>
      <tr><td><a href="../operators/sample.html"><code>sample(period,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/skip.html"><code>skip(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/skiplast.html"><code>skipLast(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/take.html"><code>take(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/takelast.html"><code>takeLast(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/takelast.html"><code>takeLast(count,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/takelast.html"><code>takeLastBuffer(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/takelast.html"><code>takeLastBuffer(count,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/sample.html"><code>throttleFirst</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/sample.html"><code>throttleLast</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/debounce.html"><code>throttleWithTimeout</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/timeinterval.html"><code>timeInterval</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="../operators/timeout.html"><code>timeout(timeoutSelector)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="../operators/timeout.html"><code>timeout(firstTimeoutSelector,&#8239;timeoutSelector)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="../operators/timeout.html"><code>timeout(timeoutSelector,&#8239;other)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="../operators/timeout.html"><code>timeout(timeout,&#8239;timeUnit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/timeout.html"><code>timeout(firstTimeoutSelector,&#8239;timeoutSelector,&#8239;other)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="../operators/timeout.html"><code>timeout(timeout,&#8239;timeUnit,&#8239;other)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/timer.html"><code>timer</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/timestamp.html"><code>timestamp</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="../operators/window.html"><code>window(timespan)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/window.html"><code>window(timespan,&#8239;count)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/window.html"><code>window(timespan,&#8239;timeshift)</code></a></td><td><code>computation</code></td></tr>
     </tbody>
    </table>
    <h2>테스트 스케줄러</h2>
    <p>
     이 <a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html">
     <code>TestScheduler</code></a>는 스케줄러의 시간에 따른 동작을 정교하게 제어할 수 있는 방법들을 제공하며, 원하는 시점에서 정확하게 동작해야 하는 상황을 테스트 할 때 유용하게 사용된다. 이 스케줄러는 세 개의 메서드를 제공한다:
    </p>
    <dl>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#advanceTimeTo(long,%20java.util.concurrent.TimeUnit)"><code>advanceTimeTo(time,unit)</code></a></dt>
      <dd>특정 시간대로 스케줄러의 시간을 앞당긴다</dd>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#advanceTimeBy(long,%20java.util.concurrent.TimeUnit)"><code>advanceTimeBy(time,unit)</code></a></dt>
      <dd>특정 시간만큼 스케줄러의 시간을 앞당긴다</dd>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#triggerActions()"><code>triggerActions( )</code></a></dt>
      <dd>스케줄러가 가리키는 시간보다 이전에 혹은 현재까지 예약된, 아직 실행되지 않은 동작들을 시작한다</dd>
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
     <a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html">
     <code>Schedulers</code></a> 클래스의 팩토리 메서드를 사용해서 스케쥴러를 생성한다. 아래의 테이블은 RxJava에서 제공하는 메서드와 사용 가능한 스케줄러들을 보여준다:
    </p>
    <table class="table">
     <thead>
      <tr><th>스케줄러</th><th>용도</th></tr>
     </thead>
     <tbody>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#computation()"><code>Schedulers.computation(&#8239;)</code></a></td>
      <td>
      이벤트-루프와 콜백 처리 같은 연산 중심적인 작업을 위해 사용된다; 그렇기 때문에 I/O를 위한 용도로는 사용하지 말아야 한다(대신 <code>Schedulers.io(&#8239;)</code>를 사용); 기본적으로 스레드의 수는 프로세서의 수와 같다</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#from(java.util.concurrent.Executor)"><code>Schedulers.from(executor)</code></a></td>
      <td>명시한 <code>Executor</code>를 스케줄러로 사용한다</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#immediate()"><code>Schedulers.immediate(&#8239;)</code></a></td>
      <td>현재 스레드에서 즉시 실행할 작업을 스케줄링 한다</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#io()"><code>Schedulers.io(&#8239;)</code></a></td>
      <td>블러킹 I/O의 비동기 연산 같은 I/O 바운드 작업을 처리한다. 이 스케줄러는 필요한 만큼 증가하는 스레드-풀을 통해 실행된다; 일반적인 연산이 필요한 작업은 <code>Schedulers.computation(&#8239;)</code>를 사용하면 된다; 기본적으로 <code>Schedulers.io(&#8239)이며 <code>CachedThreadScheduler</code>로, <code>CachedThreadScheduler</code>는 스레드 캐싱을 사용하는 새로운 스레드 스케줄러라고 생각하면 된다</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#newThread()"><code>Schedulers.newThread(&#8239;)</code></a></td>
      <td>각각의 단위 작업을 위한 새로운 스레드를 생성한다</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#trampoline()"><code>Schedulers.trampoline(&#8239;)</code></a></td>
      <td>대기 중인 큐를 처리한 후에 현재 스레드에서 실행 될 작업 큐를 만든다</td></tr>
     </tbody>
    </table>
    <h2>RxJava Observable 연산자를 위한 기본 스케줄러</h2>
    <p>
     RxJava의 일부 Observable 연산자들은 자신이 처리할 연산(또는 최소한 연산의 일부)을 위해 사용할 스케줄러를 지정하는 기능을 제공한다. 그 외에는 특정 스케줄러 상에서 동작할 수 없거나 또는 특정 기본 스케줄러 상에서만 동작한다. 여기서 설명하는 기본 스케줄러는 아래와 같다:
    </p>
    <table class="table">
     <thead>
      <tr><th>연산자</th><th>스케줄러</th></tr>
     </thead>
     <tbody>
      <tr><td><a href="../operators/buffer.html"><code>buffer(timespan)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/buffer.html"><code>buffer(timespan,&#8239;count)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/buffer.html"><code>buffer(timespan,&#8239;timeshift)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/debounce.html"><code>debounce(timeout,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/delay.html"><code>delay(delay,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/delay.html"><code>delaySubscription(delay,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/interval.html"><code>interval</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/repeat.html"><code>repeat</code></a></td><td><code>trampoline</code></td></tr>
      <tr><td><a href="../operators/replay.html"><code>replay(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/replay.html"><code>replay(buffersize,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/replay.html"><code>replay(selector,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/replay.html"><code>replay(selector,&#8239;buffersize,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/retry.html"><code>retry</code></a></td><td><code>trampoline</code></td></tr>
      <tr><td><a href="../operators/sample.html"><code>sample(period,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/skip.html"><code>skip(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/skiplast.html"><code>skipLast(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/take.html"><code>take(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/takelast.html"><code>takeLast(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/takelast.html"><code>takeLast(count,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/takelast.html"><code>takeLastBuffer(time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/takelast.html"><code>takeLastBuffer(count,&#8239;time,&#8239;unit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/sample.html"><code>throttleFirst</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/sample.html"><code>throttleLast</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/debounce.html"><code>throttleWithTimeout</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/timeinterval.html"><code>timeInterval</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="../operators/timeout.html"><code>timeout(timeoutSelector)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="../operators/timeout.html"><code>timeout(firstTimeoutSelector,&#8239;timeoutSelector)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="../operators/timeout.html"><code>timeout(timeoutSelector,&#8239;other)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="../operators/timeout.html"><code>timeout(timeout,&#8239;timeUnit)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/timeout.html"><code>timeout(firstTimeoutSelector,&#8239;timeoutSelector,&#8239;other)</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="../operators/timeout.html"><code>timeout(timeout,&#8239;timeUnit,&#8239;other)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/timer.html"><code>timer</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/timestamp.html"><code>timestamp</code></a></td><td><code>immediate</code></td></tr>
      <tr><td><a href="../operators/window.html"><code>window(timespan)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/window.html"><code>window(timespan,&#8239;count)</code></a></td><td><code>computation</code></td></tr>
      <tr><td><a href="../operators/window.html"><code>window(timespan,&#8239;timeshift)</code></a></td><td><code>computation</code></td></tr>
     </tbody>
    </table>
    <h2>스케줄러 사용</h2>
    <p>
     RxJava의 Observable 연산자에 스케줄러를 전달하는 점만 다를 뿐, 구독 시 여러분이 작성한 코드를 스케줄링 하기 위해서 이 스케줄러들을 그대로 사용할 수 있다. 아래의 예제 코드는 <code>newThread</code> 스케줄러 안에서 작업을 스케줄링 하기 위해 <a href="http://reactivex.io/RxJava/javadoc/rx/Scheduler.Worker.html"><code>Scheduler.Worker</code> 클래스</a>의 <a href="http://reactivex.io/RxJava/javadoc/rx/Scheduler.Worker.html#schedule(rx.functions.Action0)"><code>schedule</code> 메서드</a>를 사용한다:
    <div class="code java"><pre>
worker = Schedulers.newThread().createWorker();
worker.schedule(new Action0() {

    @Override
    public void call() {
        yourWork();
    }

});
// 그 후에...
worker.unsubscribe();</pre></div>
    <h3>재귀 스케줄러</h3>
    <p>
     재귀 호출 스케줄링은 <code>schedule</code>로 스케줄링 한 후에, 작업자 객체 안에서 <code>schedule(this)</code>를 호출한다:
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
// 그 후에...
worker.unsubscribe();</pre></div>
    <h3>구독 해지 상태 체크 또는 설정</h3>
    <p>
     <code>Worker</code> 클래스의 객체들은 <a href="http://reactivex.io/RxJava/javadoc/rx/Subscription.html"><code>Subscription</code> 인터페이스의 <a href="http://reactivex.io/RxJava/javadoc/rx/Subscription.html#isUnsubscribed()"><code>isUnsubscribed</code></a>와 <a href="http://reactivex.io/RxJava/javadoc/rx/Subscription.html#unsubscribe()"><code>unsubscribe</code></a>
     메서드를 구현하기 때문에, 구독이 취소 됐을 때 작업을 중지 할 수 있을 뿐만 아니라, 예약된 작업 내에서도 구독을 취소 할 수 있다:
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
     <code>Worker</code> 역시 하나의 <code>Subscription</code>이기 때문에(결과적으로 반드시) 작업을 중지시키고 리소스를 반환할 수 있도록 <code>unsubscribe</code> 메서드를 호출해야 한다:
    </p>
    <div class="code java"><pre>
worker.unsubscribe();</pre></div>
    <h3>지연 그리고 주기적 스케줄러</h3>
    <p>
     일정 시간이 경과할 때까지 주어진 스케줄러 상에서 지정한 동작을 지연시킬 수 있도록 <a href="http://reactivex.io/RxJava/javadoc/rx/Scheduler.Worker.html#schedule(rx.functions.Action0,%20long,%20java.util.concurrent.TimeUnit)">다른 형태의 <code>schedule</code></a> 메서드 사용도 가능하다. 아래 예제 코드는 스케줄러의 시간이 500ms 경과한 후에 <code>someScheduler</code>에서 <code>someAction</code>을 실행시키는 스케줄링 작업을 정의한다:
    </p>
    <div class="code java"><pre>
someScheduler.schedule(someAction, 500, TimeUnit.MILLISECONDS);</pre></div>
    <p>
     <a href="http://reactivex.io/RxJava/javadoc/rx/Scheduler.Worker.html#schedulePeriodically(rx.functions.Action0,%20long,%20long,%20java.util.concurrent.TimeUnit)">또 다른 <code>Scheduler</code> 메서드</a>는 특정 시간마다 지정된 동작을 실행하는 스케줄을 정의한다. 아래의 예제는 500ms가 경과한 후, 매 250ms 마다 <code>someScheduler</code>에서 <code>someAction</code>를 실행한다:
    </p>
    <div class="code java"><pre>
someScheduler.schedulePeriodically(someAction, 500, 250, TimeUnit.MILLISECONDS);</pre></div>
    <h2>테스트 스케줄러</h2>
    <p>
     이 <a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html">
     <code>TestScheduler</code></a>는 스케줄러의 시간에 따른 동작을 정교하게 제어할 수 있는 방법들을 제공하는데, 원하는 시점에 정확하게 동작해야 하는 상황을 테스트 할 때 유용하게 사용된다. 이 스케줄러는 세 개의 메서드를 제공한다:
    </p>
    <dl>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#advanceTimeTo(long,%20java.util.concurrent.TimeUnit)"><code>advanceTimeTo(time,unit)</code></a></dt>
      <dd>특정 시간대로 스케줄러의 시간을 앞당긴다</dd>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#advanceTimeBy(long,%20java.util.concurrent.TimeUnit)"><code>advanceTimeBy(time,unit)</code></a></dt>
      <dd>특정 시간만큼 스케줄러의 시간을 앞으로 당긴다</dd>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#triggerActions()"><code>triggerActions( )</code></a></dt>
      <dd>스케줄러가 가리키는 시간보다 이전에 혹은 현재까지 예약된, 아직 실행되지 않은 동작들을 시작한다</dd>
    </dl>
    <h4>참고</h4>
    <ul>
     <li><a href="http://www.grahamlea.com/2014/07/rxjava-threading-examples/"><cite>RxJava Threading Examples</cite></a> by Graham Lea</li>
     <li><a href="https://speakerdeck.com/benjchristensen/applying-rxjava-to-existing-applications-at-philly-ete-2015">Testing Reactive Applications</a> by Ben Christensen</li> 
     <li>Advanced RxJava: Schedulers (<a href="http://akarnokd.blogspot.hu/2015/05/schedulers-part-1.html">part 1</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-2.html">part 2</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-3.html">part 3</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-4-final.html">part 4</a>) by Dávid Karnok</li>
    </ul>
  {% endlang_operator %}

  {% lang_operator RxJS %}
    <p>
     RxJS에서는 <code>Rx.Scheduler</code> 또는 독립적으로 구현한 객체를 통해 스케줄러를 생성한다. 아래의 테이블은 RxJS에서 사용 가능한 스케줄러들을 보여준다:
    </p>
    <table class="table">
     <thead>
      <tr><th>스케줄러</th><th>용도</th></tr>
     </thead>
     <tbody>
      <tr><td><code>Rx.Scheduler.currentThread</code></td>
      <td>현재 스레드에서 가능한 빠르게 작업을 스케줄링 한다</td></tr>
      <tr><td><code>Rx.HistoricalScheduler</code></td>
      <td>과거의 특정 시점을 지정해서 마치 지정된 과거에서부터 실행되고 있었던 것처럼 작업을 스케줄링 한다</td></tr>
      <tr><td><code>Rx.Scheduler.immediate</code></td>
      <td>현재 스레드에서 작업을 즉시 스케줄링 한다</td></tr>
      <tr><td><code>Rx.TestScheduler</code></td>
      <td>단위 테스트를 위해 사용되며, 시간의 흐름을 조절할 수 있다</td></tr>
      <tr><td><code>Rx.Scheduler.timeout</code></td>
      <td>지정된 콜백을 사용해서 작업을 스케줄링 한다</td></tr>
     </tbody>
    </table>
    <h4>참고</h4>
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
