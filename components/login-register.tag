<login-register>

  <div class="animated slideInRight">
    <h4 class="center-align">Login or Register</h4>
    <div class="row">
      <form class="col s12 login-form">
        <div class="row">
          <div class="input-field col s12">
            <input id="email" type="email" name="email" class="validate" required="required" required>
            <label for="email" data-error="This is not a valid e-mail :(">E-mail</label>
          </div>
          <div class="input-field col s12">
            <input id="password" type="password" name="user_pass" class="validate" required>
            <label for="password" data-error="You have to set a password :(">Password</label>
          </div>
        </div>
      </form>
      <div style="margin-bottom:0;" class="row buttons">
          <div class="col s6">
            <button class="btn waves-effect waves-light btn-login" type="submit" form="login-form">Login
              <i class="material-icons right">send</i>
            </button>
          </div>
          <div class="col s6">
            <button class=" light-blue darken-3 btn waves-effect waves-light btn-register" type="submit" form="login-form">Registrar
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
      // console.log('montou e desmontou');
      riot.mount('.pass-recover','pass-recover');
      self.unmount(true);
    });

    this.on('mount', function(){
      $('.modal-trigger').leanModal();

      // Ajax to register
      $('.btn-register').click(function () {
        console.log('clicou');

      dataform = $('.login-form').serializeArray();
      // console.log(dataform);
      $('.login-form').submit(function(event){
        if(!this.checkValidity())
              {
                console.log($(this).find('input'));
                $(this).find('input').filter(function() {
                    return !this.value;
                }).first().addClass('invalid').focus();
                  event.preventDefault();

              }
              else {
                event.preventDefault();
                $.api.register(dataform[0].value, dataform[1].value);
              }
          });
          $('.login-form').submit();

      });
      // Ajax to login
      $('.btn-login').click(function () {
          dataform = $('.login-form').serializeArray();
      // console.log(dataform);
        $('.login-form').submit(function(event){
                if(!this.checkValidity())
                {
                  console.log($(this).find('input'));
                  $(this).find('input').filter(function() {
                      return !this.value;
                  }).first().addClass('invalid').focus();
                    event.preventDefault();

                }
                else {
                  event.preventDefault();
                  // Email and password are typically input fields in the app UI.
                  $.api.login(dataform[0].value, dataform[1].value);
                }

        });
          $('.login-form').submit();
      });
    });

    this.on('update', function(){

    });

    this.on('updated', function(){

    });

  </script>

</login-register>
