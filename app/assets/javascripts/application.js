// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require inputmask
//= require jquery.inputmask
//= require inputmask.extensions
//= require inputmask.numeric.extensions
//= require turbolinks
//= require bootstrap
//= require bootstrap.growl
//= require bootbox
//= require_tree .

/*
New rails data confirm
 */
$.rails.allowAction = function(element) {
  var message = element.attr('data-confirm');
  if (!message) { return true; }

  var opts = {
    title: "Confirmation",
    message: message,
    buttons: {
        confirm: {
            label: 'Yes',
            className: 'btn-success'
        },
        cancel: {
            label: 'No',
            className: 'btn-danger'
        }
    },
    callback: function(result) {
      if (result) {
        element.removeAttr('data-confirm');
        element.trigger('click.rails')
      }
    }
  };

  bootbox.confirm(opts);

  return false;
}

$(function(){
  $('#sale_price').inputmask('decimal', {
      radixPoint:",",
      groupSeparator: ".",
      autoGroup: true,
      digits: 2,
      digitsOptional: false,
      placeholder: '0',
      rightAlign: false,
      onBeforeMask: function (value, opts) {
        return value;
      }
  });
});
