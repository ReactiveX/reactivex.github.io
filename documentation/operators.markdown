---
layout: documentation
title: ReactiveX - Operators
id: operators
---

# Operators

Each language-specific version of ReactiveX implements a set of operators, and, although there is
much overlap, there are also some operators that are only implemented by certain versions, and
also each language tends to name its operators to conform to those of other similar operators that
are already familiar in other contexts in that language.

This page lists what could be considered the &ldquo;core&rdquo; operators in the ReactiveX set,
and links to pages that have more in-depth information on how these operators work and how
particular language-specific ReactiveX versions have implemented these operators.

<h2 id="creating">Creating Observables</h2>

Operators that originate new Observables.

* [**`Create`**]({{ site.url }}/documentation/operators/create.html) — create an Observable from scratch by calling observer methods programmatically
* [**`Defer`**]({{ site.url }}/documentation/operators/defer.html) — do not create the Observable until the observer subscribes, and create a fresh Observable for each observer
* [**`Empty`/`Never`/`Throw`**]({{ site.url }}/documentation/operators/empty-never-throw.html) — create Observables that have very precise and limited behavior
* [**`From`**]({{ site.url }}/documentation/operators/from.html) — convert some other object or data structure into an Observable
* [**`Interval`**]({{ site.url }}/documentation/operators/interval.html) — create an Observable that emits a sequence of integers spaced by a particular time interval
* [**`Just`**]({{ site.url }}/documentation/operators/just.html) — convert an object or a set of objects into an Observable that emits that or those objects
* [**`Range`**]({{ site.url }}/documentation/operators/range.html) — create an Observable that emits a range of sequential integers
* [**`Repeat`**]({{ site.url }}/documentation/operators/repeat.html) — create an Observable that emits a particular item or sequence of items repeatedly
* [**`Start`**]({{ site.url }}/documentation/operators/start.html) — create an Observable that emits the return value of a function
* [**`Timer`**]({{ site.url }}/documentation/operators/timer.html) — create an Observable that emits a single item after a given delay

<h2 id="transforming">Transforming Observables</h2>

Operators that transform items that are emitted by an Observable.

* [**`Buffer`**]({{ site.url }}/documentation/operators/buffer.html) — periodically gather items from an Observable into bundles and emit these bundles rather than emitting the items one at a time
* [**`FlatMap`**]({{ site.url }}/documentation/operators/flatmap.html) — transform the items emitted by an Observable into Observables, then flatten the emissions from those into a single Observable
* [**`GroupBy`**]({{ site.url }}/documentation/operators/groupby.html) — divide an Observable into a set of Observables that each emit a different group of items from the original Observable, organized by key
* [**`Map`**]({{ site.url }}/documentation/operators/map.html) — transform the items emitted by an Observable by applying a function to each item
* [**`Scan`**]({{ site.url }}/documentation/operators/scan.html) — apply a function to each item emitted by an Observable, sequentially, and emit each successive value
* [**`Window`**]({{ site.url }}/documentation/operators/window.html) — periodically subdivide items from an Observable into Observable windows and emit these windows rather than emitting the items one at a time

<h2 id="filtering">Filtering Observables</h2>

Operators that selectively emit items from a source Observable.

* [**`Distinct`**]({{ site.url }}/documentation/operators/distinct.html) — suppress duplicate items emitted by an Observable
* [**`ElementAt`**]({{ site.url }}/documentation/operators/elementat.html) — emit only item <i>n</i> emitted by an Observable
* [**`Filter`**]({{ site.url }}/documentation/operators/filter.html) — emit only those items from an Observable that pass a predicate test
* [**`First`**]({{ site.url }}/documentation/operators/first.html) — emit only the first item, or the first item that meets a condition, from an Observable
* [**`IgnoreElements`**]({{ site.url }}/documentation/operators/ignoreelements.html) — do not emit any items from an Observable but mirror its termination notification
* [**`Last`**]({{ site.url }}/documentation/operators/last.html) — emit only the last item emitted by an Observable
* [**`Sample`**]({{ site.url }}/documentation/operators/sample.html) — emit the most recent item emitted by an Observable within periodic time intervals
* [**`Skip`**]({{ site.url }}/documentation/operators/skip.html) — suppress the first <i>n</i> items emitted by an Observable
* [**`SkipLast`**]({{ site.url }}/documentation/operators/skiplast.html) — suppress the last <i>n</i> items emitted by an Observable
* [**`Take`**]({{ site.url }}/documentation/operators/take.html) — emit only the first <i>n</i> items emitted by an Observable
* [**`TakeLast`**]({{ site.url }}/documentation/operators/takelast.html) — emit only the last <i>n</i> items emitted by an Observable
* [**`Throttle`**]({{ site.url }}/documentation/operators/throttle.html) — only emit an item from an Observable if a particular timespan has passed without it emitting another item
* [**`Timeout`**]({{ site.url }}/documentation/operators/timeout.html) — mirror the source Observable, but issue an error notification if a particular period of time elapses without any emitted items

