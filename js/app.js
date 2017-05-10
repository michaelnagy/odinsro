//ROUTES
// ** logout
riot.route.start(true);

// Initialize collapse button menu
  $(".button-collapse").sideNav();

function passChange() {
        $('#modal3').openModal();
}

//event to listen when widget has finished loading data
var widgetLoaded = new Event('widgetLoaded');
var charLoaded = new Event('charLoaded');

//preloader to use everywhere
var preloader = '<div class="preloader-wrapper big active"><div class="spinner-layer spinner-blue-only"><div class="circle-clipper left"><div class="circle"></div></div><div class="gap-patch"><div class="circle"></div></div><div class="circle-clipper right"><div class="circle"></div></div></div></div>';
var element = '.autotrade, .profile';
function preLoader(element, preloader) {
  $(element).children().hide();
  $(element).append(preloader).show();
  $( window ).on('widgetLoaded',function() {
    // Handler for .load() called.
    $('.preloader-wrapper').remove();
    $(element).children().show();
    // console.log(element);
  });

}
// add the preloader to the site
window.onload = function () {
  $(".preloader-container").fadeOut('slow');
}

$(document).ready(function(){

  // Initialize countdown modal
    $('#modalcountdown').openModal({
      ready : function () {
        var nextYear = moment.tz("2017-05-13 12:00", "America/Sao_Paulo");
        $("#modalcountdown .modal-content h1")
        .countdown(nextYear.toDate(), function(event) {
          $(this).text(
            event.strftime('%D days %H:%M:%S')
          );
        });
      }
    });

  // tooltip
  $('.tooltipped').tooltip({html: true, position: 'left', delay: 50, tooltip: "<i class='material-icons'>info_outline</i> WOE Event - 12/21/16 - 4 P.M<br><i class='material-icons'>info_outline</i> WOE Event 2 - 12/21/16 - 6 P.M"});

  //changes the menu top position when page is scrolled
  $(window).scroll(function(){
      if ($(window).scrollTop() > 30){
        $('.side-nav.fixed').css('top','0px');
      }
      else {
        $('.side-nav.fixed').css('top','inherit');
      }
  });

  // ROUTES
  riot.route('', function() {
    view.render('home');
    //remove container from header
    $('.main-menu').addClass('container');
  });

  riot.route('shop', function() {
    view.render('shop');
    $('.main-menu').removeClass('container');
  });

  riot.route('profile', function() {
    view.render('profile');
    //remove container from header
    $('.main-menu').removeClass('container');
  });

  riot.route('reset', function() {
    view.render('reset');
    //remove container from header
    $('.main-menu').removeClass('container');
  });

  riot.route('download', function() {
    view.render('download');
  });

  riot.route('vote', function() {
    view.render('vote');
  });

  riot.route('char-reset', function() {

    view.render('reset','widget');
  });


  riot.route('server-info', function() {
    view.render('server-info');
  });

  riot.route('privacy', function() {
    view.render('privacy');
  });
  riot.route('terms', function() {
    view.render('terms');
  });
  riot.route('refund', function() {
    view.render('refund');
  });
  riot.route('contact', function() {
    view.render('contact');
  });

  riot.route('rank', function() {
    view.render('rank');
    $('.main-menu').removeClass('container');
  });

  riot.route('login', function() {
    view.render('login', 'modal');
    $('#modal1').openModal();
  });
  // riot.route('profile-password-change', function() {
  //   view.render('profile-password-change', 'modal');
  //   $('#modal3').openModal();
  // });

  riot.route('pass-recover', function() {
    view.render('pass-recover', 'modal');
  });

  riot.route('register', function() {
    view.render('register', 'modal');
    $('#modal2').openModal();
    fbq('track', "ViewContent");
  });

  riot.route('logout', function() {
    $.api.logout();
    riot.route('');
  });
});
