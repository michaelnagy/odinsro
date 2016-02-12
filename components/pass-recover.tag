<pass-recover>
  <div class="animated slideInLeft">
    <h4 class="center-align">Password Recovery</h4>
    <div class="row">
      <form class="col s12 login-form">
        <div class="row">
          <div class="input-field col s12">
            <input id="email" type="email" name="email" class="validate">
            <label for="email" data-error="Isso não um e-mail válido :(">E-mail</label>
          </div>
        </div>
      </form>
      <div class="row buttons">
          <div class="col s6">
            <button class="btn waves-effect waves-light btn-login" name="action">Send new password
              <i class="material-icons right">send</i>
            </button>
          </div>
          <div class="col s6">
            <a href="#login-register" class="light-blue darken-3 btn waves-effect waves-light btn-go-back" name="action">Go back
              <i class="material-icons right">replay</i>
            </a>
          </div>
      </div>
    </div>
  </div>

  <style>
  /*.pass-recover > .animated {
    -webkit-animation-duration: 1s;
    -moz-animation-duration: 1s;
    animation-duration: 1s;
  }*/
  </style>

  <script>

    var self = this;

    riot.route('login-register', function(name) {
      console.log('montou e desmontou 2');
      riot.mount('.login-register','login-register');
      self.unmount(true);
    });


    this.on('mount', function(){
      // $('.btn-go-back').click(function () {
      //   riot.mount('.modal-content', 'login-register');
      //   console.log('montou de novo');
      //   self.unmount();
      //   console.log('desmontou de novo');
      // });

    });

    this.on('update', function(){

    });

    this.on('updated', function(){

    });

  </script>

</pass-recover>
