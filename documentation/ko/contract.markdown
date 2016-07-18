---
layout: documentation
title: ReactiveX - The Observable Contract
id: contract
---

<h1>Observable 계약</h1>
<p>
 소스 문서나 이 사이트에서 제공하는 문서를 읽다 보면 "Observable 계약"이란 용어가 종종 사용되는 것을 알고 있을 것이다. Observable 게약이란 Observable을 공식적으로 정의하고자 하는 시도로써, 2010 마이크로소프트가
 만든 ReactiveX의 .Net 버전인 RX.NET을 설명하는 <a href="https://go.microsoft.com/fwlink/?LinkID=205219"><cite>Rx Design Guidelines</cite></a>에서 비롯되었다.
</p><p>
 이 페이지는 Observable 계약에 대한 내용을 정리해서 설명한다.
</p>
<h2>알림</h2>
<p>
 Observable은 아래에에서 설명하는 <i>알림</i>을 통해 옵저버와 커뮤니케이션 한다:
</p>
<dl>
 <dt>OnNext</dt>
  <dd>Observable이 <i>배출</i>하는 항목을 오버접에게 전달한다</dd>
 <dt>OnCompleted</dt>
  <dd>Observable이 성공적으로 작업을 완료했고 더 이상 항목을 배출하지 않을 것임을 가리킨다</dd>
 <dt>OnError</dt>
  <dd>특정 오류 조건으로 Observable이 종료됐고 더 이상 항목을 배출하지 않을 것임을 가리킨다</dd>
 <dt>OnSubscribe (선택사항)</dt>
  <dd>Observable이 옵저버로부터 요청 알림을 받을 준비가 됐음을 가리킨다(아래의 <i>역압</i>을 참조하자)</dd>
</dl>
<p>
 옵저버는 아래의 알림들을 통해 Observable과 커뮤니케이션 한다:
</p>
<dl>
 <dt>Subscribe</dt>
  <dd>옵저버가 Observable로부터 알림을 받을 준비가 됐음을 가리킨다</dd>
 <dt>Unsubscribe</dt>
  <dd>옵저버가 더 이상 Observable로부터 알림을 받고 싶지 않음을 가리킨다</dd>
 <dt>Request (선택사항)</dt>
  <dd>옵저버가 특정 수 만큼의 추가 OnNext 알림만 받고 싶음을 가리킨다(아래의 <i>역압</i>을 참조하자)</dd>
</dl>
<h2>알림을 관리하는 계약</h2>
<p>
 Observable은 0개 이상의 OnNext 알림을 만들고 각각의 알림은 배출된 하나의 항목을 나타내며 OnCompleted나 OnError 알림 중 하나를 배출한다. 단, OnCompleted와 OnError 알림 둘을 모두 만들지는 않는다.
 OnCompleted나 OnError 알림 배출 후에는 더 이상 다른 알림을 배출하지 않을 것이다.
</p><p>
 Observable은 항목을 배출하지 않을 수 있다. 또한, OnCompleted나 OnError 알림 후에 종료되지 않을 수도 있다. 이 말은 즉, Observable은 아무 알림도 배출하지 않거나, OnCompleted 또는 OnError 알림만 배출할 수 있으며, 또는 OnNext 알리만 배출할 수 있음을 뜻한다.
</p><p>
 Observable은 반드시 (병렬이 아닌)순차적으로 옵저버에게 알림을 보내야 한다. 그리고 이 알림은 다른 스레드를 통해 보내질 수 있다. 하지만, 공식적으로 알림 사이는 <i>전후</i> 관계로 이어져야 한다.
</p>
<h2>Observable Termination</h2>
<p>
 If an Observable has not issued an OnCompleted or OnError notification, an observer may consider it to be still
 active (even if it is not currently emitting items) and may issue it notifications (such as an Unsubscribe
 or Request notification). When an Observable does issue an OnCompleted or OnError notification, the Observable
 may release its resources and terminate, and its observers should not attempt to communicate with it any
 further.
</p><p>
 An OnError notification must contain the cause of the error (that is to say, it is invalid to call OnError with
 a <code>null</code> value).
</p><p>
 Before an Observable terminates it must first issue either an OnCompleted or OnError notification to all of the
 observers that are subscribed to it.
</p>
<h2>Subscribing and Unsubscribing</h2>
<p>
 An Observable may begin issuing notifications to an observer immediately after the Observable receives a
 Subscribe notification from the observer.
</p><p>
 When an observer issues an Unsubscribe notification to an Observable, the Observable will attempt to stop
 issuing notifications to the observer. It is not guaranteed, however, that the Observable will issue
 <em>no</em> notifications to the observer after an observer issues it an Unsubscribe notification.
</p><p>
 When an Observable issues an OnError or OnComplete notification to its observers, this ends the subscription.
 Observers do not need to issue an Unsubscribe notification to end subscriptions that are ended by the Observable
 in this way.
</p>
<h2>Multiple Observers</h2>
<p>
 If a second observer subscribes to an Observable that is already emitting items to a first observer, it is up
 to the Observable whether it will thenceforth emit the same items to each observer, or whether it will replay
 the complete sequence of items from the beginning to the second observer, or whether it will emit a wholly
 different sequence of items to the second observer. There is no general guarantee that two observers of the
 same Observable will see the same sequence of items.
</p>
<h2>Backpressure</h2>
<p>
 Backpressure is optional; not all ReactiveX implementations include backpressure, and in those that do, not all
 Observables or operators honor backpressure. An Observable <em>may</em> implement backpressure if it detects
 that its observer implements <i>Request</i> notifications and understands <i>OnSubscribe</i> notifications.
</p><p>
 If an Observable implements backpressure and its observer employs backpressure, the Observable will not begin
 to emit items to the observer immediately upon subscription. Instead, it will issue an OnSubscribe notification
 to the observer.
</p><p>
 At any time after it receives an OnSubscribe notification, an observer may issue a Request notification to the
 Observable it has subscribed to. This notification requests a particular number of items. The Observable
 responds to such a Request by emitting no more items to the observer than the number of items the observer
 requests. However the Observable may, in addition, issue an OnCompleted or OnError notification, and it may
 even issue such a notification before the observer requests any items at all.
</p><p>
 An Observable that does not implement backpressure should respond to a Request notification from an observer
 by issuing an OnError notification that indicates that backpressure is not supported.
</p><p>
 Requests are cumulative. For example, if an observer issues three Request notifications to an Observable, for
 3, 5, and 10 items respectively, that Observable may emit as many as 18 items to the observer, no matter when
 those Request notifications arrived relative to when the Observable emitted items in response.
</p><p>
 If the Observable produces more items than the observer requests, it is up to the Observable whether it will
 discard the excess items, store them to emit at a later time, or use some other strategy to deal with the
 overflow.
</p>
<h2>See Also</h2>
<ul>
 <li><a href="https://go.microsoft.com/fwlink/?LinkID=205219"><cite>Rx Design Guidelines</cite></a></li>
 <li><a href="http://xgrommx.github.io/rx-book/content/guidelines/index.html"><cite>RxJS Design Guidelines</cite></a></li>
</ul>