<h2 id="combining">Combining Observables</h2>

Operators that work with multiple source Observables to create a single Observable

* [**`And`/`Then`/`When`**]({{ site.url }}/documentation/operators/and-then-when.html) — combine sets of items emitted by two or more Observables by means of `Pattern` and `Plan` intermediaries
* [**`CombineLatest`**]({{ site.url }}/documentation/operators/combinelatest.html) — when an item is emitted by either of two Observables, combine the latest item emitted by each Observable via a specified function and emit items based on the results of this function
* [**`Join`**]({{ site.url }}/documentation/operators/join.html) — combine items emitted by two Observables whenever an item from one Observable is emitted during a time window defined according to an item emitted by the other Observable
* [**`Merge`**]({{ site.url }}/documentation/operators/merge.html) — combine multiple Observables into one by merging their emissions
* [**`StartWith`**]({{ site.url }}/documentation/operators/startwith.html) — emit a specified sequence of items before beginning to emit the items from the source Observable
* [**`Switch`**]({{ site.url }}/documentation/operators/switch.html) — convert an Observable that emits Observables into a single Observable that emits the items emitted by the most-recently-emitted of those Observables
* [**`Zip`**]({{ site.url }}/documentation/operators/zip.html) — combine the emissions of multiple Observables together via a specified function and emit single items for each combination based on the results of this function

<h2 id="error">Error Handling Operators</h2>

Operators that help to recover from error notifications from an Observable

* [**`Catch`**]({{ site.url }}/documentation/operators/catch.html) — recover from an `onError` notification by continuing the sequence without error
* [**`Retry`**]({{ site.url }}/documentation/operators/retry.html) — if a source Observable sends an `onError` notification, resubscribe to it in the hopes that it will complete without error

<h2 id="utility">Observable Utility Operators</h2>

A toolbox of useful Operators for working with Observables

* [**`Delay`**]({{ site.url }}/documentation/operators/delay.html) — shift the emissions from an Observable forward in time by a particular amount
* [**`Do`**]({{ site.url }}/documentation/operators/do.html) — register an action to take upon a variety of Observable lifecycle events
* [**`Materialize`/`Dematerialize`**]({{ site.url }}/documentation/operators/materialize-dematerialize.html) — represent both the items emitted and the notifications sent as emitted items, or reverse this process
* [**`ObserveOn`**]({{ site.url }}/documentation/operators/observeon.html) — specify the scheduler on which an observer will observe this Observable
* [**`SubscribeOn`**]({{ site.url }}/documentation/operators/subscribeon.html) — specify the scheduler an Observable should use when it is subscribed to
* [**`TimeInterval`**]({{ site.url }}/documentation/operators/timeinterval.html) — convert an Observable that emits items into one that emits indications of the amount of time elapsed between those emissions
* [**`Timestamp`**]({{ site.url }}/documentation/operators/timestamp.html) — attach a timestamp to each item emitted by an Observable
* [**`Using`**]({{ site.url }}/documentation/operators/using.html) — create a disposable resource that has the same lifespan as the Observable

<h2 id="conditional">Conditional and Boolean Operators</h2>

Operators that evaluate one or more Observables or items emitted by Observables

* [**`All`**]({{ site.url }}/documentation/operators/all.html) — determine whether all items emitted by an Observable meet some criteria
* [**`Amb`**]({{ site.url }}/documentation/operators/amb.html) — given two or more source Observables, emit all of the items from only the first of these Observables to emit an item
* [**`Contains`**]({{ site.url }}/documentation/operators/contains.html) — determine whether an Observable emits a particular item or not
* [**`DefaultIfEmpty`**]({{ site.url }}/documentation/operators/defaultifempty.html) — emit items from the source Observable, or a default item if the source Observable emits nothing
* [**`SequenceEqual`**]({{ site.url }}/documentation/operators/sequenceequal.html) — determine whether two Observables emit the same sequence of items
* [**`SkipUntil`**]({{ site.url }}/documentation/operators/skipuntil.html) — discard items emitted by an Observable until a second Observable emits an item
* [**`SkipWhile`**]({{ site.url }}/documentation/operators/skipwhile.html) — discard items emitted by an Observable until a specified condition becomes false
* [**`TakeUntil`**]({{ site.url }}/documentation/operators/takeuntil.html) — discard items emitted by an Observable after a second Observable emits an item or terminates
* [**`TakeWhile`**]({{ site.url }}/documentation/operators/takewhile.html) — discard items emitted by an Observable after a specified condition becomes false

