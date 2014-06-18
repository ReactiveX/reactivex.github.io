---
layout: documentation
title: ReactiveX - String Observables
id: string
---

#String Observables

The `StringObservable` class contains methods that represent operators particular to Observables that deal in string-based sequences and streams. These include:

* [**`byLine( )`**](String-Observables#wiki-byline) — converts an Observable of Strings into an Observable of Lines by treating the source sequence as a stream and splitting it on line-endings
* [**`decode( )`**](String-Observables#wiki-decode) — convert a stream of multibyte characters into an Observable that emits byte arrays that respect character boundaries
* [**`encode( )`**](String-Observables#wiki-encode) — transform an Observable that emits strings into an Observable that emits byte arrays that respect character boundaries of multibyte characters in the original strings
* [**`from( )`**](String-Observables#wiki-from) — convert a stream of characters or a Reader into an Observable that emits byte arrays or Strings
* [**`join( )`**](String-Observables#wiki-join) — converts an Observable that emits a sequence of strings into an Observable that emits a single string that concatenates them all, separating them by a specified string
* [**`split( )`**](String-Observables#wiki-split) — converts an Observable of Strings into an Observable of Strings that treats the source sequence as a stream and splits it on a specified regex boundary
* [**`stringConcat( )`**](String-Observables#wiki-stringconcat) — converts an Observable that emits a sequence of strings into an Observable that emits a single string that concatenates them all

*** 

## byLine( )
#### converts an Observable of Strings into an Observable of Lines by treating the source sequence as a stream and splitting it on line-endings
<img src="/Netflix/RxJava/wiki/images/rx-operators/St.byLine.png" width="640" height="290" />

*** 

## decode( )
#### convert a stream of multibyte characters into an Observable that emits byte arrays that respect character boundaries
<img src="/Netflix/RxJava/wiki/images/rx-operators/St.decode.png" width="640" height="300" />

*** 

## encode( )
#### transform an Observable that emits strings into an Observable that emits byte arrays that respect character boundaries of multibyte characters in the original strings
<img src="/Netflix/RxJava/wiki/images/rx-operators/St.encode.png" width="640" height="295" />

*** 

## from( )
#### convert a stream of characters or a Reader into an Observable that emits byte arrays or Strings
<img src="/Netflix/RxJava/wiki/images/rx-operators/St.from.png" width="640" height="300" />

Note that in the `from(InputStream, size)` and `from(Reader, size)` variants, the resulting Observable is unusual: you can only subscribe to it a single time. This means, for example, that operators like `repeat( )` or `retry( )` will not work on such an Observable.

*** 

## join( )
#### converts an Observable that emits a sequence of strings into an Observable that emits a single string that concatenates them all, separating them by a specified string
<img src="/Netflix/RxJava/wiki/images/rx-operators/St.join.png" width="640" height="295" />

*** 

## split( )
#### converts an Observable of Strings into an Observable of Strings that treats the source sequence as a stream and splits it on a specified regex boundary
<img src="/Netflix/RxJava/wiki/images/rx-operators/St.split.png" width="640" height="295" />

*** 

## stringConcat( )
#### converts an Observable that emits a sequence of strings into an Observable that emits a single string that concatenates them all
<img src="/Netflix/RxJava/wiki/images/rx-operators/St.stringConcat.png" width="640" height="295" />
