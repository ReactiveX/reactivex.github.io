---
layout: documentation
title: ReactiveX - Observable
id: observable
---

<h1>Observable</h1>
<p>
 In ReactiveX an <dfn>observer</dfn> <dfn>subscribes</dfn> to an <dfn>Observable</dfn>. Then that observer
 reacts to whatever item or sequence of items the Observable <dfn>emits</dfn>. This pattern facilitates
 concurrent operations because it does not need to block while waiting for the Observable to emit objects, but
 instead it creates a sentry in the form of an observer that stands ready to react appropriately at whatever
 future time the Observable does so.
</p><p>
 This page explains what the reactive pattern is and what Observables and observers are (and how observers
 subscribe to Observables). Other pages show how you use <a href="operators.html">the variety of Observable
 operators</a> to link Observables together and change their behaviors.
</p>
<figure>
 <figcaption><p>This documentation accompanies its explanations with &ldquo;marble diagrams.&rdquo; Here is how
 marble diagrams represent Observables and transformations of Observables:</p></figcaption>
 <img src="{{ site.url }}/assets/operators/legend.png" style="width:100%;" />
</figure>
<h4>See Also</h4>
<ul>
 <li><a href="single.html"><tt>Single</tt></a> &mdash; a specialized version of an Observable that emits only a single item</li>
 <li><a href="http://channel9.msdn.com/Series/Rx-Workshop/Introduction"><cite>Rx Workshop</cite>: Introduction</a></li>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#IObservable"><cite>Introduction to Rx</cite>: IObservable</a></li>
 <li><a href="http://docs.couchbase.com/developer/java-2.0/observables.html"><cite>Mastering observables</cite></a> (from the Couchbase Server documentation)</li>
 <li><a href="https://medium.com/@andrestaltz/2-minute-introduction-to-rx-24c8ca793877"><cite>2 minute introduction to Rx</cite></a> by Andre Staltz (&ldquo;Think of an Observable as an asynchronous immutable array.&rdquo;)</li>
 <li><a href="https://egghead.io/lessons/javascript-introducing-the-observable">Introducing the Observable</a> by Jafar Husain (JavaScript Video Tutorial)</li>
 <li><a href="http://xgrommx.github.io/rx-book/content/observable/index.html">Observable object</a> (RxJS) by Dennis Stoyanov</li>
 <li><a href="https://afterecho.uk/blog/turning-a-callback-into-an-rx-observable.html">Turning a callback into an Rx Observable</a> by @afterecho</li>
</ul>
<h1>Background</h1>
<p>
 In many software programming tasks, you more or less expect that the instructions you write will execute and
 complete incrementally, one-at-a-time, in order as you have written them. But in ReactiveX, many instructions
 may execute in parallel and their results are later captured, in arbitrary order, by “observers.” Rather than
 <em>calling</em> a method, you define a mechanism for retrieving and transforming the data, in the form of an
 “Observable,” and then <em>subscribe</em> an observer to it, at which point the previously-defined mechanism
 fires into action with the observer standing sentry to capture and respond to its emissions whenever they
 are ready.
</p><p>
 An advantage of this approach is that when you have a bunch of tasks that are not dependent on each other, you
 can start them all at the same time rather than waiting for each one to finish before starting the next one
 &mdash; that way, your entire bundle of tasks only takes as long to complete as the longest task in the bundle.
</p><p>
 There are many terms used to describe this model of asynchronous programming and design. This document will use
 the following terms: An <dfn>observer</dfn> <dfn>subscribes</dfn> to an <dfn>Observable</dfn>. An Observable
 <dfn>emits</dfn> <dfn>items</dfn> or sends <dfn>notifications</dfn> to its observers by calling the observers’
 methods.
</p><p>
 In other documents and other contexts, what we are calling an “observer” is sometimes called a “subscriber,”
 “watcher,” or “reactor.” This model in general is often referred to as the
 <a href="http://en.wikipedia.org/wiki/Reactor_pattern">“reactor pattern”</a>.
</p>
<h1>Establishing Observers</h1>
<p>
 This page uses Groovy-like pseudocode for its examples, but there are ReactiveX implementations in many
 languages.
</p><p>
 In an ordinary method call — that is, <em>not</em> the sort of asynchronous, parallel calls typical in
 ReactiveX — the flow is something like this:
</p><ol>
 <li>Call a method.</li>
 <li>Store the return value from that method in a variable.</li>
 <li>Use that variable and its new value to do something useful.</li>
</ol>
<p>
 Or, something like this:
</p>
<div class="code groovy"><pre>
// make the call, assign its return value to `returnVal`
returnVal = someMethod(itsParameters);
// do something useful with returnVal</pre></div>
<p>
 In the asynchronous model the flow goes more like this:
