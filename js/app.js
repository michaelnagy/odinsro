//ROUTES
// ** logout
riot.route.start(true);

//preloader to use everywhere
var preloader = '<div class="row"><div class="col s12"><div class="progress"><div class="indeterminate"></div></div></div></div>';

$(document).ready(function(){

  // ROUTES

  riot.route('', function() {
    view.render('home');
    //remove container from header
    $('.main-menu').addClass('container');
  });

  riot.route('profile', function() {
    view.render('profile');
    //remove container from header
    $('.main-menu').removeClass('container');
  });

  riot.route('download', function() {
    view.render('download');
  });

  riot.route('server-info', function() {
    view.render('server-info');
  });

  riot.route('rank', function() {
    view.render('rank');
    $('.main-menu').removeClass('container');
  });

  riot.route('login', function() {
    view.render('login', 'modal');
    $('#modal1').openModal();
  });

  riot.route('pass-recover', function() {
    view.render('pass-recover', 'modal');
  });
  
  riot.route('register', function() {
    view.render('register', 'modal');
    $('#modal2').openModal();
  });
  
  riot.route('logout', function() {
    $.api.logout();
    riot.route('');
  });

});
