---
layout: documentation
title: ReactiveX - The Observable Contract
lang: ko
id: contract
---

<h1>Observable 계약</h1>
<p>
 소스 문서나 이 사이트에서 제공하는 문서들을 읽다 보면 "Observable 계약"이란 용어가 자주 사용되는 것을 알것이다. Observable 계약이란 Observable을 공식적으로 정의하려는 시도로써, 2010 마이크로소프트가
 만든 ReactiveX의 .Net 버전인 RX.NET을 설명하는 <a href="https://go.microsoft.com/fwlink/?LinkID=205219"><cite>Rx Design Guidelines</cite></a>에서 비롯되었다.
</p><p>
 이 페이지에서는 Observable 계약에 대한 내용을 정리해서 설명하려고 한다.
</p>
<h2>알림</h2>
<p>
 Observable은 아래에서 설명하는 <i>알림</i>들을 통해 옵저버와 커뮤니케이션 한다:
</p>
<dl>
 <dt>OnNext</dt>
  <dd>Observable이 <i>배출</i>하는 항목을 옵저버에게 전달한다</dd>
 <dt>OnCompleted</dt>
  <dd>Observable이 성공적으로 작업을 완료했고 더 이상 항목을 배출하지 않음을 알린다</dd>
 <dt>OnError</dt>
  <dd>특정 오류 조건 때문에 Observable이 종료됐고 더 이상 항목을 배출하지 않음을 알린다</dd>
 <dt>OnSubscribe (선택사항)</dt>
  <dd>Observable이 옵저버로부터 Request 알림을 받을 준비가 됐음을 알린다(아래의 <i>역압</i>을 참조하자)</dd>
</dl>
<p>
 옵저버는 아래의 알림들을 통해 Observable과 커뮤니케이션 한다:
</p>
<dl>
 <dt>Subscribe</dt>
  <dd>옵저버가 Observable로부터 알림을 받을 준비가 됐음을 말한다</dd>
 <dt>Unsubscribe</dt>
  <dd>옵저버가 더 이상 Observable로부터 알림을 받고 싶지 않다는 것을 말한다</dd>
 <dt>Request (선택사항)</dt>
  <dd>옵저버가 특정 수 만큼의 추가 OnNext 알림만 받고 싶다는 것을 말한다(아래의 <i>역압</i>을 참조하자)</dd>
</dl>
<h2>알림 원칙에 관한 계약</h2>
<p>
 Observable은 0개 이상의 OnNext 알림을 만들고 각각의 알림은 배출된 하나의 항목을 나타내며 OnCompleted나 OnError 알림 중 하나를 배출한다. 단, OnCompleted와 OnError 알림 둘 다 만들지는 않는다.
 OnCompleted나 OnError 알림을 배출한 후에는 다른 알림을 배출하지 않는다.
</p><p>
 Observable은 항목을 배출하지 않을 수 있고, OnCompleted나 OnError 알림을 전달했다 해도 종료되지 않을 수 있다. 이 말은 즉, Observable은 아무 알림도 배출하지 않거나, OnCompleted 또는 OnError 알림만 배출할 수 있으며, 또는 OnNext 알리만 배출할 수도 있다는 것을 말한다.
</p><p>
 Observable은 반드시 (병렬이 아닌)순차적으로 옵저버에게 알림을 보낸다. 그리고 이 알림은 다른 스레드를 통해 전달 되기도 한다. 하지만, 공식적으로 알림 간에는 <i>전후</i> 관계가 존재한다.
</p>
<h2>Observable 종료</h2>
<p>
 만약 Observable이 OnCompleted나 OnError 알림을 보내지 않는다면, (실제로는 항목을 배출하지 않고 있어도)옵저버는 Observable이 여전히 실행 중이라고 판단하고 (Unscribe나 Request 같은)알림을 보내기도 한다. Observable이 OnCompleted나 OnError 알림을 발행하면 Observable은 자원을 반환하거나 실행을 종료 시키고, 이때 옵저버는 더 이상 Observable과의 커뮤니케이션을 시도하면 안된다.
</p><p>
 OnError 알림은 반드시 발생한 오류에 대한 정보를 포함하고 있어야 한다(다시 말해서, OnError는 <code>null</code> 값을 가지고 있으면 안된다).
</p><p>
 Observable은 종료 전에 Observable을 구독 중인 모든 구독자에게 OnCompleted나 OnError 알림을 중 하나를 꼭 보내야 한다.
