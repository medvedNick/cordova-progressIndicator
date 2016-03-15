 var ProgressIndicator = {
  show: function (type, label, detail) {
    label = label || "Please wait...";
    detail = detail || '';

    cordova.exec(null, null, "ProgressIndicator", "show", [type, label, detail]);
  },


  showSimple: function () {
    cordova.exec(null, null, "ProgressIndicator", "showSimple", []);

  },

  showSimpleWithLabel: function (label) {
    label = label || "Please wait...";

    cordova.exec(null, null, "ProgressIndicator", "showSimpleWithLabel", [label]);
  },

  showSimpleWithLabelDetail: function (label, detail) {

    label = label || "Please wait...";
    detail = detail || "Loading";

    cordova.exec(null, null, "ProgressIndicator", "showSimpleWithLabelDetail", [label, detail]);
  },

  showDeterminate: function () {

    cordova.exec(null, null, "ProgressIndicator", "showDeterminate", []);
  },

  showDeterminateWithLabel: function (label) {

    label = label || "Please wait...";

    cordova.exec(null, null, "ProgressIndicator", "showDeterminateWithLabel", [label]);
  },

  showAnnular: function () {

    cordova.exec(null, null, "ProgressIndicator", "showDeterminateAnnular", []);
  },

  showAnnularWithLabel: function (label) {

    label = label || "Please wait...";

    cordova.exec(null, null, "ProgressIndicator", "showDeterminateAnnularWithLabel", [label]);
  },

  showBar: function () {


    cordova.exec(null, null, "ProgressIndicator", "showDeterminateBar", []);
  },

  showBarWithLabel: function (label) {

    label = label || "Please wait...";

    cordova.exec(null, null, "ProgressIndicator", "showDeterminateBarWithLabel", [label]);
  },


  showSuccess: function (label) {

    label = label || "Success";

    cordova.exec(null, null, "ProgressIndicator", "showSuccess", [label]);
  },

  showText: function (label, position) {

    label = label || "Success";
    position = position || "bottom";

    cordova.exec(null, null, "ProgressIndicator", "showText", [label, position]);
  },

  setLabelText: function (text) {
    cordova.exec(null, null, "ProgressIndicator", "setLabelText", [text]);
  },

  setProgress: function (progress) {
    cordova.exec(null, null, "ProgressIndicator", "setProgress", [progress]);
  },

  hide: function () {
    cordova.exec(null, null, "ProgressIndicator", "hide", []);
  }
};

module.exports = ProgressIndicator;
