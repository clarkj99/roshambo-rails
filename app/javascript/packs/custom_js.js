$(document).on('turbolinks:load', function () {
  // bulma burger menu toggle
  $(".navbar-burger").click(function () {
    $(".navbar-burger").toggleClass("is-active");
    $(".navbar-menu").toggleClass("is-active");
  });
  $(".delete").click(function () {
    $(".notification").remove();
  });
});