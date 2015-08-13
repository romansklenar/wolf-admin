/* ==============================================================================
// Scripts for the theme
// ============================================================================== */

var ready = function() {
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
