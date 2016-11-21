---
layout: documentation
title: ReactiveX - The Observable Contract
lang: pt-br
id: contract
---

<h1>O contrato Observable</h1>
<p>
 “O contrato Observable,” que você ver referenciado em vários lugares na documentação de origem e nas páginas deste site, 
 é uma tentativa formal de um Observable, baseado originalmente no documento de 2010 <a href="https://go.microsoft.com/fwlink/?LinkID=205219"><cite>Rx Design Guidelines</cite></a> da  Microsoft que descreveu sua implementação Rx.NET do ReactiveX.
</p><p>
  Esté é um resumo do contrato Observable.
</p>
<h2>Notificações</h2>
<p>
 Um Observable comunica-se com seus observadores com as seguintes <i>notificações</i>:
</p>
<dl>
 <dt>OnNext</dt>
 <dd>Transmite um <i>item</i> que é <i>emitido</i> pelo Observable ao observador.</dd>
 <dt>OnCompleted</dt>
  <dd>indica que o Observable tenha completado com sucesso e que não irá emitir mais itens</dd>
 <dt>OnError</dt>
  <dd>indica que o Observable tenha terminado com uma condição de erro especifica e que não irá emitir mais itens</dd>
 <dt>OnSubscribe (opcional)</dt>
  <dd>indica que o Observable está pronto para aceitar notificações solicitado do observer (veja <i>Contrapressão</i> abaixo)</dd>
</dl>
<p>
 Um observador comunica-se com its Observable por meio das seguintes notificações:
</p>
<dl>
 <dt>Subscribe</dt>
  <dd>indica que o observador está pronto para receber notificações do Observable</dd>
 <dt>Unsubscribe</dt>
  <dd>indiue o observador não quer receber notificações do Observable</dd>
 <dt>Request (optional)</dt>
  <dd>indica que o observador não que mais um determinado numero de notificações OnNext adicionais do Observable (veja <i>Contrapressão</i> abaixo)</dd>
</dl>
<h2>O Contrato que Regula Notifições</h2>
<p>
 Um Observable pode fazer zero ou mais notificações OnNext, cada um representando um único item emitido, e pode
 seguir essas notificações de emissão por um OnCompleted ou um OnError, mas não ambos.
 Ao emitir uma notificação OnCompleted ou OnError, esté não poderá emitir posteriormente nenhuma notificação adicional.
</p><p>
 UM Observable pode não emitir nenhum item para todos. Um Observable também nunca pode terminar com um OnCompleted ou
 uma notificaficação OnError.  Isto significa que é adequado que um Observable não emita notificações, emitir
 apenas um OnCompleted ou uma notificação OnError, ou para somente emitir notificações OnNext.
</p><p>
 Observables devem emitir notificações aos observadores em série (não em paralelo). Podem emitir essas
 notificações de diferentes threads, mas deve haver um <i>acontecer antes</i> relação entre as notificações.
</p>
<h2>Término da Observable</h2>
<p>
 Se um Observable não emitiu um OnCompleted ou notificação OnError, um observador pode considera-lo ainda ativo
 (mesmo que não esteja emitindo itens atualmente) e pode emitir notificações (como uma notificação Unsubscribe
 ou Request). Quando un Observable emite um OnCompleted ou notificação OnError, a Observable
 pode  liberar seus recursos e terminar, e seus observadores não devem tentar comunicar com o mais distante.
</p><p>
 Uma notificação OnError deve conter a causa do erro (ou seja, é inválido para chamar OnError com
 um valor <code>null</code>).
</p><p>
 Antes de um Observable terminar ele primeiro deve emitir um OnCompleted ou uma notificação OnError para todos os observadores que
 estão subscritas a ele.
</p>
<h2>Subscrever e Anular</h2>
<p>
 Um Observable pode começar a emitir notifficações para um observador imediatamente depois que o Observable recebe uma
 notificação Subscribe do observador.
</p><p>
 Quando um observador emiti uma notificação Unsubscribe para um Observable, o Observable tentará para
 as notificações ao observador. Isto não é garantido, contudo, que o Observable 
 <em>não</em> emita notificações ao observador depois que um observador emitir uma notificação de Unsubscribe.
</p><p>
 Quando um Observable emiti uma notificaçao de OnError ou OnComplete aos seus observadores, isso termina a subscrição.
 Observadores não necessita emitir uma notificação  Unsubscribe para encerrar inscrições que são finalizadas pelo Observable
 nesse caminho.
</p>
<h2>Múltiplo Observers</h2>
<p>
 Se um segudo observador subscrever para um Observable que já está emitindo itens para um primeiro observador, cabe 
 ao Observable que a partir de então, emitirá os mesmo itens a cada observador, ou se irá reproduzir a
 seqüência completa de itens do inicio para o segundo observador, ou se emitirá uma seqüência de itens completamente diferente
 para o segundo observador. Não há garantia de que dois observadore do mesmo Observable verão a mesma seqüência de itens.
</p>
<h2>Contrapressão(Backpressure)</h2>
<p>
 Backpressure é opcional; nem todas as implementações ReactiveX incluir o backpressure, e aqueles que fazem, nem todos os
 Observables ou operadores honra a backpressure. Um Observable <em>pode</em> implementar o backpressure Se detectar que 
 seu observador implementa notificações <i>Request</i> e entende notificações <i>OnSubscribe</i>.
</p><p>
 Se um Observable implementar um  backpressure e seu observador emprega backpressure, o Observable não começará a
 emitir itens para o observador imediatamente após a subscrição. Em vez disso, ele emitirá uma notificação OnSubscribe
 para o observador.
</p><p>
 A qualquer momento após receber uma notificação OnSubscribe, um observador pode emitir uma notificação de Request para 
 Observable subscrito. Esta notificação solicita um determinado numero de itens. O Observable
 responde ao pedido não emitindo mais itens ao observador do que o numero de itens que o observador solicitou. No entando,o Observable pode, 
 emitir uma notificação  OnCompleted ou OnError, e pode até mesmo emitir tal solicitação antes que o observador solicite quaisquer itens.
</p><p>
 Um Observable que não implementa  backpressure deve responder a uma solicitação de notificação de um observador,
 emitindo uma notificação OnError que indica que a backpressure não é suportada.
</p><p>
 Requests são acumulativas. Por exemplo, se um observador emitir três notificação de Request para um Observable, para
 3, 5, e 10 itens repectivamente, este Observable poderá emitir até 18 itens para o observador, não importando quando
 essas notificações de Request chegaram em relação a quando o Observable emitiu itens em reposta.
</p><p>
 Se o Observable produzir mais itens que solicitado pelo observador, cabe ao Observable se descartará itens em excesso, 
 armazena-los para emitir mais tarde, ou usar alguma outra estratégia para lidar com o problema de overflow.
</p>
<h2>Veja também</h2>
<ul>
 <li><a href="https://go.microsoft.com/fwlink/?LinkID=205219"><cite>Rx Design Guidelines</cite></a></li>
 <li><a href="http://xgrommx.github.io/rx-book/content/guidelines/index.html"><cite>RxJS Design Guidelines</cite></a></li>
</ul>
