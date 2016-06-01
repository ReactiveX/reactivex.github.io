---
layout: documentation
title: ReactiveX - Observable
id: observable
---

<h1>Observable</h1>
<p>
 ReactiveX에서는 <dfn>옵저버</dfn>가 <dfn>Observable</dfn>을 <dfn>구독한다</dfn>. 그 후 Obseravable이 <dfn>발행하는</dfn> 항목 혹은 연속된 항목에 따라 옵저버는 반응한다. 
 이 패턴은 동시성 연산을 가능하게 하는데, 그 이유는 옵저버는 더 이상 Observable이 객체를 내보낼 때까지 기다리지 않고 대신 어떤 객체가 배출되는 시점을 감시하는 관찰자를 옵저버 안에 만들어 놓고 관찰자를 통해 알림을 받기 때문이다.
</p>
<p>
 이 문서에서는 리액티브 패턴이 무엇이고 Observable과 옵저버가 무엇인지(그리고 어떻게 옵저버가 observable을 구독하는지)를 설명한다.
 그 다음에는 <a href="../operators.html">다양한 Observable의 연산자들</a>을 어떻게 Obseravable에 연결 시키는지 또, 어떻게 Observable의 행동을 변경 시킬 수 있는지 설명한다.
</p>
<figure>
 <figcaption>
  <p>이 문서에서는 &ldquo;마블 다이어그램&rdquo;을 활용해서 필요한 내용을 설명한다. 아래는 어떻게 마블 다이어그램이 Observable과 Observable의 전환을 표현하는지 예제로 보여주고 있다.</p>
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
 많은 코드들을 살펴보면, 대부분의 개발자들은 자신이 작성한 코드가 점진적으로, 한번에 하나씩, 작성된 순서에 따라 실행되고 완료 되기를 기대한다는 사실을 알 수 있다.
 하지만, ReactiveX에의 코드 실행은 "옵저버"에 의해 임의의 순서에 대로, 병렬로 실행되며 결과는 나중에 연산된다. 즉, 메서드를 <em>호출한다기 보단</em>, "observable" 안에서 데이터를 조회하고 변환하는 메커니즘을 정의한 다음 
 Observable이 이벤트를 발생시키면 옵저버의 관찰자가 그 순간을 탐지하고 준비된 연산을 실행한 후 결과를 리턴하도록, observable을 구독한다고 표현하는 것이 올바르다.
</p>
<p>
 이 접근 방법을 통해, 서로 의존하지 않은 많은 코드들을 실행할 경우, 하나의 코드 블럭이 실행 결과를 리턴할 때까지 기다릴 필요 없이 연이어 다음 코드를 실행할 수 있기 때문에 여러 코드를 한번에 실행 시킬 수 있어 &mdash;
 결과적으로 코드 전체의 실행 시간은 그 중 실행 시간이 긴 시간 만큼 밖에 걸리지 않는다.
</p>
<p>
 비동기 프로그래밍과 설계 모델을 이야기하기 위해서 많은 용어들이 사용되고 있지만, 이 문서에서는 다음의 용어들을 사용한다: <dfn>옵저버</dfn>는 <dfn>Observable</dfn>을 <dfn>구독한다</dfn>.
 Observable은 <dfn>항목들</dfn>을 <dfn>배출</dfn>하거나 observable의 메서드 호출을 통해 옵저버에게 <dfn>알림</dfn>을 보낸다.
</p>
<p>
 다양한 문서 또는 문맥에서 우리가 "옵저버"라고 말하는 것이 "구독자", "관찰자" 또는 "리액터"라고 불려지기도 하는데, 통상적으로 이 모델은 <a href="http://en.wikipedia.org/wiki/Reactor_pattern">리액터 패턴</a>을 말한다.
</p>
<h1>옵저버 생성</h1>
<p>
 이 페이지에서는 예제 코드로 Groovy 스타일의 의사코드(pseudocode)를 사용하지만, 다양한 언어가 ReactiveX를 지원한다. 
</p>
<p>
 ReactiveX에서는 기본적으로 비동기, 병렬로 메소드 호출이 처리되지만, 그 외의 일반적인 메서드 호출은 보통 아래와 같은 흐름으로 진행된다: 
</p><ol>
 <li>메서드를 호출한다.</li>
 <li>메서드가 리턴한 값을 변수에 저장한다.</li>
 <li>결과 값을 가진 변수를 통해 필요한 연산을 처리한다.</li>
</ol>
<p>
 혹은, 이렇게 표현하기도 한다:
</p>
<div class="code groovy"><pre>
// 메서드를 호출하고, 리턴 값을 `returnVal`에 할당한다
returnVal = someMethod(itsParameters);
// returnVal을 통해 필요한 작업을 진행한다</pre></div>
<p>
 하지만, 비동기 모델에서는 아래와 같이 코드가 실행된다.
</p><ol>
 <li>비동기 메소드 호출로 결과를 리턴받고 필요한 동작을 처리하는 메서드를 정의한다: 이 메서드는 <i>옵저버</i>의 일부가 된다.</li>
 <li><i>Observable</i>로 비동기 호출을 정의한다.</li>
 <li><i>구독</i>을 통해 옵저버를 Observable 객체에 연결 시킨다(또한, 동시에 Observable의 동작을 초기화 한다).</li>
 <li>필요한 코드를 계속 구현한다; 메서드 호출로 결과가 리턴될 때마다, 옵저버의 메서드는 리턴 값 또는 (Observable이 배출하는)<i>항목들</i>을 활용해 연산을 시작한다.</li>
</ol>
<p>
 이를 코드로 구현하면 아래와 같다:
</p>
<div class="code groovy"><pre>
// 구독자의 onNext 핸들러를 정의한다, 하지만 실행하지는 않는다
// (이 예제에서, 옵저버는 단순히 onNext 핸들러만 구현한다)
def myOnNext = { it -> /* 필요한 연산을 처리한다 */ };
// Observable을 정의하지만, 역시 실행하지는 않는다
def myObservable = someObservable(itsParameters);
// Observable의 구독자를 구독한다. 그리고 Observable을 실행한다
myObservable.subscribe(myOnNext);
// 필요한 코드를 구현한다</pre></div>
<h2>onNext, onCompleted, 그리고 onError</h2>
<p>
 <a href="operators/subscribe.html"><code>Subscribe</code> 메서드</a>를 통해 옵저버와 Observable을 연결한다. 여러분의 옵저버는 아래의 메서드를 구현하게 될 것이다:
</p>
<dl>
 <dt><code>onNext</code></dt>
  <dd>Observable은 새로운 항목들을  배출할 때마다 이 메서드를 호출한다. 이 메서드는 Observable이 배출하는 항목을 자신의 파라미터로 전달 받는다.</dd>
 <dt><code>onError</code></dt>
  <dd>Observable은 기대하는 데이터가 생성되지 않았거나 다른 이유로 오류가 발생했을 때 이를 알리기 위해 이 메서드를 호출한다. 이 메서드가 호출되면 <code>onNext</code>나 <code>onCompleted</code>는 더 이상 호출되지 않는다.
      이 <code>onError</code> 메서드는 어떤 오류가 발생했는지에 대한 정보를 담고 있는 객체를 파라미터로 전달 받는다.</dd>
 <dt><code>onCompleted</code></dt>
  <dd>오류가 발생하지 않았다면 Observable은 마지막 <code>onNext</code>를 호출한 후에 이 메서드를 호출한다.</dd>
</dl>
<p>
 <a href="contract.html">the Observable contract</a>에 명시된 조건에 따라, <code>onNext</code>는 0번 이상 호출 될 수 있으며 그 후에는 <code>onCompleted</code> 또는
 <code>onError</code> 둘 중 하나를 마지막으로 호출한다. 단, 둘 다 호출하지는 않는다. 이 문서에서는 관례에 따라, <code>onNext</code> 호출을 항목의 &ldquo;배출&rdquo;로 부르며, 반대로 
 <code>onCompleted</code> 혹은 <code>onError</code> 호출을 &ldquo;알림&rdquo;으로 부를 것이다.
</p><p>
 이해를 돕기 위해서 <code>subscribe</code> 호출 예제를 조금 더 작성해 보았다:
</p>
<div class="code groovy"><pre>
def myOnNext     = { item -> /* 필요한 연산을 처리한다 */ };
def myError      = { throwable -> /* 실패한 호출에 대응한다 */ };
def myComplete   = { /* 최종 응답 후 정리 작업을 한다 */ };
def myObservable = someMethod(itsParameters);
myObservable.subscribe(myOnNext, myError, myComplete);
// 필요한 코드를 계속 구현한다</pre></div>
<h4>참고</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#IObserver"><cite>Introduction to Rx</cite>: IObserver</a></li>
</ul>
<h2>구독 해지하기</h2>
<p>
 ReactiveX 구현체 중에는 특정 옵저버 인터페이스를 구현하는 <code>Subscriber</code>라는 클래스가 있는데 이 클래스는 <code>unsubscribe</code>라는 메서드를 제공한다.
 현재 구독하고 있는 Observable 중 구독자가 더 이상 구독을 원치 않을 경우에는 이 메서드를 호출하면 된다. (만약 더 이상 관심있는 다른 옵저버가 없다면) Observable들은 새로운 항목들을 배출하지 않는다.
