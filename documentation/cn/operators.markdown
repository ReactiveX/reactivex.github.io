---
layout: documentation
title: ReactiveX - Operators
lang: cn
id: operators
---

<h1>介绍</h1>

ReactiveX的每个语言特定的实现都提供了一些操作符。 其中一些是共同提供的，但也有一些操作符仅在某些语言实现中提供。此外，每个语言实现都倾向于将其操作符命名为类似于该语言中其他上下文已熟悉的命名约定。

<h2>链接操作符</h2>

大多数操作符都在事件源上操作并返回一个事件源。这使我们可以在链中一个接一个地应用这些操作符。链中的每个操作符都会处理由前一个操作符的操作产生的事件源。

区别其他模式，如Builder模式，该模式使用特定类的各种方法通过方法的操作修改该对象，对同一类的项进行操作。这些模式允许以类似的方式链接方法。但是在Builder模式中，方法在链中出现的顺序通常并不重要，事件源的操作符<em>顺序很重要</em>。

一条链上的操作符不是单独的在原始的事件源上操作的，是依次在调用链被调用，每个操作符操作的事件源都由前一个操作符生成。

<h2>ReactiveX的操作符</h2>

此页面首先列出了ReactiveX中被视为&ldquo;核心&rdquo;操作符的内容，以及指向更深入信息页面的链接，这些页面有关于这些操作符如何工作以及特定语言特定ReactiveX版本如何实现这些操作符。

接下来是一个&ldquo;决策树&rdquo;，可以帮助找到最适合的用例的操作符。

最后，有一个按字母排列的大多数语言特定的实现中常见的ReactiveX操作符列表。这些链接指向对应核心操作符的页面，该核心操作符指最类似于特定于语言的操作符（例如，Rx.NET&ldquo;SelectMany&rdquo;操作符链接到<span class="operator">FlatMap</span>ReactiveX操作符的文档，其中&ldquo;SelectMany&rdquo;是Rx.NET实现）。

如果要实现自己的操作符，请参阅<a href="implement-operator.html">实现操作符</a>.

<h4>内容</h4> 
<ol>
 <li><a href="#categorized">操作符分类</a></li>
 <li><a href="#tree">操作符决策树</a></li>
 <li><a href="#alphabetical">按字母排序的操作符列表</a></li>
</ol>

<h1 id="categorized">操作符分类</h1>

<h2 id="creating">创建事件源</h2>

创建新事件源的操作符。

* [**`Create`**]({{ site.url }}/documentation/operators/create.html) — 通过调用观察者的方法从无到有创建一个事件源
* [**`Defer`**]({{ site.url }}/documentation/operators/defer.html) — 在观察者订阅之前不会创建事件源，并为每个观察者创建一个新的事件源
* [**`Empty`/`Never`/`Throw`**]({{ site.url }}/documentation/operators/empty-never-throw.html) —  创建具有非常明确和有限行为的事件源
* [**`From`**]({{ site.url }}/documentation/operators/from.html) — 将一些其他对象或数据结构转换为事件源
* [**`Interval`**]({{ site.url }}/documentation/operators/interval.html) —  创建一个事件源，它以给定的时间间隔发出一系列整数
* [**`Just`**]({{ site.url }}/documentation/operators/just.html) — 将对象或一组对象转换为发出该对象或那些对象的事件源
* [**`Range`**]({{ site.url }}/documentation/operators/range.html) — 创建一个事件源，它发出一系列连续的整数
* [**`Repeat`**]({{ site.url }}/documentation/operators/repeat.html) — 创建一个事件源，重复发出特定事件或事件序列
* [**`Start`**]({{ site.url }}/documentation/operators/start.html) — 创建一个发出函数返回值的事件源
* [**`Timer`**]({{ site.url }}/documentation/operators/timer.html) — 创建一个事件源，在给定的延迟后发出单个事件

<h2 id="transforming">转换事件源</h2>

转换事件源发出的事件的操作符。

* [**`Buffer`**]({{ site.url }}/documentation/operators/buffer.html) — 周期性的将事件源发出的事件收集成捆并发出这些捆绑事件，而不是一次发送一个事件
* [**`FlatMap`**]({{ site.url }}/documentation/operators/flatmap.html) — 将事件源发出的事件转换为多个事件源，然后将这事件的依次发出
* [**`GroupBy`**]({{ site.url }}/documentation/operators/groupby.html) —  将一个事件源根据不同的事件按key划分为一组事件源
* [**`Map`**]({{ site.url }}/documentation/operators/map.html) — 每个事件源发出的事件通过将函数处理后在发出
* [**`Scan`**]({{ site.url }}/documentation/operators/scan.html) — 依次的用聚合函数处理事件源发出的事件, 并发出每个连续的值
* [**`Window`**]({{ site.url }}/documentation/operators/window.html) — 将事件源中的事件周期性划分为事件源窗口并发出这些窗口，而不是一次发出一个事件

<h2 id="filtering">过滤事件源</h2>

从源事件源有选择地发出事件的操作符。

* [**`Debounce`**]({{ site.url }}/documentation/operators/debounce.html) — 如果特定的时间跨度已经过去而没有发出另一个事件则从事件源发出一个事件
* [**`Distinct`**]({{ site.url }}/documentation/operators/distinct.html) — 对事件源发出的事件去重
* [**`ElementAt`**]({{ site.url }}/documentation/operators/elementat.html) — 仅从事件源发出位置<i>n</i>的事件
* [**`Filter`**]({{ site.url }}/documentation/operators/filter.html) —  仅发出通过断言正确的事件源中的那些事件
* [**`First`**]({{ site.url }}/documentation/operators/first.html) — 从事件源中仅发出第一个事件或满足条件的第一个事件
* [**`IgnoreElements`**]({{ site.url }}/documentation/operators/ignoreelements.html) — 不从事件源中发出任何事件，但要反馈其终止通知
* [**`Last`**]({{ site.url }}/documentation/operators/last.html) — 仅发出事件源发出的最后一哥事件
* [**`Sample`**]({{ site.url }}/documentation/operators/sample.html) — 在固定的时间间隔采样事件源最靠近的事件发出
* [**`Skip`**]({{ site.url }}/documentation/operators/skip.html) — 跳过事件源发出的前<i>n</i>个事件
* [**`SkipLast`**]({{ site.url }}/documentation/operators/skiplast.html) — 跳过事件源发出的最后<i>n</i>个事件
* [**`Take`**]({{ site.url }}/documentation/operators/take.html) — 仅从事件源发出的前<i>n</i>个事件
* [**`TakeLast`**]({{ site.url }}/documentation/operators/takelast.html) — 仅从事件源发出的最后<i>n</i>个事件

<h2 id="combining">合并事件源</h2>

通过合并多个源事件源创建一个事件源的操作符。

* [**`And`/`Then`/`When`**]({{ site.url }}/documentation/operators/and-then-when.html) — 使用`Pattern`和`Plan`中介组合两个或多个事件源发出的事件
* [**`CombineLatest`**]({{ site.url }}/documentation/operators/combinelatest.html) — 当两个事件源中的任何一个发出一个事件时，通过指定的函数组合每个事件源发出的最新事件并发出
* [**`Join`**]({{ site.url }}/documentation/operators/join.html) — 在另一个事件源发出的事件定义的时间窗口期间发出一个事件源中的事件，组合两个事件源发出的事件
* [**`Merge`**]({{ site.url }}/documentation/operators/merge.html) — 合并发送的事件来合并多个事件源为一个
* [**`StartWith`**]({{ site.url }}/documentation/operators/startwith.html) — 在开始从源事件源发出事件之前，先发出指定的事件序列
* [**`Switch`**]({{ site.url }}/documentation/operators/switch.html) —  将发出多个事件源转换为单个事件源，该事件源发出多个事件源中最近发出的事件
* [**`Zip`**]({{ site.url }}/documentation/operators/zip.html) — 通过指定的函数将多个事件源的发出的事件排放组合在一起并发出

<h2 id="error">错误处理操作符</h2>

有助于捕获事件源的错误通知的操作符。

