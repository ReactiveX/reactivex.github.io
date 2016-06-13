---
layout: documentation
title: ReactiveX - Subject
id: subject
---

<h1>주제</h1>
<p>
 주제(subject)는 옵저버 그리고 Observable 처럼 행동하는 ReactiveX의 일부 구현체에서 사용 가능한 일종의 교각 혹은 프록시라고 볼 수 있는데, 그 이유는 주제는 옵저버이기 때문에 하나 이상의 Observable을 구독할 수 있으며 동시에 Observable이기도 하기 때문에 항목들을 하나 하나 거치면서 재배출하고 관찰하며 새로운 항목들을 배출할 수도 있다.
</p>
<p>
 하나의 주제는 하나의 Observable을 구독하면서, (Observable이 "차가운" Observable인 경우 즉, 옵저버가 구독을 시작하기 전까지 항목들의 배출을 지연시키는 Observable일 경우)Observable이 항목들을 배출시키도록 동작시킨다.
 그 결과로 인해 원래는 "차가운" Observable이었던 주제를 "뜨거운" Observable로 만들기도 한다.
</p>
<h4>참고</h4>
<ul>
 <li><a href="http://davesexton.com/blog/post/To-Use-Subject-Or-Not-To-Use-Subject.aspx">To Use or Not to Use Subject</a> from <cite>Dave Sexton&#8217;s blog</cite></li>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#Subject"><cite>Introduction to Rx</cite>: Subject</a></li>
 <li><a href="http://rxwiki.wikidot.com/101samples#toc44"><cite>101 Rx Samples</cite>: ISubject&lt;T&gt; and ISubject&lt;T1,T2&gt;</a></li>
 <li><a href="http://akarnokd.blogspot.hu/2015/06/subjects-part-1.html">Advanced RxJava: Subject</a> by Dávid Karnok</li>
 <li><a href="http://xgrommx.github.io/rx-book/content/getting_started_with_rxjs/subjects.html">Using Subjects</a> by Dennis Stoyanov</li>
</ul>
<h2>주제의 종류</h2>
<p>
 모두 4 종류의 <code>Subject</code>가 존재하며, 각각의 Subject는 특정 상황에 맞게 설계되었다. 그렇기 때문에 모든 상황에서 아무 주제(Subject)나 임의대로 사용할 수 없으며 일부 구현체는 주제를 다른 이름을 부르기도 한다(예를 들어, RxScala는 "주제(Subject)"를 "발행주제(PublishSubject)"로 부른다).
</p>
<h3>AysncSubject</h3>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.AsyncSubject.png" style="width:100%;" />
 <figcaption>
 <p>
  <code>AsyncSubject</code>는 소스 Observable로부터 배출된 마지막 값(만) 배출하며 소스 Observalbe의 동작이 완료된 후에야 동작한다. (만약, 소스 Observable이 아무 값도 배출하지 않으면 <code>AsyncSubject</code> 역시 아무 값도 배출하지 않는다.)
 </p>
</figcaption>
</figure>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.AsyncSubject.e.png" style="width:100%;" />
 <figcaption>
 <p>
  또한 <code>AsyncSubject</code>는 맨 마지막 값을 뒤 이어 오는 옵저버에 전달하는데, 만약 소스 Observable이 오류로 인해 종료될 경우 <code>AsyncSubject</code>는 아무 항목도 배출하지 않고 발생한 오류를 그대로 전달한다.
 </p></figcaption>
</figure>
<h4>참고</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#AsyncSubject"><cite>Introduction to Rx</cite>: AsyncSubject</a></li>
</ul>
<h3>BehaviorSubject</h3>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.BehaviorSubject.png" style="width:100%;" />
 <figcaption>
 <p>
  옵저버가 <code>BehaviorSubject</code>의 구독을 시작하면, 옵저버는 소스 Observable이 가장 최근에 발행한 항목(또는 아직 아무 값도 발행되지 않았다면 맨 처음 값이나 기본 값)의 발행을 시작하며 그 이후 소스 Observable(들)에 의해 발행된 항목들을 계속 발행한다.
 </p></figcaption>
</figure>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.BehaviorSubject.e.png" style="width:100%;" />
 <figcaption>
 <p>
  만약, 소스 Observable이 오류 때문에 종료되면 <code>BehaviorSubject</code>는 아무런 항목도 배출하지 않고 소스 Observable에서 발생한 오류를 그대로 전달한다.
 </p></figcaption>
