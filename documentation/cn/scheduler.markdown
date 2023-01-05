---
layout: documentation
title: ReactiveX - Scheduler
lang: cn
id: scheduler
---

<h1>调度器（Scheduler）</h1>
<p>
 如果要在事件源符的级联中引入多线程，可以通过指定这些操作符（或特定的事件源）在特定的<dfn>调度器</dfn>上运行来实现。
</p><p>
 一些ReactiveX事件源操作符具有将调度器作为参数的变体。 这些表示操作符在特定的调度器上完成部分或全部工作。
</p>
<figure>
 <figcaption><p>
  默认情况下，事件源和应用于它的操作符链将在同一线程上完成其工作，并将在调用其<code>订阅</code>方法通知其观察者。 <span class="operator">SubscribeOn</span>操作符指定不同的调度器来改变事件源上应操作的行为。<span class="operator">ObserveOn</span>操作符指定不同的调度器用来处理事件源要发给观察者的通知。
 </p><p>
  如图所示，<span class="operator">SubscribeOn</span>操作符指明了事件源开始操作的线程，无论操作符在链上的哪个位置被调用。在另一方面<span class="operator">ObserveOn</span>是影响事件源将在该操作符出现的位置下方使用的线程。因此，可以调用<span class="operator">ObserveOn</span> 多次在事件源操作符链上的不同位置为了改变某些操作符运行的线程。
 </p></figcaption>
 <img src="operators/images/schedulers.png" style="width:100%;" alt="ObserveOn and SubscribeOn" />
</figure>

<h4>参考</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/15_SchedulingAndThreading.html"><cite>Introduction to Rx</cite>: Scheduling and Threading</a></li>
 <li><a href="https://learn.microsoft.com/en-us/shows/rx-workshop/schedulers"><cite>Rx Workshop</cite>: Schedulers</a></li>
 <li><a href="http://xgrommx.github.io/rx-book/content/getting_started_with_rxjs/scheduling_and_concurrency.html">Using Schedulers</a> by Dennis Stoyanov</li>
</ul>

