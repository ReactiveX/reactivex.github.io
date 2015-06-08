---
layout: documentation
title: ReactiveX - Subject
id: subject
---

<h1>Subject</h1>
<p>
 A Subject is a sort of bridge or proxy that is available in some implementations of ReactiveX that acts both as
 an observer and as an Observable. Because it is an observer, it can subscribe to one or more Observables, and
 because it is an Observable, it can pass through the items it observes by reemitting them, and it can also emit
 new items.
</p><p>
 Because a Subject subscribes to an Observable, it will trigger that Observable to begin emitting items (if that
 Observable is “cold” — that is, if it waits for a subscription before it begins to emit items). This can have
 the effect of making the resulting Subject a “hot” Observable variant of the original “cold” Observable.
</p>
<h4>See Also</h4>
<ul>
 <li><a href="http://davesexton.com/blog/post/To-Use-Subject-Or-Not-To-Use-Subject.aspx">To Use or Not to Use Subject</a> from <cite>Dave Sexton&#8217;s blog</cite></li>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#Subject"><cite>Introduction to Rx</cite>: Subject</a></li>
 <li><a href="http://rxwiki.wikidot.com/101samples#toc44"><cite>101 Rx Samples</cite>: ISubject&lt;T&gt; and ISubject&lt;T1,T2&gt;</a></li>
</ul>
<h2>Varieties of Subject</h2>
<p>
 There are four varieties of <code>Subject</code> that are designed for particular use cases. Not all of these
 are available in all implementations, and some implementations use other naming conventions (for example, in
 RxScala, what is called a “PublishSubject” here is known simply as a “Subject”):
</p>
<h3>AsyncSubject</h3>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.AsyncSubject.png" style="width:100%;" />
 <figcaption><p>
  An <code>AsyncSubject</code> emits the last value (and only the last value) emitted by the source Observable,
  and only after that source Observable completes. (If the source Observable does not emit any values, the
  <code>AsyncSubject</code> also completes without emitting any values.)
 </p></figcaption>
</figure>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.AsyncSubject.e.png" style="width:100%;" />
 <figcaption><p>
  It will also emit this same final value to any subsequent observers. However, if the source Observable
  terminates with an error, the <code>AsyncSubject</code> will not emit any items, but will simply pass along
  the error notification from the source Observable.
 </p></figcaption>
</figure>
<h4>See Also</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#AsyncSubject"><cite>Introduction to Rx</cite>: AsyncSubject</a></li>
</ul>
<h3>BehaviorSubject</h3>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.BehaviorSubject.png" style="width:100%;" />
 <figcaption><p>
  When an observer subscribes to a <code>BehaviorSubject</code>, it begins by emitting the item most recently
  emitted by the source Observable (or a seed/default value if none has yet been emitted) and then continues to
  emit any other items emitted later by the source Observable(s).
 </p></figcaption>
</figure>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.BehaviorSubject.e.png" style="width:100%;" />
 <figcaption><p>
  However, if the source Observable terminates with an error, the <code>BehaviorSubject</code> will not emit any
  items to subsequent observers, but will simply pass along the error notification from the source Observable.
 </p></figcaption>
</figure>
<h4>See Also</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#BehaviorSubject"><cite>Introduction to Rx</cite>: BehaviorSubject</a></li>
</ul>
<h3>PublishSubject</h3>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.PublishSubject.png" style="width:100%;" />
 <figcaption><p>
  <code>PublishSubject</code> emits to an observer only those items that are emitted by the source Observable(s)
  subsequent to the time of the subscription.
 </p><p>
  Note that a <code>PublishSubject</code> may begin emitting items immediately upon creation (unless you have
  taken steps to prevent this), and so there is a risk that one or more items may be lost between the time the
  Subject is created and the observer subscribes to it. If you need to guarantee delivery of all items from the
  source Observable, you&#8217;ll need either to form that Observable with
  <a href="operators/create.html"><code>Create</code></a> so that you can manually reintroduce “cold” Observable
  behavior (checking to see that all observers have subscribed before beginning to emit items), or switch to
  using a <code>ReplaySubject</code> instead.
 </p></figcaption>
</figure>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.PublishSubject.e.png" style="width:100%;" />
 <figcaption><p>
  If the source Observable terminates with an error, the <code>PublishSubject</code> will not emit any items to
  subsequent observers, but will simply pass along the error notification from the source Observable.
 </p></figcaption>
</figure>
<h3>ReplaySubject</h3>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.ReplaySubject.png" style="width:100%;" />
 <figcaption><p>
  <code>ReplaySubject</code> emits to any observer all of the items that were emitted by the source
  Observable(s), regardless of when the observer subscribes.
 </p><p>
  There are also versions of <code>ReplaySubject</code> that will throw away old items once the replay buffer
  threatens to grow beyond a certain size, or when a specified timespan has passed since the items were
  originally emitted.
 </p><p>
  If you use a <code>ReplaySubject</code> as an observer, take care not to call its <code>onNext</code> method
  (or its other <code>on</code> methods) from multiple threads, as this could lead to coincident
  (non-sequential) calls, which violates the Observable contract and creates an ambiguity in the resulting
  Subject as to which item or notification should be replayed first.
 </p></figcaption>
</figure>
<h4>See Also</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#ReplaySubject"><cite>Introduction to Rx</cite>: ReplaySubject</a></li>
</ul>


<h2>Language-Specific Information:</h2>

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
   <p>
    If you have a <code>Subject</code> and you want to pass it along to some other agent without exposing its
    <code>Subscriber</code> interface, you can mask it by calling its <code>asObservable</code> method, which
    will return the Subject as a pure <code>Observable</code>.
   </p>
   <h4>See Also</h4>
   <ul>
    <li>Javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/subjects/AsyncSubject.html"><code>AsyncSubject</code></a></li>
    <li>Javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/subjects/BehaviorSubject.html"><code>BehaviorSubject</code></a></li>
    <li>Javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/subjects/PublishSubject.html"><code>PublishSubject</code></a></li>
    <li>Javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/subjects/ReplaySubject.html"><code>ReplaySubject</code></a></li>
   </ul>
  {% endlang_operator %}

  {% lang_operator RxJava %}
   <p>
    If you have a <code>Subject</code> and you want to pass it along to some other agent without exposing its
    <code>Subscriber</code> interface, you can mask it by calling its <code>asObservable</code> method, which
    will return the Subject as a pure <code>Observable</code>.
   </p>
   <h4>See Also</h4>
   <ul>
    <li>Javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/subjects/AsyncSubject.html"><code>AsyncSubject</code></a></li>
    <li>Javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/subjects/BehaviorSubject.html"><code>BehaviorSubject</code></a></li>
    <li>Javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/subjects/PublishSubject.html"><code>PublishSubject</code></a></li>
    <li>Javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/subjects/ReplaySubject.html"><code>ReplaySubject</code></a></li>
   </ul>
  {% endlang_operator %}

  {% lang_operator RxJS %}
    <p>
     <span style="color:#f00">TBD</span>
    </p>
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
    <h4>See Also</h4>
    <ul>
     <li>Reactive Extensions: <a href="http://msdn.microsoft.com/en-us/library/hh229363.aspx"><code>AsyncSubject</code></a></li>
     <li>Reactive Extensions: <a href="http://msdn.microsoft.com/en-us/library/hh211949.aspx"><code>BehaviorSubject</code></a></li>
     <li>Reactive Extensions: <a href="http://msdn.microsoft.com/en-us/library/hh211810.aspx"><code>ReplaySubject</code></a></li>
    </ul>
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
