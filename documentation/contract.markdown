---
layout: documentation
title: ReactiveX - The Observable Contract
id: contract
---

<h1>The Observable Contract</h1>
<p>
 “The Observable Contract,” which you may see referenced in various places in source documentation and in the
 pages on this site, is an attempt at a formal definition of an Observable, based originally on the 2010
 document <a href="https://go.microsoft.com/fwlink/?LinkID=205219"><cite>Rx Design Guidelines</cite></a> from
 Microsoft that described its Rx.NET implementation of ReactiveX.
</p><p>
 This page summarizes The Observable Contract.
</p>
<h2>Notifications</h2>
<p>
 An Observable communicates with its observers with the following <i>notifications</i>:
</p>
<dl>
 <dt>OnNext</dt>
  <dd>conveys an <i>item</i> that is <i>emitted</i> by the Observable to the observer</dd>
 <dt>OnCompleted</dt>
  <dd>indicates that the Observable has completed successfully and that it will be emitting no further items</dd>
 <dt>OnError</dt>
  <dd>indicates that the Observable has terminated with a specified error condition and that it will be emitting no further items</dd>
 <dt>OnSubscribe (optional)</dt>
  <dd>indicates that the Observable is ready to accept Request notifications from the observer (see <i>Backpressure</i> below)</dd>
</dl>
<p>
 An observer communicates with its Observable by means of the following notifications:
</p>
<dl>
 <dt>Subscribe</dt>
  <dd>indicates that the observer is ready to receive notifications from the Observable</dd>
 <dt>Unsubscribe</dt>
  <dd>indicates that the observer no longer wants to receive notifications from the Observable</dd>
 <dt>Request (optional)</dt>
  <dd>indicates that the observer wants no more than a particular number of additional OnNext notifications from the Observable (see <i>Backpressure</i> below)</dd>
</dl>
<h2>The Contract Governing Notifications</h2>
<p>
 An Observable may make zero or more OnNext notifications, each representing a single emitted item, and it may
 then follow those emission notifications by either an OnCompleted or an OnError notification, but not both.
 Upon issuing an OnCompleted or OnError notification, it may not thereafter issue any further notifications.
</p><p>
 An Observable may emit no items at all.  An Observable may also never terminate with either an OnCompleted or
 an OnError notification.  That is to say that it is proper for an Observable to issue no notifications, to
 issue only an OnCompleted or an OnError notification, or to issue only OnNext notifications.
</p><p>
 Observables must issue notifications to observers serially (not in parallel). They may issue these
 notifications from different threads, but there must be a formal <i>happens-before</i> relationship between the
 notifications.
</p>
<h2>Observable Termination</h2>
<p>
 If an Observable has not issued an OnCompleted or OnError notification, an observer may consider it to be still
 active (even if it is not currently emitting items) and may issue it notifications (such as an Unsubscribe
 or Request notification). When an Observable does issue an OnCompleted or OnError notification, the Observable
 may release its resources and terminate, and its observers should not attempt to communicate with it any
 further.
</p><p>
 Before an Observable releases its resources and terminates it must first issue either an OnCompleted or OnError
 notification to all of the observers that are subscribed to it.
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
