<perfil-menu>

  <div class="modal-content recover">
    <h4 class="center-align">Password Recovery</h4>
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
            <button class="btn waves-effect waves-light btn-login" name="action">Send new password
              <i class="material-icons right">send</i>
            </button>
          </div>
          <div class="col s6">
            <button class=" light-blue darken-3 btn waves-effect waves-light btn-register" name="action">Go back
              <i class="material-icons right">replay</i>
            </button>
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

</perfil-menu>
