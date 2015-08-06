---
layout: documentation
title: ReactiveX - The Observable Contract
id: contract
---

<h1>The Observable Contract</h1>
<p>
 &ldquo;The Observable Contract,&rdquo; which you may see referred to in various places in source documentation
 and in the pages on this site, is an attempt at a formal definition of an Observable, based originally on the
 2010 document <a href="https://go.microsoft.com/fwlink/?LinkID=205219"><cite>Rx Design Guidelines</cite></a>
 from Microsoft that described its Rx.NET implementation of ReactiveX.
</p><p>
 This page summarizes The Observable Contract.
</p>
<h2>Notifications from an Observable</h2>
<p>
 An Observable may emit zero or more items with one OnNext notification per item, and may then follow those
 emission notifications by either an OnCompleted or an OnError notification, but not both. Upon issuing an
 OnCompleted or OnError notification, it may not thereafter issue any further notifications.
</p><p>
 An Observable may emit no items at all.  An Observable may also never terminate with either an OnCompleted or
 an OnError notification.  That is to say that it is proper for an Observable to issue no notifications, to
 issue only an OnCompleted or an OnError notification, or to issue only OnNext notifications.
</p><p>
 Observables must send notifications serially, in a single thread, and not in parallel.
</p>
<h2>Subscribing and Unsubscribing</h2>
<p>
 An Observable may begin sending notifications to an observer immediately after the Observable receives a
 Subscribe notification from the observer.
</p><p>
 When an observer sends an Unsubscribe notification to an Observable, the Observable will attempt to stop
 sending notifications to the observer. It is not guaranteed, however, that the Observable will send <em>no</em>
 notifications to the observer after an observer sends it an Unsubscribe notification.
</p>