* [**`Catch`**]({{ site.url }}/documentation/operators/catch.html) — 捕获`onError`通知，已无错误继续发送之后的序列
* [**`Retry`**]({{ site.url }}/documentation/operators/retry.html) — 如果源事件源发出`onError`通知， 则重新订阅它，希望它能完成而不会出错

<h2 id="utility">公共操作符</h2>

用于处理事件源的有用操作符的集合。

* [**`Delay`**]({{ site.url }}/documentation/operators/delay.html) — 事件源延迟指定时间发出事件
* [**`Do`**]({{ site.url }}/documentation/operators/do.html) — 注册要对事件源生命周期中发生的各种事件执行的操作
* [**`Materialize`/`Dematerialize`**]({{ site.url }}/documentation/operators/materialize-dematerialize.html) — 发出表达事件源发出的事件（通知）类型，和逆操作
* [**`ObserveOn`**]({{ site.url }}/documentation/operators/observeon.html) — 指定观察者将观察此事件源的调度程序
* [**`Serialize`**]({{ site.url }}/documentation/operators/serialize.html) — 强制事件源进行序列化调用并保持良好行为和同步
* [**`Subscribe`**]({{ site.url }}/documentation/operators/subscribe.html) — 根据事件源的发出的事件或通知进行操作
* [**`SubscribeOn`**]({{ site.url }}/documentation/operators/subscribeon.html) — 指定事件源在订阅时应使用的调度器
* [**`TimeInterval`**]({{ site.url }}/documentation/operators/timeinterval.html) — 将发出事件的事件源转换为发出这些事件之间的时间间隔
* [**`Timeout`**]({{ site.url }}/documentation/operators/timeout.html) — 镜像源事件源，但如果在指定时间段内没有任何发出的事件，则发出错误通知
* [**`Timestamp`**]({{ site.url }}/documentation/operators/timestamp.html) — 为事件源发出的每个事件附加时间戳
* [**`Using`**]({{ site.url }}/documentation/operators/using.html) — 创建与事件源具有相同生命周期的可支配资源

<h2 id="conditional">条件操作符</h2>

评估事件源发出的一个或多个事件源或事件的操作符。

* [**`All`**]({{ site.url }}/documentation/operators/all.html) — 确定事件源发出的所有事件是否符合某些条件
* [**`Amb`**]({{ site.url }}/documentation/operators/amb.html) — 给定两个或多个源事件源，仅从第一个发出事件或通知的事件源中发出所有事件
* [**`Contains`**]({{ site.url }}/documentation/operators/contains.html) — 确定事件源是否发出指定项目
* [**`DefaultIfEmpty`**]({{ site.url }}/documentation/operators/defaultifempty.html) — 如果源事件源不发出任何内容，则发出默认事件
* [**`SequenceEqual`**]({{ site.url }}/documentation/operators/sequenceequal.html) — 确定两个事件源是否发出相同的事件序列
* [**`SkipUntil`**]({{ site.url }}/documentation/operators/skipuntil.html) — 丢弃事件源发出的事件，直到第二个事件源发出事件为止
* [**`SkipWhile`**]({{ site.url }}/documentation/operators/skipwhile.html) — 丢弃事件源发出的事件，直到指定的条件变为false
* [**`TakeUntil`**]({{ site.url }}/documentation/operators/takeuntil.html) — 在第二个事件源发出事件或终止后，丢弃事件源发出的事件
* [**`TakeWhile`**]({{ site.url }}/documentation/operators/takewhile.html) — 在指定条件变为false后丢弃事件源发出的事件

<h2 id="mathematical">算术操作符</h2>

对事件源发出的整个事件序列进行算术运算的操作符

* [**`Average`**]({{ site.url }}/documentation/operators/average.html) — 计算事件源发出的数字的平均值并发出此数值
* [**`Concat`**]({{ site.url }}/documentation/operators/concat.html) — 无交叉的拼接两个或多个事件源发出的事件
* [**`Count`**]({{ site.url }}/documentation/operators/count.html) — 计算源事件源发出的事件数并发出此数值
* [**`Max`**]({{ site.url }}/documentation/operators/max.html) — 计算事件源发出的数字的最大值并发出此数值
* [**`Min`**]({{ site.url }}/documentation/operators/min.html) — 计算事件源发出的数字的最小值并发出此数值
* [**`Reduce`**]({{ site.url }}/documentation/operators/reduce.html) — 相继的用函数处理事件源发出的事件, 并发出最终的值
* [**`Sum`**]({{ site.url }}/documentation/operators/sum.html) — 计算事件源发出的数字的和并发出此数值

<h2 id="backpressure">背压（backpressure) 操作符</h2>

* [**backpressure operators**]({{ site.url }}/documentation/operators/backpressure.html) — 当事件源比观察者消耗速度更快的发出事件时的应对策略

<h2 id="connectable">连接操作符</h2>

精确控制的订阅动态的特殊事件源。

* [**`Connect`**]({{ site.url }}/documentation/operators/connect.html) — 指示可连接的事件源开始向其观察者发出事件
* [**`Publish`**]({{ site.url }}/documentation/operators/publish.html) — 将普通的事件源转换为可连接的事件源
* [**`RefCount`**]({{ site.url }}/documentation/operators/refcount.html) — 使可连接事件源的行为类似于普通的事件源
* [**`Replay`**]({{ site.url }}/documentation/operators/replay.html) — 确保所有观察者都看到相同的事件序列，即使他们在事件源开始发出事件后订阅

<h2 id="conversion">转换操作符</h2>

* [**`To`**]({{ site.url }}/documentation/operators/to.html) — 将事件源转换为另一种对象或数据结构

<div id="tree">
<style>
   div#tree dl { margin-top: 0;
                 margin-bottom: 1.5em;
                 margin-left: 1.5em; }
   div#tree dl#outer>dt { font-weight: bold;
                          margin-right: -1.5em;
                          margin-top: .5em; }
   div#tree dl#outer>dd { margin-top: .5em; }
   div#tree dt { font-weight: normal;
                 margin-right: -1.5em; }
   div#tree dl > dt::before { content: "…"; }
   div#tree dl#outer > dt::before { content: ""; }
   div#tree dd::before { content: ": "; }
   div#tree dd.sub::before { content: ""; }

   div#tree dt { float: left; clear: left; }
   div#tree dd { float: left;
                 margin-start: 0;
                 -webkit-margin-start: 0;
                 margin-left: 1.5em; }
   div#tree dd.sub { float: none;
                     margin-left: 0; }
</style>
  <h1>操作符决策树</h1>
  <p>
   此树可以帮助找到所需的ReactiveX事件源操作符。
  </p>
