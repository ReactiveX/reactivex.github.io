---
layout: documentation
title: ReactiveX - Observable
lang: cn
id: observable
---

<h1>事件源（Observable）</h1>
<p>
 在ReactiveX中，<dfn>观察者（observer）</dfn><dfn>订阅（subscribes）</dfn>了一个<dfn>事件源（Observable）</dfn>。 然后，该观察者对事件源<dfn>发出（emit）</dfn>的任何事件或事件序列作出响应。 这种模式有利于并发操作，因为它不需要阻塞的等待事件源发出事件，而是以观察者的形式创建一个哨兵，随时准备在事件源发出事件的时候做出相应的响应。
</p><p>
 此页面解释了反应模式是什么以及事件源和观察者是什么（以及观察者如何订阅事件源）。 其他页面显示了如何使用 <a href="operators.html">各种事件源的操作指令</a> 将事件源链接在一起并更改其行为。
</p>
<figure>
 <figcaption><p>本文档附有”弹珠图“（marble diagrams）进行说明。 下图是弹珠图如何表示事件源和转换事件源：</p></figcaption>
 <img src="{{ site.url }}/assets/operators/legend.png" style="width:100%;" />
</figure>
<h4>参考</h4>
<ul>
 <li><a href="../single.html"><tt>Single</tt></a> &mdash; a specialized version of an Observable that emits only a single item</li>
 <li><a href="http://channel9.msdn.com/Series/Rx-Workshop/Introduction"><cite>Rx Workshop</cite>: Introduction</a></li>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#IObservable"><cite>Introduction to Rx</cite>: IObservable</a></li>
 <li><a href="http://docs.couchbase.com/developer/java-2.0/observables.html"><cite>Mastering observables</cite></a> (from the Couchbase Server documentation)</li>
 <li><a href="https://medium.com/@andrestaltz/2-minute-introduction-to-rx-24c8ca793877"><cite>2 minute introduction to Rx</cite></a> by Andre Staltz (&ldquo;Think of an Observable as an asynchronous immutable array.&rdquo;)</li>
 <li><a href="https://egghead.io/lessons/javascript-introducing-the-observable">Introducing the Observable</a> by Jafar Husain (JavaScript Video Tutorial)</li>
 <li><a href="http://xgrommx.github.io/rx-book/content/observable/index.html">Observable object</a> (RxJS) by Dennis Stoyanov</li>
 <li><a href="https://afterecho.uk/blog/turning-a-callback-into-an-rx-observable.html">Turning a callback into an Rx Observable</a> by @afterecho</li>
</ul>
<h1>背景</h1>
<p>
 在许多软件编程任务中，开发人员或多或少希望编写的指令是按照编写的顺序逐个执行并逐步完成。但是在ReactiveX中，许多指令可以并行执行，其结果紧接着按随机顺序由“观察者”处理。以事件源的形式定义一个校验和转换数据的机制， 然后观察者去<em>订阅</em>它， 当事件源按先前定义得机制行动并发出事件时观察者捕获并相应，而不是通过<em>调用</em>方法。
</p><p>
 这种方式的优点是，当有一堆不依赖于彼此的任务时，可以同时执行所有任务，而不是等到每个任务完成后再执行下一个。 这样整个捆绑任务的完成时间只需要与捆绑中最长的任务一样长。
</p><p>
 这里有许多术语用于描述这种异步编程和设计模型。 本文将使用下列术语：一个<dfn>观察者（observer）</dfn><dfn>订阅（subscribes）</dfn>了一个<dfn>事件源（Observable）</dfn>。 一个事件源<dfn>发出（emits）</dfn> <dfn>事件（items）</dfn>或<dfn>通知（notifications）</dfn>它的观察者通过调用观察者的方法。
</p><p>
 在其他文档或内容下, “观察者（observer）”也叫做“订阅者（subscriber）”、“监视器（watcher）”或“反应器（reactor）” 这种模型通常被称为<a href="https://zh.wikipedia.org/wiki/%E5%8F%8D%E5%BA%94%E5%99%A8%E6%A8%A1%E5%BC%8F">“反应器模式（reactor pattern）”</a>。
</p>
<h1>创建观察者（observer）</h1>
<p>
 此页面使用类Groovy的伪代码作为示例，但是在许多语言中都有ReactiveX实现。
</p><p>
 在一个普通的方法调用流程如下，而在ReactiveX通常上是异步和并行调用方法:
</p><ol>
 <li>调用一个方法。</li>
 <li>将该方法的返回值存储在变量中。</li>
 <li>使用该变量及它的值来做一些有用的事情。</li>
</ol>
<p>
 伪代码如下所示：
</p>
<div class="code groovy"><pre>
// 进行调用，将其返回值赋给`returnVal`
returnVal = someMethod(itsParameters);
// 用returnVal做一些有用的事情</pre></div>
<p>
 在异步模型中流程如下：
