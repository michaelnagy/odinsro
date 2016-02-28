<register>

  <div class="animated slideInRight">
    <h4 class="center-align">Register</h4>
    <div class="row">
      <form class="col s12 register-form">
        <div class="row">
          <div class="input-field display_name col s12">
            <input id="display_name" type="text" name="display_name" class="validate" required="required" required>
            <label for="display_name" data-error="This username is already taken :(">Username</label>
          </div>
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
            <button class=" light-blue darken-3 btn waves-effect waves-light btn-register" type="submit" form="login-form">Registrar
              <i class="material-icons right">perm_identity</i>
            </button>
          </div>
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

    this.on('mount', function(){
      // Ajax to register
      $('.btn-register').click(function () {
        console.log('register');

      dataform = $('.register-form').serializeArray();
      // console.log(dataform);
      $('.register-form').submit(function(event){
        if(!this.checkValidity())
              {
                // console.log($(this).find('input'));
                $(this).find('input').filter(function() {
                    return !this.value;
                }).first().addClass('invalid').focus();
                  event.preventDefault();

              }
              else {
                event.preventDefault();
                console.log(dataform);
                $.api.register(dataform[0].value, dataform[1].value, dataform[2].value);
                dataform = [];
              }
          });
          $('.register-form').submit(); 
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

    view.addUnmountListener('register', function() {
      self.unmount(true);
    }, 'modal');
  </script>

</register>
