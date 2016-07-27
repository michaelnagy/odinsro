<login>

  <div class="animated slideInRight">
    <h4 class="center-align">Login</h4><a href="#" class="modal-action modal-close right"><img src="img/close.png"></a>
    <div class="row login-row">
      <form class="col s12 login-form">
        <div class="row">
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
          <div class="col s6 login-preloader">
            <!-- preloader -->
            <div class="preloader-wrapper small active hide">
              <div class="spinner-layer spinner-green-only">
                <div class="circle-clipper left">
                  <div class="circle"></div>
                </div><div class="gap-patch">
                  <div class="circle"></div>
                </div><div class="circle-clipper right">
                  <div class="circle"></div>
                </div>
              </div>
            </div>
          </div>
          <div class="col s12 valign-wrapper"><a href="#pass-recover" id="pass-recover">Forgot your password?</a></div>
      </div>
    </div>
  </div>


  <style>
  #modal1 {
    width: 30%;
  }
  @media only screen and (max-width: 992px) {
    #modal1 {
        width: 80% !important;
      }
  }
  .login-row {
    background-color: #F3F3F3;
    border: 1px solid #E4E4E4;
    padding-bottom: 40px !important;
  }
  a#pass-recover {
    margin-top: 20px;
    margin-bottom: -20px;
  }

  </style>

  <script>
    var dataform = [];
    var self = this;

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

          dataform = [];
          dataform = $('.login-form').serializeArray();

          e.preventDefault();
          $('.login-form').submit();
        }
      });
    });

    this.on('update', function(){
       // $('.login-form')[0].reset();
    });

    this.on('updated', function(){

    });

    view.addUnmountListener('login', function() {
      self.unmount(true);
    }, 'modal');

  </script>

</login>
