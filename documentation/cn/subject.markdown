---
layout: documentation
title: ReactiveX - Subject
lang: cn
id: subject
---

<h1>Subject</h1>
<p>
 Subject是一种桥接器或代理，可以在一些ReactiveX的某些实现中使用，它既充当观察者又充当事件源。因为它是一个观察者，它可以订阅一个或多个事件源，而且它又是一个事件源，它可以通过重新发送它观察到的事件来传递事件，并且它也可以发出新事件。


</p><p>
 由于一个Subject订阅一个事件源，它可以触发这个事件源开始发出事件（如果那个事件源是"冷"的--就是说，它等待有订阅才开始发出事件）。因此有这样的效果，Subject可以把原来那个"冷"的事件源变成"热"的。
</p>
<h4>参考</h4>
<ul>
 <li><a href="http://davesexton.com/blog/post/To-Use-Subject-Or-Not-To-Use-Subject.aspx">To Use or Not to Use Subject</a> from <cite>Dave Sexton&#8217;s blog</cite></li>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#Subject"><cite>Introduction to Rx</cite>: Subject</a></li>
 <li><a href="http://rxwiki.wikidot.com/101samples#toc44"><cite>101 Rx Samples</cite>: ISubject&lt;T&gt; and ISubject&lt;T1,T2&gt;</a></li>
 <li><a href="http://akarnokd.blogspot.hu/2015/06/subjects-part-1.html">Advanced RxJava: Subject</a> by Dávid Karnok</li>
 <li><a href="http://xgrommx.github.io/rx-book/content/getting_started_with_rxjs/subjects.html">Using Subjects</a> by Dennis Stoyanov</li>
</ul>
<h2>Subject的种类</h2>
<p>
 针对不同的场景一共有四种类型的<code>Subject</code>。他们并不是在所有的实现中全部都存在，而且一些实现使用其它的命名约定（例如，在RxScala中Subject被称作PublishSubject）：
</p>
<h3>AsyncSubject</h3>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.AsyncSubject.png" style="width:100%;" />
 <figcaption><p>
  一个<code>AsyncSubject</code>只在源事件源完成后，发出来自源事件源的最后一个事件。它会把这最后一个事件发出给任何后续的观察者（如果源事件源没有发出任何事件，<code>AsyncSubject</code> 也不发出任何事件）。
 </p></figcaption>
</figure>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.AsyncSubject.e.png" style="width:100%;" />
 <figcaption><p>
 然而，如果源事件源因为发生了错误而终止，<code>AsyncSubject</code>将不会发出任何事件，只是简单的传递这个错误通知。
 </p></figcaption>
</figure>
<h4>参考</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#AsyncSubject"><cite>Introduction to Rx</cite>: AsyncSubject</a></li>
</ul>
<h3>BehaviorSubject</h3>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.BehaviorSubject.png" style="width:100%;" />
 <figcaption><p>
  当观察者订阅<code>BehaviorSubject</code>时，它开始发出源事件源最近发出的事件（如果此时还没有收到任何事件，它会发出一个默认值），然后继续发出其它任何来自源事件源的事件。
 </p></figcaption>
</figure>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.BehaviorSubject.e.png" style="width:100%;" />
 <figcaption><p>
  然而，如果源事件源因为发生了一个错误而终止，<code>BehaviorSubject</code> 将不会发出任何事件，只是简单的传递这个错误通知。
 </p></figcaption>
