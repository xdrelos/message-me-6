// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("semantic-ui-sass")

export const scroll_bottom = function() {
  if($('#message-box').length > 0){
    $('#message-box').scrollTop($('#message-box')[0].scrollHeight);
  }
};

let submit_messages = function () {
  $('#input_message').on('keydown', function (event) {
    if (event.keyCode == 13) {
      $('#button_send').click();
      event.target.value = '';
      event.preventDefault();
    }
  });
};

document.addEventListener('turbolinks:load', () => {
  $('.ui.dropdown').dropdown();
  $('.message .close').on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade')
    ;
  });
  submit_messages();
  scroll_bottom();
})
