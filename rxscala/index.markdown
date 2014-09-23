---
layout: simple
title: RxScala
id: rxscala
---

# RxScala

RxScala brings *Reactive Extensions* to Scala. Rx was first implemented for [.NET](https://rx.codeplex.com), and is now being implemented in [Java](https://github.com/ReactiveX/RxJava). The RxScala project is an adaptor for RxJava. Its code is in a seperate [repository](https://github.com/ReactiveX/RxScala) and it's also distributed on [Maven Central](http://search.maven.org/#search%7Cga%7C1%7Ca%3A%22rxjava-scala%22).

Get started by looking at [RxScalaDemo.scala](https://github.com/ReactiveX/RxScala/blob/0.x/src/examples/scala/rx/lang/scala/examples/RxScalaDemo.scala), the [RxScala examples](https://github.com/ReactiveX/RxScala/tree/0.x/src/examples), or the [Scaladoc]({{ site.url }}/rxscala/scaladoc/index.html#rx.lang.scala.Observable).

There's also a [comparison table]({{ site.url }}/rxscala/comparison.html) between Java Observable and Scala Observable.

## Warning

This library is not yet finished. You have to expect breaking changes in future versions.

## Binaries

Binaries and dependency information can be found at [http://search.maven.org](http://search.maven.org/#search%7Cga%7C1%7Ca%3A%22rxjava-scala%22).

Example for sbt:

{% highlight scala %}
libraryDependencies ++= Seq(
  "com.netflix.rxjava" % "rxjava-scala" % "x.y.z"
)
{% endhighlight %}

Note that `rxjava-scala` depends on `rxjava-core`, so if you download the jars manually, don't forget `rxjava-core`.

## Communication

Just use the same communication channels as for RxJava:

-    Google Group: [RxJava](http://groups.google.com/d/forum/rxjava)
-    Twitter: [@RxJava](http://twitter.com/RxJava)
-    [GitHub Issues](https://github.com/ReactiveX/RxScala/issues)

