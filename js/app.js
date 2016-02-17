//ROUTES
// ** logout
riot.route.start();

//used to fake an HTML5 validation on submitting forms
function fakeSubmit(formid) {
  $(formid).submit(function(event){
          if(!this.checkValidity())
          {
              event.preventDefault();
          }
      });
}


//preloader to use everywhere
var preloader = '<div class="row"><div class="col s12"><div class="progress"><div class="indeterminate"></div></div></div></div>';



$(document).ready(function(){
  // ROUTES
  router('download', function() {
    view.render('download');
  })

  router('getting-started', function() {
    view.render('getting-started');
  })

  // example with params
  router('teste/:id', function (params) {
    console.log(params);
  })
});
