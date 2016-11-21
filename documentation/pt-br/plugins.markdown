---
layout: documentation
title: ReactiveX - Plugins
id: plugins
---

#Plugins

Plugins allow you to modify the default behavior of RxJava 1.x in several respects:

* by changing the set of default computation, i/o, and new thread Schedulers
* by registering a handler for extraordinary errors that RxJava may encounter
* by registering functions that can take note of the occurrence of several regular RxJava activities

## RxJavaDefaultSchedulers

This plugin allows you to override the default computation, i/o, and new thread Schedulers with Schedulers of your choosing.  To do this, extend the class `RxJavaDefaultSchedulers` and override these methods:

* `Scheduler getComputationScheduler( )`
* `Scheduler getIOScheduler( )`
* `Scheduler getNewThreadScheduler( )`

Then follow these steps:

1. Create an object of the new `RxJavaDefaultSchedulers` subclass you have implemented.
1. Obtain the global `RxJavaPlugins` instance via `RxJavaPlugins.getInstance( )`.
1. Pass your default schedulers object to the `registerDefaultSchedulers( )` method of that instance.

When you do this, RxJava will begin to use the Schedulers returned by your methods rather than its built-in defaults.

## RxJavaErrorHandler

This plugin allows you to register a function that will handle errors that are raised by RxJava but that cannot be handled by the ordinary RxJava `onError` notification process (for instance, if RxJava tries to propagate an error to a subscriber that has not implemented an `onError` handler). To do this, extend the class `RxJavaErrorHandler` and override this method:

* `void handleError(Throwable e)`

Then follow these steps:

1. Create an object of the new `RxJavaErrorHandler` subclass you have implemented.
1. Obtain the global `RxJavaPlugins` instance via `RxJavaPlugins.getInstance( )`.
1. Pass your error handler object to the `registerErrorHandler( )` method of that instance.

When you do this, RxJava will begin to use your error handler to field errors that cannot be handled in ordinary ways.

## RxJavaObservableExecutionHook

This plugin allows you to register functions that RxJava will call upon certain regular RxJava activities, for instance for logging or metrics-collection purposes. To do this, extend the class `RxJavaObservableExecutionHook` and override any or all of these methods:

<table><thead>
 <tr><th>method</th><th>when invoked</th></tr>
 </thead><tbody>
  <tr><td><tt>onCreate( )</tt></td><td>during <tt>Observable.create( )</tt></td></tr>
  <tr><td><tt>onSubscribeStart( )</tt></td><td>immediately before <tt>Observable.subscribe( )</tt></td></tr>
  <tr><td><tt>onSubscribeReturn( )</tt></td><td>immediately after <tt>Observable.subscribe( )</tt></td></tr>
  <tr><td><tt>onSubscribeError( )</tt></td><td>upon a failed execution of <tt>Observable.subscribe( )</tt></td></tr>
  <tr><td><tt>onLift( )</tt></td><td>during <tt>Observable.lift( )</tt></td></tr>
 </tbody>
</table>

Then follow these steps:

1. Create an object of the new `RxJavaObservableExecutionHook` subclass you have implemented.
1. Obtain the global `RxJavaPlugins` instance via `RxJavaPlugins.getInstance( )`.
1. Pass your execution hooks object to the `registerObservableExecutionHook( )` method of that instance.

When you do this, RxJava will begin to call your functions when it encounters the specific conditions they were designed to take note of.
