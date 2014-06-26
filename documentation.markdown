---
layout: documentation
title: ReactiveX - Documentation
id: documentation
---

#Getting Started

## Getting Binaries

You can find binaries and dependency information for Maven, Ivy, Gradle, SBT, and others at [http://search.maven.org](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22com.netflix.rxjava%22%20AND%20a%3A%22rxjava-core%22). You need Java 6 or later.

<div id="getting-binaries">
  <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
    <li class="active"><a href="#maven" data-toggle="tab">Maven</a></li>
    <li><a href="#ivy" data-toggle="tab">Ivy</a></li>
    <li><a href="#sbt" data-toggle="tab">SBT</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="maven">
{% highlight xml %}
<dependency>
    <groupId>com.netflix.rxjava</groupId>
    <artifactId>rxjava-core</artifactId>
    <version>0.19.0</version>
</dependency>
{% endhighlight %}

If you need to download the jars instead of using a build system, create a Maven `pom` file like this with the desired version:

{% highlight xml %}
<?xml version="1.0"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.netflix.rxjava.download</groupId>
  <artifactId>rxjava-download</artifactId>
  <version>1.0-SNAPSHOT</version>
  <name>Simple POM to download rxjava-core and dependencies</name>
  <url>http://github.com/Netflix/RxJava</url>
  <dependencies>
    <dependency>
      <groupId>com.netflix.rxjava</groupId>
      <artifactId>rxjava-core</artifactId>
      <version>0.17.0</version>
      <scope/>
    </dependency>
  </dependencies>
</project>
{% endhighlight %}

Then execute:

{% highlight bash %}
$ mvn -f download-rxjava-pom.xml dependency:copy-dependencies
{% endhighlight %}

That command downloads `rxjava-core-*.jar` and its dependencies into `./target/dependency/`.

    </div>
    <div class="tab-pane" id="ivy">
{% highlight xml %}
<dependency org="com.netflix.rxjava" name="rxjava-core" rev="0.17.0" />
{% endhighlight %}
    </div>
    <div class="tab-pane" id="sbt">
{% highlight scala %}
libraryDependencies += "com.netflix.rxjava" % "rxjava-scala" % "0.17.0"
{% endhighlight %}
    </div>
  </div>
</div>

## Building from source

To check out and build the RxJava source, issue the following commands:

```
$ git clone git@github.com:Netflix/RxJava.git
$ cd RxJava/
$ ./gradlew build
```

To do a clean build, issue the following command:

```
$ ./gradlew clean build
```

A build should look similar to this:

```
$ ./gradlew build
:rxjava-core:compileJava
:rxjava-core:processResources UP-TO-DATE
:rxjava-core:classes
:rxjava-core:jar
:rxjava-core:sourcesJar
:rxjava-core:signArchives SKIPPED
:rxjava-core:assemble
:rxjava-core:licenseMain UP-TO-DATE
:rxjava-core:licenseTest UP-TO-DATE
:rxjava-core:compileTestJava
:rxjava-core:processTestResources UP-TO-DATE
:rxjava-core:testClasses
:rxjava-core:test
:rxjava-core:check
:rxjava-core:build

BUILD SUCCESSFUL

Total time: 30.758 secs
```

On a clean build you will see the unit tests run. They will look something like this:

```
> Building > :rxjava-core:test > 91 tests completed
```

# Hello World!

The following sample implementations of “Hello World” in Java, Groovy, Clojure, and Scala create an Observable from a list of Strings, and then subscribe to this Observable with a method that prints “Hello _String_!” for each string emitted by the Observable.

You can find additional code examples in the `/src/examples` folders of each [language adaptor](https://github.com/Netflix/RxJava/tree/master/language-adaptors):

* [Groovy examples](https://github.com/Netflix/RxJava/tree/master/language-adaptors/rxjava-groovy/src/examples)
* [Clojure examples](https://github.com/Netflix/RxJava/tree/master/language-adaptors/rxjava-clojure/src/examples)
* [Scala examples](https://github.com/Netflix/RxJava/tree/master/language-adaptors/rxjava-scala/src/examples)

<div id="hello-world">
  <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
    <li class="active"><a href="#java" data-toggle="tab">Java</a></li>
    <li><a href="#scala" data-toggle="tab">Scala</a></li>
    <li><a href="#groovy" data-toggle="tab">Groovy</a></li>
    <li><a href="#clojure" data-toggle="tab">Clojure</a></li>
    <li><a href="#kotlin" data-toggle="tab">Kotlin</a></li>
    <li><a href="#jruby" data-toggle="tab">JRuby</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="java">
{% highlight java %}
public static void hello(String... names) {
    Observable.from(names).subscribe(new Action1<String>() {

        @Override
        public void call(String s) {
            System.out.println("Hello " + s + "!");
        }

    });
}
{% endhighlight %}

{% highlight java %}
hello("Ben", "George");
Hello Ben!
Hello George!
{% endhighlight %}
    </div>
    <div class="tab-pane" id="scala">

      {% snippet https://api.github.com/repos/GeorgiKhomeriki/RxJava/contents/language-adaptors/rxjava-scala/src/examples/reactivex/getting-started/hello.scala, scala %}

      {% snippet https://api.github.com/repos/GeorgiKhomeriki/RxJava/contents/language-adaptors/rxjava-scala/src/examples/reactivex/getting-started/hello.output, scala %}
    
    </div>
    <div class="tab-pane" id="groovy">
{% highlight groovy %}
def hello(String[] names) {
    Observable.from(names)
        .subscribe({ println "Hello " + it + "!" })
}
{% endhighlight %}

{% highlight groovy %}
hello("Ben", "George")
Hello Ben!
Hello George!
{% endhighlight %}
    </div>
    <div class="tab-pane" id="clojure">
{% highlight clojure %}
(defn hello
  [&rest]
  (-> (Observable/from &rest)
    (.subscribe #(println (str "Hello " % "!")))))
{% endhighlight %}

{% highlight clojure %}
(hello ["Ben" "George"])
Hello Ben!
Hello George!
{% endhighlight %}
    </div>
    <div class="tab-pane" id="kotlin">
{% highlight kotlin %}
      TBD
{% endhighlight %}
    </div>
    <div class="tab-pane" id="jruby">
{% highlight ruby %}
      TBD
{% endhighlight %}
    </div>
  </div>
</div>


# Larger example

To use RxJava you create Observables (which emit data items), transform those Observables in various ways to get the precise data items that interest you (by using Observable operators), and then observe and react to these sequences of interesting items (by implementing Observers or Subscribers and then subscribing them to the resulting transformed Observables).

## Creating Observables

To create an Observable, you can either implement the Observable's behavior manually by passing a function to [`create( )`](Creating-Observables#create) that exhibits Observable behavior, or you can convert an existing data structure into an Observable by using [some of the Observable operators that are designed for this purpose](Creating-Observables).

### Creating an Observable from an Existing Data Structures

You use the Observable [`just( )`](Creating-Observables#just) and [`from( )`](Creating-Observables#from) methods to convert objects, lists, or arrays of objects into Observables that emit those objects:

```groovy
Observable<String> o = Observable.from("a", "b", "c");

def list = [5, 6, 7, 8]
Observable<Integer> o = Observable.from(list);

Observable<String> o = Observable.just("one object");
```

These converted Observables will synchronously invoke the [`onNext( )`](Observable#onnext-oncompleted-and-onerror) method of any subscriber that subscribes to them, for each item to be emitted by the Observable, and will then invoke the subscriber’s [`onCompleted( )`](Observable#onnext-oncompleted-and-onerror) method.

### Creating an Observable via the `create( )` method

You can implement asynchronous i/o, computational operations, or even “infinite” streams of data by designing your own Observable and implementing it with the [`create( )`](Creating-Observables#create) method.

#### Synchronous Observable Example

```groovy
/**
 * This example shows a custom Observable that blocks 
 * when subscribed to (does not spawn an extra thread).
 */
def customObservableBlocking() {
    return Observable.create({ aSubscriber ->
        for (int i=0; i<50; i++) {
            if (false == aSubscriber.isUnsubscribed()) {
                aSubscriber.onNext("value_" + i);
            };
        }
        // after sending all values we complete the sequence
        if (false == aSubscriber.isUnsubscribed()) {
            aSubscriber.onCompleted();
        }
    });
}

// To see output:
customObservableBlocking().subscribe({ it -> println(it); });
```

#### Asynchronous Observable Example

The following example uses Groovy to create an Observable that emits 75 strings.

It is written verbosely, with static typing and implementation of the `Func1` anonymous inner class, to make the example more clear:

```groovy
/**
 * This example shows a custom Observable that does not block
 * when subscribed to as it spawns a separate thread.
 */
def customObservableNonBlocking() {
    return Observable.create(
        /*
         * This 'call' method will be invoked with the Observable is subscribed to.
         * 
         * It spawns a thread to do it asynchronously.
         */
         { subscriber ->
            // For simplicity this example uses a Thread instead of an ExecutorService/ThreadPool
            final Thread t = new Thread(new Runnable() {
                void run() {
                    for (int i=0; i<75; i++) {
                        if (true == subscriber.isUnsubscribed()) {
                            return;
                        }
                        subscriber.onNext("value_" + i);
                    }
                    // after sending all values we complete the sequence
                    if (false == subscriber.isUnsubscribed()) {
                        subscriber.onCompleted();
                    }
                };
            });
            t.start();
        }
    );
}

// To see output:
customObservableNonBlocking().subscribe({ println(it) });
```

Here is the same code in Clojure that uses a Future (instead of raw thread) and is implemented more consisely:

```clojure
(defn customObservableNonBlocking []
  "This example shows a custom Observable that does not block 
   when subscribed to as it spawns a separate thread.
   
  returns Observable<String>"
  (Observable/create 
    (fn [subscriber]
      (let [f (future 
                (doseq [x (range 50)] (-> subscriber (.onNext (str "value_" x))))
                ; after sending all values we complete the sequence
                (-> subscriber .onCompleted))
        ))
      ))
```

```clojure
; To see output
(.subscribe (customObservableNonBlocking) #(println %))
```

Here is an example that fetches articles from Wikipedia and invokes onNext with each one:

```clojure
(defn fetchWikipediaArticleAsynchronously [wikipediaArticleNames]
  "Fetch a list of Wikipedia articles asynchronously.
  
   return Observable<String> of HTML"
  (Observable/create 
    (fn [subscriber]
      (let [f (future
                (doseq [articleName wikipediaArticleNames]
                  (-> subscriber (.onNext (http/get (str "http://en.wikipedia.org/wiki/" articleName)))))
                ; after sending response to onnext we complete the sequence
                (-> subscriber .onCompleted))
        ))))
```

```clojure
(-> (fetchWikipediaArticleAsynchronously ["Tiger" "Elephant"]) 
  (.subscribe #(println "--- Article ---\n" (subs (:body %) 0 125) "...")))
```

Back to Groovy, the same Wikipedia functionality but using closures instead of anonymous inner classes:

```groovy
/*
 * Fetch a list of Wikipedia articles asynchronously.
 */
def fetchWikipediaArticleAsynchronously(String... wikipediaArticleNames) {
    return Observable.create({ subscriber ->
        Thread.start( {
            for (articleName in wikipediaArticleNames) {
                if (true == subscriber.isUnsubscribed()) {
                    return;
                }
                subscriber.onNext(new URL("http://en.wikipedia.org/wiki/"+articleName).getText());
            }
            if (false == subscriber.isUnsubscribed()) {
                subscriber.onCompleted();
            }
        } );
        return( subscriber );
    });
}

fetchWikipediaArticleAsynchronously("Tiger", "Elephant")
    .subscribe({ println "--- Article ---\n" + it.substring(0, 125); });
```

Results:

```text
--- Article ---
 <!DOCTYPE html>
<html lang="en" dir="ltr" class="client-nojs">
<head>
<title>Tiger - Wikipedia, the free encyclopedia</title> ...
--- Article ---
 <!DOCTYPE html>
<html lang="en" dir="ltr" class="client-nojs">
<head>
<title>Elephant - Wikipedia, the free encyclopedia</tit ...
```

Note that all of the above examples ignore error handling, for brevity. See below for examples that include error handling.

More information can be found on the [[Observable]] and [[Creating Observables|Creating-Observables]] pages.

## Transforming Observables with Operators

Rx allows you to chain _operators_ together to transform and compose Observables.

The following example, in Groovy, uses a previously defined, asynchronous Observable that emits 75 items, skips over the first 10 of these ([`skip(10)`](Filtering-Observables#wiki-skip)), then takes the next 5 ([`take(5)`](Filtering-Observables#wiki-take)), and transforms them ([`map(...)`](Transforming-Observables#wiki-map)) before subscribing and printing the items:

```groovy
/**
 * Asynchronously calls 'customObservableNonBlocking' and defines
 * a chain of operators to apply to the callback sequence.
 */
def simpleComposition() {
    customObservableNonBlocking().skip(10).take(5)
        .map({ stringValue -> return stringValue + "_xform"})
        .subscribe({ println "onNext => " + it})
}
```

This results in:

```text
onNext => value_10_xform
onNext => value_11_xform
onNext => value_12_xform
onNext => value_13_xform
onNext => value_14_xform
```

Here is a marble diagram that illustrates this transformation:

<img src="{{ site.url }}/assets/operators/Composition.1.png" width="640" height="536" />

This next example, in Clojure, consumes three asynchronous Observables, including a dependency from one to another, and emits a single response item by combining the items emitted by each of the three Observables with the [`zip`](Combining-Observables#zip) operator and then transforming the result with [`map`](Transforming-Observables#wiki-map):

```clojure
(defn getVideoForUser [userId videoId]
  "Get video metadata for a given userId
   - video metadata
   - video bookmark position
   - user data
  return Observable<Map>"
    (let [user-observable (-> (getUser userId)
              (.map (fn [user] {:user-name (:name user) :language (:preferred-language user)})))
          bookmark-observable (-> (getVideoBookmark userId videoId)
              (.map (fn [bookmark] {:viewed-position (:position bookmark)})))
          ; getVideoMetadata requires :language from user-observable so nest inside map function
          video-metadata-observable (-> user-observable 
              (.mapMany
                ; fetch metadata after a response from user-observable is received
                (fn [user-map] 
                  (getVideoMetadata videoId (:language user-map)))))]
          ; now combine 3 observables using zip
          (-> (Observable/zip bookmark-observable video-metadata-observable user-observable 
                (fn [bookmark-map metadata-map user-map]
                  {:bookmark-map bookmark-map 
                  :metadata-map metadata-map
                  :user-map user-map}))
            ; and transform into a single response object
            (.map (fn [data]
                  {:video-id videoId
                   :video-metadata (:metadata-map data)
                   :user-id userId
                   :language (:language (:user-map data))
                   :bookmark (:viewed-position (:bookmark-map data))
                  })))))
```

The response looks like this:

```clojure
{:video-id 78965, 
 :video-metadata {:video-id 78965, :title House of Cards: Episode 1, 
                  :director David Fincher, :duration 3365}, 
 :user-id 12345, :language es-us, :bookmark 0}
```

And here is a marble diagram that illustrates how that code produces that response:

<img src="{{ site.url }}/assets/operators/Composition.2.png" width="640" height="742" />

The following example, in Groovy, comes from [Ben Christensen’s QCon presentation on the evolution of the Netflix API](https://speakerdeck.com/benjchristensen/evolution-of-the-netflix-api-qcon-sf-2013). It combines two Observables with the [`merge`](Combining-Observables#wiki-merge) operator, then uses the [`reduce`](Mathematical-and-Aggregate-Operators#wiki-reduce) operator to construct a single item out of the resulting sequence, then transforms that item with [`map`](Transforming-Observables#wiki-map) before emitting it:

```groovy
public Observable getVideoSummary(APIVideo video) {
   def seed = [id:video.id, title:video.getTitle()];
   def bookmarkObservable = getBookmark(video);
   def artworkObservable = getArtworkImageUrl(video);
   return( Observable.merge(bookmarkObservable, artworkObservable)
      .reduce(seed, { aggregate, current -> aggregate << current })
      .map({ [(video.id.toString() : it] }))
}
```

And here is a marble diagram that illustrates how that code uses the [`reduce`](Mathematical-and-Aggregate-Operators#wiki-reduce) operator to bring the results from multiple Observables together in one structure:

<img src="{{ site.url }}/assets/operators/Composition.3.png" width="640" height="640" />

## Error Handling

Here is a version of the Wikipedia example from above revised to include error handling:

```groovy
/*
 * Fetch a list of Wikipedia articles asynchronously, with error handling.
 */
def fetchWikipediaArticleAsynchronouslyWithErrorHandling(String... wikipediaArticleNames) {
    return Observable.create({ subscriber ->
        Thread.start {
            try {
                for (articleName in wikipediaArticleNames) {
                    if (true == subscriber.isUnsubscribed()) {
                        return;
                    }
                    subscriber.onNext(new URL("http://en.wikipedia.org/wiki/"+articleName).getText());
                }
                if (false == subscriber.isUnsubscribed()) {
                    subscriber.onCompleted();
                }
            } catch(Throwable t) {
                if (false == subscriber.isUnsubscribed()) {
                    subscriber.onError(t);
                }
            }
            return (subscriber);
        }
    });
}
```

Notice how it now invokes [`onError(Throwable t)`](Observable#onnext-oncompleted-and-onerror) if an error occurs and note that the following code passes `subscribe()` a second method that handles `onError`:

```groovy
fetchWikipediaArticleAsynchronouslyWithErrorHandling("Tiger", "NonExistentTitle", "Elephant")
    .subscribe(
        { println "--- Article ---\n" + it.substring(0, 125) }, 
        { println "--- Error ---\n" + it.getMessage() })
```

See the [Observable Utility Operators](Observable-Utility-Operators) page for more information on specialized error handling techniques in RxJava, including methods like [`onErrorResumeNext()`](Observable-Utility-Operators#onerrorresumenext) and [`onErrorReturn()`]](Observable-Utility-Operators#onerrorreturn) that allow Observables to continue with fallbacks in the event that they encounter errors.

Here is an example of how you can use such a method to pass along custom information about any exceptions you encounter. Imagine you have an Observable or cascade of Observables — `myObservable` — and you want to intercept any exceptions that would normally pass through to an Subscriber’s `onError` method, replacing these with a customized Throwable of your own design. You could do this by modifying `myObservable` with the [`onErrorResumeNext()`](Observable-Utility-Operators#onerrorresumenext) method, and passing into that method an Observable that calls `onError` with your customized Throwable (a utility method called [`error()`](Creating-Observables#wiki-empty-error-and-never) will generate such an Observable for you):

```groovy
myModifiedObservable = myObservable.onErrorResumeNext({ t ->
   Throwable myThrowable = myCustomizedThrowableCreator(t);
   return (Observable.error(myThrowable));
});
```
