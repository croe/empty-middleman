//= require fastclick
//= require jquery.cookie/jquery.cookie
//= require foundation/js/foundation.min
//= require jquery.kerning
//= require jquery-smooth-scroll
//= require nicescroll
//= require googleanalytics




$(window).load(function() {
  $(document).foundation()
  FastClick.attach(document.body)
  $('html').niceScroll()
  $('a').smoothScroll()
  $('p').kerning()
})