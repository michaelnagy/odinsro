<login-register>

  <div class="modal-content" id="login-register">
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
            <a href="#forgot">Recover your password</a>
          </div>
      </div>
    </div>
  </div>

  <style>

  </style>

  <script>

    var self = this;

    this.on('mount', function(){


    });

    this.on('update', function(){

    });

    this.on('updated', function(){

    });

  </script>

</login-register>
