---
layout: documentation
title: ReactiveX - Implementing Your Own Operators
id: implement-operator
---

#Implementing Your Own Operators

You can implement your own Observable operators. This page shows you how.

If your operator is designed to *originate* an Observable, rather than to transform or react to a source Observable, use the [`create( )`](Operators/create) method rather than trying to implement `Observable` manually.  Otherwise, follow the instructions below.

# Chaining Your Custom Operators with Standard RxJava Operators

The following example shows how you can chain a custom operator (in this example: `myOperator`) along with standard RxJava operators by using the `lift( )` operator:

```groovy
Observable foo = barObservable.ofType(Integer).map({it*2}).lift(new myOperator<T>()).map({"transformed by myOperator: " + it});
```
The following section will show how to form the scaffolding of your operator so that it will work correctly with `lift( )`.

# Implementing Your Operator

Define your operator as a public class that implements the [`Operator`](http://reactivex.io/RxJava/javadoc/rx/Observable.Operator.html) interface, like so:

```java
public class myOperator<T> implements Operator<T> {
  public myOperator( /* any necessary params here */ ) {
    /* any necessary initialization here */
  }

  @Override
  public Subscriber<? super T> call(final Subscriber<? super T> s) {
    return new Subscriber<t>(s) {
      @Override
      public void onCompleted() {
        /* add your own onCompleted behavior here, or just pass the completed notification through: */
        if(!s.isUnsubscribed()) {
          s.onCompleted();
        }
      }

      @Override
      public void onError(Throwable t) {
        /* add your own onError behavior here, or just pass the error notification through: */
        if(!s.isUnsubscribed()) {
          s.onError(t);
        }
      }

      @Override
      public void onNext(T item) {
        /* this example performs some sort of simple transformation on each incoming item and then passes it along */
        if(!s.isUnsubscribed()) {
          transformedItem = myOperatorTransformOperation(item);
          s.onNext(transformedItem);
        }
      }
    };
  }
}
``` 

# Other Considerations

* Your operator should check [its Subscriber's `isUnsubscribed( )` status](Observable#unsubscribing) before it emits any item to (or sends any notification to) the Subscriber. Do not waste time generating items that no Subscriber is interested in seeing.
* Your operator should obey the core tenets of the Observable contract:
  * It may call a Subscriber's [`onNext( )`](Observable#onnext-oncompleted-and-onerror) method any number of times, but these calls must be non-overlapping.
  * It may call either a Subscriber's [`onCompleted( )`](Observable#onnext-oncompleted-and-onerror) or [`onError( )`](Observable#onnext-oncompleted-and-onerror) method, but not both, exactly once, and it may not subsequently call a Subscriber's [`onNext( )`](Observable#onnext-oncompleted-and-onerror) method.
  * If you are unable to guarantee that your operator conforms to the above two tenets, you can add the [`serialize( )`](Observable-Utility-Operators#serialize) operator to it to force the correct behavior.
* Do not block within your operator.
* It is usually best that you compose new operators by combining existing ones, to the extent that this is possible, rather than reinventing the wheel. RxJava itself does this with some of its standard operators, for example:
  * [`first( )`](Filtering-Observables#wiki-first-and-takefirst) is defined as [`take(1)`](Filtering-Observables#wiki-take)`.`[`single( )`](Observable-Utility-Operators#wiki-single-and-singleordefault)
  * [`ignoreElements( )`](Filtering-Observables#wiki-ignoreelements) is defined as [`filter(alwaysFalse( ))`](Filtering-Observables#wiki-filter)
  * [`reduce(a)`](Mathematical-and-Aggregate-Operators#wiki-reduce) is defined as [`scan(a)`](Transforming-Observables#wiki-scan)`.`[`last( )`](Filtering-Observables#wiki-last)
* If your operator uses functions or lambdas that are passed in as parameters (predicates, for instance), note that these may be sources of exceptions, and be prepared to catch these and notify subscribers via `onError( )` calls.
* In general, notify subscribers of error conditions immediately, rather than making an effort to emit more items first.
* In some ReactiveX implementations, your operator may need to be sensitive to that implementation&#8217;s &ldquo;backpressure&rdquo; strategies. (See, for example: <a href="http://akarnokd.blogspot.hu/2015/05/pitfalls-of-operator-implementations_14.html">Pitfalls of Operator Implementations (part 2)</a> by D&aacute;vid Karnok.)

# See Also
* <a href="http://akarnokd.blogspot.hu/2015/05/pitfalls-of-operator-implementations.html">Pitfalls of Operator Implementations (part 1)</a> and <a href="http://akarnokd.blogspot.hu/2015/05/pitfalls-of-operator-implementations_14.html">(part 2)</a> by D&aacute;vid Karnok.
* <a href="http://xgrommx.github.io/rx-book/content/getting_started_with_rxjs/implementing_your_own_operators.html">Implementing Your Own Observable Operators</a> (in RxJS) by Dennis Stoyanov
