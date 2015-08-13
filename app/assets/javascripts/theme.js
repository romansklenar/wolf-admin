/* ==============================================================================
// Scripts for the theme
// ============================================================================== */

var ready = function() {

  // build custom selects
  UI.smart_selects();

  Number.prototype.formatMoney = function(c, d, t){
    var n = this,
      c = isNaN(c = Math.abs(c)) ? 2 : c,
      d = d == undefined ? "." : d,
      t = t == undefined ? "," : t,
      s = n < 0 ? "-" : "",
      i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "",
      j = (j = i.length) > 3 ? j % 3 : 0;
       return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
  };
};

$(document).on("ready page:load", ready);

var UI = {
  smart_selects: function () {
    var $selects = $("[data-smart-select]");
    $.each($selects, function (index, el) {
      var $select = $(el);

      // It has been already initialized
      if ($select.parent().hasClass("fake-select-wrap")) {
        $select.siblings(".fake-select").html($select.find("option:selected").text());
        return;
      }

      var $wrapper = $("<div class='fake-select-wrap' />");
      var $fake_select = $("<div class='fake-select'></div>");
      $select.wrap($wrapper);
      $select.after($fake_select);

      // set selected value as default
      $fake_select.html($select.find("option:selected").text());

      // change handler
      $select.change(function () {
        $fake_select.html($(this).find("option:selected").text());
      });

      $select.focus(function () {
        $fake_select.addClass("focus");
      }).focusout(function () {
        $fake_select.removeClass("focus");
      });
    });
  }
}

window.utils = {
  isFirefox: function () {
    return navigator.userAgent.toLowerCase().indexOf('firefox') > -1;
  },
  animation_ends: function () {
    return "animationend webkitAnimationEnd oAnimationEnd";
  },
  isTablet: function () {
    return ($(".main-sidebar").width() < 100);
  },
  get_timestamp: function (less_days) {
    return moment().subtract('days', less_days).toDate().getTime();
  }
};
