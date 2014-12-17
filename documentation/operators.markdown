---
layout: documentation
title: ReactiveX - Operators
id: operators
---

# Operators

<h2 id="creating">Creating Observables</h2>

<h2 id="transforming">Transforming Observables</h2>

Operators with which you can transform items that are emitted by an Observable.

* [**`Buffer`**]({{ site.url }}/documentation/operators/buffer.html) — periodically gather items from an Observable into bundles and emit these bundles rather than emitting the items one at a time
* [**`Window`**]({{ site.url }}/documentation/operators/window.html) — periodically subdivide items from an Observable into Observable windows and emit these windows rather than emitting the items one at a time

<h2 id="filtering">Filtering Observables</h2>

<h2 id="combining">Combining Observables</h2>

* [**`And/Then/When`**]({{ site.url }}/documentation/operators/and-then-when.html) — combine sets of items emitted by two or more Observables by means of `Pattern` and `Plan` intermediaries
* [**`CombineLatest`**]({{ site.url }}/documentation/operators/combinelatest.html) — when an item is emitted by either of two Observables, combine the latest item emitted by each Observable via a specified function and emit items based on the results of this function
* [**`Merge`**]({{ site.url }}/documentation/operators/merge.html) — combine multiple Observables into one by merging their emissions
* [**`Zip`**]({{ site.url }}/documentation/operators/zip.html) — combine the emissions of multiple Observables together via a specified function and emit single items for each combination based on the results of this function

<h2 id="error">Error Handling Operators</h2>

* [**`Catch`**]({{ site.url }}/documentation/operators/catch.html) — recover from an `onError` notification by continuing the sequence without error
* [**`Retry`**]({{ site.url }}/documentation/operators/retry.html) — if a source Observable sends an `onError` notification, resubscribe to it in the hopes that it will complete without error

<h2 id="utility">Observable Utility Operators</h2>

<h2 id="conditional">Conditional and Boolean Operators</h2>

* [**`All`**]({{ site.url }}/documentation/operators/all.html) — determine whether all items emitted by an Observable meet some criteria
* [**`Amb`**]({{ site.url }}/documentation/operators/amb.html) — given two or more source Observables, emit all of the items from only the first of these Observables to emit an item

<h2 id="mathematical">Mathematical and Aggregate Operators</h2>

* [**`Average`**]({{ site.url }}/documentation/operators/average.html) — calculates the average of numbers emitted by an Observable and emits this average
* [**`Concat`**]({{ site.url }}/documentation/operators/concat.html) — emit the emissions from two or more Observables without interleaving them
* [**`Count`**]({{ site.url }}/documentation/operators/count.html) — count the number of items emitted by the source Observable and emit only this value
* [**`Sum`**]({{ site.url }}/documentation/operators/sum.html) — calculate the sum of numbers emitted by an Observable and emit this sum

<h2 id="async">Async Operators</h2>

* [**`StartWith`**]({{ site.url }}/documentation/operators/startwith.html) — emit a specified sequence of items before beginning to emit the items from the source Observable

<h2 id="backpressure">Backpressure Operators</h2>

* [**backpressure operators**]({{ site.url }}/documentation/operators/backpressure.html) — strategies for coping with Observables that produce items more rapidly than their observers consume them

<h2 id="connectable">Connectable Observable Operators</h2>

<h2 id="blocking">Blocking Observable Operators</h2>

<h2 id="string">String Observables</h2>

<h2 id="alphabetical">Alphabetical List of Observable Operators</h2>

<h2 id="implement">Implementing your own Operators</h2>

