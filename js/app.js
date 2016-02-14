//ROUTES
// ** logout
riot.route.start();

//preloader to use everywhere
var preloader = '<div class="row"><div class="col s12"><div class="progress"><div class="indeterminate"></div></div></div></div>';



$(document).ready(function(){
  // ROUTES
  router('download', function() {
    view.render('download');
  })

  router('database', function() {
    view.render('database');
  })

  // example with params
  router('teste/:id', function (params) {
    console.log(params);
  })
});
