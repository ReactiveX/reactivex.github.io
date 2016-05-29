---
layout: documentation
title: ReactiveX - Observable
id: observable
---

<h1>Observable</h1>
<p>
 ReactiveX에서 <dfn>옵저버</dfn>는 <dfn>Observable</dfn>을 <dfn>구독한다</dfn>. 그 다음 옵저버는 Obseravable이 <dfn>내보내는</dfn> 항목 또는 연속된 항목에 반응한다. 
 이러한 패턴은 동시적 연산을 가능하게 하는데, 그 이유는 옵저버는 더 이상 Observable이 객체를 내보낼 때까지 더 이상 기다리지 않고 어떤 객체가 Observable에 의해 배출될 때마다 그에 적절히 대응할 수 있도록 생성 시점을 감시하는 관찰자를 옵저버 안에 만들어 놓기 때문이다.
</p>
<p>
 여기에서는 리액티브 패턴이 무엇이고 Observable과 옵저버가 무엇인지(그리고 어떻게 옵저버가 observable을 구독하는지)를 설명한다.
 그 이후에는  <a href="operators.html">다양한 Observable의 연산자들</a>을 어떻게 Obseravable에 연결 시키는지 또, 어떻게 Observable의 행동을 변경 시킬 수 있는지를 설명한다.
</p>
<figure>
 <figcaption>
  <p>이 문서에서는 &ldquo;마블 다이어그램&rdquo;을 활용해서 필요한 내용을 설명하는데, 아래는 어떻게 마블 다이어그램이 Observable과 Observable의 전환을 표현하는지 예제로 보여주고 있다.</p>
 </figcaption>
 <img src="{{ site.url }}/assets/operators/legend.png" style="width:100%;" />
</figure>
<h4>참고</h4>
<ul>
 <li><a href="single.html"><tt>Single</tt></a> &mdash; a specialized version of an Observable that emits only a single item</li>
 <li><a href="http://channel9.msdn.com/Series/Rx-Workshop/Rx-Workshop-Introduction"><cite>Rx Workshop</cite>: Introduction</a></li>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#IObservable"><cite>Introduction to Rx</cite>: IObservable</a></li>
 <li><a href="http://docs.couchbase.com/developer/java-2.0/observables.html"><cite>Mastering observables</cite></a> (from the Couchbase Server documentation)</li>
 <li><a href="https://medium.com/@andrestaltz/2-minute-introduction-to-rx-24c8ca793877"><cite>2 minute introduction to Rx</cite></a> by Andre Staltz (&ldquo;Think of an Observable as an asynchronous immutable array.&rdquo;)</li>
 <li><a href="https://egghead.io/lessons/javascript-introducing-the-observable">Introducing the Observable</a> by Jafar Husain (JavaScript Video Tutorial)</li>
 <li><a href="http://xgrommx.github.io/rx-book/content/observable/index.html">Observable object</a> (RxJS) by Dennis Stoyanov</li>
 <li><a href="https://afterecho.uk/blog/turning-a-callback-into-an-rx-observable.html">Turning a callback into an Rx Observable</a> by @afterecho</li>
</ul>
<h1>배경</h1>
<p>
 상당히 많은 코드들을 통해 알 수 있는 것이, 대부분의 개발자들은 자신이 작성한 코드가 점진적으로, 한번에 하나씩, 작성된 순서에 따라 실행되고 완료 되기를 기대한다.
 하지만, ReactiveX에서 대부분의 코드들은 "옵저버"에 의해 병렬로 실행되고 임의의 순서에 따라 결과는 나중에 연산된다. 즉, 메서드를 <em>호출한다기 보단</em>, "observable" 안에서 데이터를 조회하고 변환하는 메커니즘을 정의한 후에 
 이벤트가 발생하면 옵저버의 관찰자가 그 순간을 감지하고 준비된 연산을 처리한 다음 결과를 리턴하도록 observable을 구독한다고 표현하는 것이 올바르다.
</p>
<p>
 이런 접근 방법을 사용할 경우, 서로 의존 적이지 않은 많은 코드들을 실행할 때 하나의 코드 블럭이 실행을 마치고 결과를 리턴할 때까지 기다리지 않아도 다음 코드 블럭을 실행할 수 있기 때문에 많은 코드들을 한번에 실행 실행 시킬 수 있으며 &mdash;
 결과적으로 전체 실행 시간은 여러 코드 블럭 중 가장 실행 시간이 킨 시간 만큼 밖에 걸리지 않는다.
