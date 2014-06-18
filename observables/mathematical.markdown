---
layout: documentation
title: ReactiveX - Mathematical and Aggregate Operators
id: mathematical
---

#Mathematical and Aggregate Operators

This section explains operators that perform mathematical or other operations over an entire sequence of items emitted by an Observable. Because these operations must wait for the source Observable to complete emitting items before they can construct their own emissions (and must usually buffer these items), these operators are dangerous to use on Observables that may have very long or infinite sequences.

#### Operators in the `rxjava-math` module
* [**`averageInteger( )`**](Mathematical-and-Aggregate-Operators#wiki-averageinteger-averagelong-averagefloat-and-averagedouble) — calculates the average of Integers emitted by an Observable and emits this average
* [**`averageLong( )`**](Mathematical-and-Aggregate-Operators#wiki-averageinteger-averagelong-averagefloat-and-averagedouble) — calculates the average of Longs emitted by an Observable and emits this average
* [**`averageFloat( )`**](Mathematical-and-Aggregate-Operators#wiki-averageinteger-averagelong-averagefloat-and-averagedouble) — calculates the average of Floats emitted by an Observable and emits this average
* [**`averageDouble( )`**](Mathematical-and-Aggregate-Operators#wiki-averageinteger-averagelong-averagefloat-and-averagedouble) — calculates the average of Doubles emitted by an Observable and emits this average
* [**`max( )`**](Mathematical-and-Aggregate-Operators#wiki-max) — emits the maximum value emitted by a source Observable
* [**`maxBy( )`**](Mathematical-and-Aggregate-Operators#wiki-maxby) — emits the item emitted by the source Observable that has the maximum key value
* [**`min( )`**](Mathematical-and-Aggregate-Operators#wiki-min) — emits the minimum value emitted by a source Observable
* [**`minBy( )`**](Mathematical-and-Aggregate-Operators#wiki-minby) — emits the item emitted by the source Observable that has the minimum key value
* [**`sumInteger( )`**](Mathematical-and-Aggregate-Operators#wiki-suminteger-sumlong-sumfloat-and-sumdouble) — adds the Integers emitted by an Observable and emits this sum
* [**`sumLong( )`**](Mathematical-and-Aggregate-Operators#wiki-suminteger-sumlong-sumfloat-and-sumdouble) — adds the Longs emitted by an Observable and emits this sum
* [**`sumFloat( )`**](Mathematical-and-Aggregate-Operators#wiki-suminteger-sumlong-sumfloat-and-sumdouble) — adds the Floats emitted by an Observable and emits this sum
* [**`sumDouble( )`**](Mathematical-and-Aggregate-Operators#wiki-suminteger-sumlong-sumfloat-and-sumdouble) — adds the Doubles emitted by an Observable and emits this sum

#### Other Aggregate Operators
* [**`concat( )`**](Mathematical-and-Aggregate-Operators#wiki-concat) — concatenate two or more Observables sequentially
* [**`count( )` and `longCount( )`**](Mathematical-and-Aggregate-Operators#wiki-count-and-longcount) — counts the number of items emitted by an Observable and emits this count
* [**`reduce( )`**](Mathematical-and-Aggregate-Operators#wiki-reduce) — apply a function to each emitted item, sequentially, and emit only the final accumulated value
* [**`collect( )`**](Mathematical-and-Aggregate-Operators#collect) — collect items emitted by the source Observable into a single mutable data structure and return an Observable that emits this structure
* [**`toList( )`**](Mathematical-and-Aggregate-Operators#wiki-tolist) — collect all items from an Observable and emit them as a single List
* [**`toSortedList( )`**](Mathematical-and-Aggregate-Operators#wiki-tosortedlist) — collect all items from an Observable and emit them as a single, sorted List
* [**`toMap( )`**](Mathematical-and-Aggregate-Operators#wiki-tomap-and-tomultimap) — convert the sequence of items emitted by an Observable into a map keyed by a specified key function
* [**`toMultiMap( )`**](Mathematical-and-Aggregate-Operators#wiki-tomap-and-tomultimap) — convert the sequence of items emitted by an Observable into an ArrayList that is also a map keyed by a specified key function

***

## averageInteger( ), averageLong( ), averageFloat( ), and averageDouble( )
#### calculates the average of numbers emitted by an Observable and emits this average
<img src="/Netflix/RxJava/wiki/images/rx-operators/average.png" width="640" height="325" />

The `averageInteger( )` method returns an Observable that calculates the average of the Integers emitted by a source Observable and then emits this average as an Integer, as shown in the following sample code:
```groovy
def myObservable = Observable.create({ aSubscriber ->
  if(false == aSubscriber.isUnsubscribed()) aSubscriber.onNext(4);
  if(false == aSubscriber.isUnsubscribed()) aSubscriber.onNext(3);
  if(false == aSubscriber.isUnsubscribed()) aSubscriber.onNext(2);
  if(false == aSubscriber.isUnsubscribed()) aSubscriber.onNext(1);
  if(false == aSubscriber.isUnsubscribed()) aSubscriber.onCompleted();
});

Observable.averageInteger(myObservable).subscribe(
  { println(it); },                  // onNext
  { println("Error encountered"); }, // onError
  { println("Sequence complete"); }  // onCompleted
);
```
```
2
Sequence complete
```
There are also specialized "average" methods for Longs, Floats, and Doubles (`averageLong( )`, `averageFloat( )`, and `averageDouble( )`).

You can also average not the items themselves but the results of a function applied to each item.

<img src="/Netflix/RxJava/wiki/images/rx-operators/average.f.png" width="640" height="325" />

Note that any of these methods will fail with an `IllegalArgumentException` if the source Observable does not emit any items.

#### see also:
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypeaverageselector">`average`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.average.aspx">`Average`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/07_Aggregation.html#MaxAndMin">Introduction to Rx: Min, Max, Sum, and Average</a>

***

## concat( )
#### concatenate two or more Observables sequentially
<img src="/Netflix/RxJava/wiki/images/rx-operators/concat.png" width="640" height="380" />

You can concatenate the output of multiple Observables so that they act like a single Observable, with all of the items emitted by the first Observable being emitted before any of the items emitted by the second Observable, by using the `concat( )` method:

```groovy
myConcatenatedObservable = Observable.concat(observable1, observable2, ... );
```

For example, the following code concatenates the 'odds' and 'evens' Observables into a single Observable:

```groovy
odds  = Observable.from([1, 3, 5, 7]);
evens = Observable.from([2, 4, 6]);

Observable.concat(odds, evens).subscribe(
  { println(it); },                          // onNext
  { println("Error: " + it.getMessage()); }, // onError
  { println("Sequence complete"); }          // onCompleted
);
```
```
1
3
5
7
2
4
6
Sequence complete
```

Instead of passing multiple Observables into `concat( )`, you could also pass in a `List<>` of Observables, or even an Observable that emits Observables, and `concat( )` will concatenate their output into the output of a single Observable.

The instance version of `concat( )` is `concatWith( )`, so, for example, in the code sample above, instead of writing `Observable.concat(odds,evens)` you could also write `odds.concatWith(evens)`.

> **Note:** in the scala language adaptor for RxJava, you access this functionality with the `++` operator rather than the `concat( )` method.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#concat(rx.Observable)">`concat(observableOfObservables)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#concat(rx.Observable, rx.Observable)">`concat(two observables)`</a> (and versions that accept <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#concat(rx.Observable, rx.Observable, rx.Observable)">three</a>, <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#concat(rx.Observable, rx.Observable, rx.Observable, rx.Observable)">four</a>, <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#concat(rx.Observable, rx.Observable, rx.Observable, rx.Observable, rx.Observable)">five</a>, <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#concat(rx.Observable, rx.Observable, rx.Observable, rx.Observable, rx.Observable, rx.Observable)">six</a>, <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#concat(rx.Observable, rx.Observable, rx.Observable, rx.Observable, rx.Observable, rx.Observable, rx.Observable)">seven</a>, <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#concat(rx.Observable, rx.Observable, rx.Observable, rx.Observable, rx.Observable, rx.Observable, rx.Observable, rx.Observable)">eight</a>, and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#concat(rx.Observable, rx.Observable, rx.Observable, rx.Observable, rx.Observable, rx.Observable, rx.Observable, rx.Observable, rx.Observable)">nine</a> observables)
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypeconcatargs">`concat`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.concat.aspx">`Concat`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/12_CombiningSequences.html#Concat">Introduction to Rx: Concat</a>

***

## count( ) and longCount( )
#### counts the number of items emitted by an Observable and emits this count
<img src="/Netflix/RxJava/wiki/images/rx-operators/count.png" width="640" height="310" />

The `count( )` method returns an Observable that emits a single item: an Integer that represents the total number of items emitted by the source Observable, as shown in the following sample code:
```groovy
def myObservable = Observable.create({ aSubscriber ->
  if(false == aSubscriber.isUnsubscribed()) aSubscriber.onNext('Three');
  if(false == aSubscriber.isUnsubscribed()) aSubscriber.onNext('Two');
  if(false == aSubscriber.isUnsubscribed()) aSubscriber.onNext('One');
  if(false == aSubscriber.isUnsubscribed()) aSubscriber.onCompleted();
});

myObservable.count().subscribe(
   { println(it); },                          // onNext
   { println("Error: " + it.getMessage()); }, // onError
   { println("Sequence complete"); }          // onCompleted
);
```
```
3
Sequence complete
```

`longCount( )` is essentially the same, but emits its item as a Long rather than an Integer.

> **Note:** in the scala language adaptor for RxJava, this method is called `length( )` or `size( )`.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#count()">`count()`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#longCount()">`longCount()`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypecountpredicate">`count`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh229470.aspx">`Count`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/07_Aggregation.html#Count">Introduction to Rx: Count</a>

***

## max( )
#### emits the maximum value emitted by a source Observable
<img src="/Netflix/RxJava/wiki/images/rx-operators/max.png" width="640" height="305" />

The `max( )` operator waits until the source Observable completes, and then emits the item emitted by the source Observable that had the highest value, before itself completing. If more than one item has this maximum value, `max( )` emits the last such item. You may optionally pass in a comparator that `max( )` will use to determine the maximum of two emitted items.

#### see also: 
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.max.aspx">`Max`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypemaxcomparer">`max`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/07_Aggregation.html#MaxAndMin">Intro to Rx: Max and Min</a>

***

## maxBy( )
#### emits the item emitted by the source Observable that has the maximum key value
<img src="/Netflix/RxJava/wiki/images/rx-operators/maxBy.png" width="640" height="305" />

The `maxBy( )` operator is similar to `max( )` but instead of emitting the maximum item emitted by the source Observable, it emits the last item from the source Observable that has the maximum key, where that key is generated by a function applied to each item. You supply this function.

#### see also:
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.maxby.aspx">`MaxBy`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypemaxbykeyselector-comparer">`maxBy`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/07_Aggregation.html#MinByMaxBy">Intro to Rx: MinBy and MaxBy</a>

***

## min( )
#### emits the minimum value emitted by a source Observable
<img src="/Netflix/RxJava/wiki/images/rx-operators/min.png" width="640" height="310" />

The `min( )` operator waits until the source Observable completes, and then emits the item emitted by the source Observable that had the lowest value, before itself completing.  If more than one item has this minimum value, `min( )` emits the last such item. You may optionally pass in a comparator that `min( )` will use to determine the minimum of two emitted items.

#### see also: 
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.min.aspx">`Min`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypemincomparer">`min`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/07_Aggregation.html#MaxAndMin">Intro to Rx: Max and Min</a>

***

##  minBy( )
#### emits the item emitted by the source Observable that has the minimum key value
<img src="/Netflix/RxJava/wiki/images/rx-operators/minBy.png" width="640" height="305" />

The `minBy( )` operator is similar to `min( )` but instead of emitting the minimum item emitted by the source Observable, it emits the last item from the source Observable that has the minimum key, where that key is generated by a function applied to each item. You supply this function.

#### see also: 
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.minby.aspx">`MinBy`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypeminbykeyselector-comparer">`minBy`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/07_Aggregation.html#MinByMaxBy">Intro to Rx: MinBy and MaxBy</a>

***

## reduce( )
#### Apply a function to each emitted item, sequentially, and emit only the final accumulated value
<img src="/Netflix/RxJava/wiki/images/rx-operators/reduce.png" width="640" height="320" />

The `reduce( )` method returns an Observable that applies a function of your choosing to the first item emitted by a source Observable, then feeds the result of that function along with the second item emitted by the source Observable into the same function, then feeds the result of _that_ function along with the third item into the same function, and so on until all items have been emitted by the source Observable. Then it emits the final result from the final call to your function as the sole output from the returned Observable.

Note that if the source Observable does not emit any items, `reduce( )` will fail with an `IllegalArgumentException`.

For example, the following code uses `reduce( )` to compute, and then emit as an Observable, the sum of the numbers emitted by the source Observable:

```groovy
numbers = Observable.from([1, 2, 3, 4, 5]);

numbers.reduce({ a, b -> a+b }).subscribe(
  { println(it); },                          // onNext
  { println("Error: " + it.getMessage()); }, // onError
  { println("Sequence complete"); }          // onCompleted
);
```
```
15
Sequence complete
```

This technique, which is called “reduce” in the RxJava context, is sometimes called “aggregate,” “fold,” “accumulate,” “compress,” or “inject” in other programming arenas. 

There is also a version of `reduce( )` to which you can pass a seed item in addition to an accumulator function:

```groovy
my_observable.reduce(initial_seed, accumulator_closure)
```

Note that passing a `null` seed is not the same as not passing a seed. The behavior will be different. If you pass a seed of `null`, you will be seeding your reduction with the item `null`. Note also that if you do pass in a seed, and the source Observable emits no items, `reduce` will emit the seed and complete normally without error.

> **Note:** in the scala language adaptor for RxJava, the `reduce(seed)` variant is called `foldLeft`.

#### example:

Imagine you have access to an Observable that emits a sequence of "Movie" objects that correspond to the "coming soon" movies from a theater. These objects include a number of items of information about the movie, including its title and opening day. You could use `reduce` to convert this sequence of Movie objects into a single list of titles, like this:

```groovy
getComingSoonSequence()
    .reduce([], { theList, video ->
                  theList.add("'" + video.getTitle() + "' (" + video.getOpen() + ")");
                  return(theList);
    }).subscribe({ println("Coming Soon: " + it) });
```
Which might result in something like this:
```
Coming Soon: ['Botso' (Sept. 30), 'The Act of Killing' (Sept. 30), 'Europa Report' (Sept. 27), 'Salinger' (Sept.27), 'In a World' (Sept. 27)]
```

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#reduce(rx.functions.Func2)">`reduce(accumulator)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#reduce(R, rx.functions.Func2)">`reduce(initialValue, accumulator)`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypeaggregateseed-accumulator">`aggregate`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.aggregate.aspx">`Aggregate`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/07_Aggregation.html#Aggregate">Introduction to Rx: Aggregate</a>

***

## collect( )
#### Collect items emitted by the source Observable into a single mutable data structure and return an Observable that emits this structure
<img src="/Netflix/RxJava/wiki/images/rx-operators/collect.png" width="640" height="330" />

This is a simplified version of reduce that does not need to return the state on each pass.

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#collect(R, rx.functions.Action2)">`collect(state, collector )`</a>

***

## sumInteger( ), sumLong( ), sumFloat( ), and sumDouble( )
#### adds the numbers emitted by an Observable and emits this sum
<img src="/Netflix/RxJava/wiki/images/rx-operators/sum.png" width="640" height="330" />

The `sumInteger( )` method returns an Observable that adds the Integers emitted by a source Observable and then emits this sum as an Integer, as shown in the following sample code:
```groovy
def myObservable = Observable.create({ aSubscriber ->
  if(false == aSubscriber.isUnsubscribed()) aSubscriber.onNext(4);
  if(false == aSubscriber.isUnsubscribed()) aSubscriber.onNext(3);
  if(false == aSubscriber.isUnsubscribed()) aSubscriber.onNext(2);
  if(false == aSubscriber.isUnsubscribed()) aSubscriber.onNext(1);
  if(false == aSubscriber.isUnsubscribed()) aSubscriber.onCompleted();
});

Observable.sumInteger(myObservable).subscribe(
  { println(it); },                  // onNext
  { println("Error encountered"); }, // onError
  { println("Sequence complete"); }  // onCompleted
);
```
```
10
Sequence complete
```
There are also specialized "sum" methods for Longs, Floats, and Doubles (`sumLong( )`, `sumFloat( )`, and `sumDouble( )`).

You can also sum not the items themselves but the results of a function applied to each item.

<img src="/Netflix/RxJava/wiki/images/rx-operators/sum.f.png" width="640" height="330" />

#### see also:
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypesumkeyselector-thisarg">`sum`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.sum.aspx">`Sum`</a>
* <a href="http://www.introtorx.com/Content/v1.0.10621.0/07_Aggregation.html#MaxAndMin">Introduction to Rx: Min, Max, Sum, and Average</a>

***

## toList( )
#### collect all items from an Observable and emit them as a single List
<img src="/Netflix/RxJava/wiki/images/rx-operators/toList.png" width="640" height="305" />

Normally, an Observable that emits multiple items will do so by invoking its Subscriber’s `onNext` method for each such item. You can change this behavior, instructing the Observable to compose a list of these multiple items and then to invoke the Subscriber’s `onNext` method _once_, passing it the entire list, by calling the Observable’s `toList( )` method prior to calling its `subscribe( )` method. For example:

```groovy
Observable.tolist(myObservable).subscribe({ myListOfSomething -> do something useful with the list });
```

For example, the following rather pointless code takes a list of integers, converts it into an Observable, then converts that Observable into one that emits the original list as a single item:

```groovy
numbers = Observable.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);

numbers.toList().subscribe(
  { println(it); },                          // onNext
  { println("Error: " + it.getMessage()); }, // onError
  { println("Sequence complete"); }          // onCompleted
);
```
```
[1, 2, 3, 4, 5, 6, 7, 8, 9]
Sequence complete
```

If the source Observable invokes `onCompleted` before emitting any items, `toList( )` will emit an empty list before invoking `onCompleted`. If the source Observable invokes `onError`, `toList( )` will in turn invoke the `onError` methods of its Subscribers.

> **Note:** in the scala language adaptor for RxJava, this method is called `toSeq( )`.

#### see also
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#toList()">`toList()`</a>
* RxJS: <a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/core/observable.md#rxobservableprototypetoarray">`toArray`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/hh211848.aspx">`ToList`</a> and <a href="http://msdn.microsoft.com/en-us/library/hh229207.aspx">`ToArray`</a>

***

## toSortedList( )
#### collect all items emitted by an Observable and emit them as a single sorted List
<img src="/Netflix/RxJava/wiki/images/rx-operators/toSortedList.png" width="640" height="310" />

The `toSortedList( )` method behaves much like `toList( )` except that it sorts the resulting list. By default it sorts the list naturally in ascending order by means of the `Comparable` interface. If any of the items emitted by the Observable does not support `Comparable` with respect to the type of every other item emitted by the Observable, `toSortedList( )` will throw an exception. However, you can change this default behavior by also passing in to `toSortedList( )` a function that takes as its parameters two items and returns a number; `toSortedList( )` will then use that function instead of `Comparable` to sort the items.

For example, the following code takes a list of unsorted integers, converts it into an Observable, then converts that Observable into one that emits the original list in sorted form as a single item:

```groovy
numbers = Observable.from([8, 6, 4, 2, 1, 3, 5, 7, 9]);

numbers.toSortedList().subscribe(
  { println(it); },                          // onNext
  { println("Error: " + it.getMessage()); }, // onError
  { println("Sequence complete"); }          // onCompleted
);
```
```
[1, 2, 3, 4, 5, 6, 7, 8, 9]
Sequence complete
```
Here is an example that provides its own sorting function, in this case, one that sorts numbers according to how close to the number 5 they are:
```groovy
numbers = Observable.from([8, 6, 4, 2, 1, 3, 5, 7, 9]);

numbers.toSortedList({ n, m -> Math.abs(5-n) - Math.abs(5-m) }).subscribe(
  { println(it); },                          // onNext
  { println("Error: " + it.getMessage()); }, // onError
  { println("Sequence complete"); }          // onCompleted
);
```
```
[5, 6, 4, 3, 7, 8, 2, 1, 9]
Sequence complete
```

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#toSortedList()">`toSortedList()`</a> and <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#toSortedList(rx.functions.Func2)">`toSortedList(sortingFunction)`</a>

***

## toMap( ) and toMultimap( )
#### convert the sequence of items emitted by an Observable into a map keyed by a specified key function
<img src="/Netflix/RxJava/wiki/images/rx-operators/toMap.png" width="640" height="305" />

The `toMap( )` and `toMultimap( )` methods collect the items emitted by the source Observable into a map (by default, a `HashMap`, but you can supply a factory function that generates another `Map` variety) and then emit that map. You supply a function that generates the key for each emitted item. You may also optionally supply a function that converts an emitted item into the value to be stored in the map (by default, the item itself is this value).

The `toMultimap( )` method differs from `toMap( )` in that the map it generates is also an `ArrayList`.

<img src="/Netflix/RxJava/wiki/images/rx-operators/toMultiMap.png" width="640" height="305" />

#### see also:
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#toMap(rx.functions.Func1)">`toMap(keySelector)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#toMap(rx.functions.Func1, rx.functions.Func1)">`toMap(keySelector,valueSelector)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#toMap(rx.functions.Func1, rx.functions.Func1, rx.functions.Func0)">`toMap(keySelector,valueSelector,mapFactory)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#toMultimap(rx.functions.Func1)">`toMultimap(keySelector)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#toMultimap(rx.functions.Func1, rx.functions.Func1)">`toMultimap(keySelector,valueSelector)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#toMultimap(rx.functions.Func1, rx.functions.Func1, rx.functions.Func0)">`toMultimap(keySelector,valueSelector,mapFactory)`</a>
* javadoc: <a href="http://netflix.github.io/RxJava/javadoc/rx/Observable.html#toMultimap(rx.functions.Func1, rx.functions.Func1, rx.functions.Func0, rx.functions.Func1)">`toMultimap(keySelector,valueSelector,mapFactory,collectionFactory)`</a>
* Linq: <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.tolookup.aspx">`ToLookup`</a> and <a href="http://msdn.microsoft.com/en-us/library/system.reactive.linq.observable.todictionary.aspx">`ToDictionary`</a>