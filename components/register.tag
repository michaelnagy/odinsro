<register>

  <div class="animated slideInRight">
    <h4 class="left-align">Register</h4><a href="#" class="modal-action modal-close"><img src="img/close.png"></a>
    <div class="row">
      <form class="col s6 register-form">
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
        <div style="margin-bottom:0;" class="row buttons">

          <div class="col s12 recaptcha">
            <div id="recaptcha"></div>
          </div>

          <div class="col s12">
            <button class=" light-blue darken-3 btn waves-effect waves-light btn-register" type="submit" form="login-form">Registrar
              <i class="material-icons right">perm_identity</i>
            </button>
          </div>
          
        </div>
      
      </form>

      <div class="col s6 register-features">
      <h5>OdinsRO Panel</h5>
        <ul class="collection with-header">
          <li class="collection-item">Vote daily and get a reward <i class="material-icons left green-text bold">done</i></li>
          <li class="collection-item">Account and character status <i class="material-icons left green-text bold">done</i></li>
          <li class="collection-item">Cash Shop and Packet Shop <i class="material-icons left green-text bold">done</i></li>
          <li class="collection-item">Rank System <i class="material-icons left green-text bold">done</i></li>
        </ul>
        <a href="" target="_blank">General Rules</a>
      </div>
    </div>
  </div>


  <style>
  #modal2 {
    max-height: 90%;
  }
  .recaptcha {
    margin-bottom: 10px;
  } 

  a#pass-recover {
    margin-top: 20px;
    margin-bottom: -20px;
  }
  .bold {
    font-weight: bold;
  }
  .modal-close {
    position: relative;
    bottom: 55px;
    float: right;
  }
  register .collection {
    border: none;
  }
  register .collection .collection-item {
    border-bottom: none;
    background-color: transparent;
  }
  .register-form {
    background-color: #F3F3F3;
    border: 1px solid #E4E4E4;
    padding-bottom: 10px !important;
  }
  .register-features > h5 {
    padding-left: 30px;
    font-size: 1.8rem;
  }
  register h4 {
    font-size: 1.8rem;
  }
  register a {
    padding-left: 30px;
  }
  .btn-register {
    width: 100%;
  }
  </style>

  <script>
    var dataform = [];
    var self = this;

     this.on('mount', function(){

       //recaptcha loading
      grecaptcha.render('recaptcha', {
        'sitekey' : '6LflHxsTAAAAAJd8J1vtxys-GZRNVLAq2ipGAP_x',
      });

      // Ajax to register
      $('.btn-register').click(function () {
        console.log('register');

      dataform = $('.register-form').serializeArray();
      console.log(dataform);
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
                $.api.register(dataform[0].value, dataform[1].value, dataform[2].value, dataform[3].value);
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
