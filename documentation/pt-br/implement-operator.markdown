---
layout: documentation
title: ReactiveX - Implementing Your Own Operators
lang: pt-br
id: implement-operator
---

#Implementando seus próprios operadores

Você pode implementar seus próprios operadores Observable. Esta página mostra como.

Se seu operador é projetado para *originar* um Observable, em vez de transformar ou reagir a uma fonte
Observable, use o método [`create( )`](Operators/create) em vez de tentar implementar `Observable` manualmente.  Caso contrário, siga as instruções abaixo.

# Encadeando seus operadores personalizados com operadores RxJava padrão

O exemplo a seguir mostra como você pode encadear um operador personalizado (neste exemplo: `myOperator`) Junto com operadores RxJava padrão usando o operador `lift( )`:

```groovy
Observable foo = barObservable.ofType(Integer).map({it*2}).lift(new myOperator<T>()).map({"Transformado por myOperator: " + it});
```
A seguinte seção mostrará como formar o andaime do seu operador para que ele funcione corretamente com `lift( )`.

# Implementando seu Operador

Defina seu operador como uma classe pública que implementa a interface [`Operator`](http://reactivex.io/RxJava/javadoc/rx/Observable.Operator.html) da seguinte forma:

```java
public class myOperator<T> implements Operator<T> {
  public myOperator( /* Todos os parâmetros necessários aqui */ ) {
    /* Qualquer inicialização necessária aqui */
  }

  @Override
  public Subscriber<? super T> call(final Subscriber<? super T> s) {
    return new Subscriber<t>(s) {
      @Override
      public void onCompleted() {
        /* Adicione seu próprio comportamento onCompleted aqui, ou apenas passar a notificação concluída através de:s */
        if(!s.isUnsubscribed()) {
          s.onCompleted();
        }
      }

      @Override
      public void onError(Throwable t) {
        /* Adicione seu próprio comportamento onError aqui, ou apenas passar a notificação de erro através de: */
        if(!s.isUnsubscribed()) {
          s.onError(t);
        }
      }

      @Override
      public void onNext(T item) {
        /* Este exemplo executa algum tipo de transformação simples em cada item de entrada e, em seguida, passa-o ao longo */
        if(!s.isUnsubscribed()) {
          transformedItem = myOperatorTransformOperation(item);
          s.onNext(transformedItem);
        }
      }
    };
  }
}
``` 

# Outras Considerações

* Seu operador deve verificar [o status do `isUnsubscribed( )`](Observable#unsubscribing) antes de emitir qualquer item para (ou enviar qualquer notificação para) o Assinante. Não perca tempo gerando itens que nenhum Assinante está interessado em ver.
* Seu operador deve obedecer aos princípios fundamentais do contrato Observable:
  * Ele pode chamar um subscritor [`onNext( )`](Observable#onnext-oncompleted-and-onerror) método qualquer número de vezes, mas essas chamadas devem ser não-sobrepostas.
  * Ele pode chamar um Assinante [`onCompleted( )`](Observable#onnext-oncompleted-and-onerror) ou [`onError( )`](Observable#onnext-oncompleted-and-onerror) método, mas não ambos, exatamente Uma vez, e não pode subsequentemente chamar um subscritor[`onNext( )`](Observable#onnext-oncompleted-and-onerror) método.
  * Se você não conseguir garantir que seu operador está em conformidade com os dois princípios acima, você pode adicionar o operador[`serialize( )`](Observable-Utility-Operators#serialize) para forçar o comportamento correto.
* Não bloqueie no seu operador.
* Geralmente é melhor que você compor novos operadores, combinando os existentes, na medida em que isso é possível, em vez de reinventar a roda. O próprio RxJava faz isso com alguns de seus operadores padrão, por exemplo:
  * [`first( )`](Filtering-Observables#wiki-first-and-takefirst) é definido como [`take(1)`](Filtering-Observables#wiki-take)`.`[`single( )`](Observable-Utility-Operators#wiki-single-and-singleordefault)
  * [`ignoreElements( )`](Filtering-Observables#wiki-ignoreelements) é definido como [`filter(alwaysFalse( ))`](Filtering-Observables#wiki-filter)
  * [`reduce(a)`](Mathematical-and-Aggregate-Operators#wiki-reduce) é definido como [`scan(a)`](Transforming-Observables#wiki-scan)`.`[`last( )`](Filtering-Observables#wiki-last)
* Se o seu operador usa funções ou lambdas que são transmitidas como parâmetros (predicates, por exemplo),  note que estes podem ser fontes de exceções e esteja preparado para capturar esses e notificar os assinantes através de chamadas `onError( )`.
* Em geral, notificar os assinantes de condições de erro imediatamente, em vez de fazer um esforço para emitir mais itens primeiro.
* Em algumas implementações do ReactiveX,seu operador pode precisar ser sensível à &#8217;s &ldquo;backpressure&rdquo; estratégias. (Veja, por exemplo: <a href="http://akarnokd.blogspot.hu/2015/05/pitfalls-of-operator-implementations_14.html">Pitfalls of Operator Implementations (part 2)</a> by D&aacute;vid Karnok.)

# Veja Também
* <a href="http://akarnokd.blogspot.hu/2015/05/pitfalls-of-operator-implementations.html">Pitfalls of Operator Implementations (part 1)</a> and <a href="http://akarnokd.blogspot.hu/2015/05/pitfalls-of-operator-implementations_14.html">(part 2)</a> by D&aacute;vid Karnok.
* <a href="http://xgrommx.github.io/rx-book/content/getting_started_with_rxjs/implementing_your_own_operators.html">Implementing Your Own Observable Operators</a> (in RxJS) by Dennis Stoyanov
