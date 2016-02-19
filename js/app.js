//ROUTES
// ** logout
riot.route.start(true);

//preloader to use everywhere
var preloader = '<div class="row"><div class="col s12"><div class="progress"><div class="indeterminate"></div></div></div></div>';



$(document).ready(function(){
  // ROUTES

  riot.route('', function() {
    view.render('home');
  });

  riot.route('profile', function() {
    view.render('profile');
  });

  riot.route('download', function() {
    view.render('download');
  });


});
