---
layout: documentation
title: ReactiveX - Single
lang: ko
id: single
---

<h1>Single</h1>
<p>
 RxJava(그리고 RxGroovy나 RxScala 같은 reactivex의 구현체들)는 <a href="observable.html">Observable</a>과 유사한 &ldquo;Single&rdquo;을 제공한다.
</p>
<p>
 Single은 Obvservable의 한 형태이지만, Observable처럼 존재하지 않는 곳에서부터 무한대까지의 임이의 연속된 값들을 배출하는 것과는 달리, 항상 한 가지 값 또는 오류 알림 둘 중 하나만 배출한다.
</p>
<p>
 이런 이유 때문에, Single을 구독할 때는 Observable을 구독할 때 사용하는 세 개의 메서드(<tt>onNext</tt>, <tt>onError</tt>, 그리고 <tt>onCompleted</tt>) 대신 다음의 두 메서드만 사용할 수 있다:
</p>
<dl>
 <dt>onSuccess</dt>
  <dd>Single은 자신이 배출하는 하나의 값을 이 메서드를 통해 전달한다</dd>
 <dt>onError</dt>
  <dd>Single은 항목을 배출할 수 없을 때 이 메서드를 통해 Throwable 객체를 전달한다</dd>
</dl>
<p>
 Single은 이 메서드 중 하나만 그리고, 한 번만 호출한다. 메서드가 호출되면 Single의 생명주기는 끝나고 구독도 종료된다.
</p>

<h1>Single 연산자를 통한 구성</h1>
<p>
 Observable과 마찬가지로, Single도 다양한 연산자들을 제공한다. 이 중 어떤 연산자들은 Observable과 Single을 섞어서 사용할 수 있도록 Observable의 영역과 Single의 영역을 연결하는 인터페이스 역할을 수행한다:
</p>
<table>
 <thead>
  <tr><th>연산자</th><th>리턴 타입</th><th>설명</th></tr>
 </thead>
 <tbody>
  <tr><td><tt>compose</tt></td><td><tt>Single</tt></td><td>이 연산자를 통해 사용자 정의 연산자를 만들 수 있다</td></tr>
  <tr><td><tt>concat</tt> 그리고 <tt>concatWith</tt></td><td><tt>Observable</tt></td><td>여러 개의 Single이 배출한 항목들을 Observable이 배출하는 형태로 변환한다</td></tr>
  <tr><td><tt>create</tt></td><td><tt>Single</tt></td><td>명시적으로 subscriber 메서드 호출을 통해 Single을 생성한다</td></tr>
  <tr><td><tt>delay</tt></td><td><tt>Single</tt></td><td>Single의 항목 배출을 명시된 시간 만큼 미룬다</td></tr>
  <tr><td><tt>doOnError</tt></td><td><tt>Single</tt></td><td>onError 메서드가 호출될 때 전달한 메서드를 실행하는 Single을 리턴한다</td></tr>
  <tr><td><tt>doOnSuccess</tt></td><td><tt>Single</tt></td><td>onSuccess 메서드가 호출될 때 전달한 메서드를 실행하는 Single을 리턴한다</td></tr>
  <tr><td><tt>error</tt></td><td><tt>Single</tt></td><td>오류를 구독하는 구독자에게 즉시 오류가 발생했음을 알리는 Single을 리턴한다</td></tr>
  <tr><td><tt>flatMap</tt></td><td><tt>Single</tt></td><td>Single이 배출하는 항목에 적용된 함수의 결과를 담은 Single을 리턴한다</td></tr>
  <tr><td><tt>flatMapObservable</tt></td><td><tt>Observable</tt></td><td>Single이 배출한 항목에 적용된 함수의 결과를 담은 Observable을 리턴한다</td></tr>
  <tr><td><tt>from</tt></td><td><tt>Single</tt></td><td>퓨처를 Single로 변환한다</td></tr>
  <tr><td><tt>just</tt></td><td><tt>Single</tt></td><td>명시한 항목을 배출하는 Single을 리턴한다</td></tr>
  <tr><td><tt>map</tt></td><td><tt>Single</tt></td><td>소스 Single이 배출한 항목에 적용된 함수의 결과를 배출하는 Single을 리턴한다</td></tr>
  <tr><td><tt>merge</tt></td><td><tt>Single</tt></td><td>두 번째 Single을 배출하는 Single을 전달 받은 후, 두 번째 Single이 배출한 항목을 배출하는 Single을 리턴한다</td></tr>
  <tr><td><tt>merge</tt> 그리고 <tt>mergeWith</tt></td><td><tt>Observable</tt></td><td>여러 Single이 배출한 항목들을 머지 후 Observable을 리턴하며 리턴된 Observable은 머지된 Single들의 항목들을 배출한다</td></tr>
  <tr><td><tt>observeOn</tt></td><td><tt>Single</tt></td><td>특정 <a href="scheduler.html">스케줄러</a> 상에서 구독자 메서드를 호출하는 Single을 리턴한다</td></tr>
  <tr><td><tt>onErrorReturn</tt></td><td><tt>Single</tt></td><td>명시된 항목을 배출하는 Single을 오류 알림을 보내는 Single로 변환한다</td></tr>
  <tr><td><tt>subscribeOn</tt></td><td><tt>Single</tt></td><td>특정 <a href="scheduler.html">스케줄러</a> 상에서 동작하는 Single을 리턴한다</td></tr>
  <tr><td><tt>timeout</tt></td><td><tt>Single</tt></td><td>특정 시간 동안 소스 Single이 항목을 배출하지 못하면 오류 알림을 보내는 Single을 리턴한다</td></tr>
  <tr><td><tt>toSingle</tt></td><td><tt>Single</tt></td><td>항목 하나를 배출하는 Observable을 Single로 변환한다</td></tr>
  <tr><td><tt>toObservable</tt></td><td><tt>Observable</tt></td><td>Single을 Observable로 변환하며 변환된 Observable은 Single이 배출 할 항목을 배출한 후 종료된다</td></tr>
  <tr><td><tt>zip</tt> 그리고 <tt>zipWith</tt></td><td><tt>Single</tt></td><td>두 개 이상의 Single들이 배출한 항목에 적용된 함수의 결과를 담은 항목을 하나 배출하는 Single을 리턴한다</td></tr>
 </tbody>
