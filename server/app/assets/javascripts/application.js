/*global _*/
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
_.templateSettings = {
    interpolate: /\{\{\=(.+?)\}\}/g,
    evaluate: /\{\{(.+?)\}\}/g
};