</p>
<h2>구독과 해지</h2>
<p>
 Observable은 옵저버로부터 Subscribe 알림을 받는 순간, 즉시 옵저버에게 알림을 보낼 수 있다.
</p><p>
 옵저버가 Observable에게 Unsubsribe 알림을 보내면, Observable은 더 이상 옵저버에게 알림을 보내지 않을 것이다. 하지만, 옵저버가 Unsubscribe 알림을 보낸 후라 해도 구독 해지는 보장되지 않을 수 있다.
</p><p>
 Observable이 OnError나 OnCompleted를 옵저버에게 보내면 구독은 종료된다. 이 경우, 옵저버는 더 이상 구독을 해지하기 위해 Observable에게 Unsubscribe 알림을 보낼 필요가 없다.
</p>
<h2>다중 Observer</h2>
<p>
 이미 첫 번째 옵저버에게 항목을 배출 중인 Observable을 두 번째 옵저버가 구독하려 했을 때, 이 후 부터의 동작은 전적으로 Observable이 결정하는데 이때 Observable이 선택할 수 있는 옵션은, 두 번째 옵저버가 구독을 시작하는 시점부터 발행 중인 항목을 동일하게 두 번재 옵저버에게도 배출하거나, 아예 처음부터 두 번째 옵저버에게 항목을 다시 배출하거나, 아니면 아예 다른 순서대로 항목들을 두 번째 옵저버에게 배출할 수 있다. 일반적으로 같은 Observable을 두 개의 옵저버가 구독하는 경우, 동일한 순서대로 옵저버가 항목들을 구독 받도록 보장 할 수는 없다.
</p>
<h2>역압</h2>
<p>
 역압(Backpressure)은 선택사항으로 ReactiveX의 모든 구현체가 역압을 포함하는 것은 아니며, 역압을 포함한다 해도 그 구현체의 모든 Observable이나 연산자가 역압을 수행하는 것도 아니다.
 만약 Observable을 구독하는 옵저버가 <i>Request</i> 알림을 구현하고 <i>OnSubscribe</i> 알림을 이해한다는 것을 Observable가 인지한다면 이 Observable은 역압을 구현 <em>할 수</em> 있다.
</p><p>
 만약 Observable이 역압을 구현하고 옵저버가 이를 사용할 경우, Observable은 옵저버가 구독을 시작했더라도 항목을 즉시 배출하지는 않고 대신, 옵저버에게 OnSubscribe 알림을 보낸다.
</p><p>
 옵저버는 OnSubscribe 알림을 받은 이후부터 구독 중인 Observable에게 Request 알림을 보낸다. 이 알림은 특정 갯수 만큼의 항목을 요청하며, 이 요청을 전달 받은 Observable은 정확히 요청 받은 갯수 만큼의 항목만 옵저버에게 발행한다. 하지만, 그 외에도 Observable은 OnCompleted나 OnError 알림을 보낼 수 있으며 옵저버가 아무런 항목도 요청하지 않아도 이 알림을 발행 할 수 있다.
</p><p>
 역압을 구현하지 않는 Observable은, 역압이 지원되지 않는다는 사실을 OnError 통해 전달함으로써 옵저버가 보내온 Request 알림에 응답해야 한다.
</p><p>
 옵저버의 Request 알림은 누적된다. 예를 들어, 옵저버가 Observable에게 Request 알림을 각각 3개, 5개 그리고 10개, 총 세 번 보냈다면 Observable은 아마도 옵저버에게 총 18개의 항목을 배출할 것이다. 하지만, 이렇게 전달된 Request 알림에 대해서 언제 Observable이 요청된 만큼의 항목을 응답으로 배출할 지는 문제 되지 않는다.
</p><p>
 만약 요청된 갯수 보다 많은 항목들이 Observable에 의해 배출될 경우, 초과한 항목들을 버릴 것인지 아니면 오버플로우(overflow)에 대한 다른 전략을 사용할지는 Observable에 달렸다.
</p>
<h2>참고</h2>
<ul>
 <li><a href="https://go.microsoft.com/fwlink/?LinkID=205219"><cite>Rx Design Guidelines</cite></a></li>
 <li><a href="http://xgrommx.github.io/rx-book/content/guidelines/index.html"><cite>RxJS Design Guidelines</cite></a></li>
</ul>
