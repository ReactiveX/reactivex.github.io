---
layout: documentation
title: ReactiveX - Implementing Your Own Operators
lang: ko
id: implement-operator
---

<h1>사용자 정의 연산자 구현</h1>

필요하다면, 원하는 Observable의 연산자를 직접 구현할 수 있다. 이 페이지를 통해 어떻게 연산자를 구현하는지 설명한다.

만약, 구현하려는 연산자가 소스 Observable이 배출하는 항목에 반응하거나 항목을 다른 형태로 변환하는 것이 아니라, Observable을 생성하는 거라면 `Observable`을 직접 구현하려고 애쓰지 말고 대신, 
[`create( )`](Operators/ko/create) 메서를 사용하는 것이 좋다. 반대로, 소스 Observable이 배출하는 항목에 반응하는 연산자라면 아래 내용을 살펴보자.

<h1> 표준 RxJava 연산자와 사용자 정의 연산자 체인</h1>

다음 예제는 표준 RxJava 연산자인 `lift( )`와 사용자 정의 연산자(이 예제에서는 `myOperator`)를 함께 체인에 적용하는 방법을 보여준다:

```groovy
Observable foo = barObservable.ofType(Integer).map({it*2}).lift(new myOperator<T>()).map({"transformed by myOperator: " + it});
```
아래는 여러분이 정의한 연산자가 `lift( )`와 함께 잘 동작하기 위해서 어떤 구조로 코드를 구현해야 하는지 설명한다.

<h1> 연산자 구현</h1>

먼저, 구현하려는 연산자를 [`Operator`](http://reactivex.io/RxJava/javadoc/rx/Observable.Operator.html) 인터페이스를 구현하는 public 클래스로 선언한다. 그럼 아래와 같을 것이다:

```java
public class myOperator<T> implements Operator<T> {
  public myOperator( /* 필요한 파라미터 선언 */ ) {
    /* 필요한 초기화 코드 구현 */
  }

  @Override
  public Subscriber<? super T> call(final Subscriber<? super T> s) {
    return new Subscriber<t>(s) {
      @Override
      public void onCompleted() {
        /* onCompleted 시에 필요한 코드를 구현하거나 완료 알림을 그냥 지나친다: */
        if(!s.isUnsubscribed()) {
          s.onCompleted();
        }
      }

      @Override
      public void onError(Throwable t) {
        /* onError 시에 필요한 코드를 구현하거나 오류 알림을 그냥 지나친다: */
        if(!s.isUnsubscribed()) {
          s.onError(t);
        }
      }

      @Override
      public void onNext(T item) {
        /* 이 예제는 전달된 항목을 간단히 변환한 후 전달하는 코드를 구현한다 */
        if(!s.isUnsubscribed()) {
          transformedItem = myOperatorTransformOperation(item);
          s.onNext(transformedItem);
        }
      }
    };
  }
}
``` 

<h1> 그 외 고려사항</h1>

* 구현할 연산자는 구독자에게 항목을 배출하기 전에(혹은 알림을 보내기 전에) 반드시 [구독자의 `isUnsubscribed( )` 상태](Observable#unsubscribing)를 체크해야 한다. 구독자가 없는데도 항목을 배출하기 위해 시간을 낭비할 필요가 없다.

* 구현할 연산자는 Observable 계약이 가진 핵심 원칙을 따라야 한다:
  * 연산자는 구독자의 [`onNext( )`](Observable#onnext-oncompleted-and-onerror) 메서드를 수도 없이 많이 호출할 수 있다. 하지만, 절대 중복된 호출이 발생하면 안된다.
  * 연산자는 구독자의 [`onCompleted( )`](Observable#onnext-oncompleted-and-onerror)나 [`onError( )`](Observable#onnext-oncompleted-and-onerror) 중 하나를 호출한다. 하지만 둘 모두를 호출해서는 안되며 반드시 둘 중 하나만 한번 호출해야 한다. 그 후에는 구독자의 [`onNext( )`](Observable#onnext-oncompleted-and-onerror)를 호출하지 않을 것이다.
  * 만약 구현하는 연산자가 위의 두 원칙을 보장할 수 없다면, [`serialize( )`](Observable-Utility-Operators#serialize) 연산자 호출를 추가해서 올바르게 행동하도록 강제할 수 있다.
* 구현하는 연산자 내에서 블럭킹(blocking) 방식을 사용하지 않는다.
* 대부분의 상황에서는 새로운 연산자를 만들 때 완전히 새로운 것을 만들기 보다는 기존의 확장 가능한 연산자를 결합시켜 구현하는 것이 가장 좋은 방법이다. RxJava 역시도 표준 연산자들을 결합하여 새로운 연산자들을 만들었는데, 아래의 연산자들을 그 예로 들 수 있다:
  * [`first( )`](Filtering-Observables#wiki-first-and-takefirst) 연산자는 [`take(1)`](Filtering-Observables#wiki-take)`.`[`single( )`](Observable-Utility-Operators#wiki-single-and-singleordefault)를 활용해 만들어 졌다.
  * [`ignoreElements( )`](Filtering-Observables#wiki-ignoreelements) 연산자는 [`filter(alwaysFalse( ))`](Filtering-Observables#wiki-filter)를 사용해 만들어 졌다
  * [`reduce(a)`](Mathematical-and-Aggregate-Operators#wiki-reduce) 연산자는 is [`scan(a)`](Transforming-Observables#wiki-scan)`.`[`last( )`](Filtering-Observables#wiki-last)를 사용해 만들어 졌다
* 만약 (예를 들어, predicates와 같이) 함수나 람다 식을 파라미터로 사용한다면, 이것이 오류를 발생시킬 수 있기 때문에 오류가 발생할 경우를 대비해서 코드를 구현해야 하고 오류가 발생하면 try/catch 절로 오류를 잡아서 `onError( )` 메서드를 호출해 구독자에게 오류가 발생했음을 알려야 한다.
* 일반적으로, 항목들을 배출하는 코드를 구현하기 위해 노력을 기울이기 보다는 그 전에 앞서 오류 조건을 먼저 파악하고 구독자에게 이를 알리는 것이 좋다.
* ReactiveX의 일부 구현체에서는 구현한 연산자의 &ldquo;역압&rdquo; 전략에 대해 꼼꼼히 체크할 필요가 있다. (그 예로 D&aacute;vid Karnok의 <a href="http://akarnokd.blogspot.hu/2015/05/pitfalls-of-operator-implementations_14.html">Pitfalls of Operator Implementations (part 2)</a> 글을 참고하기 바란다.)

<h1> 참고</h1>
* <a href="http://akarnokd.blogspot.hu/2015/05/pitfalls-of-operator-implementations.html">Pitfalls of Operator Implementations (part 1)</a> and <a href="http://akarnokd.blogspot.hu/2015/05/pitfalls-of-operator-implementations_14.html">(part 2)</a> by D&aacute;vid Karnok.
* <a href="http://xgrommx.github.io/rx-book/content/getting_started_with_rxjs/implementing_your_own_operators.html">Implementing Your Own Observable Operators</a> (in RxJS) by Dennis Stoyanov
