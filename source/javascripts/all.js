//= require fastclick
//= require googleanalytics
//= require jquery.cookie/jquery.cookie
//= require foundation/js/foundation.min
//= require jquery.kerning
//= require nicescroll
//= require jquery-smooth-scroll
//= require lodash
//= require backbone




$(window).load(function() {
  $(document).foundation()
  FastClick.attach(document.body)
  $('html').niceScroll()
  $('a').smoothScroll()
  $('p').kerning()
})
