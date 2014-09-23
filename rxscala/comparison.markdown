---
layout: comparison
title: Comparison of Scala Observable and Java Observable
---

Note:

*    This table contains both static methods and instance methods.
*    If a signature is too long, move your mouse over it to get the full signature.


| Java Method | Scala Method |
|-------------|--------------|
| `all(Func1<? super T, Boolean>)` | `forall(T => Boolean)` |
| `amb(Observable<? extends T>, Observable<? extends T>)`<br/><span title="amb(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>amb(...)</code></span><br/><span title="amb(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>amb(...)</code></span><br/><span title="amb(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>amb(...)</code></span><br/><span title="amb(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>amb(...)</code></span><br/><span title="amb(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>amb(...)</code></span><br/><span title="amb(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>amb(...)</code></span><br/><span title="amb(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>amb(...)</code></span> | unnecessary because we can use `o1 amb o2` instead or `amb(List(o1, o2, o3, ...)` |
| `amb(Iterable<? extends Observable<? extends T>>)` | `amb(Observable[T]*)` |
| `ambWith(Observable<? extends T>)` | `amb(Observable[U])` |
| `asObservable()` | considered unnecessary in Scala land |
| `buffer(Int)` | `tumblingBuffer(Int)` |
| `buffer(Long, TimeUnit)` | `tumblingBuffer(Duration)` |
| `buffer(Func0<? extends Observable<? extends TClosing>>)`<br/>`buffer(Observable<B>)` | `tumblingBuffer(=> Observable[Any])` |
| `buffer(Long, Long, TimeUnit, Scheduler)` | `slidingBuffer(Duration, Duration, Scheduler)` |
| `buffer(Int, Int)` | `slidingBuffer(Int, Int)` |
| `buffer(Long, TimeUnit, Scheduler)` | `tumblingBuffer(Duration, Scheduler)` |
| <span title="buffer(Observable&lt;? extends TOpening&gt;, Func1&lt;? super TOpening, ? extends Observable&lt;? extends TClosing&gt;&gt;)"><code>buffer(...)</code></span> | `slidingBuffer(Observable[Opening])(Opening => Observable[Any])` |
| `buffer(Long, TimeUnit, Int, Scheduler)` | `tumblingBuffer(Duration, Int, Scheduler)` |
| `buffer(Observable<B>, Int)` | `tumblingBuffer(Observable[Any], Int)` |
| `buffer(Long, Long, TimeUnit)` | `slidingBuffer(Duration, Duration)` |
| `buffer(Long, TimeUnit, Int)` | `tumblingBuffer(Duration, Int)` |
| `cache(Int)` | `cache(Int)` |
| `cache()` | `cache` |
| `cast(Class<R>)` | RxJava needs this one because `rx.Observable` is invariant. `Observable` in RxScala is covariant and does not need this operator. |
| `collect(R, Action2<R, ? super T>)` | `foldLeft(R)((R, T) => R)` |
| <span title="combineLatest(Observable&lt;? extends T1&gt;, Observable&lt;? extends T2&gt;, Func2&lt;? super T1, ? super T2, ? extends R&gt;)"><code>combineLatest(...)</code></span> | `combineLatest(Observable[U])` |
| <span title="combineLatest(Observable&lt;? extends T1&gt;, Observable&lt;? extends T2&gt;, Observable&lt;? extends T3&gt;, Func3&lt;? super T1, ? super T2, ? super T3, ? extends R&gt;)"><code>combineLatest(...)</code></span><br/><span title="combineLatest(Observable&lt;? extends T1&gt;, Observable&lt;? extends T2&gt;, Observable&lt;? extends T3&gt;, Observable&lt;? extends T4&gt;, Func4&lt;? super T1, ? super T2, ? super T3, ? super T4, ? extends R&gt;)"><code>combineLatest(...)</code></span><br/><span title="combineLatest(Observable&lt;? extends T1&gt;, Observable&lt;? extends T2&gt;, Observable&lt;? extends T3&gt;, Observable&lt;? extends T4&gt;, Observable&lt;? extends T5&gt;, Func5&lt;? super T1, ? super T2, ? super T3, ? super T4, ? super T5, ? extends R&gt;)"><code>combineLatest(...)</code></span><br/><span title="combineLatest(Observable&lt;? extends T1&gt;, Observable&lt;? extends T2&gt;, Observable&lt;? extends T3&gt;, Observable&lt;? extends T4&gt;, Observable&lt;? extends T5&gt;, Observable&lt;? extends T6&gt;, Func6&lt;? super T1, ? super T2, ? super T3, ? super T4, ? super T5, ? super T6, ? extends R&gt;)"><code>combineLatest(...)</code></span><br/><span title="combineLatest(Observable&lt;? extends T1&gt;, Observable&lt;? extends T2&gt;, Observable&lt;? extends T3&gt;, Observable&lt;? extends T4&gt;, Observable&lt;? extends T5&gt;, Observable&lt;? extends T6&gt;, Observable&lt;? extends T7&gt;, Func7&lt;? super T1, ? super T2, ? super T3, ? super T4, ? super T5, ? super T6, ? super T7, ? extends R&gt;)"><code>combineLatest(...)</code></span><br/><span title="combineLatest(Observable&lt;? extends T1&gt;, Observable&lt;? extends T2&gt;, Observable&lt;? extends T3&gt;, Observable&lt;? extends T4&gt;, Observable&lt;? extends T5&gt;, Observable&lt;? extends T6&gt;, Observable&lt;? extends T7&gt;, Observable&lt;? extends T8&gt;, Func8&lt;? super T1, ? super T2, ? super T3, ? super T4, ? super T5, ? super T6, ? super T7, ? super T8, ? extends R&gt;)"><code>combineLatest(...)</code></span><br/><span title="combineLatest(Observable&lt;? extends T1&gt;, Observable&lt;? extends T2&gt;, Observable&lt;? extends T3&gt;, Observable&lt;? extends T4&gt;, Observable&lt;? extends T5&gt;, Observable&lt;? extends T6&gt;, Observable&lt;? extends T7&gt;, Observable&lt;? extends T8&gt;, Observable&lt;? extends T9&gt;, Func9&lt;? super T1, ? super T2, ? super T3, ? super T4, ? super T5, ? super T6, ? super T7, ? super T8, ? super T9, ? extends R&gt;)"><code>combineLatest(...)</code></span> | If C# doesn't need it, Scala doesn't need it either ;-) |
| <span title="combineLatest(List&lt;? extends Observable&lt;? extends T&gt;&gt;, FuncN&lt;? extends R&gt;)"><code>combineLatest(...)</code></span> | `combineLatest(Seq[Observable[T]])(Seq[T] => R)` |
| `compose(Transformer<? super T, R>)` | `compose(Observable[T] => Observable[R])` |
| `concat(Observable<? extends Observable<? extends T>>)` | `concat(<:<[Observable[T], Observable[Observable[U]]])` |
| `concat(Observable<? extends T>, Observable<? extends T>)`<br/><span title="concat(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>concat(...)</code></span><br/><span title="concat(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>concat(...)</code></span><br/><span title="concat(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>concat(...)</code></span><br/><span title="concat(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>concat(...)</code></span><br/><span title="concat(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>concat(...)</code></span><br/><span title="concat(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>concat(...)</code></span><br/><span title="concat(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>concat(...)</code></span> | unnecessary because we can use `++` instead or `Observable(o1, o2, ...).concat` |
| `concatMap(Func1<? super T, ? extends Observable<? extends R>>)` | `concatMap(T => Observable[R])` |
| `concatWith(Observable<? extends T>)` | use `o1 ++ o2` |
| `contains(Any)` | `contains(U)` |
| `count()` | `length` |
| `create(OnSubscribe<T>)` | `apply(Subscriber[T] => Unit)` |
| `create(OnSubscribeFunc<T>)` | **TODO: missing** |
| `debounce(Long, TimeUnit)` | `debounce(Duration)` |
| `debounce(Func1<? super T, ? extends Observable<U>>)` | `debounce(T => Observable[Any])` |
| `debounce(Long, TimeUnit, Scheduler)` | `debounce(Duration, Scheduler)` |
| `defaultIfEmpty(T)` | `orElse(=> U)` |
| `defer(Func0<Observable<T>>)` | `defer(=> Observable[T])` |
| `delay(Long, TimeUnit)` | `delay(Duration)` |
| <span title="delay(Func0&lt;? extends Observable&lt;U&gt;&gt;, Func1&lt;? super T, ? extends Observable&lt;V&gt;&gt;)"><code>delay(...)</code></span> | `delay(() => Observable[Any], T => Observable[Any])` |
| `delay(Long, TimeUnit, Scheduler)` | `delay(Duration, Scheduler)` |
| `delay(Func1<? super T, ? extends Observable<U>>)` | `delay(T => Observable[Any])` |
| `delaySubscription(Long, TimeUnit, Scheduler)` | `delaySubscription(Duration, Scheduler)` |
| `delaySubscription(Long, TimeUnit)` | `delaySubscription(Duration)` |
| `dematerialize()` | `dematerialize(<:<[Observable[T], Observable[Notification[U]]])` |
| `distinct(Func1<? super T, ? extends U>)` | `distinct(T => U)` |
| `distinct()` | `distinct` |
| `distinctUntilChanged()` | `distinctUntilChanged` |
| `distinctUntilChanged(Func1<? super T, ? extends U>)` | `distinctUntilChanged(T => U)` |
| `doOnCompleted(Action0)` | `doOnCompleted(=> Unit)` |
| `doOnEach(Action1<Notification<? super T>>)` | use `doOnEach(T => Unit, Throwable => Unit, () => Unit)` |
| `doOnEach(Observer<? super T>)` | `doOnEach(Observer[T])` |
| `doOnError(Action1<Throwable>)` | `doOnError(Throwable => Unit)` |
| `doOnNext(Action1<? super T>)` | `doOnNext(T => Unit)` |
| `doOnSubscribe(Action0)` | `doOnSubscribe(=> Unit)` |
| `doOnTerminate(Action0)` | `doOnTerminate(=> Unit)` |
| `doOnUnsubscribe(Action0)` | `doOnUnsubscribe(=> Unit)` |
| `elementAt(Int)` | `elementAt(Int)` |
| `elementAtOrDefault(Int, T)` | `elementAtOrDefault(Int, U)` |
| `empty()` | `empty` |
| `empty(Scheduler)` | `empty(Scheduler)` |
| `error(Throwable, Scheduler)` | `error(Throwable, Scheduler)` |
| `error(Throwable)` | `error(Throwable)` |
| `exists(Func1<? super T, Boolean>)` | `exists(T => Boolean)` |
| `filter(Func1<? super T, Boolean>)` | `filter(T => Boolean)` |
| `finallyDo(Action0)` | `finallyDo(=> Unit)` |
| `first()` | `first` |
| `first(Func1<? super T, Boolean>)` | use `.filter(condition).first` |
| `firstOrDefault(T, Func1<? super T, Boolean>)` | use `.filter(condition).firstOrElse(default)` |
| `firstOrDefault(T)` | `firstOrElse(=> U)` |
| <span title="flatMap(Func1&lt;? super T, ? extends Observable&lt;? extends R&gt;&gt;, Func1&lt;? super Throwable, ? extends Observable&lt;? extends R&gt;&gt;, Func0&lt;? extends Observable&lt;? extends R&gt;&gt;)"><code>flatMap(...)</code></span> | `flatMap(T => Observable[R], Throwable => Observable[R], () => Observable[R])` |
| <span title="flatMap(Func1&lt;? super T, ? extends Observable&lt;? extends U&gt;&gt;, Func2&lt;? super T, ? super U, ? extends R&gt;)"><code>flatMap(...)</code></span> | `flatMapWith(T => Observable[U])((T, U) => R)` |
| `flatMap(Func1<? super T, ? extends Observable<? extends R>>)` | `flatMap(T => Observable[R])` |
| <span title="flatMapIterable(Func1&lt;? super T, ? extends Iterable&lt;? extends R&gt;&gt;)"><code>flatMapIterable(...)</code></span> | `flatMapIterable(T => Iterable[R])` |
| <span title="flatMapIterable(Func1&lt;? super T, ? extends Iterable&lt;? extends U&gt;&gt;, Func2&lt;? super T, ? super U, ? extends R&gt;)"><code>flatMapIterable(...)</code></span> | `flatMapIterableWith(T => Iterable[U])((T, U) => R)` |
| `forEach(Action1<? super T>)` | `foreach(T => Unit)` |
| `forEach(Action1<? super T>, Action1<Throwable>, Action0)` | `foreach(T => Unit, Throwable => Unit, () => Unit)` |
| `forEach(Action1<? super T>, Action1<Throwable>)` | `foreach(T => Unit, Throwable => Unit)` |
| `from(Iterable<? extends T>, Scheduler)` | `from(Iterable[T], Scheduler)` |
| `from(T[], Scheduler)`<br/>`from(T)`<br/>`from(T, T)`<br/>`from(T, T, T)`<br/>`from(T, T, T, T)`<br/>`from(T, T, T, T, T)`<br/>`from(T, T, T, T, T, T)`<br/>`from(T, T, T, T, T, T, T)`<br/>`from(T, T, T, T, T, T, T, T)`<br/>`from(T, T, T, T, T, T, T, T, T)`<br/>`from(T, T, T, T, T, T, T, T, T, T)` | **TODO: missing** |
| `from(Future<? extends T>)`<br/>`from(Future<? extends T>, Long, TimeUnit)`<br/>`from(Future<? extends T>, Scheduler)` | TODO: Decide how Scala Futures should relate to Observables. Should there be a common base interface for Future and Observable? And should Futures also have an unsubscribe method? |
| `from(T[])`<br/>`from(Iterable<? extends T>)` | `from(Iterable[T])` |
| `groupBy(Func1<? super T, ? extends K>)` | `groupBy(T => K)` |
| <span title="groupBy(Func1&lt;? super T, ? extends K&gt;, Func1&lt;? super T, ? extends R&gt;)"><code>groupBy(...)</code></span> | `groupBy(T => K, T => V)` |
| <span title="groupByUntil(Func1&lt;? super T, ? extends TKey&gt;, Func1&lt;? super T, ? extends TValue&gt;, Func1&lt;? super GroupedObservable&lt;TKey, TValue&gt;, ? extends Observable&lt;? extends TDuration&gt;&gt;)"><code>groupByUntil(...)</code></span> | `groupByUntil(T => K, T => V)((K, Observable[V]) => Observable[Any])` |
| <span title="groupByUntil(Func1&lt;? super T, ? extends TKey&gt;, Func1&lt;? super GroupedObservable&lt;TKey, T&gt;, ? extends Observable&lt;? extends TDuration&gt;&gt;)"><code>groupByUntil(...)</code></span> | `groupByUntil(T => K)((K, Observable[T]) => Observable[Any])` |
| <span title="groupJoin(Observable&lt;T2&gt;, Func1&lt;? super T, ? extends Observable&lt;D1&gt;&gt;, Func1&lt;? super T2, ? extends Observable&lt;D2&gt;&gt;, Func2&lt;? super T, ? super Observable&lt;T2&gt;, ? extends R&gt;)"><code>groupJoin(...)</code></span> | `groupJoin(Observable[S])(T => Observable[Any], S => Observable[Any], (T, Observable[S]) => R)` |
| `ignoreElements()` | use `filter(_ => false)` |
| `interval(Long, TimeUnit)` | `interval(Duration)` |
| `interval(Long, TimeUnit, Scheduler)` | `interval(Duration, Scheduler)` |
| `isEmpty()` | `isEmpty` |
| <span title="join(Observable&lt;TRight&gt;, Func1&lt;T, Observable&lt;TLeftDuration&gt;&gt;, Func1&lt;TRight, Observable&lt;TRightDuration&gt;&gt;, Func2&lt;T, TRight, R&gt;)"><code>join(...)</code></span> | `join(Observable[S])(T => Observable[Any], S => Observable[Any], (T, S) => R)` |
| `just(T)`<br/>`just(T, T)`<br/>`just(T, T, T)`<br/>`just(T, T, T, T)`<br/>`just(T, T, T, T, T)`<br/>`just(T, T, T, T, T, T)`<br/>`just(T, T, T, T, T, T, T)`<br/>`just(T, T, T, T, T, T, T, T)`<br/>`just(T, T, T, T, T, T, T, T, T)`<br/>`just(T, T, T, T, T, T, T, T, T, T)` | use `just(T*)` |
| `last()` | `last` |
| `last(Func1<? super T, Boolean>)` | use `filter(predicate).last` |
| `lastOrDefault(T, Func1<? super T, Boolean>)` | use `filter(predicate).lastOrElse(default)` |
| `lastOrDefault(T)` | `lastOrElse(=> U)` |
| `lift(Operator<? extends R, ? super T>)` | `lift(Subscriber[R] => Subscriber[T])` |
| `limit(Int)` | `take(Int)` |
| `longCount()` | `longCount` |
| `map(Func1<? super T, ? extends R>)` | `map(T => R)` |
| `materialize()` | `materialize` |
| `merge(Array<Observable<? extends T>>, Scheduler)`<br/><span title="merge(Iterable&lt;? extends Observable&lt;? extends T&gt;&gt;, Int, Scheduler)"><code>merge(...)</code></span><br/>`merge(Iterable<? extends Observable<? extends T>>, Scheduler)` | **TODO: missing** |
| `merge(Array<Observable<? extends T>>)` | use `Observable.from(array).flatten` |
| <span title="merge(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>merge(...)</code></span><br/><span title="merge(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>merge(...)</code></span><br/><span title="merge(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>merge(...)</code></span><br/><span title="merge(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>merge(...)</code></span><br/><span title="merge(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>merge(...)</code></span><br/><span title="merge(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>merge(...)</code></span><br/><span title="merge(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>merge(...)</code></span> | unnecessary because we can use `Observable(o1, o2, ...).flatten` instead |
| `merge(Observable<? extends Observable<? extends T>>)` | `flatten(<:<[Observable[T], Observable[Observable[U]]])` |
| `merge(Observable<? extends T>, Observable<? extends T>)` | `merge(Observable[U])` |
| `merge(Iterable<? extends Observable<? extends T>>)` | use `Observable.from(iter).flatten` |
| `merge(Observable<? extends Observable<? extends T>>, Int)` | `flatten(Int)(<:<[Observable[T], Observable[Observable[U]]])` |
| `merge(Iterable<? extends Observable<? extends T>>, Int)` | use `Observable.from(iter).flatten(n)` |
| `mergeDelayError(Observable<? extends Observable<? extends T>>)` | `flattenDelayError(<:<[Observable[T], Observable[Observable[U]]])` |
| <span title="mergeDelayError(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>mergeDelayError(...)</code></span><br/><span title="mergeDelayError(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>mergeDelayError(...)</code></span><br/><span title="mergeDelayError(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>mergeDelayError(...)</code></span><br/><span title="mergeDelayError(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>mergeDelayError(...)</code></span><br/><span title="mergeDelayError(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>mergeDelayError(...)</code></span><br/><span title="mergeDelayError(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>mergeDelayError(...)</code></span><br/><span title="mergeDelayError(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>mergeDelayError(...)</code></span> | unnecessary because we can use `Observable(o1, o2, ...).flattenDelayError` instead |
| <span title="mergeDelayError(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;)"><code>mergeDelayError(...)</code></span> | `mergeDelayError(Observable[U])` |
| `mergeMap(Func1<? super T, ? extends Observable<? extends R>>)`<br/><span title="mergeMap(Func1&lt;? super T, ? extends Observable&lt;? extends R&gt;&gt;, Func1&lt;? super Throwable, ? extends Observable&lt;? extends R&gt;&gt;, Func0&lt;? extends Observable&lt;? extends R&gt;&gt;)"><code>mergeMap(...)</code></span><br/><span title="mergeMap(Func1&lt;? super T, ? extends Observable&lt;? extends U&gt;&gt;, Func2&lt;? super T, ? super U, ? extends R&gt;)"><code>mergeMap(...)</code></span> | **TODO: missing** |
| <span title="mergeMapIterable(Func1&lt;? super T, ? extends Iterable&lt;? extends R&gt;&gt;)"><code>mergeMapIterable(...)</code></span><br/><span title="mergeMapIterable(Func1&lt;? super T, ? extends Iterable&lt;? extends U&gt;&gt;, Func2&lt;? super T, ? super U, ? extends R&gt;)"><code>mergeMapIterable(...)</code></span> | **TODO: missing** |
| `mergeWith(Observable<? extends T>)` | `merge(Observable[U])` |
| `multicast(Subject<? super T, ? extends R>)` | **TODO: missing** |
| `multicast(Func0<? extends Subject<? super T, ? extends R>>)` | `multicast(=> Subject[R])` |
| <span title="multicast(Func0&lt;? extends Subject&lt;? super T, ? extends TIntermediate&gt;&gt;, Func1&lt;? super Observable&lt;TIntermediate&gt;, ? extends Observable&lt;TResult&gt;&gt;)"><code>multicast(...)</code></span> | `multicast(() => Subject[R])(Observable[R] => Observable[U])` |
| `nest()` | `nest` |
| `never()` | `never` |
| `observeOn(Scheduler)` | `observeOn(Scheduler)` |
| `ofType(Class<R>)` | use `filter(_.isInstanceOf[Class])` |
| `onBackpressureBuffer()` | `onBackpressureBuffer` |
| `onBackpressureDrop()` | `onBackpressureDrop` |
| <span title="onErrorFlatMap(Func1&lt;OnErrorThrowable, ? extends Observable&lt;? extends T&gt;&gt;)"><code>onErrorFlatMap(...)</code></span> | **TODO: missing** |
| <span title="onErrorResumeNext(Func1&lt;Throwable, ? extends Observable&lt;? extends T&gt;&gt;)"><code>onErrorResumeNext(...)</code></span> | `onErrorResumeNext(Throwable => Observable[U])` |
| `onErrorResumeNext(Observable<? extends T>)` | `onErrorResumeNext(Observable[U])` |
| `onErrorReturn(Func1<Throwable, ? extends T>)` | `onErrorReturn(Throwable => U)` |
| `onExceptionResumeNext(Observable<? extends T>)` | `onExceptionResumeNext(Observable[U])` |
| `parallel(Func1<Observable<T>, Observable<R>>)` | `parallel(Observable[T] => Observable[R])` |
| `parallel(Func1<Observable<T>, Observable<R>>, Scheduler)` | `parallel(Observable[T] => Observable[R], Scheduler)` |
| `parallelMerge(Observable<Observable<T>>, Int)` | `parallelMerge(Int)(<:<[Observable[T], Observable[Observable[U]]])` |
| `parallelMerge(Observable<Observable<T>>, Int, Scheduler)` | `parallelMerge(Int, Scheduler)(<:<[Observable[T], Observable[Observable[U]]])` |
| `publish()` | `publish` |
| `publish(Func1<? super Observable<T>, ? extends Observable<R>>)` | `publish(Observable[T] => Observable[R])` |
| <span title="publish(Func1&lt;? super Observable&lt;T&gt;, ? extends Observable&lt;R&gt;&gt;, T)"><code>publish(...)</code></span> | `publish(Observable[T] => Observable[R], T @uncheckedVariance)` |
| `publish(T)` | `publish(T)` |
| <span title="publishLast(Func1&lt;? super Observable&lt;T&gt;, ? extends Observable&lt;R&gt;&gt;)"><code>publishLast(...)</code></span> | `publishLast(Observable[T] => Observable[R])` |
| `publishLast()` | `publishLast` |
| `range(Int, Int, Scheduler)` | use `(start until (start + count)).toObservable.subscribeOn(scheduler)` instead of `range(start, count, scheduler)` |
| `range(Int, Int)` | use `(start until (start + count)).toObservable` instead of `range(start, count)` |
| `reduce(Func2<T, T, T>)` | `reduce((U, U) => U)` |
| `reduce(R, Func2<R, ? super T, R>)` | `foldLeft(R)((R, T) => R)` |
| `repeat()` | `repeat` |
| `repeat(Long)` | `repeat(Long)` |
| `repeat(Long, Scheduler)` | `repeat(Long, Scheduler)` |
| `repeat(Scheduler)` | `repeat(Scheduler)` |
| <span title="repeatWhen(Func1&lt;? super Observable&lt;? extends Notification&lt;_&gt;&gt;, ? extends Observable&lt;_&gt;&gt;)"><code>repeatWhen(...)</code></span> | `repeatWhen(Observable[Notification[Any]] => Observable[Any])` |
| <span title="repeatWhen(Func1&lt;? super Observable&lt;? extends Notification&lt;_&gt;&gt;, ? extends Observable&lt;_&gt;&gt;, Scheduler)"><code>repeatWhen(...)</code></span> | `repeatWhen(Observable[Notification[Any]] => Observable[Any], Scheduler)` |
| <span title="replay(Func1&lt;? super Observable&lt;T&gt;, ? extends Observable&lt;R&gt;&gt;, Int, Long, TimeUnit, Scheduler)"><code>replay(...)</code></span> | `replay(Observable[T] => Observable[R], Int, Duration, Scheduler)` |
| <span title="replay(Func1&lt;? super Observable&lt;T&gt;, ? extends Observable&lt;R&gt;&gt;, Scheduler)"><code>replay(...)</code></span> | `replay(Observable[T] => Observable[R], Scheduler)` |
| `replay(Long, TimeUnit, Scheduler)` | `replay(Duration, Scheduler)` |
| `replay(Scheduler)` | `replay(Scheduler)` |
| <span title="replay(Func1&lt;? super Observable&lt;T&gt;, ? extends Observable&lt;R&gt;&gt;, Int)"><code>replay(...)</code></span> | `replay(Observable[T] => Observable[R], Int)` |
| <span title="replay(Func1&lt;? super Observable&lt;T&gt;, ? extends Observable&lt;R&gt;&gt;, Long, TimeUnit)"><code>replay(...)</code></span> | `replay(Observable[T] => Observable[R], Duration)` |
| `replay(Long, TimeUnit)` | `replay(Duration)` |
| `replay(Int, Long, TimeUnit)` | `replay(Int, Duration)` |
| <span title="replay(Func1&lt;? super Observable&lt;T&gt;, ? extends Observable&lt;R&gt;&gt;, Int, Long, TimeUnit)"><code>replay(...)</code></span> | `replay(Observable[T] => Observable[R], Int, Duration)` |
| `replay(Int, Long, TimeUnit, Scheduler)` | `replay(Int, Duration, Scheduler)` |
| `replay(Func1<? super Observable<T>, ? extends Observable<R>>)` | `replay(Observable[T] => Observable[R])` |
| `replay(Int)` | `replay(Int)` |
| <span title="replay(Func1&lt;? super Observable&lt;T&gt;, ? extends Observable&lt;R&gt;&gt;, Int, Scheduler)"><code>replay(...)</code></span> | `replay(Observable[T] => Observable[R], Int, Scheduler)` |
| <span title="replay(Func1&lt;? super Observable&lt;T&gt;, ? extends Observable&lt;R&gt;&gt;, Long, TimeUnit, Scheduler)"><code>replay(...)</code></span> | `replay(Observable[T] => Observable[R], Duration, Scheduler)` |
| `replay(Int, Scheduler)` | `replay(Int, Scheduler)` |
| `replay()` | `replay` |
| `retry(Long)` | `retry(Long)` |
| `retry()` | `retry` |
| `retry(Func2<Integer, Throwable, Boolean>)` | `retry((Int, Throwable) => Boolean)` |
| <span title="retryWhen(Func1&lt;? super Observable&lt;? extends Notification&lt;_&gt;&gt;, ? extends Observable&lt;_&gt;&gt;, Scheduler)"><code>retryWhen(...)</code></span> | `retryWhen(Observable[Notification[Any]] => Observable[Any], Scheduler)` |
| <span title="retryWhen(Func1&lt;? super Observable&lt;? extends Notification&lt;_&gt;&gt;, ? extends Observable&lt;_&gt;&gt;)"><code>retryWhen(...)</code></span> | `retryWhen(Observable[Notification[Any]] => Observable[Any])` |
| `sample(Long, TimeUnit)` | `sample(Duration)` |
| `sample(Long, TimeUnit, Scheduler)` | `sample(Duration, Scheduler)` |
| `sample(Observable<U>)` | `sample(Observable[Any])` |
| `scan(Func2<T, T, T>)` | considered unnecessary in Scala land |
| `scan(R, Func2<R, ? super T, R>)` | `scan(R)((R, T) => R)` |
| `sequenceEqual(Observable<? extends T>, Observable<? extends T>)` | `sequenceEqual(Observable[U])` |
| <span title="sequenceEqual(Observable&lt;? extends T&gt;, Observable&lt;? extends T&gt;, Func2&lt;? super T, ? super T, Boolean&gt;)"><code>sequenceEqual(...)</code></span> | `sequenceEqualWith(Observable[U])((U, U) => Boolean)` |
| `serialize()` | `serialize` |
| `share()` | `share` |
| `single(Func1<? super T, Boolean>)` | use `filter(predicate).single` |
| `single()` | `single` |
| `singleOrDefault(T, Func1<? super T, Boolean>)` | use `filter(predicate).singleOrElse(default)` |
| `singleOrDefault(T)` | `singleOrElse(=> U)` |
| `skip(Long, TimeUnit, Scheduler)` | `drop(Duration, Scheduler)` |
| `skip(Int)` | `drop(Int)` |
| `skip(Long, TimeUnit)` | `drop(Duration)` |
| `skipLast(Long, TimeUnit, Scheduler)` | `dropRight(Duration, Scheduler)` |
| `skipLast(Long, TimeUnit)` | `dropRight(Duration)` |
| `skipLast(Int)` | `dropRight(Int)` |
| `skipUntil(Observable<U>)` | `dropUntil(Observable[Any])` |
| `skipWhile(Func1<? super T, Boolean>)` | `dropWhile(T => Boolean)` |
| `skipWhileWithIndex(Func2<? super T, Integer, Boolean>)` | considered unnecessary in Scala land |
| `startWith(Iterable<T>)` | use `Observable.from(iterable) ++ o` |
| `startWith(T, T)`<br/>`startWith(T, T, T)`<br/>`startWith(T, T, T, T)`<br/>`startWith(T, T, T, T, T)`<br/>`startWith(T, T, T, T, T, T)`<br/>`startWith(T, T, T, T, T, T, T)`<br/>`startWith(T, T, T, T, T, T, T, T)`<br/>`startWith(T, T, T, T, T, T, T, T, T)` | use `Observable.just(...) ++ o` |
| `startWith(T)` | use `item +: o` |
| `startWith(Observable<T>)` | use `++` |
| `startWith(T[], Scheduler)`<br/>`startWith(Iterable<T>, Scheduler)` | **TODO: missing** |
| `subscribe(Action1<? super T>, Action1<Throwable>)` | `subscribe(T => Unit, Throwable => Unit)` |
| `subscribe(Action1<? super T>, Action1<Throwable>, Action0)` | `subscribe(T => Unit, Throwable => Unit, () => Unit)` |
| `subscribe()` | `subscribe()` |
| `subscribe(Action1<? super T>)` | `subscribe(T => Unit)` |
| `subscribe(Subscriber<? super T>)` | `subscribe(Subscriber[T])` |
| `subscribe(Observer<? super T>)` | `subscribe(Observer[T])` |
| `subscribeOn(Scheduler)` | `subscribeOn(Scheduler)` |
| `switchMap(Func1<? super T, ? extends Observable<? extends R>>)` | `switchMap(T => Observable[R])` |
| `switchOnNext(Observable<? extends Observable<? extends T>>)` | `switch(<:<[Observable[T], Observable[Observable[U]]])` |
| `take(Long, TimeUnit, Scheduler)` | `take(Duration, Scheduler)` |
| `take(Int)` | `take(Int)` |
| `take(Long, TimeUnit)` | `take(Duration)` |
| `takeFirst(Func1<? super T, Boolean>)` | use `filter(condition).take(1)` |
| `takeLast(Int, Long, TimeUnit)` | `takeRight(Int, Duration)` |
| `takeLast(Long, TimeUnit, Scheduler)` | `takeRight(Duration, Scheduler)` |
| `takeLast(Int, Long, TimeUnit, Scheduler)` | `takeRight(Int, Duration, Scheduler)` |
| `takeLast(Long, TimeUnit)` | `takeRight(Duration)` |
| `takeLast(Int)` | `takeRight(Int)` |
| `takeLastBuffer(Int)`<br/>`takeLastBuffer(Int, Long, TimeUnit)`<br/>`takeLastBuffer(Int, Long, TimeUnit, Scheduler)`<br/>`takeLastBuffer(Long, TimeUnit)`<br/>`takeLastBuffer(Long, TimeUnit, Scheduler)` | use `takeRight(...).toSeq` |
| `takeUntil(Observable<? extends E>)` | `takeUntil(Observable[Any])` |
| `takeWhile(Func1<? super T, Boolean>)` | `takeWhile(T => Boolean)` |
| `takeWhileWithIndex(Func2<? super T, ? super Integer, Boolean>)` | use `.zipWithIndex.takeWhile{case (elem, index) => condition}.map(_._1)` |
| `throttleFirst(Long, TimeUnit)` | `throttleFirst(Duration)` |
| `throttleFirst(Long, TimeUnit, Scheduler)` | `throttleFirst(Duration, Scheduler)` |
| `throttleLast(Long, TimeUnit)` | `throttleLast(Duration)` |
| `throttleLast(Long, TimeUnit, Scheduler)` | `throttleLast(Duration, Scheduler)` |
| `throttleWithTimeout(Long, TimeUnit, Scheduler)` | `throttleWithTimeout(Duration, Scheduler)` |
| `throttleWithTimeout(Long, TimeUnit)` | `throttleWithTimeout(Duration)` |
| `timeInterval()` | `timeInterval` |
| `timeInterval(Scheduler)` | `timeInterval(Scheduler)` |
| <span title="timeout(Func1&lt;? super T, ? extends Observable&lt;V&gt;&gt;, Observable&lt;? extends T&gt;)"><code>timeout(...)</code></span> | `timeout(T => Observable[Any], Observable[U])` |
| <span title="timeout(Func0&lt;? extends Observable&lt;U&gt;&gt;, Func1&lt;? super T, ? extends Observable&lt;V&gt;&gt;)"><code>timeout(...)</code></span> | `timeout(() => Observable[Any], T => Observable[Any])` |
| `timeout(Func1<? super T, ? extends Observable<V>>)` | `timeout(T => Observable[Any])` |
| `timeout(Long, TimeUnit, Observable<? extends T>)` | `timeout(Duration, Observable[U])` |
| `timeout(Long, TimeUnit, Observable<? extends T>, Scheduler)` | `timeout(Duration, Observable[U], Scheduler)` |
| `timeout(Long, TimeUnit)` | `timeout(Duration)` |
| <span title="timeout(Func0&lt;? extends Observable&lt;U&gt;&gt;, Func1&lt;? super T, ? extends Observable&lt;V&gt;&gt;, Observable&lt;? extends T&gt;)"><code>timeout(...)</code></span> | `timeout(() => Observable[Any], T => Observable[Any], Observable[U])` |
| `timeout(Long, TimeUnit, Scheduler)` | `timeout(Duration, Scheduler)` |
| `timer(Long, Long, TimeUnit)` | `timer(Duration, Duration)` |
| `timer(Long, Long, TimeUnit, Scheduler)` | `timer(Duration, Duration, Scheduler)` |
| `timer(Long, TimeUnit, Scheduler)` | `timer(Duration, Scheduler)` |
| `timer(Long, TimeUnit)` | `timer(Duration)` |
| `timestamp(Scheduler)` | `timestamp(Scheduler)` |
| `timestamp()` | `timestamp` |
| `toBlocking()` | `toBlocking` |
| `toBlockingObservable()` | `toBlockingObservable` |
| `toList()` | `toSeq` |
| <span title="toMap(Func1&lt;? super T, ? extends K&gt;, Func1&lt;? super T, ? extends V&gt;, Func0&lt;? extends Map&lt;K, V&gt;&gt;)"><code>toMap(...)</code></span> | `toMap(T => K, T => V, () => Map[K, V])` |
| <span title="toMap(Func1&lt;? super T, ? extends K&gt;, Func1&lt;? super T, ? extends V&gt;)"><code>toMap(...)</code></span> | `toMap(T => K, T => V)` |
| `toMap(Func1<? super T, ? extends K>)` | `toMap(T => K)` |
| <span title="toMultimap(Func1&lt;? super T, ? extends K&gt;, Func1&lt;? super T, ? extends V&gt;)"><code>toMultimap(...)</code></span> | `toMultimap(T => K, T => V)` |
| <span title="toMultimap(Func1&lt;? super T, ? extends K&gt;, Func1&lt;? super T, ? extends V&gt;, Func0&lt;? extends Map&lt;K, Collection&lt;V&gt;&gt;&gt;)"><code>toMultimap(...)</code></span> | `toMultimap(T => K, T => V, () => M)` |
| `toMultimap(Func1<? super T, ? extends K>)` | `toMultimap(T => K)` |
| <span title="toMultimap(Func1&lt;? super T, ? extends K&gt;, Func1&lt;? super T, ? extends V&gt;, Func0&lt;? extends Map&lt;K, Collection&lt;V&gt;&gt;&gt;, Func1&lt;? super K, ? extends Collection&lt;V&gt;&gt;)"><code>toMultimap(...)</code></span> | `toMultimap(T => K, T => V, () => M, K => B)` |
| `toSortedList(Func2<? super T, ? super T, Integer>)` | Sorting is already done in Scala's collection library, use `.toSeq.map(_.sortWith(f))` |
| `toSortedList()` | Sorting is already done in Scala's collection library, use `.toSeq.map(_.sorted)` |
| `unsafeSubscribe(Subscriber<? super T>)` | `unsafeSubscribe(Subscriber[T])` |
| `unsubscribeOn(Scheduler)` | `unsubscribeOn(Scheduler)` |
| <span title="using(Func0&lt;Resource&gt;, Func1&lt;? super Resource, ? extends Observable&lt;? extends T&gt;&gt;)"><code>using(...)</code></span> | `using(() => Resource, Resource => Observable[T])` |
| <span title="using(Func0&lt;Resource&gt;, Func1&lt;? super Resource, ? extends Observable&lt;? extends T&gt;&gt;, Action1&lt;? super Resource&gt;)"><code>using(...)</code></span> | `using(=> Resource)(Resource => Observable[T], Resource => Unit)` |
| `window(Long, TimeUnit, Scheduler)` | `tumbling(Duration, Scheduler)` |
| `window(Func0<? extends Observable<? extends TClosing>>)`<br/>`window(Observable<U>)` | `tumbling(=> Observable[Any])` |
| `window(Int)` | `tumbling(Int)` |
| `window(Long, Long, TimeUnit)` | `sliding(Duration, Duration)` |
| `window(Int, Int)` | `sliding(Int, Int)` |
| `window(Long, Long, TimeUnit, Int, Scheduler)` | `sliding(Duration, Duration, Int, Scheduler)` |
| `window(Long, TimeUnit, Int, Scheduler)` | `tumbling(Duration, Int, Scheduler)` |
| `window(Long, Long, TimeUnit, Scheduler)` | `sliding(Duration, Duration, Scheduler)` |
| <span title="window(Observable&lt;? extends TOpening&gt;, Func1&lt;? super TOpening, ? extends Observable&lt;? extends TClosing&gt;&gt;)"><code>window(...)</code></span> | `sliding(Observable[Opening])(Opening => Observable[Any])` |
| `window(Long, TimeUnit)` | `tumbling(Duration)` |
| `window(Long, TimeUnit, Int)` | `tumbling(Duration, Int)` |
| <span title="zip(Observable&lt;? extends T1&gt;, Observable&lt;? extends T2&gt;, Func2&lt;? super T1, ? super T2, ? extends R&gt;)"><code>zip(...)</code></span> | use instance method `zip` and `map` |
| <span title="zip(Iterable&lt;? extends T2&gt;, Func2&lt;? super T, ? super T2, ? extends R&gt;)"><code>zip(...)</code></span><br/><span title="zip(Observable&lt;? extends T2&gt;, Func2&lt;? super T, ? super T2, ? extends R&gt;)"><code>zip(...)</code></span> | **TODO: missing** |
| `zip(Iterable<? extends Observable<_>>, FuncN<? extends R>)`<br/>`zip(Observable<? extends Observable<_>>, FuncN<? extends R>)` | use `zip` in companion object and `map` |
| <span title="zip(Observable&lt;? extends T1&gt;, Observable&lt;? extends T2&gt;, Observable&lt;? extends T3&gt;, Func3&lt;? super T1, ? super T2, ? super T3, ? extends R&gt;)"><code>zip(...)</code></span><br/><span title="zip(Observable&lt;? extends T1&gt;, Observable&lt;? extends T2&gt;, Observable&lt;? extends T3&gt;, Observable&lt;? extends T4&gt;, Func4&lt;? super T1, ? super T2, ? super T3, ? super T4, ? extends R&gt;)"><code>zip(...)</code></span><br/><span title="zip(Observable&lt;? extends T1&gt;, Observable&lt;? extends T2&gt;, Observable&lt;? extends T3&gt;, Observable&lt;? extends T4&gt;, Observable&lt;? extends T5&gt;, Func5&lt;? super T1, ? super T2, ? super T3, ? super T4, ? super T5, ? extends R&gt;)"><code>zip(...)</code></span><br/><span title="zip(Observable&lt;? extends T1&gt;, Observable&lt;? extends T2&gt;, Observable&lt;? extends T3&gt;, Observable&lt;? extends T4&gt;, Observable&lt;? extends T5&gt;, Observable&lt;? extends T6&gt;, Func6&lt;? super T1, ? super T2, ? super T3, ? super T4, ? super T5, ? super T6, ? extends R&gt;)"><code>zip(...)</code></span><br/><span title="zip(Observable&lt;? extends T1&gt;, Observable&lt;? extends T2&gt;, Observable&lt;? extends T3&gt;, Observable&lt;? extends T4&gt;, Observable&lt;? extends T5&gt;, Observable&lt;? extends T6&gt;, Observable&lt;? extends T7&gt;, Func7&lt;? super T1, ? super T2, ? super T3, ? super T4, ? super T5, ? super T6, ? super T7, ? extends R&gt;)"><code>zip(...)</code></span><br/><span title="zip(Observable&lt;? extends T1&gt;, Observable&lt;? extends T2&gt;, Observable&lt;? extends T3&gt;, Observable&lt;? extends T4&gt;, Observable&lt;? extends T5&gt;, Observable&lt;? extends T6&gt;, Observable&lt;? extends T7&gt;, Observable&lt;? extends T8&gt;, Func8&lt;? super T1, ? super T2, ? super T3, ? super T4, ? super T5, ? super T6, ? super T7, ? super T8, ? extends R&gt;)"><code>zip(...)</code></span><br/><span title="zip(Observable&lt;? extends T1&gt;, Observable&lt;? extends T2&gt;, Observable&lt;? extends T3&gt;, Observable&lt;? extends T4&gt;, Observable&lt;? extends T5&gt;, Observable&lt;? extends T6&gt;, Observable&lt;? extends T7&gt;, Observable&lt;? extends T8&gt;, Observable&lt;? extends T9&gt;, Func9&lt;? super T1, ? super T2, ? super T3, ? super T4, ? super T5, ? super T6, ? super T7, ? super T8, ? super T9, ? extends R&gt;)"><code>zip(...)</code></span> | considered unnecessary in Scala land |
| <span title="zipWith(Iterable&lt;? extends T2&gt;, Func2&lt;? super T, ? super T2, ? extends R&gt;)"><code>zipWith(...)</code></span> | `zipWith(Iterable[U])((T, U) => R)` |
| <span title="zipWith(Observable&lt;? extends T2&gt;, Func2&lt;? super T, ? super T2, ? extends R&gt;)"><code>zipWith(...)</code></span> | `zipWith(Observable[U])((T, U) => R)` |

This table was generated on Fri Sep 19 12:57:13 CEST 2014.
**Do not edit**. Instead, edit `rx.lang.scala.CompletenessTest`.