<dl id="outer">
 <dt>想创建一个新的事件源</dt>
  <dd class="sub"><dl>
   <dt>发出指定事件</dt>
    <dd><a href="operators/just.html">Just</a></dd>
    <dd class="sub"><dl>
     <dt>事件是订阅调用后从方法返回</dt>
      <dd><a href="operators/start.html">Start</a></dd>
     <dt>事件是订阅调用后从<code>Action</code>、<code>Callable</code>、<code>Runnable</code>或一些有序对象返回</dt>
      <dd><a href="operators/from.html">From</a></dd>
     <dt>在指定延迟后</dt>
      <dd><a href="operators/timer.html">Timer</a></dd>
     </dl></dd>
   <dt>从<code>Array</code>、<code>Iterable</code>或类似的地方拉取要发出的事件</dt>
    <dd><a href="operators/from.html">From</a></dd>
   <dt>从Future获取它</dt>
    <dd><a href="operators/start.html">Start</a></dd>
   <dt>从Future获取序列</dt>
    <dd><a href="operators/from.html">From</a></dd>
   <dt>重复发出特定事件或事件序列</dt>
    <dd><a href="operators/repeat.html">Repeat</a></dd>
   <dt>从无到有使用自定义逻辑</dt>
    <dd><a href="operators/create.html">Create</a></dd>
   <dt>为每个要订阅的观察者</dt>
    <dd><a href="operators/defer.html">Defer</a></dd>
   <dt>发出一系列连续的整数</dt>
    <dd><a href="operators/range.html">Range</a></dd>
    <dd class="sub"><dl>
     <dt>以指定时间间隔</dt>
      <dd><a href="operators/interval.html">Interval</a></dd>
      <dd class="sub"><dl>
       <dt>在指定延迟后</dt>
       <dd><a href="operators/timer.html">Timer</a></dd>
      </dl></dd>
    </dl></dd>
   <dt>直接完成而不发出事件</dt>
    <dd><a href="operators/empty-never-throw.html">Empty</a></dd>
   <dt>什么都不做</dt>
    <dd><a href="operators/empty-never-throw.html">Never</a></dd>
  </dl></dd>

 <dt>想通过组合其他事件源来创建一个事件源</dt>
  <dd class="sub"><dl>
   <dt>并按照收到的顺序从所有事件源中发出所有事件</dt>
    <dd><a href="operators/merge.html">Merge</a></dd>
   <dt>从所有的事件源中发出所有事件，一次一个事件源</dt>
    <dd><a href="operators/concat.html">Concat</a></dd>
   <dt>通过顺序组合来自两个或多个事件源的事件来发出的新事件</dt>
    <dd class="sub"><dl>
     <dt>当<em>每个</em>事件源发出新的事件</dt>
      <dd><a href="operators/zip.html">Zip</a></dd>
     <dt>当<em>任何一个</em>事件源发出新的事件</dt>
      <dd><a href="operators/combinelatest.html">CombineLatest</a></dd>
     <dt>在另一个事件源发出的事件定义的时间窗口期间发出一个事件源中的事件</dt>
      <dd><a href="operators/join.html">Join</a></dd>
     <dt>使用<code>Pattern</code>和<code>Plan</code>中介组合</dt>
      <dd><a href="operators/and-then-when.html">And/Then/When</a></dd>
    </dl></dd>
   <dt>发出多个事件源中最近发出的事件</dt>
    <dd><a href="operators/switch.html">Switch</a></dd>
  </dl></dd>

 <dt>想转换事件源发出的事件</dt>
  <dd class="sub"><dl>
   <dt>一个一个使用函数处理</dt>
    <dd><a href="operators/map.html">Map</a></dd>
   <dt>转换为事件对应的事件源</dt>
    <dd><a href="operators/flatmap.html">FlatMap</a></dd>
    <dd class="sub"><dl>
     <dt>按顺序一次一个事件源</dt>
      <dd><a href="operators/flatmap.html">ConcatMap</a></dd>
    </dl></dd>
   <dt>基于之前所以的事件</dt>
    <dd><a href="operators/scan.html">Scan</a></dd>
   <dt>附加上时间戳</dt>
    <dd><a href="operators/timestamp.html">Timestamp</a></dd>
   <dt>转换为发出这些事件之间的时间间隔</dt>
    <dd><a href="operators/timeinterval.html">TimeInterval</a></dd>
  </dl></dd>

 <dt>想延迟指定时间发出事件</dt>
  <dd><a href="operators/delay.html">Delay</a></dd>

 <dt>想将事件源发出的事件<em>和</em>通知转换为事件并重新发出</dt>
  <dd class="sub"><dl>
   <dt>把其包裹在<code>通知</code>对象中</dt>
    <dd><a href="operators/materialize-dematerialize.html">Materialize</a></dd>
    <dd class="sub"><dl>
     <dt>当要重新解包恢复时</dt>
      <dd><a href="operators/materialize-dematerialize.html">Dematerialize</a></dd>
    </dl></dd>
  </dl></dd>

 <dt>想忽略事件源发出的所有事件，只发出完成或错误通知</dt>
  <dd><a href="operators/ignoreelements.html">IgnoreElements</a></dd>

 <dt>想镜像并在之前添加指定事件序列</dt>
  <dd><a href="operators/startwith.html">StartWith</a></dd>
  <dd class="sub"><dl>
   <dt>仅当它的事件序列为空时</dt>
    <dd><a href="operators/defaultifempty.html">DefaultIfEmpty</a></dd>
  </dl></dd>

 <dt>想将事件源发出的事件收集成捆并发出这些捆绑事件</dt>
  <dd><a href="operators/buffer.html">Buffer</a></dd>
  <dd class="sub"><dl>
   <dt>仅包含最后发出的事件</dt>
    <dd><a href="operators/takelast.html">TakeLastBuffer</a></dd>
  </dl></dd>

 <dt>想将一个事件源拆分成多个事件源</dt>
  <dd><a href="operators/window.html">Window</a></dd>
  <dd class="sub"><dl>
   <dt>把相似的事件放在同事件源里</dt>
    <dd><a href="operators/groupby.html">GroupBy</a></dd>
  </dl></dd>

 <dt>想获取事件源发出的特定事件</dt>
  <dd class="sub"><dl>
   <dt>完成前的最后一个事件</dt>
    <dd><a href="operators/last.html">Last</a></dd>
   <dt>发出的唯一事件</dt>
    <dd><a href="operators/first.html">Single</a></dd>
   <dt>发出的第一个事件</dt>
    <dd><a href="operators/first.html">First</a></dd>
  </dl></dd>

 <dt>想有选择的发出某些事件</dt>
  <dd class="sub"><dl>
   <dt>过滤掉不匹配的事件</dt>
    <dd><a href="operators/filter.html">Filter</a></dd>
   <dt>只有第一个事件</dt>
    <dd><a href="operators/first.html">First</a></dd>
   <dt>只有前<i>n</i>个事件</em></dt>
    <dd><a href="operators/take.html">Take</a></dd>
   <dt>只有最后一个事件</dt>
    <dd><a href="operators/last.html">Last</a></dd>
   <dt>只有位置<i>n</i>的事件</dt>
    <dd><a href="operators/elementat.html">ElementAt</a></dd>
   <dt>过滤前面的事件</dt>
    <dd class="sub"><dl>
     <dt>跳过<i>n</i>个事件</dt>
      <dd><a href="operators/skip.html">Skip</a></dd>
     <dt>跳过直到匹配的事件</dt>
      <dd><a href="operators/skipwhile.html">SkipWhile</a></dd>
     <dt>跳过最初的几次</dt>
      <dd><a href="operators/skip.html">Skip</a></dd>
     <dt>跳过直到第二个事件源发出事件</dt>
      <dd><a href="operators/skipuntil.html">SkipUntil</a></dd>
    </dl></dd>
   <dt>过滤后面的事件</dt>
    <dd class="sub"><dl>
     <dt>跳过最后<i>n</i>个事件</dt>
      <dd><a href="operators/skiplast.html">SkipLast</a></dd>
     <dt>发出直到不匹配的事件</dt>
      <dd><a href="operators/takewhile.html">TakeWhile</a></dd>
     <dt>跳过最后的几次</dt>
      <dd><a href="operators/skiplast.html">SkipLast</a></dd>
     <dt>发出直到第二个事件源发出事件</dt>
      <dd><a href="operators/takeuntil.html">TakeUntil</a></dd>
    </dl></dd>
   <dt>定期对事件源抽样</dt>
    <dd><a href="operators/sample.html">Sample</a></dd>
   <dt>特定的时间跨度已经过去而没有发出另一个事件则发出事件</dt>
    <dd><a href="operators/debounce.html">Debounce</a></dd>
   <dt>对事件源发出的事件去重</dt>
    <dd><a href="operators/distinct.html">Distinct</a></dd>
    <dd class="sub"><dl>
     <dt>如果紧跟的事件相同才认为是重复的</dt>
      <dd><a href="operators/distinct.html">DistinctUntilChanged</a></dd>
    </dl></dd>
   <dt>在开始发出事件后的一段时间内延迟订阅</dt>
    <dd><a href="operators/delay.html">DelaySubscription</a></dd>
  </dl></dd>

 <dt>想只发出第一个发出事件的事件源的事件</dt>
  <dd><a href="operators/amb.html">Amb</a></dd>

 <dt>想评估事件源发出的整个事件序列</dt>
  <dd class="sub"><dl>
   <dt>返回<em>全部</em>事件是否符合某些条件的布尔值</dt>
    <dd><a href="operators/all.html">All</a></dd>
   <dt>返回<em>任一</em>事件是否符合某些条件的布尔值</dt>
    <dd><a href="operators/contains.html">Contains</a></dd>
   <dt>返回事件源是否<em>为空</em>的布尔值</dt>
    <dd><a href="operators/contains.html">IsEmpty</a></dd>
   <dt>返回序列是否与另一个事件源发出的序列是否相同的布尔值</dt>
    <dd><a href="operators/sequenceequal.html">SequenceEqual</a></dd>
   <dt>发出所有数的平均值</dt>
    <dd><a href="operators/average.html">Average</a></dd>
   <dt>发出所有数的和</dt>
    <dd><a href="operators/sum.html">Sum</a></dd>
   <dt>发出事件个数</dt>
    <dd><a href="operators/count.html">Count</a></dd>
   <dt>发出所有数中的最大值</dt>
    <dd><a href="operators/max.html">Max</a></dd>
   <dt>发出所有数中的最小值</dt>
    <dd><a href="operators/min.html">Min</a></dd>
   <dt>通过依次对每个事件应用聚合函数并发出结果</dt>
    <dd><a href="operators/scan.html">Scan</a></dd>
  </dl></dd>

 <dt>想将事件源转换为另一种对象或数据结构</dt>
  <dd><a href="operators/to.html">To</a></dd>

 <dt>想使用指定的<a href="../scheduler.html">调度器（Scheduler）</a></dt>
  <dd><a href="operators/subscribeon.html">SubscribeOn</a></dd>
  <dd class="sub"><dl>
   <dt>当通知观察者</dt>
    <dd><a href="operators/observeon.html">ObserveOn</a></dd>
  </dl></dd>

 <dt>想事件源在发出事件时进行特定操作</dt>
  <dd><a href="operators/do.html">Do</a></dd>

 <dt>想事件源抛出一个错误</dt>
  <dd><a href="operators/empty-never-throw.html">Throw</a></dd>
  <dd class="sub"><dl>
   <dt>如果指定时间过去而没有发出事件</dt>
    <dd><a href="operators/timeout.html">Timeout</a></dd>
  </dl></dd>

 <dt>想事件源能够优雅的恢复</dt>
  <dd class="sub"><dl>
   <dt>超时切换到备用事件源</dt>
    <dd><a href="operators/timeout.html">Timeout</a></dd>
   <dt>捕获上游的错误通知</dt>
    <dd><a href="operators/catch.html">Catch</a></dd>
    <dd class="sub"><dl>
     <dt>尝试重新订阅上游的事件源</dt>
      <dd><a href="operators/retry.html">Retry</a></dd>
    </dl></dd>
  </dl></dd>

 <dt>想创建与事件源具有相同生命周期的可支配资源</dt>
  <dd><a href="operators/using.html">Using</a></dd>

 <dt>想订阅一个事件源并接受一个<code>Future</code>，阻塞直到事件源完成</dt>
  <dd><a href="operators/start.html">Start</a></dd>

 <dt>想要一个事件源，直到被需要到才开始向观察者发出事件</dt>
  <dd><a href="operators/publish.html">Publish</a></dd>
  <dd class="sub"><dl>
   <dt>只发出序列中的最后一个事件</dt>
    <dd><a href="operators/publish.html">PublishLast</a></dd>
   <dt>发出完整序列即使观察者在事件源开始发出事件后订阅</dt>
    <dd><a href="operators/replay.html">Replay</a></dd>
   <dt>但是一旦所有观察者取消订阅则销毁</dt>
    <dd><a href="operators/refcount.html">RefCount</a></dd>
   <dt>当想要它开始发出事件</dt>
    <dd><a href="operators/connect.html">Connect</a></dd>
  </dl></dd>