</figure>
<h4>참고</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#BehaviorSubject"><cite>Introduction to Rx</cite>: BehaviorSubject</a></li>
</ul>
<h3>PublishSubject</h3>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.PublishSubject.png" style="width:100%;" />
 <figcaption>
 <p>
  <code>PublishSubject</code>는 구독 이후에 소스 Observable(들)이 배출한 항목들만 옵저버에게 배출한다.
 </p>
 <p>
  주의할 점은, <code>PublishSubject</code>는 (이를 막지 않는 이상) 생성 시점에서 즉시 항목들을 배출하기 시작할 것이고 이런 특성 때문에 주제가 생성되는 시점과 옵저버가 이 주제를 구독하기 시작하는 그 사이에 배출되는 항목들을 잃어 버릴 수 있다는 단점이 있다. 따라서, 소스 Observable이 배출하는 모든 항목들의 배출을 보장해야 한다면 <a href="operators/create.html"><code>Create</code></a>을 사용해서 명시적으로 "차가운" Observable(항목들을 배출하기 전에 모든 옵저버가 구독을 시작했는지 체크한다)을 생성하거나, PublishSubject 대신 <code>ReplaySubject</code>를 사용해야 한다.
 </p>
 </figcaption>
</figure>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.PublishSubject.e.png" style="width:100%;" />
 <figcaption>
 <p>
  만약, 소스 Observable이 오류 때문에 종료되면 <code>BehaviorSubject</code>는 아무런 항목도 배출하지 않고 소스 Observable에서 발생한 오류를 그대로 전달한다.
 </p></figcaption>
</figure>
<h3>ReplaySubject</h3>
<figure>
 <img src="{{ site.url }}/documentation/operators/images/S.ReplaySubject.png" style="width:100%;" />
 <figcaption>
 <p>
  <code>ReplaySubject</code>는 옵저버가 구독을 시작한 시점과 관계 없이 소스 Observable(들)이 배출한 모든 항목들을 모든 옵저버에게 배출한다.
 </p>
 <p>
  <code>ReplaySubject</code>는 몇 개의 생성자 오버로드를 제공하는데 이를 통해, 재생 버퍼의 크기가 특정 이상으로 증가할 경우, 또는 처음 배출 이후 지정한 시간이 경과할 경우 오래된 항목들을 제거한다.
 </p>
 <p>
  만약, <code>ReplaySubject</code>을 옵저버로 사용할 경우, 멀티 스레드 환경에서는 <a href="../contract.html">Observable 계약</a> 위반과 주제에서 어느 항목 또는 알림을 먼저 재생해야 하는지 알 수 없는 모호함이 동시에 발생할 수 있기 때문에 (비순차적) 호출을 유발시키는 <code>onNext</code>(또는 그 외 <code>on</code>) 메서드를 사용하지 않도록 주의해야 한다.
 </p></figcaption>
</figure>
<h4>참고</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#ReplaySubject"><cite>Introduction to Rx</cite>: ReplaySubject</a></li>
</ul>

<h2>언어 별 명세:</h2>

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
    만약, <code>Subject</code>를 정의했는데, 이를 <code>Subscriber</code> 인터페이스 없이 다른 에이전트에 전달하고 싶다면 그 Subject를 순수 <code>Observable</code>로 리턴하는 <code>asObservable</code> 메서드를 사용하면 된다.
   </p>
   <h4>참고</h4>
   <ul>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/AsyncSubject.html"><code>AsyncSubject</code></a></li>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/BehaviorSubject.html"><code>BehaviorSubject</code></a></li>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/PublishSubject.html"><code>PublishSubject</code></a></li>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/ReplaySubject.html"><code>ReplaySubject</code></a></li>
   </ul>
  {% endlang_operator %}

  {% lang_operator RxJava %}
   <p>
    만약, <code>Subject</code>를 정의했는데, 이를 <code>Subscriber</code> 인터페이스 없이 다른 에이전트에 전달하고 싶다면 그 Subject를 순수 <code>Observable</code>로 리턴하는 <code>asObservable</code> 메서드를 사용하면 된다.
   </p>
   <h4>참고</h4>
   <ul>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/AsyncSubject.html"><code>AsyncSubject</code></a></li>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/BehaviorSubject.html"><code>BehaviorSubject</code></a></li>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/PublishSubject.html"><code>PublishSubject</code></a></li>
    <li>Javadoc: <a href="http://reactivex.io/RxJava/javadoc/rx/subjects/ReplaySubject.html"><code>ReplaySubject</code></a></li>
   </ul>
  {% endlang_operator %}

  {% lang_operator RxJS %}
    <p>
     <span style="color:#f00">TBD</span>
    </p>
    <h4>참고</h4>
    <ul>
     <li><a href="http://xgrommx.github.io/rx-book/content/subjects/index.html">Subjects</a> by Denis Stoyanov</li>
    </ul>
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
    <h4>참고</h4>
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
