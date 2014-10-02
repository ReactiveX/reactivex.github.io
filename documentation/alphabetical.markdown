---
layout: documentation
title: ReactiveX - Alphabetical List of Observable Operators
id: alphabetical
---

#Alphabetical List of Observable Operators

* **`aggregate( )`** — _see [**`reduce( )`**](mathematical.html#reduce)_
* [**`all( )`**](conditionals.html#all) — determine whether all items emitted by an Observable meet some criteria
* [**`amb( )`**](conditionals.html#amb) — given two or more source Observables, emits all of the items from the first of these Observables to emit an item
* **`ambWith( )`** — _instance version of [**`amb( )`**](conditionals.html#amb)_
* [**`and( )`**](combining.html#and-then-and-when) — combine the emissions from two or more source Observables into a `Pattern` (`rxjava-joins`)
* **`apply( )`** (scala) — _see [**`create( )`**](creating.html#create)_
* **`asObservable( )`** (kotlin) — _see [**`from( )`**](creating.html#from) (et al.)_
* [**`asyncAction( )`**](async.html#toasync-or-asyncaction-or-asyncfunc) — convert an Action into an Observable that executes the Action and emits its return value (`rxjava-async`)
* [**`asyncFunc( )`**](async.html#toasync-or-asyncaction-or-asyncfunc) — convert a function into an Observable that executes the function and emits its return value (`rxjava-async`)
* [**`averageDouble( )`**](mathematical.html#averageinteger-averagelong-averagefloat-and-averagedouble) — calculates the average of Doubles emitted by an Observable and emits this average (`rxjava-math`)
* [**`averageFloat( )`**](mathematical.html#averageinteger-averagelong-averagefloat-and-averagedouble) — calculates the average of Floats emitted by an Observable and emits this average (`rxjava-math`)
* [**`averageInteger( )`**](mathematical.html#averageinteger-averagelong-averagefloat-and-averagedouble) — calculates the average of Integers emitted by an Observable and emits this average (`rxjava-math`)
* [**`averageLong( )`**](mathematical.html#averageinteger-averagelong-averagefloat-and-averagedouble) — calculates the average of Longs emitted by an Observable and emits this average (`rxjava-math`)
* **`blocking( )`** (clojure) — _see [**`toBlocking( )`**](blocking.html)_
* [**`buffer( )`**](transforming.html#buffer) — periodically gather items from an Observable into bundles and emit these bundles rather than emitting the items one at a time
* [**`byLine( )`**](string.html#byline) (`StringObservable`) — converts an Observable of Strings into an Observable of Lines by treating the source sequence as a stream and splitting it on line-endings
* [**`cache( )`**](utilities.html#cache) — remember the sequence of items emitted by the Observable and emit the same sequence to future Subscribers
* [**`cast( )`**](transforming.html#cast) — cast all items from the source Observable into a particular type before reemitting them
* **`catch( )`** (clojure) — _see [**`onErrorResumeNext( )`**](error-handling.html#onerrorresumenext)_
* [**`chunkify( )`**](phantom.html#chunkify) — returns an iterable that periodically returns a list of items emitted by the source Observable since the last list (⁇)
* [**`collect( )`**](mathematical.html#collect) — collects items emitted by the source Observable into a single mutable data structure and returns an Observable that emits this structure
* [**`combineLatest( )`**](combining.html#combinelatest) — when an item is emitted by either of two Observables, combine the latest item emitted by each Observable via a specified function and emit items based on the results of this function
* **`combineLatestWith( )`** (scala) — _instance version of [**`combineLatest( )`**](combining.html#combinelatest)_
* [**`concat( )`**](mathematical.html#concat) — concatenate two or more Observables sequentially
* [**`concatMap( )`**](transforming.html#flatmap-concatmap-and-flatmapiterable) — transform the items emitted by an Observable into Observables, then flatten this into a single Observable, without interleaving
* **`concatWith( )`** — _instance version of [**`concat( )`**](mathematical.html#concat)_
* [**`connect( )`**](connectable.html#connectableobservableconnect) — instructs a Connectable Observable to begin emitting items
* **`cons( )`** (clojure) — _see [**`concat( )`**](mathematical.html#concat)_
* [**`contains( )`**](conditionals.html#contains) — determine whether an Observable emits a particular item or not
* [**`count( )`**](mathematical.html#count-and-longcount) — counts the number of items emitted by an Observable and emits this count
* [**`create( )`**](creating.html#create) — create an Observable from scratch by means of a function
* **`cycle( )`** (clojure) — _see [**`repeat( )`**](creating.html#repeat)_
* [**`debounce( )`**](filtering.html#throttlewithtimeout-or-debounce) — only emit an item from the source Observable after a particular timespan has passed without the Observable emitting any other items
* [**`decode( )`**](string.html#decode) (`StringObservable`) — convert a stream of multibyte characters into an Observable that emits byte arrays that respect character boundaries
* [**`defaultIfEmpty( )`**](conditionals.html#defaultifempty) — emit items from the source Observable, or emit a default item if the source Observable completes after emitting no items
* [**`defer( )`**](creating.html#defer) — do not create the Observable until a Subscriber subscribes; create a fresh Observable on each subscription
* [**`deferFuture( )`**](async.html#deferfuture) — convert a Future that returns an Observable into an Observable, but do not attempt to get the Observable that the Future returns until a Subscriber subscribes (`rxjava-async`)
* [**`deferCancellableFuture( )`**](phantom.html#fromcancellablefuture-startcancellablefuture-and-defercancellablefuture-) — convert a Future that returns an Observable into an Observable in a way that monitors the subscription status of the Observable to determine whether to halt work on the Future, but do not attempt to get the returned Observable until a Subscriber subscribes (⁇)(`rxjava-async`)
* [**`delay( )`**](utilities.html#delay) — shift the emissions from an Observable forward in time by a specified amount
* [**`dematerialize( )`**](utilities.html#dematerialize) — convert a materialized Observable back into its non-materialized form
* [**`distinct( )`**](filtering.html#distinct) — suppress duplicate items emitted by the source Observable
* [**`distinctUntilChanged( )`**](filtering.html#distinctuntilchanged) — suppress duplicate consecutive items emitted by the source Observable
* **`do( )`** (clojure) — _see [**`doOnEach( )`**](utilities.html#dooneach)_
* [**`doOnCompleted( )`**](utilities.html#dooncompleted) — register an action to take when an Observable completes successfully
* [**`doOnEach( )`**](utilities.html#dooneach) — register an action to take whenever an Observable emits an item
* [**`doOnError( )`**](utilities.html#doonerror) — register an action to take when an Observable completes with an error
* **`doOnNext( )`** — _see [**`doOnEach( )`**](utilities.html#dooneach)_
* [**`doOnSubscribe( )`**](utilities.html#doonsubscribe) — register an action to take when an observer subscribes to an Observable
* [**`doOnTerminate( )`**](utilities.html#doonterminate) — register an action to take when an Observable completes, either successfully or with an error
* [**`doOnUnsubscribe( )`**](utilities.html#doonunsubscribe) — register an action to take when an observer unsubscribes from an Observable
* [**`doWhile( )`**](conditionals.html#dowhile) — emit the source Observable's sequence, and then repeat the sequence as long as a condition remains true (`contrib-computation-expressions`)
* **`drop( )`** (scala/clojure) — _see [**`skip( )`**](filtering.html#skip)_
* **`dropRight( )`** (scala) — _see [**`skipLast( )`**](filtering.html#skiplast)_
* **`dropUntil( )`** (scala) — _see [**`skipUntil( )`**](conditionals.html#skipuntil)_
* **`dropWhile( )`** (scala) — _see [**`skipWhile( )`**](conditionals.html#skipwhile-and-skipwhilewithindex)_
* **`drop-while( )`** (clojure) — _see [**`skipWhile( )`**](conditionals.html#skipwhile-and-skipwhilewithindex)_
* [**`elementAt( )`**](filtering.html#elementat) — emit item _n_ emitted by the source Observable
* [**`elementAtOrDefault( )`**](filtering.html#elementatordefault) — emit item _n_ emitted by the source Observable, or a default item if the source Observable emits fewer than _n_ items
* [**`empty( )`**](creating.html#empty-error-and-never) — create an Observable that emits nothing and then completes
* [**`encode( )`**](string.html#encode) (`StringObservable`) — transform an Observable that emits strings into an Observable that emits byte arrays that respect character boundaries of multibyte characters in the original strings
* [**`error( )`**](creating.html#empty-error-and-never) — create an Observable that emits nothing and then signals an error
* **`every( )`** (clojure) — _see [**`all( )`**](conditionals.html#all)_
* [**`exists( )`**](conditionals.html#exists-and-isempty) — determine whether an Observable emits any items or not
* [**`filter( )`**](filtering.html#filter) — filter items emitted by an Observable
* **`finally( )`** (clojure) — _see [**`finallyDo( )`**](utilities.html#finallydo)_
* **`filterNot( )`** (scala) — _see [**`filter( )`**](filtering.html#filter)_
* [**`finallyDo( )`**](utilities.html#finallydo) — register an action to take when an Observable completes
* [**`first( )`**](filtering.html#first-and-takefirst) (`Observable`) — emit only the first item emitted by an Observable, or the first item that meets some condition
* [**`first( )`**](blocking.html#first-and-firstordefault) (`BlockingObservable`) — emit only the first item emitted by an Observable, or the first item that meets some condition
* [**`firstOrDefault( )`**](filtering.html#firstordefault) (`Observable`) — emit only the first item emitted by an Observable, or the first item that meets some condition, or a default value if the source Observable is empty
* [**`firstOrDefault( )`**](blocking.html#first-and-firstordefault) (`BlockingObservable`) — emit only the first item emitted by an Observable, or the first item that meets some condition, or a default value if the source Observable is empty
* **`firstOrElse( )`** (scala) — _see [**`firstOrDefault( )`**](filtering.html#firstordefault) or [**`firstOrDefault( )`**](blocking.html#first-and-firstordefault) (`BlockingObservable`)_
* [**`flatMap( )`**](transforming.html#flatmap-concatmap-and-flatmapiterable) — transform the items emitted by an Observable into Observables, then flatten this into a single Observable
* [**`flatMapIterable( )`**](transforming.html#flatmap-concatmap-and-flatmapiterable) — create Iterables corresponding to each emission from a source Observable and merge the results into a single Observable
* **`flatMapIterableWith( )`** (scala) — _instance version of [**`flatMapIterable( )`**](transforming.html#flatmap-concatmap-and-flatmapiterable)_
* **`flatMapWith( )`** (scala) — _instance version of [**`flatmap( )`**](transforming.html#flatmap-concatmap-and-flatmapiterable)_
* **`flatten( )`** (scala) — _see [**`merge( )`**](combining.html#merge)_
* **`flattenDelayError( )`** (scala) — _see [**`mergeDelayError( )`**](combining.html#mergedelayerror)_
* **`foldLeft( )`** (scala) — _see [**`reduce( )`**](mathematical.html#reduce)_
* **`forall( )`** (scala) — _see [**`all( )`**](conditionals.html#all)_
* **`forEach( )`** (`Observable`) — _see [**`subscribe( )`**](Observable#onnext-oncompleted-and-onerror)_
* [**`forEach( )`**](blocking.html#foreach) (`BlockingObservable`) — invoke a function on each item emitted by the Observable; block until the Observable completes
* [**`forEachFuture( )`**](async.html#foreachfuture) (`Async`) — pass Subscriber methods to an Observable but also have it behave like a Future that blocks until it completes (`rxjava-async`)
* [**`forEachFuture( )`**](phantom.html#foreachfuture) (`BlockingObservable`)— create a futureTask that will invoke a specified function on each item emitted by an Observable (⁇)
* [**`forIterable( )`**](phantom.html#foriterable) — apply a function to the elements of an Iterable to create Observables which are then concatenated (⁇)
* [**`from( )`**](creating.html#from) — convert an Iterable, a Future, or an Array into an Observable
* [**`from( )`**](string.html#from) (`StringObservable`) — convert a stream of characters or a Reader into an Observable that emits byte arrays or Strings
* [**`fromAction( )`**](async.html#fromaction) — convert an Action into an Observable that invokes the action and emits its result when a Subscriber subscribes (`rxjava-async`)
* [**`fromCallable( )`**](async.html#fromcallable) — convert a Callable into an Observable that invokes the callable and emits its result or exception when a Subscriber subscribes (`rxjava-async`)
* [**`fromCancellableFuture( )`**](phantom.html#fromcancellablefuture-startcancellablefuture-and-defercancellablefuture-) — convert a Future into an Observable in a way that monitors the subscription status of the Observable to determine whether to halt work on the Future, but do not attempt to get the Future's value until a Subscriber subscribes (⁇)(`rxjava-async`)
* **`fromFunc0( )`** — _see [**`fromCallable( )`**](async.html#fromcallable) (`rxjava-async`)_
* [**`fromFuture( )`**](phantom.html#fromfuture) — convert a Future into an Observable, but do not attempt to get the Future's value until a Subscriber subscribes (⁇)
* [**`fromRunnable( )`**](async.html#fromrunnable) — convert a Runnable into an Observable that invokes the runable and emits its result when a Subscriber subscribes (`rxjava-async`)
* [**`generate( )`**](phantom.html#generate-and-generateabsolutetime) — create an Observable that emits a sequence of items as generated by a function of your choosing (⁇)
* [**`generateAbsoluteTime( )`**](phantom.html#generate-and-generateabsolutetime) — create an Observable that emits a sequence of items as generated by a function of your choosing, with each item emitted at an item-specific time (⁇)
* **`generator( )`** (clojure) — _see [**`generate( )`**](phantom.html#generate-and-generateabsolutetime)_
* [**`getIterator( )`**](blocking.html#transformations-tofuture-toiterable-and-getiterator) — convert the sequence emitted by the Observable into an Iterator
* [**`groupBy( )`**](transforming.html#groupby-and-groupbyuntil) — divide an Observable into a set of Observables that emit groups of items from the original Observable, organized by key
* **`group-by( )`** (clojure) — _see [**`groupBy( )`**](transforming.html#groupby-and-groupbyuntil)_
* [**`groupByUntil( )`**](transforming.html#groupby-and-groupbyuntil) — divide an Observable into a set of Observables that emit groups of items from the original Observable, organized by key, and opening a new set periodically
* [**`groupJoin( )`**](combining.html#join-and-groupjoin) — combine the items emitted by two Observables whenever one item from one Observable falls within a window of duration specified by an item emitted by the other Observable
* **`head( )`** (scala) — _see [**`first( )`**](blocking.html#first-and-firstordefault) (`BlockingObservable`)_
* **`headOption( )`** (scala) — _see [**`firstOrDefault( )`**](filtering.html#firstordefault) or [**`firstOrDefault( )`**](blocking.html#first-and-firstordefault) (`BlockingObservable`)_
* **`headOrElse( )`** (scala) — _see [**`firstOrDefault( )`**](filtering.html#firstordefault) or [**`firstOrDefault( )`**](blocking.html#first-and-firstordefault) (`BlockingObservable`)_
* [**`ifThen( )`**](conditionals.html#ifthen) — only emit the source Observable's sequence if a condition is true, otherwise emit an empty or default sequence (`contrib-computation-expressions`)
* [**`ignoreElements( )`**](filtering.html#ignoreelements) — discard the items emitted by the source Observable and only pass through the error or completed notification
* [**`interval( )`**](creating.html#interval) — create an Observable that emits a sequence of integers spaced by a given time interval
* **`into( )`** (clojure) — _see [**`reduce( )`**](mathematical.html#reduce)_
* [**`isEmpty( )`**](conditionals.html#exists-and-isempty) — determine whether an Observable emits any items or not
* **`items( )`** (scala) — _see [**`just( )`**](creating.html#just)_
* [**`join( )`**](combining.html#join-and-groupjoin) — combine the items emitted by two Observables whenever one item from one Observable falls within a window of duration specified by an item emitted by the other Observable
* [**`join( )`**](string.html#join) (`StringObservable`) — converts an Observable that emits a sequence of strings into an Observable that emits a single string that concatenates them all, separating them by a specified string
* [**`just( )`**](creating.html#just) — convert an object into an Observable that emits that object
* [**`last( )`**](blocking.html#last-and-lastordefault) (`BlockingObservable`) — block until the Observable completes, then return the last item emitted by the Observable
* [**`last( )`**](filtering.html#last) (`Observable`) — emit only the last item emitted by the source Observable
* **`lastOption( )`** (scala) — _see [**`lastOrDefault( )`**](filtering.html#lastOrDefault) or [**`lastOrDefault( )`**](blocking.html#last-and-lastordefault) (`BlockingObservable`)_
* [**`lastOrDefault( )`**](blocking.html#last-and-lastordefault) (`BlockingObservable`) — block until the Observable completes, then return the last item emitted by the Observable or a default item if there is no last item
* [**`lastOrDefault( )`**](filtering.html#lastOrDefault) (`Observable`) — emit only the last item emitted by an Observable, or a default value if the source Observable is empty
* **`lastOrElse( )`** (scala) — _see [**`lastOrDefault( )`**](filtering.html#lastOrDefault) or [**`lastOrDefault( )`**](blocking.html#last-and-lastordefault) (`BlockingObservable`)_
* [**`latest( )`**](blocking.html#latest) — returns an iterable that blocks until or unless the Observable emits an item that has not been returned by the iterable, then returns the latest such item
* **`length( )`** (scala) — _see [**`count( )`**](mathematical.html#count-and-longcount)_
* **`limit( )`** — _see [**`take( )`**](filtering.html#take)_
* [**`longCount( )`**](mathematical.html#count-and-longcount) — counts the number of items emitted by an Observable and emits this count
* [**`map( )`**](transforming.html#map) — transform the items emitted by an Observable by applying a function to each of them
* **`mapcat( )`** (clojure) — _see [**`concatMap( )`**](transforming.html#flatmap-concatmap-and-flatmapiterable)_
* **`mapMany( )`** — _see: [**`flatMap( )`**](transforming.html#flatmap-concatmap-and-flatmapiterable)_
* [**`materialize( )`**](utilities.html#materialize) — convert an Observable into a list of Notifications
* [**`max( )`**](mathematical.html#max) — emits the maximum value emitted by a source Observable (`rxjava-math`)
* [**`maxBy( )`**](mathematical.html#maxby) — emits the item emitted by the source Observable that has the maximum key value (`rxjava-math`)
* [**`merge( )`**](combining.html#merge) — combine multiple Observables into one
* [**`mergeDelayError( )`**](combining.html#mergedelayerror) — combine multiple Observables into one, allowing error-free Observables to continue before propagating errors
* **`merge-delay-error( )`** (clojure) — _see [**`mergeDelayError( )`**](combining.html#mergedelayerror)_
* **`mergeMap( )`** * — _see: [**`flatMap( )`**](transforming.html#flatmap-concatmap-and-flatmapiterable)_
* **`mergeMapIterable( )`** — _see: [**`flatMapIterable( )`**](transforming.html#flatmap-concatmap-and-flatmapiterable)_
* **`mergeWith( )`** — _instance version of [**`merge( )`**](combining.html#merge)_
* [**`min( )`**](mathematical.html#min) — emits the minimum value emitted by a source Observable (`rxjava-math`)
* [**`minBy( )`**](mathematical.html#minby) — emits the item emitted by the source Observable that has the minimum key value (`rxjava-math`)
* [**`mostRecent( )`**](blocking.html#mostrecent) — returns an iterable that always returns the item most recently emitted by the Observable
* [**`multicast( )`**](connectable.html#observablepublish-and-observablemulticast) — represents an Observable as a Connectable Observable
* [**`never( )`**](creating.html#empty-error-and-never) — create an Observable that emits nothing at all
* [**`next( )`**](blocking.html#next) — returns an iterable that blocks until the Observable emits another item, then returns that item
* **`nonEmpty( )`** (scala) — _see [**`isEmpty( )`**](conditionals.html#exists-and-isempty)_
* **`nth( )`** (clojure) — _see [**`elementAt( )`**](filtering.html#elementat) and [**`elementAtOrDefault( )`**](filtering.html#elementatordefault)_
* [**`observeOn( )`**](utilities.html#observeon) — specify on which Scheduler a Subscriber should observe the Observable
* [**`ofType( )`**](filtering.html#oftype) — emit only those items from the source Observable that are of a particular class
* [**`onBackpressureBuffer( )`**](Backpressure) — maintain a buffer of all emissions from the source Observable and emit them to downstream Subscribers according to the requests they generate
* [**`onBackpressureDrop( )`**](Backpressure) — drop emissions from the source Observable unless there is a pending request from a downstream Subscriber, in which case emit enough items to fulfill the request
* [**`onErrorFlatMap( )`**](phantom.html#onerrorflatmap) — instructs an Observable to emit a sequence of items whenever it encounters an error (⁇)
* [**`onErrorResumeNext( )`**](error-handling.html#onerrorresumenext) — instructs an Observable to emit a sequence of items if it encounters an error
* [**`onErrorReturn( )`**](error-handling.html#onerrorreturn) — instructs an Observable to emit a particular item when it encounters an error
* [**`onExceptionResumeNext( )`**](error-handling.html#onexceptionresumenext) — instructs an Observable to continue emitting items after it encounters an exception (but not another variety of throwable)
* **`orElse( )`** (scala) — _see [**`defaultIfEmpty( )`**](conditionals.html#defaultifempty)_
* [**`parallel( )`**](phantom.html#parallel) — split the work done on the emissions from an Observable into multiple Observables each operating on its own parallel thread (⁇)
* [**`parallelMerge( )`**](phantom.html#parallelmerge) — combine multiple Observables into smaller number of Observables (⁇)
* [**`pivot( )`**](phantom.html#pivot) — combine multiple sets of grouped observables so that they are arranged primarily by group rather than by set (⁇)
* [**`publish( )`**](connectable.html#observablepublish-and-observablemulticast) — represents an Observable as a Connectable Observable
* [**`publishLast( )`**](connectable.html#observablepublishlast) — represent an Observable as a Connectable Observable that emits only the last item emitted by the source Observable
* [**`range( )`**](creating.html#range) — create an Observable that emits a range of sequential integers
* [**`reduce( )`**](mathematical.html#reduce) — apply a function to each emitted item, sequentially, and emit only the final accumulated value
* **`reductions( )`** (clojure) — _see [**`scan( )`**](transforming.html#scan)_
* [**`refCount( )`**](connectable.html#connectableobservablerefcount) — makes a Connectable Observable behave like an ordinary Observable
* [**`repeat( )`**](creating.html#repeat) — create an Observable that emits a particular item or sequence of items repeatedly
* [**`repeatWhen( )`**](creating.html#repeatwhen) — create an Observable that emits a particular item or sequence of items repeatedly, depending on the emissions of a second Observable
* [**`replay( )`**](connectable.html#observablereplay) — ensures that all Subscribers see the same sequence of emitted items, even if they subscribe after the Observable begins emitting the items
* **`rest( )`** (clojure) — _see [**`next( )`**](blocking.html#next)_
* **`return( )`** (clojure) — _see [**`just( )`**](creating.html#just)_
* [**`retry( )`**](error-handling.html#retry) — if a source Observable emits an error, resubscribe to it in the hopes that it will complete without error
* [**`retrywhen( )`**](error-handling.html#retrywhen) — if a source Observable emits an error, pass that error to another Observable to determine whether to resubscribe to the source
* [**`runAsync( )`**](async.html#runasync) — returns a `StoppableObservable` that emits multiple actions as generated by a specified Action on a Scheduler (`rxjava-async`)
* [**`sample( )`**](filtering.html#sample-or-throttlelast) — emit the most recent items emitted by an Observable within periodic time intervals
* [**`scan( )`**](transforming.html#scan) — apply a function to each item emitted by an Observable, sequentially, and emit each successive value
* **`seq( )`** (clojure) — _see [**`getIterator( )`**](blocking.html#transformations-tofuture-toiterable-and-getiterator)_
* [**`sequenceEqual( )`**](conditionals.html#sequenceequal) — test the equality of sequences emitted by two Observables
* **`sequenceEqualWith( )`** (scala) — _instance version of [**`sequenceEqual( )`**](conditionals.html#sequenceequal)_
* [**`serialize( )`**](utilities.html#serialize) — force an Observable to make serialized calls and to be well-behaved
* **`share( )`** — _see [**`refCount( )`**](connectable.html#connectableobservablerefcount)_
* [**`single( )`**](blocking.html#single-and-singleordefault) (`BlockingObservable`) — if the source Observable completes after emitting a single item, return that item, otherwise throw an exception
* [**`single( )`**](utilities.html#single-and-singleordefault) (`Observable`) — if the source Observable completes after emitting a single item, emit that item, otherwise notify of an exception
* **`singleOption( )`** (scala) — _see [**`singleOrDefault( )`**](blocking.html#single-and-singleordefault) (`BlockingObservable`)_
* [**`singleOrDefault( )`**](blocking.html#single-and-singleordefault) (`BlockingObservable`) — if the source Observable completes after emitting a single item, return that item, otherwise return a default item
* [**`singleOrDefault( )`**](utilities.html#single-and-singleordefault) (`Observable`) — if the source Observable completes after emitting a single item, emit that item, otherwise emit a default item
* **`singleOrElse( )`** (scala) — _see [**`singleOrDefault( )`**](utilities.html#single-and-singleordefault)_
* **`size( )`** (scala) — _see [**`count( )`**](mathematical.html#count-and-longcount)_
* [**`skip( )`**](filtering.html#skip) — ignore the first _n_ items emitted by an Observable
* [**`skipLast( )`**](filtering.html#skiplast) — ignore the last _n_ items emitted by an Observable
* [**`skipUntil( )`**](conditionals.html#skipuntil) — discard items emitted by a source Observable until a second Observable emits an item, then emit the remainder of the source Observable's items
* [**`skipWhile( )`**](conditionals.html#skipwhile-and-skipwhilewithindex) — discard items emitted by an Observable until a specified condition is false, then emit the remainder
* [**`skipWhileWithIndex( )`**](conditionals.html#skipwhile-and-skipwhilewithindex) — discard items emitted by an Observable until a specified condition is false, then emit the remainder
* **`sliding( )`** (scala) — _see [**`window( )`**](transforming.html#window)_
* **`slidingBuffer( )`** (scala) — _see [**`buffer( )`**](transforming.html#buffer)_
* [**`split( )`**](string.html#split) (`StringObservable`) — converts an Observable of Strings into an Observable of Strings that treats the source sequence as a stream and splits it on a specified regex boundary
* [**`start( )`**](async.html#start) — create an Observable that emits the return value of a function (`rxjava-async`)
* [**`startCancellableFuture( )`**](phantom.html#fromcancellablefuture-startcancellablefuture-and-defercancellablefuture-) — convert a function that returns Future into an Observable that emits that Future's return value in a way that monitors the subscription status of the Observable to determine whether to halt work on the Future (⁇)(`rxjava-async`)
* [**`startFuture( )`**](async.html#startfuture) — convert a function that returns Future into an Observable that emits that Future's return value (`rxjava-async`)
* [**`startWith( )`**](combining.html#startwith) — emit a specified sequence of items before beginning to emit the items from the Observable
* [**`stringConcat( )`**](string.html#stringconcat) (`StringObservable`) — converts an Observable that emits a sequence of strings into an Observable that emits a single string that concatenates them all
* [**`subscribeOn( )`**](utilities.html#subscribeon) — specify which Scheduler an Observable should use when its subscription is invoked
* [**`sumDouble( )`**](mathematical.html#suminteger-sumlong-sumfloat-and-sumdouble) — adds the Doubles emitted by an Observable and emits this sum (`rxjava-math`)
* [**`sumFloat( )`**](mathematical.html#suminteger-sumlong-sumfloat-and-sumdouble) — adds the Floats emitted by an Observable and emits this sum (`rxjava-math`)
* [**`sumInteger( )`**](mathematical.html#suminteger-sumlong-sumfloat-and-sumdouble) — adds the Integers emitted by an Observable and emits this sum (`rxjava-math`)
* [**`sumLong( )`**](mathematical.html#suminteger-sumlong-sumfloat-and-sumdouble) — adds the Longs emitted by an Observable and emits this sum (`rxjava-math`)
* **`switch( )`** (scala) — _see [**`switchOnNext( )`**](combining.html#switchonnext)_
* [**`switchCase( )`**](conditionals.html#switchcase) — emit the sequence from a particular Observable based on the results of an evaluation (`contrib-computation-expressions`)
* [**`switchMap( )`**](transforming.html#switchmap) — transform the items emitted by an Observable into Observables, and mirror those items emitted by the most-recently transformed Observable
* [**`switchOnNext( )`**](combining.html#switchonnext) — convert an Observable that emits Observables into a single Observable that emits the items emitted by the most-recently emitted of those Observables
* **`synchronize( )`** — _see [**`serialize( )`**](utilities.html#serialize)_
* [**`take( )`**](filtering.html#take) — emit only the first _n_ items emitted by an Observable
* [**`takeFirst( )`**](filtering.html#first-and-takefirst) — emit only the first item emitted by an Observable, or the first item that meets some condition
* [**`takeLast( )`**](filtering.html#takelast) — only emit the last _n_ items emitted by an Observable
* [**`takeLastBuffer( )`**](filtering.html#takelastbuffer) — emit the last _n_ items emitted by an Observable, as a single list item
* **`takeRight( )`** (scala) — _see [**`last( )`**](filtering.html#last) (`Observable`) or [**`takeLast( )`**](filtering.html#takelast)_
* [**`takeUntil( )`**](conditionals.html#takeuntil) — emits the items from the source Observable until a second Observable emits an item
* [**`takeWhile( )`**](conditionals.html#takewhile-and-takewhilewithindex) — emit items emitted by an Observable as long as a specified condition is true, then skip the remainder
* **`take-while( )`** (clojure) — _see [**`takeWhile( )`**](conditionals.html#takewhile-and-takewhilewithindex)_
* [**`takeWhileWithIndex( )`**](conditionals.html#takewhile-and-takewhilewithindex) — emit items emitted by an Observable as long as a specified condition is true, then skip the remainder
* [**`then( )`**](combining.html#and-then-and-when) — transform a series of `Pattern` objects via a `Plan` template (`rxjava-joins`)
* [**`throttleFirst( )`**](filtering.html#throttlefirst) — emit the first items emitted by an Observable within periodic time intervals
* [**`throttleLast( )`**](filtering.html#sample-or-throttlelast) — emit the most recent items emitted by an Observable within periodic time intervals
* [**`throttleWithTimeout( )`**](filtering.html#throttlewithtimeout-or-debounce) — only emit an item from the source Observable after a particular timespan has passed without the Observable emitting any other items
* **`throw( )`** (clojure) — _see [**`error( )`**](creating.html#empty-error-and-never)_
* [**`timeInterval( )`**](utilities.html#timeinterval) — emit the time lapsed between consecutive emissions of a source Observable
* [**`timeout( )`**](filtering.html#timeout) — emit items from a source Observable, but issue an exception if no item is emitted in a specified timespan
* [**`timer( )`**](creating.html#timer) — create an Observable that emits a single item after a given delay
* [**`timestamp( )`**](utilities.html#timestamp) — attach a timestamp to every item emitted by an Observable
* [**`toAsync( )`**](async.html#toasync-or-asyncaction-or-asyncfunc) — convert a function or Action into an Observable that executes the function and emits its return value (`rxjava-async`)
* [**`toBlocking( )`**](blocking.html) — transform an Observable into a BlockingObservable
* **`toBlockingObservable( )`** - _see [**`toBlocking( )`**](blocking.html)_
* [**`toFuture( )`**](blocking.html#transformations-tofuture-toiterable-and-getiterator) — convert the Observable into a Future
* [**`toIterable( )`**](blocking.html#transformations-tofuture-toiterable-and-getiterator) — convert the sequence emitted by the Observable into an Iterable
* **`toIterator( )`** — _see [**`getIterator( )`**](blocking.html#transformations-tofuture-toiterable-and-getiterator)_
* [**`toList( )`**](mathematical.html#tolist) — collect all items from an Observable and emit them as a single List
* [**`toMap( )`**](mathematical.html#tomap-and-tomultimap) — convert the sequence of items emitted by an Observable into a map keyed by a specified key function
* [**`toMultimap( )`**](mathematical.html#tomap-and-tomultimap) — convert the sequence of items emitted by an Observable into an ArrayList that is also a map keyed by a specified key function
* **`toSeq( )`** (scala) — _see [**`toList( )`**](mathematical.html#tolist)_
* [**`toSortedList( )`**](mathematical.html#tosortedlist) — collect all items from an Observable and emit them as a single, sorted List
* **`tumbling( )`** (scala) — _see [**`window( )`**](transforming.html#window)_
* **`tumblingBuffer( )`** (scala) — _see [**`buffer( )`**](transforming.html#buffer)_
* [**`using( )`**](utilities.html#using) — create a disposable resource that has the same lifespan as an Observable
* [**`when( )`**](combining.html#and-then-and-when) — convert a series of `Plan` objects into an Observable (`rxjava-joins`)
* **`where( )`** — _see: [**`filter( )`**](filtering.html#filter)_
* [**`whileDo( )`**](conditionals.html#whiledo) — if a condition is true, emit the source Observable's sequence and then repeat the sequence as long as the condition remains true (`contrib-computation-expressions`)
* [**`window( )`**](transforming.html#window) — periodically subdivide items from an Observable into Observable windows and emit these windows rather than emitting the items one at a time
* [**`zip( )`**](combining.html#zip) — combine sets of items emitted by two or more Observables together via a specified function and emit items based on the results of this function
* **`zipWith( )`** — _instance version of [**`zip( )`**](combining.html#zip)_
* **`zipWithIndex( )`** (scala) — _see [**`zip( )`**](combining.html#zip)_
* **`++`** (scala) — _see [**`concat( )`**](mathematical.html#concat)_
* **`+:`** (scala) — _see [**`startWith( )`**](combining.html#startwith)_

(⁇) — this proposed operator is not part of RxJava 1.0