<h2 id="mathematical">Mathematical and Aggregate Operators</h2>

Operators that operate on the entire sequence of items emitted by an Observable

* [**`Average`**]({{ site.url }}/documentation/operators/average.html) — calculates the average of numbers emitted by an Observable and emits this average
* [**`Concat`**]({{ site.url }}/documentation/operators/concat.html) — emit the emissions from two or more Observables without interleaving them
* [**`Count`**]({{ site.url }}/documentation/operators/count.html) — count the number of items emitted by the source Observable and emit only this value
* [**`Max`**]({{ site.url }}/documentation/operators/max.html) — determine, and emit, the maximum-valued item emitted by an Observable
* [**`Min`**]({{ site.url }}/documentation/operators/min.html) — determine, and emit, the minimum-valued item emitted by an Observable
* [**`Reduce`**]({{ site.url }}/documentation/operators/reduce.html) — apply a function to each item emitted by an Observable, sequentially, and emit the final value
* [**`Sum`**]({{ site.url }}/documentation/operators/sum.html) — calculate the sum of numbers emitted by an Observable and emit this sum

<h2 id="backpressure">Backpressure Operators</h2>

* [**backpressure operators**]({{ site.url }}/documentation/operators/backpressure.html) — strategies for coping with Observables that produce items more rapidly than their observers consume them

<h2 id="connectable">Connectable Observable Operators</h2>

Specialty Observables that have more precisely-controlled subscription dynamics

* [**`Connect`**]({{ site.url }}/documentation/operators/connect.html) — instruct a connectable Observable to begin emitting items to its subscribers
* [**`Publish`**]({{ site.url }}/documentation/operators/publish.html) — convert an ordinary Observable into a connectable Observable
* [**`RefCount`**]({{ site.url }}/documentation/operators/refcount.html) — make a Connectable Observable behave like an ordinary Observable
* [**`Replay`**]({{ site.url }}/documentation/operators/replay.html) — ensure that all observers see the same sequence of emitted items, even if they subscribe after the Observable has begun emitting items

<h2 id="blocking">Blocking Observable Operators</h2>

* [**`To`**]({{ site.url }}/documentation/operators/to.html) — convert an Observable into another object or data structure

<h2 id="alphabetical">Alphabetical List of Observable Operators</h2>

Canonical, core operator names are in **boldface**. Other entries represent language-specific
variants of these operators or specialty operators outside of the main ReactiveX core set of
operators.

