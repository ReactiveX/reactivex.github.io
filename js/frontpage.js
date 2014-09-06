restartBlip = function(blipSelector) {
  var elm = document.querySelector(blipSelector);
  var newone = elm.cloneNode(true);
  elm.parentNode.replaceChild(newone, elm);
};

(function($){
  $(document).ready(function(){
    setInterval(function() {
      restartBlip('.js-input-blip1');
      restartBlip('.js-input-blip2');
      restartBlip('.js-input-blip3');
      restartBlip('.js-input-blip4');
      restartBlip('.js-input-scheduler');
      restartBlip('.js-output-blip1');
      restartBlip('.js-output-blip4');
      restartBlip('.js-output-scheduler');
    }, 3000);
  });
})(jQuery);