</dl>
</div>
<h4 style="clear:both;">参考</h4>
<ul>
 <li><a href="http://xgrommx.github.io/rx-book/content/which_operator_do_i_use/index.html">Which Operator do I use?</a> by Dennis Stoyanov (a similar decision tree, specific to RxJS operators)</li>
</ul>

<h1 id="alphabetical" style="clear: left;">按字母排序的操作符列表</h1>

公认的核心操作符名称以**黑体字**显示。 其他条目表示ReactiveX核心操作符集之外的特殊操作符或特定于语言的操作符的变体。

* [`Aggregate`]({{ site.url }}/documentation/operators/reduce.html)
* [**`All`**]({{ site.url }}/documentation/operators/all.html)
* [**`Amb`**]({{ site.url }}/documentation/operators/amb.html)
* [`ambArray`]({{ site.url }}/documentation/operators/amb.html)
* [`ambWith`]({{ site.url }}/documentation/operators/amb.html)
* [`and_`]({{ site.url }}/documentation/operators/and-then-when.html)
* [**`And`**]({{ site.url }}/documentation/operators/and-then-when.html)
* [`Any`]({{ site.url }}/documentation/operators/contains.html)
* [`apply`]({{ site.url }}/documentation/operators/create.html)
* [`as_blocking`]({{ site.url }}/documentation/operators/to.html)
* [`asObservable`]({{ site.url }}/documentation/operators/from.html)
* [`AssertEqual`]({{ site.url }}/documentation/operators/sequenceequal.html)
* [`asyncAction`]({{ site.url }}/documentation/operators/start.html)
* [`asyncFunc`]({{ site.url }}/documentation/operators/start.html)
* [**`Average`**]({{ site.url }}/documentation/operators/average.html)
* [`averageDouble`]({{ site.url }}/documentation/operators/average.html)
* [`averageFloat`]({{ site.url }}/documentation/operators/average.html)
* [`averageInteger`]({{ site.url }}/documentation/operators/average.html)
* [`averageLong`]({{ site.url }}/documentation/operators/average.html)
* [`blocking`]({{ site.url }}/documentation/operators/to.html)
* [`blockingFirst`]({{ site.url }}/documentation/operators/first.html)
* [`blockingForEach`]({{ site.url }}/documentation/operators/subscribe.html)
* [`blockingIterable`]({{ site.url }}/documentation/operators/to.html)
* [`blockingLast`]({{ site.url }}/documentation/operators/last.html)
* [`blockingLatest`]({{ site.url }}/documentation/operators/to.html)
* [`blockingMostRecent`]({{ site.url }}/documentation/operators/to.html)
* [`blockingNext`]({{ site.url }}/documentation/operators/to.html)
* [`blockingSingle`]({{ site.url }}/documentation/operators/first.html)
* [`blockingSubscribe`]({{ site.url }}/documentation/operators/subscribe.html)
* [**`Buffer`**]({{ site.url }}/documentation/operators/buffer.html)
* [`bufferWithCount`]({{ site.url }}/documentation/operators/buffer.html)
* [`bufferWithTime`]({{ site.url }}/documentation/operators/buffer.html)
* [`bufferWithTimeOrCount`]({{ site.url }}/documentation/operators/buffer.html)
* [`byLine`]({{ site.url }}/documentation/operators/map.html)
* [`cache`]({{ site.url }}/documentation/operators/replay.html)
* [`cacheWithInitialCapacity`]({{ site.url }}/documentation/operators/replay.html)
* [`case`]({{ site.url }}/documentation/operators/defer.html)
* [`Cast`]({{ site.url }}/documentation/operators/map.html)
* [**`Catch`**]({{ site.url }}/documentation/operators/catch.html)
* [`catchError`]({{ site.url }}/documentation/operators/catch.html)
* [`catchException`]({{ site.url }}/documentation/operators/catch.html)
* [`collect`]({{ site.url }}/documentation/operators/reduce.html)
* [`collect`]({{ site.url }}/documentation/operators/filter.html) (RxScala version of **`Filter`**)
* [`collectInto`]({{ site.url }}/documentation/operators/reduce.html)
* [**`CombineLatest`**]({{ site.url }}/documentation/operators/combinelatest.html)
* [`combineLatestDelayError`]({{ site.url }}/documentation/operators/combinelatest.html)
* [`combineLatestWith`]({{ site.url }}/documentation/operators/combinelatest.html)
* [**`Concat`**]({{ site.url }}/documentation/operators/concat.html)
* [`concat_all`]({{ site.url }}/documentation/operators/flatmap.html)
* [`concatAll`]({{ site.url }}/documentation/operators/concat.html)
* [`concatArray`]({{ site.url }}/documentation/operators/concat.html)
* [`concatArrayDelayError`]({{ site.url }}/documentation/operators/concat.html)
* [`concatArrayEager`]({{ site.url }}/documentation/operators/concat.html)
* [`concatDelayError`]({{ site.url }}/documentation/operators/concat.html)
* [`concatEager`]({{ site.url }}/documentation/operators/concat.html)
* [`concatMap`]({{ site.url }}/documentation/operators/flatmap.html)
* [`concatMapDelayError`]({{ site.url }}/documentation/operators/flatmap.html)
* [`concatMapEager`]({{ site.url }}/documentation/operators/flatmap.html)
* [`concatMapEagerDelayError`]({{ site.url }}/documentation/operators/flatmap.html)
* [`concatMapIterable`]({{ site.url }}/documentation/operators/flatmap.html)
* [`concatMapObserver`]({{ site.url }}/documentation/operators/flatmap.html)
* [`concatMapTo`]({{ site.url }}/documentation/operators/flatmap.html)
* [`concatWith`]({{ site.url }}/documentation/operators/concat.html)
* [**`Connect`**]({{ site.url }}/documentation/operators/connect.html)
* [`connect_forever`]({{ site.url }}/documentation/operators/connect.html)
* [`cons`]({{ site.url }}/documentation/operators/startwith.html)
* [**`Contains`**]({{ site.url }}/documentation/operators/contains.html)
* [`controlled`]({{ site.url }}/documentation/operators/backpressure.html)
* [**`Count`**]({{ site.url }}/documentation/operators/count.html)
* [`countLong`]({{ site.url }}/documentation/operators/count.html)
* [**`Create`**]({{ site.url }}/documentation/operators/create.html)
* [`cycle`]({{ site.url }}/documentation/operators/repeat.html)
* [**`Debounce`**]({{ site.url }}/documentation/operators/debounce.html)
* [`decode`]({{ site.url }}/documentation/operators/from.html)
* [**`DefaultIfEmpty`**]({{ site.url }}/documentation/operators/defaultifempty.html)
* [**`Defer`**]({{ site.url }}/documentation/operators/defer.html)
* [`deferFuture`]({{ site.url }}/documentation/operators/start.html)
* [**`Delay`**]({{ site.url }}/documentation/operators/delay.html)
* [`delaySubscription`]({{ site.url }}/documentation/operators/delay.html)
* [`delayWithSelector`]({{ site.url }}/documentation/operators/delay.html)
* [**`Dematerialize`**]({{ site.url }}/documentation/operators/materialize-dematerialize.html)
* [**`Distinct`**]({{ site.url }}/documentation/operators/distinct.html)
* [`distinctKey`]({{ site.url }}/documentation/operators/distinct.html)
* [`distinctUntilChanged`]({{ site.url }}/documentation/operators/distinct.html)
* [`distinctUntilKeyChanged`]({{ site.url }}/documentation/operators/distinct.html)
* [**`Do`**]({{ site.url }}/documentation/operators/do.html)
* [`doAction`]({{ site.url }}/documentation/operators/do.html)
* [`doAfterTerminate`]({{ site.url }}/documentation/operators/do.html)
* [`doOnComplete`]({{ site.url }}/documentation/operators/do.html)
* [`doOnCompleted`]({{ site.url }}/documentation/operators/do.html)
* [`doOnDispose`]({{ site.url }}/documentation/operators/do.html)
* [`doOnEach`]({{ site.url }}/documentation/operators/do.html)
* [`doOnError`]({{ site.url }}/documentation/operators/do.html)
* [`doOnLifecycle`]({{ site.url }}/documentation/operators/do.html)
* [`doOnNext`]({{ site.url }}/documentation/operators/do.html)
* [`doOnRequest`]({{ site.url }}/documentation/operators/do.html)
* [`doOnSubscribe`]({{ site.url }}/documentation/operators/do.html)
* [`doOnTerminate`]({{ site.url }}/documentation/operators/do.html)
* [`doOnUnsubscribe`]({{ site.url }}/documentation/operators/do.html)
* [`doseq`]({{ site.url }}/documentation/operators/subscribe.html)
* [`doWhile`]({{ site.url }}/documentation/operators/repeat.html)
* [`drop`]({{ site.url }}/documentation/operators/skip.html)
* [`dropRight`]({{ site.url }}/documentation/operators/skiplast.html)
* [`dropUntil`]({{ site.url }}/documentation/operators/skipuntil.html)
* [`dropWhile`]({{ site.url }}/documentation/operators/skipwhile.html)
* [**`ElementAt`**]({{ site.url }}/documentation/operators/elementat.html)
* [`ElementAtOrDefault`]({{ site.url }}/documentation/operators/elementat.html)
* [**`Empty`**]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [`emptyObservable`]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [`empty?`]({{ site.url }}/documentation/operators/contains.html)
* [`encode`]({{ site.url }}/documentation/operators/map.html)
* [`ensures`]({{ site.url }}/documentation/operators/do.html)
* [`error`]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [`every`]({{ site.url }}/documentation/operators/all.html)
* [`exclusive`]({{ site.url }}/documentation/operators/switch.html)
* [`exists`]({{ site.url }}/documentation/operators/contains.html)
* [`expand`]({{ site.url }}/documentation/operators/flatmap.html)
* [`failWith`]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [**`Filter`**]({{ site.url }}/documentation/operators/filter.html)
* [`filterNot`]({{ site.url }}/documentation/operators/filter.html)
* [`Finally`]({{ site.url }}/documentation/operators/do.html)
* [`finallyAction`]({{ site.url }}/documentation/operators/do.html)
* [`finallyDo`]({{ site.url }}/documentation/operators/do.html)
* [`find`]({{ site.url }}/documentation/operators/contains.html)
* [`findIndex`]({{ site.url }}/documentation/operators/contains.html)
* [**`First`**]({{ site.url }}/documentation/operators/first.html)
* [`firstElement`]({{ site.url }}/documentation/operators/first.html)
* [`FirstOrDefault`]({{ site.url }}/documentation/operators/first.html)
* [`firstOrElse`]({{ site.url }}/documentation/operators/first.html)
* [**`FlatMap`**]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapFirst`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapIterable`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapIterableWith`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapLatest`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapObserver`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapWith`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapWithMaxConcurrent`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flat_map_with_index`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatten`]({{ site.url }}/documentation/operators/merge.html)
* [`flattenDelayError`]({{ site.url }}/documentation/operators/merge.html)
* [`foldl`]({{ site.url }}/documentation/operators/reduce.html)
* [`foldLeft`]({{ site.url }}/documentation/operators/reduce.html)
* [`for`]({{ site.url }}/documentation/operators/flatmap.html)
* [`forall`]({{ site.url }}/documentation/operators/all.html)
* [`ForEach`]({{ site.url }}/documentation/operators/subscribe.html)
* [`forEachFuture`]({{ site.url }}/documentation/operators/start.html)
* [`forEachWhile`]({{ site.url }}/documentation/operators/subscribe.html)
* [`forIn`]({{ site.url }}/documentation/operators/flatmap.html)
* [`forkJoin`]({{ site.url }}/documentation/operators/zip.html)
* [**`From`**]({{ site.url }}/documentation/operators/from.html)
* [`fromAction`]({{ site.url }}/documentation/operators/from.html)
* [`fromArray`]({{ site.url }}/documentation/operators/from.html)
* [`FromAsyncPattern`]({{ site.url }}/documentation/operators/from.html)
* [`fromCallable`]({{ site.url }}/documentation/operators/from.html)
* [`fromCallback`]({{ site.url }}/documentation/operators/from.html)
* [`FromEvent`]({{ site.url }}/documentation/operators/from.html)
* [`FromEventPattern`]({{ site.url }}/documentation/operators/from.html)
* [`fromFunc0`]({{ site.url }}/documentation/operators/from.html)
* [`fromFuture`]({{ site.url }}/documentation/operators/from.html)
* [`fromIterable`]({{ site.url }}/documentation/operators/from.html)
* [`fromIterator`]({{ site.url }}/documentation/operators/from.html)
* [`from_list`]({{ site.url }}/documentation/operators/from.html)
* [`fromNodeCallback`]({{ site.url }}/documentation/operators/from.html)
* [`fromPromise`]({{ site.url }}/documentation/operators/from.html)
* [`fromPublisher`]({{ site.url }}/documentation/operators/from.html)
* [`fromRunnable`]({{ site.url }}/documentation/operators/from.html)
* [`Generate`]({{ site.url }}/documentation/operators/create.html)
* [`generateWithAbsoluteTime`]({{ site.url }}/documentation/operators/create.html)
* [`generateWithRelativeTime`]({{ site.url }}/documentation/operators/create.html)
* [`generator`]({{ site.url }}/documentation/operators/create.html)
* [`GetEnumerator`]({{ site.url }}/documentation/operators/to.html)
* [`getIterator`]({{ site.url }}/documentation/operators/to.html)
* [**`GroupBy`**]({{ site.url }}/documentation/operators/groupby.html)
* [`GroupByUntil`]({{ site.url }}/documentation/operators/groupby.html)
* [`GroupJoin`]({{ site.url }}/documentation/operators/join.html)
* [`head`]({{ site.url }}/documentation/operators/first.html)
* [`headOption`]({{ site.url }}/documentation/operators/first.html)
* [`headOrElse`]({{ site.url }}/documentation/operators/first.html)
* [`if`]({{ site.url }}/documentation/operators/defer.html)
* [`ifThen`]({{ site.url }}/documentation/operators/defer.html)
* [**`IgnoreElements`**]({{ site.url }}/documentation/operators/ignoreelements.html)
* [`indexOf`]({{ site.url }}/documentation/operators/contains.html)
* [`interleave`]({{ site.url }}/documentation/operators/merge.html)
* [`interpose`]({{ site.url }}/documentation/operators/to.html)
* [**`Interval`**]({{ site.url }}/documentation/operators/interval.html)
* [`intervalRange`]({{ site.url }}/documentation/operators/range.html)
* [`into`]({{ site.url }}/documentation/operators/reduce.html)
* [`isEmpty`]({{ site.url }}/documentation/operators/contains.html)
* [`items`]({{ site.url }}/documentation/operators/just.html)
* [**`Join`**]({{ site.url }}/documentation/operators/join.html)
* [`join`]({{ site.url }}/documentation/operators/sum.html) (string)
* [`jortSort`]({{ site.url }}/documentation/operators/all.html)
* [`jortSortUntil`]({{ site.url }}/documentation/operators/all.html)
* [**`Just`**]({{ site.url }}/documentation/operators/just.html)
* [`keep`]({{ site.url }}/documentation/operators/map.html)
* [`keep-indexed`]({{ site.url }}/documentation/operators/map.html)
* [**`Last`**]({{ site.url }}/documentation/operators/last.html)
* [`lastElement`]({{ site.url }}/documentation/operators/last.html)
* [`lastOption`]({{ site.url }}/documentation/operators/last.html)
* [`LastOrDefault`]({{ site.url }}/documentation/operators/last.html)
* [`lastOrElse`]({{ site.url }}/documentation/operators/last.html)
* [`Latest`]({{ site.url }}/documentation/operators/first.html)
* [`latest`]({{ site.url }}/documentation/operators/switch.html) (Rx.rb version of **`Switch`**)
* [`length`]({{ site.url }}/documentation/operators/count.html)
* [`let`]({{ site.url }}/documentation/operators/publish.html)
* [`letBind`]({{ site.url }}/documentation/operators/publish.html)
* [`lift`]({{ site.url }}/documentation/implement-operator.html)
* [`limit`]({{ site.url }}/documentation/operators/take.html)
* [`LongCount`]({{ site.url }}/documentation/operators/count.html)
* [`ManySelect`]({{ site.url }}/documentation/operators/flatmap.html)
* [**`Map`**]({{ site.url }}/documentation/operators/map.html)
* [`map`]({{ site.url }}/documentation/operators/zip.html) (RxClojure version of **`Zip`**)
* [`MapCat`]({{ site.url }}/documentation/operators/flatmap.html)
* [`mapCat`]({{ site.url }}/documentation/operators/zip.html) (RxClojure version of **`Zip`**)
* [`map-indexed`]({{ site.url }}/documentation/operators/map.html)
* [`mapTo`]({{ site.url }}/documentation/operators/map.html)
* [`mapWithIndex`]({{ site.url }}/documentation/operators/map.html)
* [**`Materialize`**]({{ site.url }}/documentation/operators/materialize-dematerialize.html)
* [**`Max`**]({{ site.url }}/documentation/operators/max.html)
* [`MaxBy`]({{ site.url }}/documentation/operators/max.html)
* [**`Merge`**]({{ site.url }}/documentation/operators/merge.html)
* [`mergeAll`]({{ site.url }}/documentation/operators/merge.html)
* [`mergeArray`]({{ site.url }}/documentation/operators/merge.html)
* [`mergeArrayDelayError`]({{ site.url }}/documentation/operators/merge.html)
* [`merge_concurrent`]({{ site.url }}/documentation/operators/merge.html)
* [`mergeDelayError`]({{ site.url }}/documentation/operators/merge.html)
* [`mergeObservable`]({{ site.url }}/documentation/operators/merge.html)
* [`mergeWith`]({{ site.url }}/documentation/operators/merge.html)
* [**`Min`**]({{ site.url }}/documentation/operators/min.html)
* [`MinBy`]({{ site.url }}/documentation/operators/min.html)
* [`MostRecent`]({{ site.url }}/documentation/operators/first.html)
* [`Multicast`]({{ site.url }}/documentation/operators/publish.html)
* [`multicastWithSelector`]({{ site.url }}/documentation/operators/publish.html)
* [`nest`]({{ site.url }}/documentation/operators/to.html)
* [**`Never`**]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [`Next`]({{ site.url }}/documentation/operators/takelast.html)
* [`Next`]({{ site.url }}/documentation/operators/first.html) (BlockingObservable version)
* [`none`]({{ site.url }}/documentation/operators/contains.html)
* [`nonEmpty`]({{ site.url }}/documentation/operators/contains.html)
* [`nth`]({{ site.url }}/documentation/operators/elementat.html)
* [**`ObserveOn`**]({{ site.url }}/documentation/operators/observeon.html)
* [`ObserveOnDispatcher`]({{ site.url }}/documentation/operators/observeon.html)
* [`observeSingleOn`]({{ site.url }}/documentation/operators/observeon.html)
* [`of`]({{ site.url }}/documentation/operators/from.html)
* [`of_array`]({{ site.url }}/documentation/operators/from.html)
* [`ofArrayChanges`]({{ site.url }}/documentation/operators/from.html)
* [`of_enumerable`]({{ site.url }}/documentation/operators/from.html)
* [`of_enumerator`]({{ site.url }}/documentation/operators/from.html)
* [`ofObjectChanges`]({{ site.url }}/documentation/operators/from.html)
* [`OfType`]({{ site.url }}/documentation/operators/filter.html)
* [`ofWithScheduler`]({{ site.url }}/documentation/operators/from.html)
* [`onBackpressureBlock`]({{ site.url }}/documentation/operators/backpressure.html)
* [`onBackpressureBuffer`]({{ site.url }}/documentation/operators/backpressure.html)
* [`onBackpressureDrop`]({{ site.url }}/documentation/operators/backpressure.html)
* [`OnErrorResumeNext`]({{ site.url }}/documentation/operators/catch.html)
* [`onErrorReturn`]({{ site.url }}/documentation/operators/catch.html)
* [`onErrorReturnItem`]({{ site.url }}/documentation/operators/catch.html)
* [`onExceptionResumeNext`]({{ site.url }}/documentation/operators/catch.html)
* [`onTerminateDetach`]({{ site.url }}/documentation/operators/do.html)
* [`orElse`]({{ site.url }}/documentation/operators/defaultifempty.html)
* [`pairs`]({{ site.url }}/documentation/operators/from.html)
* [`pairwise`]({{ site.url }}/documentation/operators/buffer.html)
* [`partition`]({{ site.url }}/documentation/operators/groupby.html)
* [`partition-all`]({{ site.url }}/documentation/operators/window.html)
* [`pausable`]({{ site.url }}/documentation/operators/backpressure.html)
* [`pausableBuffered`]({{ site.url }}/documentation/operators/backpressure.html)
* [`pluck`]({{ site.url }}/documentation/operators/map.html)
* [`product`]({{ site.url }}/documentation/operators/sum.html)
* [**`Publish`**]({{ site.url }}/documentation/operators/publish.html)
* [`PublishLast`]({{ site.url }}/documentation/operators/publish.html)
* [`publish_synchronized`]({{ site.url }}/documentation/operators/replay.html)
* [`publishValue`]({{ site.url }}/documentation/operators/publish.html)
* [`raise_error`]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [**`Range`**]({{ site.url }}/documentation/operators/range.html)
* [**`Reduce`**]({{ site.url }}/documentation/operators/reduce.html)
* [`reduceWith`]({{ site.url }}/documentation/operators/reduce.html)
* [`reductions`]({{ site.url }}/documentation/operators/scan.html)
* [**`RefCount`**]({{ site.url }}/documentation/operators/refcount.html)
* [**`Repeat`**]({{ site.url }}/documentation/operators/repeat.html)
* [`repeat_infinitely`]({{ site.url }}/documentation/operators/repeat.html)
* [`repeatUntil`]({{ site.url }}/documentation/operators/repeat.html)
* [`repeatWhen`]({{ site.url }}/documentation/operators/repeat.html)
* [**`Replay`**]({{ site.url }}/documentation/operators/replay.html)
* [`rescue_error`]({{ site.url }}/documentation/operators/catch.html)
* [`rest`]({{ site.url }}/documentation/operators/first.html)
* [**`Retry`**]({{ site.url }}/documentation/operators/retry.html)
* [`retry_infinitely`]({{ site.url }}/documentation/operators/retry.html)
* [`retryUntil`]({{ site.url }}/documentation/operators/retry.html)
* [`retryWhen`]({{ site.url }}/documentation/operators/retry.html)
* [`Return`]({{ site.url }}/documentation/operators/just.html)
* [`returnElement`]({{ site.url }}/documentation/operators/just.html)
* [`returnValue`]({{ site.url }}/documentation/operators/just.html)
* [`runAsync`]({{ site.url }}/documentation/operators/from.html)
* [`safeSubscribe`]({{ site.url }}/documentation/operators/subscribe.html)
* [**`Sample`**]({{ site.url }}/documentation/operators/sample.html)
* [**`Scan`**]({{ site.url }}/documentation/operators/scan.html)
* [`scanWith`]({{ site.url }}/documentation/operators/scan.html)
* [`scope`]({{ site.url }}/documentation/operators/using.html)
* [`Select`]({{ site.url }}/documentation/operators/map.html) (alternate name of **`Map`**)
* [`select`]({{ site.url }}/documentation/operators/filter.html) (alternate name of **`Filter`**)
* [`selectConcat`]({{ site.url }}/documentation/operators/flatmap.html)
* [`selectConcatObserver`]({{ site.url }}/documentation/operators/flatmap.html)
* [`SelectMany`]({{ site.url }}/documentation/operators/flatmap.html)
* [`selectManyObserver`]({{ site.url }}/documentation/operators/flatmap.html)
* [`select_switch`]({{ site.url }}/documentation/operators/switch.html)
* [`selectSwitch`]({{ site.url }}/documentation/operators/flatmap.html)
* [`selectSwitchFirst`]({{ site.url }}/documentation/operators/flatmap.html)
* [`selectWithMaxConcurrent`]({{ site.url }}/documentation/operators/flatmap.html)
* [`select_with_index`]({{ site.url }}/documentation/operators/filter.html)
* [`seq`]({{ site.url }}/documentation/operators/from.html)
* [**`SequenceEqual`**]({{ site.url }}/documentation/operators/sequenceequal.html)
* [`sequence_eql?`]({{ site.url }}/documentation/operators/sequenceequal.html)
* [`SequenceEqualWith`]({{ site.url }}/documentation/operators/sequenceequal.html)
* [**`Serialize`**]({{ site.url }}/documentation/operators/serialize.html)
* [`share`]({{ site.url }}/documentation/operators/refcount.html)
* [`shareReplay`]({{ site.url }}/documentation/operators/replay.html)
* [`shareValue`]({{ site.url }}/documentation/operators/refcount.html)
* [`Single`]({{ site.url }}/documentation/operators/first.html)
* [`singleElement`]({{ site.url }}/documentation/operators/first.html)
* [`SingleOrDefault`]({{ site.url }}/documentation/operators/first.html)
* [`singleOption`]({{ site.url }}/documentation/operators/first.html)
* [`singleOrElse`]({{ site.url }}/documentation/operators/first.html)
* [`size`]({{ site.url }}/documentation/operators/count.html)
* [**`Skip`**]({{ site.url }}/documentation/operators/skip.html)
* [**`SkipLast`**]({{ site.url }}/documentation/operators/skiplast.html)
* [`skipLastWithTime`]({{ site.url }}/documentation/operators/skiplast.html)
* [**`SkipUntil`**]({{ site.url }}/documentation/operators/skipuntil.html)
* [`skipUntilWithTime`]({{ site.url }}/documentation/operators/skipuntil.html)
* [**`SkipWhile`**]({{ site.url }}/documentation/operators/skipwhile.html)
* [`skipWhileWithIndex`]({{ site.url }}/documentation/operators/skipwhile.html)
* [`skip_with_time`]({{ site.url }}/documentation/operators/skip.html)
* [`slice`]({{ site.url }}/documentation/operators/filter.html)
* [`sliding`]({{ site.url }}/documentation/operators/window.html)
* [`slidingBuffer`]({{ site.url }}/documentation/operators/buffer.html)
* [`some`]({{ site.url }}/documentation/operators/contains.html)
* [`sort`]({{ site.url }}/documentation/operators/to.html)
* [`sorted`]({{ site.url }}/documentation/operators/to.html)
* [`sort-by`]({{ site.url }}/documentation/operators/to.html)
* [`sorted-list-by`]({{ site.url }}/documentation/operators/to.html)
* [`split`]({{ site.url }}/documentation/operators/flatmap.html)
* [`split-with`]({{ site.url }}/documentation/operators/groupby.html)
* [**`Start`**]({{ site.url }}/documentation/operators/start.html)
* [`startAsync`]({{ site.url }}/documentation/operators/start.html)
* [`startFuture`]({{ site.url }}/documentation/operators/start.html)
* [**`StartWith`**]({{ site.url }}/documentation/operators/startwith.html)
* [`startWithArray`]({{ site.url }}/documentation/operators/startwith.html)
* [`stringConcat`]({{ site.url }}/documentation/operators/sum.html)
* [`stopAndWait`]({{ site.url }}/documentation/operators/backpressure.html)
* [`subscribe`]({{ site.url }}/documentation/operators/subscribe.html)
* [`subscribeActual`]({{ site.url }}/documentation/operators/subscribe.html)
* [**`SubscribeOn`**]({{ site.url }}/documentation/operators/subscribeon.html)
* [`SubscribeOnDispatcher`]({{ site.url }}/documentation/operators/subscribeon.html)
* [`subscribeOnCompleted`]({{ site.url }}/documentation/operators/subscribe.html)
* [`subscribeOnError`]({{ site.url }}/documentation/operators/subscribe.html)
* [`subscribeOnNext`]({{ site.url }}/documentation/operators/subscribe.html)
* [`subscribeWith`]({{ site.url }}/documentation/operators/subscribe.html)
* [**`Sum`**]({{ site.url }}/documentation/operators/sum.html)
* [`sumDouble`]({{ site.url }}/documentation/operators/sum.html)
* [`sumFloat`]({{ site.url }}/documentation/operators/sum.html)
* [`sumInteger`]({{ site.url }}/documentation/operators/sum.html)
* [`sumLong`]({{ site.url }}/documentation/operators/sum.html)
* [**`Switch`**]({{ site.url }}/documentation/operators/switch.html)
* [`switchCase`]({{ site.url }}/documentation/operators/defer.html)
* [`switchIfEmpty`]({{ site.url }}/documentation/operators/defaultifempty.html)
* [`switchLatest`]({{ site.url }}/documentation/operators/switch.html)
* [`switchMap`]({{ site.url }}/documentation/operators/flatmap.html)
* [`switchMapDelayError`]({{ site.url }}/documentation/operators/flatmap.html)
* [`switchOnNext`]({{ site.url }}/documentation/operators/switch.html)
* [`switchOnNextDelayError`]({{ site.url }}/documentation/operators/switch.html)
* [`Synchronize`]({{ site.url }}/documentation/operators/serialize.html)
* [**`Take`**]({{ site.url }}/documentation/operators/take.html)
* [`take_with_time`]({{ site.url }}/documentation/operators/take.html)
* [`takeFirst`]({{ site.url }}/documentation/operators/first.html)
* [**`TakeLast`**]({{ site.url }}/documentation/operators/takelast.html)
* [`takeLastBuffer`]({{ site.url }}/documentation/operators/takelast.html)
* [`takeLastBufferWithTime`]({{ site.url }}/documentation/operators/takelast.html)
* [`takeLastWithTime`]({{ site.url }}/documentation/operators/takelast.html)
* [`takeRight`]({{ site.url }}/documentation/operators/last.html) (参考: [**`TakeLast`**]({{ site.url }}/documentation/operators/takelast.html))
* [**`TakeUntil`**]({{ site.url }}/documentation/operators/takeuntil.html)
* [`takeUntilWithTime`]({{ site.url }}/documentation/operators/takeuntil.html)
* [**`TakeWhile`**]({{ site.url }}/documentation/operators/takewhile.html)
* [`takeWhileWithIndex`]({{ site.url }}/documentation/operators/takewhile.html)
* [`tail`]({{ site.url }}/documentation/operators/takelast.html)
* [`tap`]({{ site.url }}/documentation/operators/do.html)
* [`tapOnCompleted`]({{ site.url }}/documentation/operators/do.html)
* [`tapOnError`]({{ site.url }}/documentation/operators/do.html)
* [`tapOnNext`]({{ site.url }}/documentation/operators/do.html)
* [**`Then`**]({{ site.url }}/documentation/operators/and-then-when.html)
* [`thenDo`]({{ site.url }}/documentation/operators/and-then-when.html)
* [`Throttle`]({{ site.url }}/documentation/operators/debounce.html)
* [`throttleFirst`]({{ site.url }}/documentation/operators/sample.html)
* [`throttleLast`]({{ site.url }}/documentation/operators/sample.html)
* [`throttleWithSelector`]({{ site.url }}/documentation/operators/debounce.html)
* [`throttleWithTimeout`]({{ site.url }}/documentation/operators/debounce.html)
* [**`Throw`**]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [`throwError`]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [`throwException`]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [**`TimeInterval`**]({{ site.url }}/documentation/operators/timeinterval.html)
* [**`Timeout`**]({{ site.url }}/documentation/operators/timeout.html)
* [`timeoutWithSelector`]({{ site.url }}/documentation/operators/timeout.html)
* [**`Timer`**]({{ site.url }}/documentation/operators/timer.html)
* [**`Timestamp`**]({{ site.url }}/documentation/operators/timestamp.html)
* [**`To`**]({{ site.url }}/documentation/operators/to.html)
* [`to_a`]({{ site.url }}/documentation/operators/to.html)
* [`ToArray`]({{ site.url }}/documentation/operators/to.html)
* [`ToAsync`]({{ site.url }}/documentation/operators/start.html)
* [`toBlocking`]({{ site.url }}/documentation/operators/to.html)
* [`toBuffer`]({{ site.url }}/documentation/operators/to.html)
* [`to_dict`]({{ site.url }}/documentation/operators/to.html)
* [`ToDictionary`]({{ site.url }}/documentation/operators/to.html)
* [`ToEnumerable`]({{ site.url }}/documentation/operators/to.html)
* [`ToEvent`]({{ site.url }}/documentation/operators/to.html)
* [`ToEventPattern`]({{ site.url }}/documentation/operators/to.html)
* [`ToFlowable`]({{ site.url }}/documentation/operators/to.html)
* [`ToFuture`]({{ site.url }}/documentation/operators/to.html)
* [`to_h`]({{ site.url }}/documentation/operators/to.html)
* [`toIndexedSeq`]({{ site.url }}/documentation/operators/to.html)
* [`toIterable`]({{ site.url }}/documentation/operators/to.html)
* [`toIterator`]({{ site.url }}/documentation/operators/to.html)
* [`ToList`]({{ site.url }}/documentation/operators/to.html)
* [`ToLookup`]({{ site.url }}/documentation/operators/to.html)
* [`toMap`]({{ site.url }}/documentation/operators/to.html)
* [`toMultiMap`]({{ site.url }}/documentation/operators/to.html)
* [`ToObservable`]({{ site.url }}/documentation/operators/from.html)
* [`toSet`]({{ site.url }}/documentation/operators/to.html)
* [`toSortedList`]({{ site.url }}/documentation/operators/to.html)
* [`toStream`]({{ site.url }}/documentation/operators/to.html)
* [`ToTask`]({{ site.url }}/documentation/operators/to.html)
* [`toTraversable`]({{ site.url }}/documentation/operators/to.html)
* [`toVector`]({{ site.url }}/documentation/operators/to.html)
* [`tumbling`]({{ site.url }}/documentation/operators/window.html)
* [`tumblingBuffer`]({{ site.url }}/documentation/operators/buffer.html)
* [`unsafeCreate`]({{ site.url }}/documentation/operators/create.html)
* [`unsubscribeOn`]({{ site.url }}/documentation/operators/subscribeon.html)
* [**`Using`**]({{ site.url }}/documentation/operators/using.html)
* [**`When`**]({{ site.url }}/documentation/operators/and-then-when.html)
* [`Where`]({{ site.url }}/documentation/operators/filter.html)
* [`while`]({{ site.url }}/documentation/operators/repeat.html)
* [`whileDo`]({{ site.url }}/documentation/operators/repeat.html)
* [**`Window`**]({{ site.url }}/documentation/operators/window.html)
* [`windowWithCount`]({{ site.url }}/documentation/operators/window.html)
* [`windowWithTime`]({{ site.url }}/documentation/operators/window.html)
* [`windowWithTimeOrCount`]({{ site.url }}/documentation/operators/window.html)
* [`windowed`]({{ site.url }}/documentation/operators/backpressure.html)
* [`withFilter`]({{ site.url }}/documentation/operators/filter.html)
* [`withLatestFrom`]({{ site.url }}/documentation/operators/combinelatest.html)
* [**`Zip`**]({{ site.url }}/documentation/operators/zip.html)
* [`zipArray`]({{ site.url }}/documentation/operators/zip.html)
* [`zipIterable`]({{ site.url }}/documentation/operators/zip.html)
* [`zipWith`]({{ site.url }}/documentation/operators/zip.html)
* [`zipWithIndex`]({{ site.url }}/documentation/operators/zip.html)
* [`++`]({{ site.url }}/documentation/operators/concat.html)
* [`+:`]({{ site.url }}/documentation/operators/startwith.html)
* [`:+`]({{ site.url }}/documentation/operators/just.html)
