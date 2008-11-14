// Common JavaScript code across your application goes here.
$(document).ready(function() {
  var container = $('pre#content.markdown');
  var converted = new Showdown.converter().makeHtml(container.html());
  container.replaceWith("<div>" + converted + "</div>");
});