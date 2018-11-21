---
layout: documentation
title: ReactiveX - Single
lang: cn
id: single
---

<h1>单事件源（Single）</h1>
<p>
 RxJava（及其衍生品，如RxGroovy和RxScala）提供了一个<a href="observable.html">事件源</a>的变体&ldquo;单事件源&rdquo;。
</p><p>
 单事件源和事件大部分是类似的，但它总是只输出一个事件或错误通知，而不是像事件源那样发出一系列的事件或通知。

 因此，订阅的时候不是使用原先的（<tt>onNext</tt>、<tt>onError</tt>和<tt>onCompleted</tt>）这三个方法， 而是以下两个方式：
</p><dl>
 <dt>onSuccess</dt>
  <dd>单事件源调用此方法当发出唯一的事件</dd>
 <dt>onError</dt>
  <dd>当单事件无法发出事件时通过此方法处理Throwable对象</dd>
</dl><p>
 单事件源将只调用其中一种方法，并且只调用一次。在调用任一方法时，单事件源终止并且对它的订阅结束。
</p>

<h1>单事件源操作符组合</h1>
<p>
 如同事件源，单事件源也可以通过各种操作符进行操作。 一些操作符甚至允许混合事件源和单事件源两种类型：
</p>
<table class="table table-striped">
 <thead>
  <tr><th>操作符</th><th>返回</th><th>描述</th></tr>
 </thead>
 <tbody>
  <tr><td><tt>compose</tt></td><td><tt>单事件源</tt></td><td>创建自定义操作符</td></tr>
  <tr><td><tt>concat</tt>和<tt>concatWith</tt></td><td><tt>事件源</tt></td><td>将多个单事件源发出的事件连接起来做事件源</td></tr>
  <tr><td><tt>create</tt></td><td><tt>单事件源</tt></td><td>通过显式调用观察者方法创建单事件源</td></tr>
  <tr><td><tt>delay</tt></td><td><tt>单事件源</tt></td><td>延迟指定时间发出事件</td></tr>
  <tr><td><tt>doOnError</tt></td><td><tt>单事件源</tt></td><td>返回一个单事件源会在调用onError时调用指定的方法</td></tr>
  <tr><td><tt>doOnSuccess</tt></td><td><tt>单事件源</tt></td><td>返回一个单事件源会在调用onSuccess时调用指定的方法</td></tr>
  <tr><td><tt>error</tt></td><td><tt>单事件源</tt></td><td>返回一个单事件源立即通知观察者错误</td></tr>
  <tr><td><tt>flatMap</tt></td><td><tt>单事件源</tt></td><td>返回一个发出函数处理后事件的结果的单事件源 </td></tr>
  <tr><td><tt>flatMapObservable</tt></td><td><tt>事件源</tt></td><td>返回一个发出函数处理后事件的结果的单事件源</td></tr>
  <tr><td><tt>from</tt></td><td><tt>单事件源</tt></td><td>转换一个可能还没有完成的异步任务为一个单事件源</td></tr>
  <tr><td><tt>just</tt></td><td><tt>单事件源</tt></td><td>返回一个发出指定事件的单事件源</td></tr>
  <tr><td><tt>map</tt></td><td><tt>单事件源</tt></td><td>返回一个单事件源，将发出的事件通过将函数处理后在发出</td></tr>
  <tr><td><tt>merge</tt></td><td><tt>单事件源</tt></td><td>一个单事件源发出另一个单事件源，将发出后一个事件源的事件</td></tr>
  <tr><td><tt>merge</tt>和<tt>mergeWith</tt></td><td><tt>事件源</tt></td><td>合并两个或多个单事件源为一个事件源</td></tr>
  <tr><td><tt>observeOn</tt></td><td><tt>单事件源</tt></td><td>让单事件源的在指定的<a href="scheduler.html">调度器</a>上调用订阅方法</td></tr>
  <tr><td><tt>onErrorReturn</tt></td><td><tt>单事件源</tt></td><td>将发出错误通知的单事件源转换为发出指定事件的单事件源</td></tr>
  <tr><td><tt>subscribeOn</tt></td><td><tt>单事件源</tt></td><td>指定单事件源的<a href="scheduler.html">调度器</a></td></tr>
  <tr><td><tt>timeout</tt></td><td><tt>单事件源</tt></td><td>如果源单事件源未在指定时间段内发出事件，则返回一个发出错误通知的单事件源</td></tr>
  <tr><td><tt>toSingle</tt></td><td><tt>单事件源</tt></td><td>将发出单个事件的事件源转换为发出该事件的单事件源</td></tr>
  <tr><td><tt>toObservable</tt></td><td><tt>事件源</tt></td><td>将单事件源转换为事件源，它发出单事件源发出的事件，然后完成</td></tr>
  <tr><td><tt>zip</tt>和<tt>zipWith</tt></td><td><tt>单事件源</tt></td><td>返回一个单事件源发出通过指定的函数将两个或多个其他单事件源发出的事件组合的结果</td></tr>
 </tbody>
</table>
<p>
 本页的下面部分将提供弹珠图来说明这些操作符。 下图是单事件源在弹珠图中的表示：
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.legend.png" width="100%" />
<h2>compose</h2>
<h2>concat和concatWith</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.concat.png" width="100%" />
<p>
 这也是操作符的一个实例版本：
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.concatWith.png" width="100%" />
<h2>create</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.create.png" width="100%" />
<h2>delay</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.delay.png" width="100%" />
<p>
 这也是操作符的一个实例版本以指定的<a href="scheduler.html">调度器</a>执行延迟：
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.delay.s.png" width="100%" />
<h2>doOnError</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.doOnError.png" width="100%" />
<h2>doOnSuccess</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.doOnSuccess.png" width="100%" />
<h2>error</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.error.png" width="100%" />
<h2>flatMap</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.flatMap.png" width="100%" />
<h2>flatMapObservable</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.flatMapObservable.png" width="100%" />
<h2>from</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.from.Future.png" width="100%" />
<p>还有一种以<a href="scheduler.html">调度器</a>为参数:
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.from.Future.s.png" width="100%" />
<h2>just</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.just.png" width="100%" />
<h2>map</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.map.png" width="100%" />
<h2>merge和mergeWith</h2>
<p>
 其中一种merge的实现是，一个单事件源发出另一个单事件源，则发出后一个事件源的事件：
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.merge.oo.png" width="100%" />
<p>
 另一种是合并两个或多个单事件源为一个事件源，该事件源发出源单事件源发出的事件（以随机顺序）：
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.merge.png" width="100%" />
<h2>observeOn</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.observeOn.png" width="100%" />
<h2>onErrorReturn</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.onErrorReturn.png" width="100%" />
<h2>subscribeOn</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.subscribeOn.png" width="100%" />
<h2>timeout</h2>
<p>
 如果在订阅后指定的时间段内没有发出事件，超时将发出单个中止错误通知。一种实现是通过指定的时间单位设置此时间：
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.timeout.1.png" width="100%" />
<p>
 也可以为要运行的计时器指定<a href="scheduler.html">调度器</a>:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.timeout.1s.png" width="100%" />
<p>
 另一种实现是超时切换到备用事件源而不是在超时时发出错误通知：
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.timeout.2.png" width="100%" />
<p>
 同样有个能指定<a href="scheduler.html">调度器</a>的版本:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.timeout.2s.png" width="100%" />
<h2>toObservable</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.toObservable.png" width="100%" />
<h2>zip和zipWith</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.zip.png" width="100%" />