</p>
<p>
 비동기 프로그래밍과 설계 모델을 설명하기 위해 많은 용어들이 상요되고 있지만, 이 문서에서는 다음의 용어들을 사용할 것이다: <dfn>옵저버</dfn>는 <dfn>Observable</dfn>을 <dfn>구독한다</dfn>.
 Observable은 <dfn>항목들</dfn>을 <dfn>내보내거나</dfn> observable의 메서드 호출을 통해 옵저버에게 <dfn>알림</dfn>을 보낸다.
</p>
<p>
 많은 문서나 다른 문맥에서 우리가 "옵저버"라고 말하는 것이 "구독자", "관찰자" 또는 "리액터"라고 불려지기도 하는데, 통상적으로 이 모델은 <a href="http://en.wikipedia.org/wiki/Reactor_pattern">리액터 패턴</a>이라고 여겨진다.
</p>
<h1>옵저버 생성</h1>
<p>
 이 페이지에서는 예제 코드를 위해 Groovy 스타일의 의사코드(pseudocode)를 사용하지만, ReactiveX는 다양한 언어에서 사용되고 있다. 
</p>
<p>
 In an ordinary method call — that is, <em>not</em> the sort of asynchronous, parallel calls typical in
 ReactiveX — the flow is something like this:
</p><ol>
 <li>Call a method.</li>
 <li>Store the return value from that method in a variable.</li>
 <li>Use that variable and its new value to do something useful.</li>
</ol>
<p>
 Or, something like this:
</p>
<div class="code groovy"><pre>
// make the call, assign its return value to `returnVal`
returnVal = someMethod(itsParameters);
// do something useful with returnVal</pre></div>
<p>
 In the asynchronous model the flow goes more like this:
</p><ol>
 <li>Define a method that does something useful with the return value from the asynchronous call; this method is
     part of the <i>observer</i>.</li>
 <li>Define the asynchronous call itself as an <i>Observable</i>.</li>
 <li>Attach the observer to that Observable by <i>subscribing</i> it (this also initiates the actions of the
     Observable).</li>
 <li>Go on with your business; whenever the call returns, the observer’s method will begin to operate on its
     return value or values — the <i>items</i> emitted by the Observable.</li>
</ol>
<p>
 Which looks something like this:
</p>
<div class="code groovy"><pre>
// defines, but does not invoke, the Subscriber's onNext handler
// (in this example, the observer is very simple and has only an onNext handler)
def myOnNext = { it -> do something useful with it };
// defines, but does not invoke, the Observable
def myObservable = someObservable(itsParameters);
// subscribes the Subscriber to the Observable, and invokes the Observable
myObservable.subscribe(myOnNext);
// go on about my business</pre></div>
<h2>onNext, onCompleted, and onError</h2>
<p>
 <a href="operators/subscribe.html">The <code>Subscribe</code> method</a> is how you connect an observer to an
 Observable. Your observer implements some subset of the following methods:
</p>
<dl>
 <dt><code>onNext</code></dt>
  <dd>An Observable calls this method whenever the Observable emits an item. This method takes as a parameter
      the item emitted by the Observable.</dd>
 <dt><code>onError</code></dt>
  <dd>An Observable calls this method to indicate that it has failed to generate the expected data or has
      encountered some other error. It will not make further calls to <code>onNext</code> or <code>onCompleted</code>.
      The <code>onError</code> method takes as its parameter an indication of what caused the error.</dd>
 <dt><code>onCompleted</code></dt>
  <dd>An Observable calls this method after it has called <code>onNext</code> for the final time, if it has not
      encountered any errors.</dd>
</dl>
<p>
 By the terms of <a href="contract.html">the Observable contract</a>, it may call <code>onNext</code> zero or
 more times, and then may follow those calls with a call to either <code>onCompleted</code> or
 <code>onError</code> but not both, which will be its last call. By convention, in this document, calls to
 <code>onNext</code> are usually called &ldquo;emissions&rdquo; of items, whereas calls to
 <code>onCompleted</code> or <code>onError</code> are called &ldquo;notifications.&rdquo;
</p><p>
 A more complete <code>subscribe</code> call example looks like this:
</p>
<div class="code groovy"><pre>
def myOnNext     = { item -> /* do something useful with item */ };
def myError      = { throwable -> /* react sensibly to a failed call */ };
def myComplete   = { /* clean up after the final response */ };
def myObservable = someMethod(itsParameters);
myObservable.subscribe(myOnNext, myError, myComplete);
// go on about my business</pre></div>
<h4>See Also</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#IObserver"><cite>Introduction to Rx</cite>: IObserver</a></li>
</ul>
<h2>Unsubscribing</h2>
<p>
 In some ReactiveX implementations, there is a specialized observer interface, <code>Subscriber</code>, that
 implements an <code>unsubscribe</code> method. You can call this method to indicate that the Subscriber is no
 longer interested in any of the Observables it is currently subscribed to. Those Observables can then (if they
 have no other interested observers) choose to stop generating new items to emit.
</p><p>
 The results of this unsubscription will cascade back through the chain of operators that applies to the
 Observable that the observer subscribed to, and this will cause each link in the chain to stop emitting items.
 This is not guaranteed to happen immediately, however, and it is possible for an Observable to generate and
 attempt to emit items for a while even after no observers remain to observe these emissions.
</p>
<h2>Some Notes on Naming Conventions</h2>
<p>
 Each language-specific implementation of ReactiveX has its own naming quirks. There is no canonical naming
 standard, though there are many commonalities between implementations.
</p><p>
 Furthermore, some of these names have different implications in other contexts, or seem awkward in the idiom of
 a particular implementing language.
</p><p>
 For example there is the <code>on<i>Event</i></code> naming pattern (e.g. <code>onNext</code>,
 <code>onCompleted</code>, <code>onError</code>). In some contexts such names would indicate methods by means of
 which event handlers are <em>registered</em>. In ReactiveX, however, they name the event handlers themselves.
</p>
<h1>&ldquo;Hot&rdquo; and &ldquo;Cold&rdquo; Observables</h1>
<p>
 When does an Observable begin emitting its sequence of items? It depends on the Observable. A &ldquo;hot&rdquo;
 Observable may begin emitting items as soon as it is created, and so any observer who later subscribes to that
 Observable may start observing the sequence somewhere in the middle. A &ldquo;cold&rdquo; Observable, on the
 other hand, waits until an observer subscribes to it before it begins to emit items, and so such an observer is
 guaranteed to see the whole sequence from the beginning.
</p><p>
 In some implementations of ReactiveX, there is also something called a &ldquo;Connectable&rdquo; Observable.
 Such an Observable does not begin emitting items until its
 <a href="operators/connect.html"><span class="operator">Connect</span></a> method is called, whether or not any
 observers have subscribed to it.
</p>
<h1>Composition via Observable Operators</h1>
<p>
 Observables and observers are only the start of ReactiveX. By themselves they’d be nothing more than a slight
 extension of the standard observer pattern, better suited to handling a sequence of events rather than a single
 callback.
</p><p>
 The real power comes with the “reactive extensions” (hence “ReactiveX”) — operators that allow you to
 transform, combine, manipulate, and work with the sequences of items emitted by Observables.
</p><p>
 These Rx operators allow you to compose asynchronous sequences together in a declarative manner with all the
 efficiency benefits of callbacks but without the drawbacks of nesting callback handlers that are typically
 associated with asynchronous systems.
</p><p>
 This documentation groups information about <a href="operators.html#alphabetical">the various operators</a>
 and examples of their usage into the following pages:
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
 These pages include information about some operators that are not part of the core of ReactiveX but are
 implemented in one or more of language-specific implementations and/or optional modules.
</p>
<h2>Chaining Operators</h2>
<p>
 Most operators operate on an Observable and return an Observable. This allows you to apply these operators one
 after the other, in a chain. Each operator in the chain modifies the Observable that results from the operation
 of the previous operator.
</p><p>
 There are other patterns, like the Builder Pattern, in which a variety of methods of a particular class
 operate on an item of that same class by modifying that object through the operation of the method. These
 patterns also allow you to chain the methods in a similar way. But while in the Builder Pattern, the order in
 which the methods appear in the chain does not usually matter, with the Observable operators <em>order
 matters</em>.
</p><p>
 A chain of Observable operators do not operate independently on the original Observable that originates the
 chain, but they operate <em>in turn</em>, each one operating on the Observable generated by the operator
 immediately previous in the chain.
</p>