</p><ol>
 <li>Define a method that does something useful with the return value from the asynchronous call; this method is
     part of the <i>observer</i>.</li>
 <li>Define the asynchronous call itself as an <i>Observable</i>.</li>
 <li>Attach the observer to that Observable by <i>subscribing</i> it (this also initiates the actions of the
     Observable).</li>
 <li>Go on with your business; whenever the call returns, the observer’s method will begin to operate on its
     return value or values — the <i>items</i> emitted by the Observable.</li>
</ol>
<p>
 Which looks something like this:
</p>
<div class="code groovy"><pre>
// defines, but does not invoke, the Subscriber's onNext handler
// (in this example, the observer is very simple and has only an onNext handler)
def myOnNext = { it -> do something useful with it };
// defines, but does not invoke, the Observable
def myObservable = someObservable(itsParameters);
// subscribes the Subscriber to the Observable, and invokes the Observable
myObservable.subscribe(myOnNext);
// go on about my business</pre></div>
<h2>onNext, onCompleted, and onError</h2>
<p>
 <a href="operators/subscribe.html">The <code>Subscribe</code> method</a> is how you connect an observer to an
 Observable. Your observer implements some subset of the following methods:
</p>
<dl>
 <dt><code>onNext</code></dt>
  <dd>An Observable calls this method whenever the Observable emits an item. This method takes as a parameter
      the item emitted by the Observable.</dd>
 <dt><code>onError</code></dt>
  <dd>An Observable calls this method to indicate that it has failed to generate the expected data or has
      encountered some other error. It will not make further calls to <code>onNext</code> or <code>onCompleted</code>.
      The <code>onError</code> method takes as its parameter an indication of what caused the error.</dd>
 <dt><code>onCompleted</code></dt>
  <dd>An Observable calls this method after it has called <code>onNext</code> for the final time, if it has not
      encountered any errors.</dd>
</dl>
<p>
 By the terms of <a href="contract.html">the Observable contract</a>, it may call <code>onNext</code> zero or
 more times, and then may follow those calls with a call to either <code>onCompleted</code> or
 <code>onError</code> but not both, which will be its last call. By convention, in this document, calls to
 <code>onNext</code> are usually called &ldquo;emissions&rdquo; of items, whereas calls to
 <code>onCompleted</code> or <code>onError</code> are called &ldquo;notifications.&rdquo;
</p><p>
 A more complete <code>subscribe</code> call example looks like this:
</p>
<div class="code groovy"><pre>
def myOnNext     = { item -> /* do something useful with item */ };
def myError      = { throwable -> /* react sensibly to a failed call */ };
def myComplete   = { /* clean up after the final response */ };
def myObservable = someMethod(itsParameters);
myObservable.subscribe(myOnNext, myError, myComplete);
// go on about my business</pre></div>
<h4>See Also</h4>
<ul>
 <li><a href="http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#IObserver"><cite>Introduction to Rx</cite>: IObserver</a></li>
</ul>
<h2>Unsubscribing</h2>
<p>
 In some ReactiveX implementations, there is a specialized observer interface, <code>Subscriber</code>, that
 implements an <code>unsubscribe</code> method. You can call this method to indicate that the Subscriber is no
 longer interested in any of the Observables it is currently subscribed to. Those Observables can then (if they
 have no other interested observers) choose to stop generating new items to emit.
</p><p>
 The results of this unsubscription will cascade back through the chain of operators that applies to the
 Observable that the observer subscribed to, and this will cause each link in the chain to stop emitting items.
 This is not guaranteed to happen immediately, however, and it is possible for an Observable to generate and
 attempt to emit items for a while even after no observers remain to observe these emissions.
</p>
<h2>Some Notes on Naming Conventions</h2>
<p>
 Each language-specific implementation of ReactiveX has its own naming quirks. There is no canonical naming
 standard, though there are many commonalities between implementations.
</p><p>
 Furthermore, some of these names have different implications in other contexts, or seem awkward in the idiom of
 a particular implementing language.
</p><p>
 For example there is the <code>on<i>Event</i></code> naming pattern (e.g. <code>onNext</code>,
 <code>onCompleted</code>, <code>onError</code>). In some contexts such names would indicate methods by means of
 which event handlers are <em>registered</em>. In ReactiveX, however, they name the event handlers themselves.
</p>
<h1>&ldquo;Hot&rdquo; and &ldquo;Cold&rdquo; Observables</h1>
<p>
 When does an Observable begin emitting its sequence of items? It depends on the Observable. A &ldquo;hot&rdquo;
 Observable may begin emitting items as soon as it is created, and so any observer who later subscribes to that
 Observable may start observing the sequence somewhere in the middle. A &ldquo;cold&rdquo; Observable, on the
 other hand, waits until an observer subscribes to it before it begins to emit items, and so such an observer is
 guaranteed to see the whole sequence from the beginning.
</p><p>
 In some implementations of ReactiveX, there is also something called a &ldquo;Connectable&rdquo; Observable.
 Such an Observable does not begin emitting items until its
 <a href="operators/connect.html"><span class="operator">Connect</span></a> method is called, whether or not any
 observers have subscribed to it.