</p><ol>
 <li>定义一个方法，该方法对异步调用的返回值执行一些有用的操作; 这种方法是<i>观察者</i>的一部分。</li>
 <li>将异步调用本身定义为<i>事件源</i>。</li>
 <li>通过<i>订阅</i>关联观察者和事件源（同时也调用了事件源的动作）。</li>
 <li>继续执行必要的代码，当调用返回时，调用观察者的方法对其返回值（事件源发出的事件）进行操作。</li>
</ol>
<p>
 伪代码如下所示：
</p>
<div class="code groovy"><pre>
// 定义但是不执行onNext方法
// （在这个例子种, 观察者非常简单并且只有一个onNext方法）
def myOnNext = { it -> do something useful with it };
// 定义但是不执行事件源
def myObservable = someObservable(itsParameters);
// 观察者订阅事件源，并运行事件源
myObservable.subscribe(myOnNext);
// 继续执行必要的代码</pre></div>
<h2>onNext, onCompleted和onError</h2>
<p>
 通过<a href="operators/subscribe.html"><code>subscribe</code>方法</a>关联观察者和事件源。一个观察者应该实现以下方法的某个自集：
</p>
<dl>
 <dt><code>onNext</code></dt>
  <dd>当事件源发出事件，就会调用观察者这个方法。 此方法将事件源发出的事件作为参数。</dd>
 <dt><code>onError</code></dt>
  <dd>当事件源未能生成预期数据或遇到其他一些错误将调用这个方法。这意味这不会再调用<code>onNext</code>或<code>onCompleted</code>。此方法将事件源抛出的错误为参数</dd>
 <dt><code>onCompleted</code></dt>
  <dd>如果事件源一直调用<code>onNext</code>没有发生任何错误，则在调用最后一次之后调用此方法。</dd>
</dl>
<p>
 根据<a href="contract.html">事件源合约（the Observable contract）</a>中的条款, 事件源可以调用<code>onNext</code>零次或多次，然后可以随后调用<code>onCompleted</code>或<code>onError</code> 其中一个， 这将是它的最后一次调用。 按照合约, 在本文档中，调用<code>onNext</code> 通常称为事件的&ldquo;发出（emissions）&rdquo;，而调用<code>onCompleted</code>或<code>onError</code>称为&ldquo;通知（notifications）&rdquo;。
</p><p>
 更完整的<code>subscribe</code>调用如下所示：
</p>
<div class="code groovy"><pre>
def myOnNext     = { item -> /* 对事件进行处理 */ };
def myError      = { throwable -> /* 对失败的调用作出合理的处理 */ };
def myComplete   = { /* 在最终进行清理工作 */ };
def myObservable = someMethod(itsParameters);
myObservable.subscribe(myOnNext, myError, myComplete);
// 继续执行必要的代码</pre></div>
<h4>参考</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#IObserver"><cite>Introduction to Rx</cite>: IObserver</a></li>
</ul>
<h2>退订（Unsubscribing）</h2>
<p>
 在一些ReactiveX实现中，有一个专门的观察​​者接口<code>Subscriber</code>，它实现了一个<code>unsubscribe</code>方法。可以调用此方法来让观察者取消订阅。然后事件源可以（如果他们没有其他感兴趣的观察者）选择停止生成要发出的新事件。
</p><p>
 此取消订阅的结果将通过适用于观察者订阅的事件源的链运算，这将导致链中的每个链接停止发出事件。然而，这并不能保证立即发生，即使在没有观察者处理这些发出之后，事件源也有可能产生并尝试发出事件一段时间。
</p>
<h2>命名约定的注意事项</h2>
<p>
 ReactiveX的每种语言特定实现都有自己的命名怪癖。虽然实现之间存在许多共性，但没有规范的命名标准。
</p><p>
 此外，这些名称中的一些在其他情境中具有不同的含义，或者在特定实现语言的常用用语中看起来很尴尬。
</p><p>
 例如存在命名模式<code>on<i>Event</i></code>(例如<code>onNext</code>,
 <code>onCompleted</code>, <code>onError</code>). 在某些上下文中，这样的名称将表示<em>注册</em>了哪个事件处理的方法。但是在ReactiveX指的是事件处理方法本身。
</p>
<h1>&ldquo;热（Hot）&rdquo;和&ldquo;冷（Cold）&rdquo;事件源</h1>
<p>
 事件源何时开始发出其事件序列？这取决于事件源。 &ldquo;热&rdquo;事件源可以在创建后立即开始发出事件，因此任何后来订阅该事件源的观察者都可以开始在中间某处观察事件序列。 &ldquo;冷&rdquo;事件源需要观察者在开始发出事件之前订阅它，因此这样的观察者保证从一开始就看到整个事件序列。
</p><p>
 在ReactiveX的一些实现中，还存在称为“可连接（Connectable）”事件源的东西。这样的事件源在调用<a href="operators/connect.html"><span class="operator">Connect</span></a>方法之前不会开始发出事件，无论是否有任何观察者都订阅了它。
