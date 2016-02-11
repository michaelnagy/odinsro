<perfil-menu>

  <div class="modal-content">
    <h4 class="center-align">Login</h4>
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
      <div class="row buttons">
          <div class="col s6">
            <button class="btn waves-effect waves-light btn-login" name="action">Login
              <i class="material-icons right">send</i>
            </button>
          </div>
          <div class="col s6">
            <button class=" light-blue darken-3 btn waves-effect waves-light btn-register" name="action">Registrar
              <i class="material-icons right">perm_identity</i>
            </button>
            <a href="#recover">Recover your password</a>
          </div>
      </div>
    </div>
  </div>

  <style>

  </style>

  <script>

    var dataform = [];
    var self = this;

    this.on('mount', function(){

      this.session = getToken('token');
      this.usermail = getToken('email');
      // console.log(this.usermail);
      // $('.modal-trigger').click(function () {
      //   $('#modal1.modal').openModal();
      // });
      $('.modal-trigger').leanModal();

      // Ajax to register
      $('.btn-register').click(function () {

      dataform = $('.login-form').serializeArray();
      // console.log(dataform);

        $.api.register(dataform[0].value, dataform[1].value, registered);

      });
      // Ajax to login
      $('.btn-login').click(function () {

      dataform = $('.login-form').serializeArray();
      // console.log(dataform);

        // Email and password are typically input fields in the app UI.
        $.api.login(dataform[0].value, dataform[1].value);
      });
      //Logout
    });

    this.on('update', function(){
      this.session = getToken('token');
      this.usermail = getToken('email');
    });

    this.on('updated', function(){
      $(".dropdown-button").dropdown();



    });

    riot.route('logout', function() {
      console.log('deslogou');
      $.api.logout();
      self.update();
      console.log(self.session);
    });

  </script>

</perfil-menu>