* [`Aggregate`]({{ site.url }}/documentation/operators/reduce.html)
* [**`All`**]({{ site.url }}/documentation/operators/all.html)
* [**`Amb`**]({{ site.url }}/documentation/operators/amb.html)
* [**`And`**]({{ site.url }}/documentation/operators/and-then-when.html)
* [`Any`]({{ site.url }}/documentation/operators/contains.html)
* [`apply`]({{ site.url }}/documentation/operators/create.html)
* `as_blocking`
* [`AsObservable`]({{ site.url }}/documentation/operators/from.html)
* [`AssertEqual`]({{ site.url }}/documentation/operators/sequenceequal.html)
* [`asyncAction`]({{ site.url }}/documentation/operators/start.html)
* [`asyncFunc`]({{ site.url }}/documentation/operators/start.html)
* [**`Average`**]({{ site.url }}/documentation/operators/average.html)
* [`averageDouble`]({{ site.url }}/documentation/operators/average.html)
* [`averageFloat`]({{ site.url }}/documentation/operators/average.html)
* [`averageInteger`]({{ site.url }}/documentation/operators/average.html)
* [`averageLong`]({{ site.url }}/documentation/operators/average.html)
* `blocking`
* [**`Buffer`**]({{ site.url }}/documentation/operators/buffer.html)
* [`bufferWithCount`]({{ site.url }}/documentation/operators/buffer.html)
* [`bufferWithTime`]({{ site.url }}/documentation/operators/buffer.html)
* [`bufferWithTimeOrCount`]({{ site.url }}/documentation/operators/buffer.html)
* `byLine`
* [`cache`]({{ site.url }}/documentation/operators/replay.html)
* `case`
* `Cast`
* [**`Catch`**]({{ site.url }}/documentation/operators/catch.html)
* [`catchException`]({{ site.url }}/documentation/operators/catch.html)
* [`collect`]({{ site.url }}/documentation/operators/filter.html)
* [**`CombineLatest`**]({{ site.url }}/documentation/operators/combinelatest.html)
* [`combineLatestWith`]({{ site.url }}/documentation/operators/combinelatest.html)
* [**`Concat`**]({{ site.url }}/documentation/operators/concat.html)
* `concat_all`
* `concatMap`
* `concatMapObserver`
* [`concatAll`]({{ site.url }}/documentation/operators/concat.html)
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
* [`debounce`]({{ site.url }}/documentation/operators/throttle.html)
* `decode`
* [**`DefaultIfEmpty`**]({{ site.url }}/documentation/operators/defaultifempty.html)
* [**`Defer`**]({{ site.url }}/documentation/operators/defer.html)
* [`deferFuture`]({{ site.url }}/documentation/operators/start.html)
* [**`Delay`**]({{ site.url }}/documentation/operators/delay.html)
* [`delaySubscription`]({{ site.url }}/documentation/operators/delay.html)
* [`delayWithSelector`]({{ site.url }}/documentation/operators/delay.html)
* [**`Dematerialize`**]({{ site.url }}/documentation/operators/materialize-dematerialize.html)
* [**`Distinct`**]({{ site.url }}/documentation/operators/distinct.html)
* [`DistinctUntilChanged`]({{ site.url }}/documentation/operators/distinct.html)
* [**`Do`**]({{ site.url }}/documentation/operators/do.html)
* [`doAction`]({{ site.url }}/documentation/operators/do.html)
* [`doOnCompleted`]({{ site.url }}/documentation/operators/do.html)
* [`doOnEach`]({{ site.url }}/documentation/operators/do.html)
* [`doOnError`]({{ site.url }}/documentation/operators/do.html)
* [`doOnSubscribe`]({{ site.url }}/documentation/operators/do.html)
* [`doOnTerminate`]({{ site.url }}/documentation/operators/do.html)
* [`doOnUnsubscribe`]({{ site.url }}/documentation/operators/do.html)
* `doseq`
* `doWhile`
* [`drop`]({{ site.url }}/documentation/operators/skip.html)
* [`dropRight`]({{ site.url }}/documentation/operators/skiplast.html)
* [`dropUntil`]({{ site.url }}/documentation/operators/skipuntil.html)
* [`dropWhile`]({{ site.url }}/documentation/operators/skipwhile.html)
* [**`ElementAt`**]({{ site.url }}/documentation/operators/elementat.html)
* [`ElementAtOrDefault`]({{ site.url }}/documentation/operators/elementat.html)
* [**`Empty`**]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [`empty?`]({{ site.url }}/documentation/operators/contains.html)
* `encode`
* [`ensures`]({{ site.url }}/documentation/operators/do.html)
* [`error`]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [`every`]({{ site.url }}/documentation/operators/all.html)
* [`exclusive`]({{ site.url }}/documentation/operators/switch.html)
* [`exists`]({{ site.url }}/documentation/operators/contains.html)
* [**`Filter`**]({{ site.url }}/documentation/operators/filter.html)
* [`filterNot`]({{ site.url }}/documentation/operators/filter.html)
* [`Finally`]({{ site.url }}/documentation/operators/do.html)
* [`finallyAction`]({{ site.url }}/documentation/operators/do.html)
* [`finallyDo`]({{ site.url }}/documentation/operators/do.html)
* [`find`]({{ site.url }}/documentation/operators/contains.html)
* [`findIndex`]({{ site.url }}/documentation/operators/contains.html)
* [**`First`**]({{ site.url }}/documentation/operators/first.html)
* [`FirstOrDefault`]({{ site.url }}/documentation/operators/first.html)
* [`firstOrElse`]({{ site.url }}/documentation/operators/first.html)
* [**`FlatMap`**]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapIterable`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapIterableWith`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapLatest`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapObserver`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatMapWith`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flat_map_with_index`]({{ site.url }}/documentation/operators/flatmap.html)
* [`flatten`]({{ site.url }}/documentation/operators/merge.html)
* [`flattenDelayError`]({{ site.url }}/documentation/operators/merge.html)
* [`foldLeft`]({{ site.url }}/documentation/operators/reduce.html)
* `for`
* [`forall`]({{ site.url }}/documentation/operators/all.html)
* `ForEach`
* [`forEachFuture`]({{ site.url }}/documentation/operators/start.html)
* `forIn`
* `forkJoin`
* [**`From`**]({{ site.url }}/documentation/operators/from.html)
* [`fromAction`]({{ site.url }}/documentation/operators/from.html)
* [`fromArray`]({{ site.url }}/documentation/operators/from.html)
* [`FromAsyncPattern`]({{ site.url }}/documentation/operators/from.html)
* [`fromCallable`]({{ site.url }}/documentation/operators/from.html)
* [`fromCallback`]({{ site.url }}/documentation/operators/from.html)
* [`FromEvent`]({{ site.url }}/documentation/operators/from.html)
* [`FromEventPattern`]({{ site.url }}/documentation/operators/from.html)
* [`fromFunc0`]({{ site.url }}/documentation/operators/from.html)
* [`from_future`]({{ site.url }}/documentation/operators/from.html)
* [`from_iterable`]({{ site.url }}/documentation/operators/from.html)
* [`from_list`]({{ site.url }}/documentation/operators/from.html)
* [`fromNodeCallback`]({{ site.url }}/documentation/operators/from.html)
* [`fromPromise`]({{ site.url }}/documentation/operators/from.html)
* [`fromRunnable`]({{ site.url }}/documentation/operators/from.html)
* `Generate`
* `generateWithAbsoluteTime`
* `generateWithRelativeTime`
* `generator`
* [`GetEnumerator`]({{ site.url }}/documentation/operators/to.html)
* [`getIterator`]({{ site.url }}/documentation/operators/to.html)
* [**`GroupBy`**]({{ site.url }}/documentation/operators/groupby.html)
* [`GroupByUntil`]({{ site.url }}/documentation/operators/groupby.html)
* [`GroupJoin`]({{ site.url }}/documentation/operators/join.html)
* [`head`]({{ site.url }}/documentation/operators/first.html)
* [`headOption`]({{ site.url }}/documentation/operators/first.html)
* [`headOrElse`]({{ site.url }}/documentation/operators/first.html)
* `if`
* `ifThen`
* [**`IgnoreElements`**]({{ site.url }}/documentation/operators/ignoreelements.html)
* [`indexOf`]({{ site.url }}/documentation/operators/contains.html)
* [`interleave`]({{ site.url }}/documentation/operators/merge.html)
* `interpose`
* [**`Interval`**]({{ site.url }}/documentation/operators/interval.html)
* [`into`]({{ site.url }}/documentation/operators/reduce.html)
* [`isEmpty`]({{ site.url }}/documentation/operators/contains.html)
* [`items`]({{ site.url }}/documentation/operators/just.html)
* [**`Join`**]({{ site.url }}/documentation/operators/join.html)
* `join` (string)
* [**`Just`**]({{ site.url }}/documentation/operators/just.html)
* `keep`
* `keep-indexed`
* [**`Last`**]({{ site.url }}/documentation/operators/last.html)
* [`lastOption`]({{ site.url }}/documentation/operators/last.html)
* [`LastOrDefault`]({{ site.url }}/documentation/operators/last.html)
* [`lastOrElse`]({{ site.url }}/documentation/operators/last.html)
* `Latest`
* [`latest`]({{ site.url }}/documentation/operators/switch.html) (Rx.rb version of **`Switch`**)
* [`length`]({{ site.url }}/documentation/operators/count.html)
* [`let`]({{ site.url }}/documentation/operators/publish.html)
* [`letBind`]({{ site.url }}/documentation/operators/publish.html)
* [`LongCount`]({{ site.url }}/documentation/operators/count.html)
* `ManySelect`
* [**`Map`**]({{ site.url }}/documentation/operators/map.html)
* [`map`]({{ site.url }}/documentation/operators/zip.html) (RxClojure version of **`Zip`**)
* `mapCat`
* [`mapCat`]({{ site.url }}/documentation/operators/zip.html) (RxClojure version of **`Zip`**)
* [`map-indexed`]({{ site.url }}/documentation/operators/map.html)
* [`map_with_index`]({{ site.url }}/documentation/operators/map.html)
* [**`Materialize`**]({{ site.url }}/documentation/operators/materialize-dematerialize.html)
* [**`Max`**]({{ site.url }}/documentation/operators/max.html)
* [`MaxBy`]({{ site.url }}/documentation/operators/max.html)
* [**`Merge`**]({{ site.url }}/documentation/operators/merge.html)
* [`mergeAll`]({{ site.url }}/documentation/operators/merge.html)
* [`merge_concurrent`]({{ site.url }}/documentation/operators/merge.html)
* [`mergeDelayError`]({{ site.url }}/documentation/operators/merge.html)
* [`mergeObservable`]({{ site.url }}/documentation/operators/merge.html)
* [`mergeWith`]({{ site.url }}/documentation/operators/merge.html)
* [**`Min`**]({{ site.url }}/documentation/operators/min.html)
* [`MinBy`]({{ site.url }}/documentation/operators/min.html)
* `MostRecent`
* [`Multicast`]({{ site.url }}/documentation/operators/publish.html)
* `nest`
* [**`Never`**]({{ site.url }}/documentation/operators/empty-never-throw.html)
* `Next`
* [`none`]({{ site.url }}/documentation/operators/contains.html)
* [`nonEmpty`]({{ site.url }}/documentation/operators/contains.html)
* [`nth`]({{ site.url }}/documentation/operators/elementat.html)
* [**`ObserveOn`**]({{ site.url }}/documentation/operators/observeon.html)
* [`ObserveOnDispatcher`]({{ site.url }}/documentation/operators/observeon.html)
* [`of`]({{ site.url }}/documentation/operators/from.html)
* [`of_array`]({{ site.url }}/documentation/operators/from.html)
* [`of_enumerable`]({{ site.url }}/documentation/operators/from.html)
* [`of_enumerator`]({{ site.url }}/documentation/operators/from.html)
* `OfType`
* [`ofWithScheduler`]({{ site.url }}/documentation/operators/from.html)
* [`onBackpressureBlock`]({{ site.url }}/documentation/operators/backpressure.html)
* [`onBackpressureBuffer`]({{ site.url }}/documentation/operators/backpressure.html)
* [`onBackpressureDrop`]({{ site.url }}/documentation/operators/backpressure.html)
* [`OnErrorResumeNext`]({{ site.url }}/documentation/operators/catch.html)
* [`onErrorReturn`]({{ site.url }}/documentation/operators/catch.html)
* [`onExceptionResumeNext`]({{ site.url }}/documentation/operators/catch.html)
* [`orElse`]({{ site.url }}/documentation/operators/defaultifempty.html)
* [`pairwise`]({{ site.url }}/documentation/operators/buffer.html)
* [`partition`]({{ site.url }}/documentation/operators/groupby.html)
* [`partition-all`]({{ site.url }}/documentation/operators/window.html)
* [`pausable`]({{ site.url }}/documentation/operators/backpressure.html)
* [`pausableBuffered`]({{ site.url }}/documentation/operators/backpressure.html)
* [`pluck`]({{ site.url }}/documentation/operators/map.html)
* `product`
* [**`Publish`**]({{ site.url }}/documentation/operators/publish.html)
* [`PublishLast`]({{ site.url }}/documentation/operators/publish.html)
* [`publish_synchronized`]({{ site.url }}/documentation/operators/replay.html)
* [`publishValue`]({{ site.url }}/documentation/operators/publish.html)
* [`raise_error`]({{ site.url }}/documentation/operators/empty-never-throw.html)
* [**`Range`**]({{ site.url }}/documentation/operators/range.html)
* [**`Reduce`**]({{ site.url }}/documentation/operators/reduce.html)
* [`reductions`]({{ site.url }}/documentation/operators/scan.html)
* [**`RefCount`**]({{ site.url }}/documentation/operators/refcount.html)
* [**`Repeat`**]({{ site.url }}/documentation/operators/repeat.html)
* [`repeat_infinitely`]({{ site.url }}/documentation/operators/repeat.html)
* [`repeatWhen`]({{ site.url }}/documentation/operators/repeat.html)
* [**`Replay`**]({{ site.url }}/documentation/operators/replay.html)
* [`rescue_error`]({{ site.url }}/documentation/operators/catch.html)
* `rest`
* [**`Retry`**]({{ site.url }}/documentation/operators/retry.html)
* [`retry_infinitely`]({{ site.url }}/documentation/operators/retry.html)
* [`retryWhen`]({{ site.url }}/documentation/operators/retry.html)
* [`Return`]({{ site.url }}/documentation/operators/just.html)
* [`returnValue`]({{ site.url }}/documentation/operators/just.html)
* `runAsync`
* [**`Sample`**]({{ site.url }}/documentation/operators/sample.html)
* [**`Scan`**]({{ site.url }}/documentation/operators/scan.html)
* [`scope`]({{ site.url }}/documentation/operators/using.html)
* [`Select`]({{ site.url }}/documentation/operators/map.html) (alternate name of of **`Map`**)
* [`select`]({{ site.url }}/documentation/operators/filter.html) (alternate name of **`Filter`**)
* `selectConcat`
* `selectConcatObserver`
* [`SelectMany`]({{ site.url }}/documentation/operators/flatmap.html)
* [`selectManyObserver`]({{ site.url }}/documentation/operators/flatmap.html)
* [`select_switch`]({{ site.url }}/documentation/operators/switch.html)
* [`selectSwitch`]({{ site.url }}/documentation/operators/flatmap.html)
* [`select_with_index`]({{ site.url }}/documentation/operators/filter.html)
* [`seq`]({{ site.url }}/documentation/operators/from.html)
* [**`SequenceEqual`**]({{ site.url }}/documentation/operators/sequenceequal.html)
* [`sequence_eql?`]({{ site.url }}/documentation/operators/sequenceequal.html)
* [`SequenceEqualWith`]({{ site.url }}/documentation/operators/sequenceequal.html)
* `serialize`
* [`share`]({{ site.url }}/documentation/operators/refcount.html)
* [`shareReplay`]({{ site.url }}/documentation/operators/replay.html)
* [`shareValue`]({{ site.url }}/documentation/operators/refcount.html)
* `single`
* `singleOrDefault`
* `singleOption`
* `singleOrElse`
* [`size`]({{ site.url }}/documentation/operators/count.html)
* [**`Skip`**]({{ site.url }}/documentation/operators/skip.html)
* [**`SkipLast`**]({{ site.url }}/documentation/operators/skiplast.html)
* [`skipLastWithTime`]({{ site.url }}/documentation/operators/skiplast.html)
* [**`SkipUntil`**]({{ site.url }}/documentation/operators/skipuntil.html)
* [`skipUntilWithTime`]({{ site.url }}/documentation/operators/skipuntil.html)
* [**`SkipWhile`**]({{ site.url }}/documentation/operators/skipwhile.html)
* [`skip_while_with_index`]({{ site.url }}/documentation/operators/skipwhile.html)
* [`skip_with_time`]({{ site.url }}/documentation/operators/skip.html)
* [`sliding`]({{ site.url }}/documentation/operators/window.html)
* [`slidingBuffer`]({{ site.url }}/documentation/operators/buffer.html)
* [`some`]({{ site.url }}/documentation/operators/contains.html)
* `sort`
* `sort-by`
* [`sorted-list-by`]({{ site.url }}/documentation/operators/to.html)
* `spawn`
* `split`
* [`split-with`]({{ site.url }}/documentation/operators/groupby.html)
* [**`Start`**]({{ site.url }}/documentation/operators/start.html)
* [`startAsync`]({{ site.url }}/documentation/operators/start.html)
* [`startFuture`]({{ site.url }}/documentation/operators/start.html)
* [**`StartWith`**]({{ site.url }}/documentation/operators/startwith.html)
* `stringConcat`
* [`stopAndWait`]({{ site.url }}/documentation/operators/backpressure.html)
* `subscribe`
* [**`SubscribeOn`**]({{ site.url }}/documentation/operators/subscribeon.html)
* [`SubscribeOnDispatcher`]({{ site.url }}/documentation/operators/subscribeon.html)
* `subscribeOnCompleted`
* `subscribeOnError`
* `subscribeOnNext`
* [**`Sum`**]({{ site.url }}/documentation/operators/sum.html)
* [`sumDouble`]({{ site.url }}/documentation/operators/sum.html)
* [`sumFloat`]({{ site.url }}/documentation/operators/sum.html)
* [`sumInteger`]({{ site.url }}/documentation/operators/sum.html)
* [`sumLong`]({{ site.url }}/documentation/operators/sum.html)
* [**`Switch`**]({{ site.url }}/documentation/operators/switch.html)
* `switchCase`
* [`switchLatest`]({{ site.url }}/documentation/operators/switch.html)
* `switchMap`
* [`switchOnNext`]({{ site.url }}/documentation/operators/switch.html)
* `Synchronize`
* [**`Take`**]({{ site.url }}/documentation/operators/take.html)
* [`take_with_time`]({{ site.url }}/documentation/operators/take.html)
* [`takeFirst`]({{ site.url }}/documentation/operators/first.html)
* [**`TakeLast`**]({{ site.url }}/documentation/operators/takelast.html)
* [`takeLastBuffer`]({{ site.url }}/documentation/operators/takelast.html)
* [`takeLastBufferWithTime`]({{ site.url }}/documentation/operators/takelast.html)
* [`takeLastWithTime`]({{ site.url }}/documentation/operators/takelast.html)
* [`takeRight`]({{ site.url }}/documentation/operators/last.html) (see also: [**`TakeLast`**]({{ site.url }}/documentation/operators/takelast.html))
* [**`TakeUntil`**]({{ site.url }}/documentation/operators/takeuntil.html)
* [`takeUntilWithTime`]({{ site.url }}/documentation/operators/takeuntil.html)
* [**`TakeWhile`**]({{ site.url }}/documentation/operators/takewhile.html)
* [`take_while_with_index`]({{ site.url }}/documentation/operators/takewhile.html)
* `tail`
* [`tap`]({{ site.url }}/documentation/operators/do.html)
* [`tapOnCompleted`]({{ site.url }}/documentation/operators/do.html)
* [`tapOnError`]({{ site.url }}/documentation/operators/do.html)
* [`tapOnNext`]({{ site.url }}/documentation/operators/do.html)
* [**`Then`**]({{ site.url }}/documentation/operators/and-then-when.html)
* [`thenDo`]({{ site.url }}/documentation/operators/and-then-when.html)
* [**`Throttle`**]({{ site.url }}/documentation/operators/throttle.html)
* `throttleFirst`
* [`throttleLast`]({{ site.url }}/documentation/operators/sample.html)
* [`throttleWithSelector`]({{ site.url }}/documentation/operators/throttle.html)
* [`throttleWithTimeout`]({{ site.url }}/documentation/operators/throttle.html)
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
* `toBlocking`
* [`toBuffer`]({{ site.url }}/documentation/operators/to.html)
* [`to_dict`]({{ site.url }}/documentation/operators/to.html)
* [`ToDictionary`]({{ site.url }}/documentation/operators/to.html)
* [`ToEnumerable`]({{ site.url }}/documentation/operators/to.html)
* `ToEvent`
* [`ToEventPattern`]({{ site.url }}/documentation/operators/to.html)
* `ToFuture`
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
* `ToTask`
* [`toTraversable`]({{ site.url }}/documentation/operators/to.html)
* [`toVector`]({{ site.url }}/documentation/operators/to.html)
* [`tumbling`]({{ site.url }}/documentation/operators/window.html)
* [`tumblingBuffer`]({{ site.url }}/documentation/operators/buffer.html)
* [`unsubscribeOn`]({{ site.url }}/documentation/operators/subscribeon.html)
* [**`Using`**]({{ site.url }}/documentation/operators/using.html)
* [**`When`**]({{ site.url }}/documentation/operators/and-then-when.html)
* [`Where`]({{ site.url }}/documentation/operators/filter.html)
* `while`
* `whileDo`
* [**`Window`**]({{ site.url }}/documentation/operators/window.html)
* [`windowWithCount`]({{ site.url }}/documentation/operators/window.html)
* [`windowWithTime`]({{ site.url }}/documentation/operators/window.html)
* [`windowWithTimeOrCount`]({{ site.url }}/documentation/operators/window.html)
* [`windowed`]({{ site.url }}/documentation/operators/backpressure.html)
* `withFilter`
* [`withLatestFrom`]({{ site.url }}/documentation/operators/combinelatest.html)
* [**`Zip`**]({{ site.url }}/documentation/operators/zip.html)
* [`zipArray`]({{ site.url }}/documentation/operators/zip.html)
* [`zipWith`]({{ site.url }}/documentation/operators/zip.html)
* [`zipWithIndex`]({{ site.url }}/documentation/operators/zip.html)
* [`++`]({{ site.url }}/documentation/operators/concat.html)
* [`+:`]({{ site.url }}/documentation/operators/startwith.html)
* [`:+`]({{ site.url }}/documentation/operators/just.html)