</p>
<h1>Composition via Observable Operators</h1>
<p>
 Observables and observers are only the start of ReactiveX. By themselves they’d be nothing more than a slight
 extension of the standard observer pattern, better suited to handling a sequence of events rather than a single
 callback.
</p><p>
 The real power comes with the “reactive extensions” (hence “ReactiveX”) — operators that allow you to
 transform, combine, manipulate, and work with the sequences of items emitted by Observables.
</p><p>
 These Rx operators allow you to compose asynchronous sequences together in a declarative manner with all the
 efficiency benefits of callbacks but without the drawbacks of nesting callback handlers that are typically
 associated with asynchronous systems.
</p><p>
 This documentation groups information about <a href="operators.html#alphabetical">the various operators</a>
 and examples of their usage into the following pages:
</p><dl>
 <dt><a href="operators.html#creating">Creating Observables</a></dt>
  <dd><code>Create</code>, <code>Defer</code>, <code>Empty</code>/<code>Never</code>/<code>Throw</code>,
      <code>From</code>, <code>Interval</code>, <code>Just</code>, <code>Range</code>, <code>Repeat</code>,
      <code>Start</code>, and <code>Timer</code></dd>
 <dt><a href="operators.html#transforming">Transforming Observable Items</a></dt>
  <dd><code>Buffer</code>, <code>FlatMap</code>, <code>GroupBy</code>, <code>Map</code>, <code>Scan</code>, and
      <code>Window</code></dd>
 <dt><a href="operators.html#filtering">Filtering Observables</a></dt>
  <dd><code>Debounce</code>, <code>Distinct</code>, <code>ElementAt</code>, <code>Filter</code>,
      <code>First</code>, <code>IgnoreElements</code>, <code>Last</code>, <code>Sample</code>,
      <code>Skip</code>, <code>SkipLast</code>, <code>Take</code>, and <code>TakeLast</code></dd>
 <dt><a href="operators.html#combining">Combining Observables</a></dt>
  <dd><code>And</code>/<code>Then</code>/<code>When</code>, <code>CombineLatest</code>, <code>Join</code>,
      <code>Merge</code>, <code>StartWith</code>, <code>Switch</code>, and <code>Zip</code></dd>
 <dt><a href="operators.html#error">Error Handling Operators</a></dt>
  <dd><code>Catch</code> and <code>Retry</code></dd>
 <dt><a href="operators.html#utility">Utility Operators</a></dt>
  <dd><code>Delay</code>, <code>Do</code>, <code>Materialize</code>/<code>Dematerialize</code>,
      <code>ObserveOn</code>, <code>Serialize</code>, <code>Subscribe</code>, <code>SubscribeOn</code>,
      <code>TimeInterval</code>, <code>Timeout</code>, <code>Timestamp</code>, and <code>Using</code></dd>
 <dt><a href="operators.html#conditional">Conditional and Boolean Operators</a></dt>
  <dd><code>All</code>, <code>Amb</code>, <code>Contains</code>, <code>DefaultIfEmpty</code>,
      <code>SequenceEqual</code>, <code>SkipUntil</code>, <code>SkipWhile</code>, <code>TakeUntil</code>,
      and <code>TakeWhile</code></dd>
 <dt><a href="operators.html#mathematical">Mathematical and Aggregate Operators</a></dt>
  <dd><code>Average</code>, <code>Concat</code>, <code>Count</code>, <code>Max</code>, <code>Min</code>,
      <code>Reduce</code>, and <code>Sum</code></dd>
 <dt><a href="operators.html#conversion">Converting Observables</a></dt>
  <dd><code>To</code></dd>
 <dt><a href="operators.html#connectable">Connectable Observable Operators</a></dt>
  <dd><code>Connect</code>, <code>Publish</code>, <code>RefCount</code>, and <code>Replay</code></dd>
 <dt><a href="operators/backpressure.html">Backpressure Operators</a></dt>
  <dd>a variety of operators that enforce particular flow-control policies</dd>
</dl>
<p>
 These pages include information about some operators that are not part of the core of ReactiveX but are
 implemented in one or more of language-specific implementations and/or optional modules.
</p>
<h2>Chaining Operators</h2>
<p>
 Most operators operate on an Observable and return an Observable. This allows you to apply these operators one
 after the other, in a chain. Each operator in the chain modifies the Observable that results from the operation
 of the previous operator.
</p><p>
 There are other patterns, like the Builder Pattern, in which a variety of methods of a particular class
 operate on an item of that same class by modifying that object through the operation of the method. These
 patterns also allow you to chain the methods in a similar way. But while in the Builder Pattern, the order in
 which the methods appear in the chain does not usually matter, with the Observable operators <em>order
 matters</em>.
</p><p>
 A chain of Observable operators do not operate independently on the original Observable that originates the
 chain, but they operate <em>in turn</em>, each one operating on the Observable generated by the operator
 immediately previous in the chain.
</p>