</p>
<p>
 unsubscribe를 통한 구독 해지는 연산자 체인을 통해 옵저버가 구독하고 있었던 Observable들이 더 이상 항목들을 배출하지 못하도록 체인 안에 연결된 링크들을 끊어 버린다.
</p>
<h2>명명 규칙에 관한 참고내용</h2>
<p>
 ReactiveX를 구현하는 언어들은 자신 만의 독특한 특징을 갖고있다. 그렇다고 반드시 지켜야할 규칙들이 존재하는 것은 아니지만, 언어별 구현체 간에 공통적으로 유지해야 할 많은 명명 규칙들이 존재한다.
</p>
<p>
 뿐만 아니라, 이들 규칙 간에는 각기 다른 문맥에서 서로 다른 함축적 의미를 가지고 있기도 하고 특정 언어의 관용구에서는 상당히 어색한 의미로 해석되기도 한다.
</p>
<p>
 예를 들면, (<code>onNext</code>, <code>onCompleted</code>, <code>onError</code>)같은 <code>on<i>Event</i></code> 이벤트에 관한 명명 패턴이 존재한다.
 어떤 문맥에서는 이 같은 이름들이, 어떤 핸들러가 등록 되었는지를 가리키는 메서드의 용도로 사용되기도 한다. 하지만, ReactiveX에서 이 이름들은 이벤트 핸들러 자체를 의미한다.
</p>
<h1>&ldquo;뜨거운&rdquo; 그리고 &ldquo;차가운&rdquo; Observable</h1>
<p>
 Observable은 연속된 항목들을 언제 배출하기 시작하는가? 이 질문에 대한 대답은, "Observable에 따라 다르다"이다. &ldquo;뜨거운&rdquo; Observable은 생성되지 마자 항목들을 배출할 수도 있기 때문에 나중에 이 Observable을 구독하는 옵저버들은 항목들이 배출되는 중간부터 
 구독을 시작할 수 있다. 반대로, &ldquo;차가운&rdquo; Observable은 옵저버가 구독을 시작할때 까지 항목의 배출을 지연시키기 때문에 이 Observable을 구독하는 옵저버는 Observable이 배출하는 항목 전체에 대한 구독을 보장한다.
</p><p>
 ReactiveX의 구현 코드 중에는 &ldquo;연결 가능한&rdquo; Observable이라고 불리는 Observable 객체가 존재하는데, 이 Observable은 어떤 옵저버에 의한 구독 여부와는 상관 없이 자신의 <a href="operators/connect.html"><span class="operator">Connect</span></a> 메서드가 호출되기 전까지 항목들을 배출하지 않는다.
</p>
<h1>Observable 연산자를 통한 구성</h1>
<p>
 Observable과 옵저버는 그저 ReactiveX의 시적일 뿐이다. 우리가 알고 있는 표준 옵저버 패턴을 조금 확장한 것이며, 연속된 이벤트를 처리하는데 있어서는 싱글 콜백보다는 훨씬 더 효과적인 방법을 제공한다.
</p>
<p>
 "리액티브 확장(reactive extensions)"(그래서 "ReactiveX"로 부르는)의 진짜 힘은 연산자로부터 나온다. 연산자들은 Observable이 배출하는 연속된 항목들을 변환하고, 결합하고, 조작하는 기능들을 제공한다.
</p>
<p>
 이 연산자들은 콜백이 제공하는 효율적인 장점들을 바탕으로 선언적인 방법을 통해 연속된 비동기 호출을 구성할 수 있는 방법을 제공하는데, 중요한 것은 일반적인 비동기 시스템이 보이는 중첩된 콜백 핸들러의 단점들을 제거했다는 점이다.
</p>
<p>
 여기에서 제공하는 문서들은 <a href="../operators.html#alphabetical">다양한 연산자</a>에 대한 내용을 그룹시키고 아래의 페이지들을 통해 실제 사용에 필요한 예제를 제공한다:
</p>
<dl>
 <dt><a href="../operators.html#creating">Observable 생성</a></dt>
  <dd><code>Create</code>, <code>Defer</code>, <code>Empty</code>/<code>Never</code>/<code>Throw</code>,
      <code>From</code>, <code>Interval</code>, <code>Just</code>, <code>Range</code>, <code>Repeat</code>,
      <code>Start</code>, and <code>Timer</code></dd>
 <dt><a href="../operators.html#transforming">Observable 항목 변환</a></dt>
  <dd><code>Buffer</code>, <code>FlatMap</code>, <code>GroupBy</code>, <code>Map</code>, <code>Scan</code>, and
      <code>Window</code></dd>
 <dt><a href="../operators.html#filtering">Observable 필터</a></dt>
  <dd><code>Debounce</code>, <code>Distinct</code>, <code>ElementAt</code>, <code>Filter</code>,
      <code>First</code>, <code>IgnoreElements</code>, <code>Last</code>, <code>Sample</code>,
      <code>Skip</code>, <code>SkipLast</code>, <code>Take</code>, and <code>TakeLast</code></dd>
 <dt><a href="../operators.html#combining">Observable 결합</a></dt>
  <dd><code>And</code>/<code>Then</code>/<code>When</code>, <code>CombineLatest</code>, <code>Join</code>,
      <code>Merge</code>, <code>StartWith</code>, <code>Switch</code>, and <code>Zip</code></dd>
 <dt><a href="../operators.html#error">오류 처리 연산자</a></dt>
  <dd><code>Catch</code> and <code>Retry</code></dd>
 <dt><a href="../operators.html#utility">유틸리티 연산자</a></dt>
  <dd><code>Delay</code>, <code>Do</code>, <code>Materialize</code>/<code>Dematerialize</code>,
      <code>ObserveOn</code>, <code>Serialize</code>, <code>Subscribe</code>, <code>SubscribeOn</code>,
      <code>TimeInterval</code>, <code>Timeout</code>, <code>Timestamp</code>, and <code>Using</code></dd>
 <dt><a href="../operators.html#conditional">조건 및 불린(Boolean) 연산자</a></dt>
  <dd><code>All</code>, <code>Amb</code>, <code>Contains</code>, <code>DefaultIfEmpty</code>,
      <code>SequenceEqual</code>, <code>SkipUntil</code>, <code>SkipWhile</code>, <code>TakeUntil</code>,
      and <code>TakeWhile</code></dd>
 <dt><a href="../operators.html#mathematical">수학과 조합 연산자</a></dt>
  <dd><code>Average</code>, <code>Concat</code>, <code>Count</code>, <code>Max</code>, <code>Min</code>,
      <code>Reduce</code>, and <code>Sum</code></dd>
 <dt><a href="../operators.html#conversion">변환 Observable</a></dt>
  <dd><code>To</code></dd>
 <dt><a href="../operators.html#connectable">연결 가능한 Observable 연산자</a></dt>
  <dd><code>Connect</code>, <code>Publish</code>, <code>RefCount</code>, and <code>Replay</code></dd>
 <dt><a href="../operators/backpressure.html">역압(backpressure) 연산자</a></dt>
  <dd>특정 제어흐름 원칙들을 적용하는 다양한 연산자들</dd>
</dl>
<p>
 위 페이지들은 ReactiveX의 비핵심적인 연산자 혹은 선택적 모듈에 대한 정보를 포함하고 있으며 하나 이상의 언어를 통해 구현된다.
</p>
<h2>연산자 체인</h2>
<p>
 대부분의 연산자들은 Observable 상에서 동작하고 Observable을 리턴한다. 이런 접근 방법은 연산자들을 하나의 Observable에 적용한 후 다음 연산자에 다시 적용할 수 있는 연산자 체인을 제공한다.
 연산자 체인에 있는 각각의 연산자들은 이전 연산자가 리턴한 Observable을 변경한다.
</p>
<p>
 특정 클래스의 다양한 메서드 연산을 통해서 같은 클래스에 있는 항목들을 변경하는 빌더 패턴 같은 것도 존재한다. 이들 패턴 역시 비슷한 방법으로 메서드 체인을 제공한다. 
 하지만 연산자의 호출 순서가 문제가 되지는 않는 빌더 패턴과는 달리, Obervable 연산자들은 <em>호출 순서</em>에 영향을 받는다.
</p>
<p>
 Observable 연산자 체인은 원본 Observable에서 떨어져서 동작할 수 없고 <em>순서대로</em> 동작하기 때문에, 호출 체인 중 바로 이전에 호출된 연산자가 리턴한 Observable 상에서 실행된다.
</p>
