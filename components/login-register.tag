<login-register>

  <div class="animated slideInRight">
    <h4 class="center-align">Login or Register</h4>
    <div class="row">
      <form class="col s12 login-form">
        <div class="row">
          <div class="input-field col s12">
            <input id="email" type="email" name="email" class="validate">
            <label for="email" data-error="Isso não um e-mail válido :(">E-mail</label>
          </div>
          <div class="input-field col s12">
            <input id="password" type="password" name="user_pass" class="validate">
            <label for="password">Password</label>
          </div>
        </div>
      </form>
      <div style="margin-bottom:0;" class="row buttons">
          <div class="col s6">
            <button class="btn waves-effect waves-light btn-login" name="action">Login
              <i class="material-icons right">send</i>
            </button>
          </div>
          <div class="col s6">
            <button class=" light-blue darken-3 btn waves-effect waves-light btn-register" name="action">Registrar
              <i class="material-icons right">perm_identity</i>
            </button>
          </div>
          <div class="col s12 valign-wrapper"><a href="#pass-recover" id="pass-recover">Forgot your password?</a></div>
      </div>
    </div>
  </div>


  <style>
  a#pass-recover {
    margin-top: 20px;
    margin-bottom: -20px;
  }
  </style>

  <script>
    var dataform = [];
    var self = this;

    riot.route('pass-recover', function(name) {
      console.log('montou e desmontou');
      riot.mount('.pass-recover','pass-recover');
      self.unmount(true);
    });

    this.on('mount', function(){
      $('.modal-trigger').leanModal();

      // Ajax to register
      $('.btn-register').click(function () {

      dataform = $('.login-form').serializeArray();
      // console.log(dataform);

        $.api.register(dataform[0].value, dataform[1].value);

      });
      // Ajax to login
      $('.btn-login').click(function () {

      dataform = $('.login-form').serializeArray();
      // console.log(dataform);

        // Email and password are typically input fields in the app UI.
        $.api.login(dataform[0].value, dataform[1].value);
      });
    });

    this.on('update', function(){

    });

    this.on('updated', function(){

    });

  </script>

</login-register>