<h2>Language-Specific Information:</h2>
<div class="panel-group operators-by-language" id="accordion" role="tablist" aria-multiselectable="true">

  {% lang_operator RxClojure %}
    <p>
     <span style="color:#f00">待定</span>
    </p>
  {% endlang_operator %}

  {% lang_operator RxCpp %}
    <p>
     <span style="color:#f00">待定</span>
    </p>
  {% endlang_operator %}

  {% lang_operator RxGroovy %}
    <h2>调度器的种类</h2>
    <p>
     可以从<a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html"><code>Schedulers</code>类</a>的描述中的工厂方法获得调度器。下表显示了RxGroovy中通过这些方法可用的调度器的种类：
    </p>
    <table class="table">
     <thead>
      <tr><th>调度器</th><th>作用</th></tr>
     </thead>
     <tbody>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#computation()"><code>Schedulers.computation(&#8239;)</code></a></td><td>用于计算工作，如事件循环和回调处理；不能在I/O工作使用此调度器（用<code>Schedulers.io(&#8239;)</code>代替）； 默认情况下，线程数等于处理器数</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#from(java.util.concurrent.Executor)"><code>Schedulers.from(executor)</code></a></td><td>使用指定的<code>Executor</code>作为一个调度器</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#immediate()"><code>Schedulers.immediate(&#8239;)</code></a></td><td>调度工作立即在当前线程中运行</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#io()"><code>Schedulers.io(&#8239;)</code></a></td><td>用于I/O密集型工作如异步执行阻塞I/O，此调度程序由一个将根据需要增长的线程池支持；用于普通的计算工作转为<code>Schedulers.computation(&#8239;)</code>；<code>Schedulers.io(&#8239)</code> 默认情况下是<code>CachedThreadScheduler</code>， 它是类似于带有线程缓存的新线程调度器</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#newThread()"><code>Schedulers.newThread(&#8239;)</code></a></td><td>为每个工作单元创建一个新线程</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#trampoline()"><code>Schedulers.trampoline(&#8239;)</code></a></td><td>队列工作在其他已经排队的工作之后在当前线程上运行</td></tr>
     </tbody>
    </table>
    <h2>RxGroovy事件源操作符的默认调度器</h2>
    <p>
    RxGroovy中的一些事件源操作符具有变体，允许设置操作符用于（至少某些部分）其操作的调度器。其他不在任何特定的调度器上运行，或在指定的默认调度器上运行。具有特定默认调度器的那些包括：
    </p>
    <table class="table">
     <thead>
      <tr><th>操作符</th><th>调度器</th></tr>
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
    <h2>测试调度器</h2>
    <p>
     <a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html"><code>TestScheduler</code></a>允许对调度器的时钟行为进行手动微调。这对于测试依赖于明确的时间安排的动作是非常有用的。此调度器还有三种方法：
    </p>
    <dl>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#advanceTimeTo(long,%20java.util.concurrent.TimeUnit)"><code>advanceTimeTo(time,unit)</code></a></dt>
      <dd>将调度器的时钟修改到特定时间点</dd>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#advanceTimeBy(long,%20java.util.concurrent.TimeUnit)"><code>advanceTimeBy(time,unit)</code></a></dt>
      <dd>将调度器的时钟向前推进一段特定的时间</dd>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#triggerActions()"><code>triggerActions( )</code></a></dt>
      <dd>根据调度器的时钟启动任何已安排的时间等于或早于当前时间的未启动操作</dd>
    </dl>
    <h4>参考</h4>
    <ul>
     <li><a href="https://speakerdeck.com/benjchristensen/applying-rxjava-to-existing-applications-at-philly-ete-2015">Testing Reactive Applications</a> by Ben Christensen</li>
     <li><a href="http://www.grahamlea.com/2014/07/rxjava-threading-examples/"><cite>RxJava Threading Examples</cite></a> by Graham Lea</li>
     <li>Advanced RxJava: Schedulers (<a href="http://akarnokd.blogspot.hu/2015/05/schedulers-part-1.html">part 1</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-2.html">part 2</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-3.html">part 3</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-4-final.html">part 4</a>) by Dávid Karnok</li>
    </ul>
  {% endlang_operator %}

  {% lang_operator RxJava&nbsp;1․x %}
    <h2>调度器的种类</h2>
    <p>
     可以从<a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html"><code>Schedulers</code>类</a>的描述中的工厂方法获得调度器。下表显示了RxJava中通过这些方法可用的调度器的种类：
    </p>
    <table class="table">
     <thead>
      <tr><th>调度器</th><th>作用</th></tr>
     </thead>
     <tbody>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#computation()"><code>Schedulers.computation(&#8239;)</code></a></td><td>用于计算工作，如事件循环和回调处理；不能在I/O工作使用此调度器（用<code>Schedulers.io(&#8239;)</code>代替）； 默认情况下，线程数等于处理器数</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#from(java.util.concurrent.Executor)"><code>Schedulers.from(executor)</code></a></td><td>使用指定的<code>Executor</code>作为一个调度器</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#immediate()"><code>Schedulers.immediate(&#8239;)</code></a></td><td>调度工作立即在当前线程中运行</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#io()"><code>Schedulers.io(&#8239;)</code></a></td><td>用于I/O密集型工作如异步执行阻塞I/O，此调度程序由一个将根据需要增长的线程池支持；用于普通的计算工作转为<code>Schedulers.computation(&#8239;)</code>；<code>Schedulers.io(&#8239)</code> 默认情况下是<code>CachedThreadScheduler</code>， 它是类似于带有线程缓存的新线程调度器</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#newThread()"><code>Schedulers.newThread(&#8239;)</code></a></td><td>为每个工作单元创建一个新线程</td></tr>
      <tr><td><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/Schedulers.html#trampoline()"><code>Schedulers.trampoline(&#8239;)</code></a></td><td>队列工作在其他已经排队的工作之后在当前线程上运行</td></tr>
     </tbody>
    </table>
    <h2>RxJava 1.x事件源操作符的默认调度器</h2>
    <p>
    RxJava 1.x中的一些事件源操作符具有变体，允许设置操作符用于（至少某些部分）其操作的调度器。其他不在任何特定的调度器上运行，或在指定的默认调度器上运行。具有特定默认调度器的那些包括：
    </p>
    <table class="table">
     <thead>
      <tr><th>操作符</th><th>调度器</th></tr>
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
    <h2>使用调度器</h2>
    <p>
     不仅可以将这些调度器传递给RxJava事件源操作符，还可以使用它们来安排自己的订阅工作。以下示例使用<a href="http://reactivex.io/RxJava/javadoc/rx/Scheduler.Worker.html"><code>Scheduler.Worker</code>类</a>的<a href="http://reactivex.io/RxJava/javadoc/rx/Scheduler.Worker.html#schedule(rx.functions.Action0)"><code>调度</code>方法</a>让其运行在<code>newThread</code>的调度器上：
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
    <h3>递归调度器</h3>
    <p>
     在Worker对象使用<code>schedule</code>然后使用<code>schedule(this)</code>递归的调用调度：
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
    <h3>检查或设置取消订阅状态</h3>
    <p>
     <code>Worker</code>对象的类实现了<a href="http://reactivex.io/RxJava/javadoc/rx/Subscription.html"><code>Subscription</code>接口</a>， 使用<a href="http://reactivex.io/RxJava/javadoc/rx/Subscription.html#isUnsubscribed()"><code>isUnsubscribed</code></a>和<a href="http://reactivex.io/RxJava/javadoc/rx/Subscription.html#unsubscribe()"><code>unsubscribe</code></a>
     方法， 可以在被订阅后停止运行或者从调度任务中取消订阅：
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
     当<code>Worker</code>已经变成<code>Subscription</code>，就可以（并应该、最终）调用它的<code>unsubscribe</code>方法来表示它可以停止工作并释放资源：
    </p>
    <div class="code java"><pre>
worker.unsubscribe();</pre></div>
    <h3>延迟和定期调度器</h3>
    <p>
     可以延迟对给定计划程序的操作，直到超过某个时间跨度通过使用<a href="http://reactivex.io/RxJava/javadoc/rx/Scheduler.Worker.html#schedule(rx.functions.Action0,%20long,%20java.util.concurrent.TimeUnit)"><code>schedule</code>一个实现</a>。以下示例调度<code>someAction</code>在
     <code>someScheduler</code>调度器的时钟经过500ms后运行:
    </p>
    <div class="code java"><pre>
someScheduler.schedule(someAction, 500, TimeUnit.MILLISECONDS);</pre></div>
    <p>
     <a href="http://reactivex.io/RxJava/javadoc/rx/Scheduler.Worker.html#schedulePeriodically(rx.functions.Action0,%20long,%20long,%20java.util.concurrent.TimeUnit)">另一种<code>Scheduler</code>方法</a>允许安排定期执行操作。以下示例调度<code>someAction</code>在<code>someScheduler</code>调度器时钟经过500ms后运行，然后每隔250ms也都运行：
    </p>
    <div class="code java"><pre>
someScheduler.schedulePeriodically(someAction, 500, 250, TimeUnit.MILLISECONDS);</pre></div>
    <h2>测试调度器</h2>
    <p>
     <a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html"><code>TestScheduler</code></a>允许对调度器的时钟行为进行手动微调。这对于测试依赖于明确的时间安排的动作是非常有用的。此调度器还有三种方法：
    </p>
    <dl>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#advanceTimeTo(long,%20java.util.concurrent.TimeUnit)"><code>advanceTimeTo(time,unit)</code></a></dt>
      <dd>将调度器的时钟修改到特定时间点</dd>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#advanceTimeBy(long,%20java.util.concurrent.TimeUnit)"><code>advanceTimeBy(time,unit)</code></a></dt>
      <dd>将调度器的时钟向前推进一段特定的时间</dd>
     <dt><a href="http://reactivex.io/RxJava/javadoc/rx/schedulers/TestScheduler.html#triggerActions()"><code>triggerActions( )</code></a></dt>
      <dd>根据调度器的时钟启动任何已安排的时间等于或早于当前时间的未启动操作</dd>
    </dl>
    <h4>参考</h4>
    <ul>
     <li><a href="http://www.grahamlea.com/2014/07/rxjava-threading-examples/"><cite>RxJava Threading Examples</cite></a> by Graham Lea</li>
     <li><a href="https://speakerdeck.com/benjchristensen/applying-rxjava-to-existing-applications-at-philly-ete-2015">Testing Reactive Applications</a> by Ben Christensen</li> 
     <li>Advanced RxJava: Schedulers (<a href="http://akarnokd.blogspot.hu/2015/05/schedulers-part-1.html">part 1</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-2.html">part 2</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-3.html">part 3</a>) (<a href="http://akarnokd.blogspot.hu/2015/06/schedulers-part-4-final.html">part 4</a>) by Dávid Karnok</li>
    </ul>
  {% endlang_operator %}

  {% lang_operator RxJS %}
    <p>
     在RxJS可以从<code>Rx.Scheduler</code>对象或独立实现的对象获取调度器，下表显示了RxJS中可用的各种调度器：
    </p>
    <table class="table">
     <thead>
      <tr><th>调度器</th><th>作用</th></tr>
     </thead>
     <tbody>
      <tr><td><code>Rx.Scheduler.currentThread</code></td><td>调度工作立即在当前线程中运行</td></tr>
      <tr><td><code>Rx.HistoricalScheduler</code></td><td>调度工作就像在指定的之前时间发生一样</td></tr>
      <tr><td><code>Rx.Scheduler.immediate</code></td><td>调度工作立即在当前线程中运行</td></tr>
      <tr><td><code>Rx.TestScheduler</code></td><td>用于单元测试；允许手动操纵时间移动</td></tr>
      <tr><td><code>Rx.Scheduler.timeout</code></td><td>调度工作通过定时器回调</td></tr>
     </tbody>
    </table>
    <h4>参考</h4>
    <ul>
     <li><a href="http://stackoverflow.com/questions/28145890/what-is-a-scheduler-in-rxjs"><cite>StackOverflow</cite>: What is a &ldquo;Scheduler&rdquo; in RxJS</a></li>
     <li><a href="http://xgrommx.github.io/rx-book/content/schedulers/index.html">Schedulers</a> by Dennis Stoyanov</a></li>
     <li><a href="http://www.grahamlea.com/2014/07/rxjava-threading-examples/">RxJava Threading Examlpes</a> by Graham Lea</li>
    </ul>
  {% endlang_operator %}

  {% lang_operator RxKotlin %}
    <p>
     <span style="color:#f00">待定</span>
    </p>
  {% endlang_operator %}

  {% lang_operator Rx.NET %}
    <p>
     <span style="color:#f00">待定</span>
    </p>
  {% endlang_operator %}

  {% lang_operator RxPY %}
    <p>
     <span style="color:#f00">待定</span>
    </p>
  {% endlang_operator %}

  {% lang_operator Rx.rb %}
    <p>
     <span style="color:#f00">待定</span>
    </p>
  {% endlang_operator %}

  {% lang_operator RxScala %}
    <p>
     <span style="color:#f00">待定</span>
    </p>
  {% endlang_operator %}

</div>