</p>
<h1>事件源操作符（operator）组合</h1>
<p>
 事件源和观察者只是ReactiveX的开始。它们本身只不过是标准观察者模式的轻微扩展，更适合处理一系列事件而不是简单的回调。
</p><p>
 真正的威力在于“反应性扩展（reactive extensions）” （书面称为“ReactiveX”）——能通过操作符来转换，组合，操作和处理事件源发出的事件序列。
</p><p>
 这些Rx操作符提供了一种基于回调提供的效率优势以声明方式构造连续异步调用的方法。重要的是它们消除了通常异步系统中嵌套回调处理程序的缺点。
</p><p>
 本文档提供<a href="operators.html#alphabetical">各种操作符</a>的信息及其用法示例在以下页面：
</p><dl>
 <dt><a href="operators.html#creating">Creating Observables</a></dt>
  <dd><code>Create</code>, <code>Defer</code>, <code>Empty</code>/<code>Never</code>/<code>Throw</code>,
      <code>From</code>, <code>Interval</code>, <code>Just</code>, <code>Range</code>, <code>Repeat</code>,
      <code>Start</code>, and <code>Timer</code></dd>
 <dt><a href="operators.html#transforming">Transforming Observable Items</a></dt>
  <dd><code>Buffer</code>, <code>FlatMap</code>, <code>GroupBy</code>, <code>Map</code>, <code>Scan</code>, and
      <code>Window</code></dd>
 <dt><a href="operators.html#filtering">Filtering Observables</a></dt>
  <dd><code>Debounce</code>, <code>Distinct</code>, <code>ElementAt</code>, <code>Filter</code>,
      <code>First</code>, <code>IgnoreElements</code>, <code>Last</code>, <code>Sample</code>,
      <code>Skip</code>, <code>SkipLast</code>, <code>Take</code>, and <code>TakeLast</code></dd>
 <dt><a href="operators.html#combining">Combining Observables</a></dt>
  <dd><code>And</code>/<code>Then</code>/<code>When</code>, <code>CombineLatest</code>, <code>Join</code>,
      <code>Merge</code>, <code>StartWith</code>, <code>Switch</code>, and <code>Zip</code></dd>
 <dt><a href="operators.html#error">Error Handling Operators</a></dt>
  <dd><code>Catch</code> and <code>Retry</code></dd>
 <dt><a href="operators.html#utility">Utility Operators</a></dt>
  <dd><code>Delay</code>, <code>Do</code>, <code>Materialize</code>/<code>Dematerialize</code>,
      <code>ObserveOn</code>, <code>Serialize</code>, <code>Subscribe</code>, <code>SubscribeOn</code>,
      <code>TimeInterval</code>, <code>Timeout</code>, <code>Timestamp</code>, and <code>Using</code></dd>
 <dt><a href="operators.html#conditional">Conditional and Boolean Operators</a></dt>
  <dd><code>All</code>, <code>Amb</code>, <code>Contains</code>, <code>DefaultIfEmpty</code>,
      <code>SequenceEqual</code>, <code>SkipUntil</code>, <code>SkipWhile</code>, <code>TakeUntil</code>,
      and <code>TakeWhile</code></dd>
 <dt><a href="operators.html#mathematical">Mathematical and Aggregate Operators</a></dt>
  <dd><code>Average</code>, <code>Concat</code>, <code>Count</code>, <code>Max</code>, <code>Min</code>,
      <code>Reduce</code>, and <code>Sum</code></dd>
 <dt><a href="operators.html#conversion">Converting Observables</a></dt>
  <dd><code>To</code></dd>
 <dt><a href="operators.html#connectable">Connectable Observable Operators</a></dt>
  <dd><code>Connect</code>, <code>Publish</code>, <code>RefCount</code>, and <code>Replay</code></dd>
 <dt><a href="operators/backpressure.html">Backpressure Operators</a></dt>
  <dd>a variety of operators that enforce particular flow-control policies</dd>
</dl>
<p>
 这些页面包含有关某些操作符的信息，这些操作符不属于ReactiveX的核心，而是在一个或多个特定于语言的实现和/或可选模块中实现。
</p>
<h2>链接操作符</h2>
<p>
 大多数操作符都在事件源上操作并返回一个事件源。这使我们可以在链中一个接一个地应用这些运算符。链中的每个操作符都会处理由前一个操作符的操作产生的事件源。
</p><p>
 区别其他模式，如Builder模式，该模式使用特定类的各种方法通过方法的操作修改该对象，对同一类的项进行操作。这些模式允许以类似的方式链接方法。但是在Builder模式中，方法在链中出现的顺序通常并不重要，事件源的操作符<em>顺序很重要</em>。
</p><p>
 一条链上的操作符不是单独的在原始的事件源上操作的，是依次在调用链被调用，每个操作符操作的事件源都由前一个操作符生成。
</p>