</table>
<p>
 지금부터는 마블 다이어그램을 통해 이 연산자들에 대해 설명한다. 이 다이어그램은 마블 다이어그램을 통해 어떻게 Single이 표현되는지 보여준다:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.legend.png" width="100%" />
<h2>compose</h2>
<h2>concat 그리고 concatWith</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.concat.png" width="100%" />
<p>
 이 연산자의 인스턴스 버전도 존재한다:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.concatWith.png" width="100%" />
<h2>create</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.create.png" width="100%" />
<h2>delay</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.delay.png" width="100%" />
<p>
 다른 버전의 연산자로 특정 <a href="scheduler.html">스케줄러</a> 상에서 Single의 배출을 지연시킨다:
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
<p><a href="scheduler.html">스케줄러</a>를 파라미터로 받는 다른 버전 역시 존재한다:
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.from.Future.s.png" width="100%" />
<h2>just</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.just.png" width="100%" />
<h2>map</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.map.png" width="100%" />
<h2>merge 그리고 mergeWith</h2>
<p>
 한 버전은 Single을 파라미터로 전달 받는데, 이때 전달된 Single은 두 번째 Single을 배출한다. 그 후 이 연산자는 두 번째 Single이 배출한 항목을 배출하는 또 다른 Single을 리턴한다:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.merge.oo.png" width="100%" />
<p>
 또 다른 버전은 두 개 이상의 Single을 전달 받고 머지한 후에 Observable을 리턴하는데 이때 리턴되는 Observable은 (임의의 순서에 따라)소스 Single이 배출한 항목들을 배출한다:
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
 timeout 연산자는 Single이 구독된 이후 특정 시간 동안 항목이 배출되지 않으면 Single이 오류 알림을 보낸다. 특정 시간을 명시해 타임 아웃을 설정할 수 있다:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.timeout.1.png" width="100%" />
<p>
 연산자에 특정 <a href="scheduler.html">스케줄러스</a>를 명시할 수도 있다:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.timeout.1s.png" width="100%" />
<p>
 timeout 연산자 중 하나는 타임 아웃이 발생하면 오류 알림을 보내는 대신 백업 싱글로 대체시키는 기능을 제공한다:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.timeout.2.png" width="100%" />
<p>
 또한, 이 연산자는 <a href="scheduler.html">스케줄러</a> 명시적인 버전도 제공한다:
</p>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.timeout.2s.png" width="100%" />
<h2>toObservable</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.toObservable.png" width="100%" />
<h2>zip zipWith</h2>
<img src="https://raw.github.com/wiki/ReactiveX/RxJava/images/rx-operators/Single.zip.png" width="100%" />
