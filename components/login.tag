<login>

  <div class="animated slideInRight">
    <h4 class="center-align">Login</h4>
    <div class="row">
      <form class="col s12 login-form">
        <div class="row">
          <!-- <div class="input-field display_name col s12">
            <input id="display_name" type="text" name="display_name" class="validate" required="required" required>
            <label for="display_name" data-error="This username is already taken :(">Username</label>
          </div> -->
          <div class="input-field email col s12">
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

    view.addUnmountListener('login', function() {
      self.unmount(true);
    });

    // riot.route('pass-recover', function(name) {
    //   // console.log('montou e desmontou');
    //   riot.mount('.pass-recover','pass-recover');
    //   self.unmount(true);
    // });

    this.on('mount', function(){

      //submit binder function
      $('.login-form').submit(function(event){
                if(!this.checkValidity())
                {
                  // console.log($(this).find('input'));
                  $(this).find('input').filter(function() {
                      return !this.value;
                  }).first().addClass('invalid').focus();
                    event.preventDefault();
                    dataform = [];

                }
                else {
                  event.preventDefault();
                  // Email and password are typically input fields in the app UI.
                  $.api.login(dataform[0].value, dataform[1].value);
                  console.log(dataform, 'else');
                  // riot.update();
                }
        });

      // Ajax to login
      $('.btn-login').click(function () {
        dataform = [];
        // console.log(dataform,'click');
        dataform = $('.login-form').serializeArray();
        // console.log(dataform,'serialized');

        $('.login-form').submit();
          // dataform = [];
      });
      //submit form on Enter press
      $('input[type=password]').on('keydown', function(e) {
        if (e.which == 13) {
          e.preventDefault();
          $('.login-form').submit();
        }
      });
    });

    this.on('update', function(){

    });

    this.on('updated', function(){

    });

  </script>

</login>