</figure>
<h4>参考</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#BehaviorSubject"><cite>Introduction to Rx</cite>: BehaviorSubject</a></li>
</ul>
<h3>PublishSubject</h3>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.PublishSubject.png" style="width:100%;" />
 <figcaption><p>
  <code>PublishSubject</code>只会把来自源事件源的在订阅发生的时间点之后事件发出给观察者。
 </p><p>
  需要注意的是，<code>PublishSubject</code>可能会一创建完成就立刻开始发出事件（除非你可以阻止它发生），因此这里有一个风险：在Subject被创建后到有观察者订阅它之前这个时间段内，一个或多个事件可能会丢失。如果要确保来自源事件源的所有事件都被发出，你需要这样做：使用<a href="operators/create.html"><code>Create</code></a>创建那个事件源以便手动给它引入"冷"事件源的行为（当所有观察者都已经订阅时才开始发出事件），或者改用<code>ReplaySubject</code>。
 </p></figcaption>
</figure>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.PublishSubject.e.png" style="width:100%;" />
 <figcaption><p>
  如果源事件源因为发生了一个错误而终止，<code>PublishSubject</code>将不会发出任何事件，只是简单的传递这个错误通知。
 </p></figcaption>
</figure>
<h3>ReplaySubject</h3>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.ReplaySubject.png" style="width:100%;" />
 <figcaption><p>
  <code>ReplaySubject</code>会发出所有来自源事件源的事件给观察者，无论它们是何时订阅的。
 </p><p>
  也有其它版本的<code>ReplaySubject</code>，在重放缓存增长到一定大小的时候或过了一段时间后会丢弃旧的事件（源事件源发出的）。
 </p><p>
  如果你把<code>ReplaySubject</code>当作一个观察者使用，注意不要从多个线程中调用它的<code>onNext</code>方法（包括其它的<code>on</code>系列方法），这可能导致并行非有序调用，这会违反<a href="contract.html">事件源合约</a>，给Subject的重放事件活通知的结果增加了不确定性。
 </p></figcaption>
</figure>
<h4>参考</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#ReplaySubject"><cite>Introduction to Rx</cite>: ReplaySubject</a></li>
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
   <p>
    如果你有一个<code>Subject</code>并且想要将其传递给其他客户端而不暴露其<code>Subscriber</code>接口，则可以通过调用其<code>asObservable</code>方法来掩盖它，该方法将Subject返回为单纯的事件源。
   </p>
   <h4>参考</h4>
   <ul>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/AsyncSubject.html"><code>AsyncSubject</code></a></li>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/BehaviorSubject.html"><code>BehaviorSubject</code></a></li>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/PublishSubject.html"><code>PublishSubject</code></a></li>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/ReplaySubject.html"><code>ReplaySubject</code></a></li>
   </ul>
  {% endlang_operator %}

  {% lang_operator RxJava&nbsp;1․x %}
   <p>
    如果你有一个<code>Subject</code>并且想要将其传递给其他客户端而不暴露其<code>Subscriber</code>接口，则可以通过调用其<code>asObservable</code>方法来掩盖它，该方法将Subject返回为单纯的事件源。
   </p>
   <h4>参考</h4>
   <ul>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/AsyncSubject.html"><code>AsyncSubject</code></a></li>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/BehaviorSubject.html"><code>BehaviorSubject</code></a></li>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/PublishSubject.html"><code>PublishSubject</code></a></li>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/ReplaySubject.html"><code>ReplaySubject</code></a></li>
   </ul>
  {% endlang_operator %}

  {% lang_operator RxJS %}
    <p>
     <span style="color:#f00">待定</span>
    </p>
    <h4>参考</h4>
    <ul>
     <li><a href="http://xgrommx.github.io/rx-book/content/subjects/index.html">Subjects</a> by Denis Stoyanov</li>
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
    <h4>参考</h4>
    <ul>
     <li>Reactive Extensions: <a href="http://msdn.microsoft.com/en-us/library/hh229363.aspx"><code>AsyncSubject</code></a></li>
     <li>Reactive Extensions: <a href="http://msdn.microsoft.com/en-us/library/hh211949.aspx"><code>BehaviorSubject</code></a></li>
     <li>Reactive Extensions: <a href="http://msdn.microsoft.com/en-us/library/hh211810.aspx"><code>ReplaySubject</code></a></li>
    </ul>
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
