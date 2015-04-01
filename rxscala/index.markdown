---
layout: simple
title: RxScala
id: rxscala
---

# RxScala

RxScala brings *Reactive Extensions* to Scala. Rx was first implemented for [.NET](https://rx.codeplex.com), and is now also available in [Java](https://github.com/ReactiveX/RxJava). The RxScala project is an adaptor for RxJava. Its code is in a seperate [repository](https://github.com/ReactiveX/RxScala) and it's also distributed on [Maven Central](http://search.maven.org/#search%7Cga%7C1%7C%22rxscala%22%20AND%20g%3A%22io.reactivex%22).

Get started by looking at [RxScalaDemo.scala](https://github.com/ReactiveX/RxScala/blob/0.x/examples/src/test/scala/rx/lang/scala/examples/RxScalaDemo.scala), the [RxScala examples](https://github.com/ReactiveX/RxScala/tree/0.x/examples/src), or the [Scaladoc]({{ site.url }}/rxscala/scaladoc/index.html#rx.lang.scala.Observable).

There's also a [comparison table]({{ site.url }}/rxscala/comparison.html) between Java Observable and Scala Observable.

## Warning

This library is not yet finished. You have to expect breaking changes in future versions.

## Binaries

Binaries and dependency information for Maven, Ivy, Gradle and others can be found at [http://search.maven.org](http://search.maven.org/#search%7Cga%7C1%7C%22rxscala%22%20AND%20g%3A%22io.reactivex%22).

Example for sbt/activator:

    libraryDependencies += "io.reactivex" %% "rxscala" % "x.y.z"

and for Maven:

    <dependency>
        <groupId>io.reactivex</groupId>
        <artifactId>rxscala_${scala.compat.version}</artifactId>
        <version>x.y.z</version>
    </dependency>

and for Ivy:

    <dependency org="io.reactivex" name="rxscala_${scala.compat.version}" rev="x.y.z" />

## Communication

Just use the same communication channels as for RxJava:

-    Google Group: [RxJava](http://groups.google.com/d/forum/rxjava)
-    Twitter: [@RxJava](http://twitter.com/RxJava)
-    [GitHub Issues](https://github.com/ReactiveX/RxScala/issues)

