Ninja.behavior({
  // Enables graceful degradation of method links to forms and back again
  '.mizugumo_graceful_form': Ninja.becomesLink

  // Confirmation handler
  // 'a[data-confirm],input[data-confirm]': {
  //   click: function(){
  //     var el = this.element;
  //     if (el.triggerAndReturn('confirm')) {
  //         if (!confirm(el.attr('data-confirm'))) {
  //             return false;
  //         }
  //     }
  //   }
  // } // end data-confirm



})

// This should be run only when you are finished defining NinjaScript behaviors.
// If mizugomo.js is not the last-loaded file that defines NS behaviors,
// you should move this line to the bottom of the file that defines your
// last behavior.
Ninja.go()