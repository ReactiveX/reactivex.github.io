---
layout: documentation
title: ReactiveX - Plugins
lang: pt-br
id: plugins
---

#Plugins

Os plugins permitem modificar o comportamento padrão do RxJava 1.x em vários aspectos:

* Alterando o conjunto de computação predefinida, i / o, e novo thread Schedulers
* Registrando um manipulador para erros extraordinários que RxJava pode encontrar
* Registrando funções que podem tomar nota da ocorrência de várias atividades regulares do RxJava

## RxJavaDefaultSchedulers

Este plugin permite que você substitua o cálculo padrão, i / o, e novo segmento Programadores com Programadores de sua escolha. Para fazer isso, estenda a classe `RxJavaDefaultSchedulers`  e substitua estes métodos:

* `Scheduler getComputationScheduler( )`
* `Scheduler getIOScheduler( )`
* `Scheduler getNewThreadScheduler( )`

Em seguida, siga estes passos:

1. Crie um objeto da nova subclasse `RxJavaDefaultSchedulers` que você implementou.
1. Obter a instância global do `RxJavaPlugins` através do `RxJavaPlugins.getInstance( )`.
1. Passe seu objeto de agendador padrão para o método `registerDefaultSchedulers( )` dessa instância.

Quando você fizer isso, RxJava começará a usar os Schedulers retornados por seus métodos em vez de seus padrões internos.

## RxJavaErrorHandler

Este plugin permite que você registre uma função que lida com erros que são gerados pelo RxJava, mas que não podem ser manipulados pelo processo de notificação RxJava `onError` normal (por exemplo, se RxJava tentar propagar um erro para um assinante que não implementou um Manipulador `onError`). Para fazer isso, estenda a classe  `RxJavaErrorHandler` e substitua este método:

* `void handleError(Throwable e)`

Em seguida, siga estes passos:

1. Crie um objeto da nova subclasse `RxJavaErrorHandler` que você implementou.
1. Obtenha a instância global do`RxJavaPlugins` através de `RxJavaPlugins.getInstance( )`.
1. Passe seu objeto manipulador de erro para o método `registerErrorHandler( )`dessa instância.

Quando você fizer isso, RxJava começará a usar seu manipulador de erro para erros de campo que não podem ser manipulados de maneiras comuns.

## RxJavaObservableExecutionHook

Esse plugin permite que você registre funções que o RxJava irá chamar em certas atividades regulares do RxJava, por exemplo, para fins de registro ou de coleta de métricas. Para fazer isso, estenda a classe `RxJavaObservableExecutionHook` e substitua qualquer um ou todos estes métodos:

<table><thead>
 <tr><th>Método</th><th>Quando invocado</th></tr>
 </thead><tbody>
  <tr><td><tt>onCreate( )</tt></td><td>durante <tt>Observable.create( )</tt></td></tr>
  <tr><td><tt>onSubscribeStart( )</tt></td><td>Imediatamente antes <tt>Observable.subscribe( )</tt></td></tr>
  <tr><td><tt>onSubscribeReturn( )</tt></td><td>imediatamente depois <tt>Observable.subscribe( )</tt></td></tr>
  <tr><td><tt>onSubscribeError( )</tt></td><td>uma falha na execução de <tt>Observable.subscribe( )</tt></td></tr>
  <tr><td><tt>onLift( )</tt></td><td>durante <tt>Observable.lift( )</tt></td></tr>
 </tbody>
</table>

Em seguida, siga estes passos:

1. Crie um objeto da nova subclasse `RxJavaObservableExecutionHook`  que você implementou.
1. Obtenha a instância global do  `RxJavaPlugins` através de `RxJavaPlugins.getInstance( )`.
1. Passe seu objeto hooks de execução para o método `registerObservableExecutionHook( )` dessa instância.

Quando você fizer isso, RxJava vai começar a chamar suas funções quando ele encontra as condições específicas que foram concebidos para tomar nota.
