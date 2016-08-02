<register>

  <div class="animated slideInRight">
    <h4 class="center-align">Register</h4><a href="#" class="modal-action modal-close"><img src="img/close.png"></a>
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
          <div class="input-field col s12">
            <input type="date" id="birthdate" name="birthdate" class="datepicker">
            <label for="birthdate" class="birth">Birthdate</label>
          </div>
        </div>
        <div style="margin-bottom:0;" class="row buttons">

          <div class="col s12 recaptcha">
            <div id="recaptcha"></div>
          </div>

          <div class="col s12 register-btn">
            <button class=" light-blue darken-3 btn waves-effect waves-light btn-register" type="submit" form="login-form">Register
              <i class="material-icons right">perm_identity</i>
            </button>
            <div class="preloader-wrapper small active hide" style="display:block; margin:10px; auto;">
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
        <div class="row" style="margin-top: 105px;">
          <h6 class="center-align" style="padding-left: 20px;">Already have an account?</h6>
          <div class="col s4 offset-s4 register-features">
            <a href="#login" class="center-align btn waves-effect waves-light" >Login
              <i class="material-icons right">perm_identity</i>
            </a>
          </div>
        </div>

      </div>
    </div>
  </div>


  <style>
  label.birth  {
    top: -0.8rem;
  }
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

      (function() {
        Date.prototype.toYMD = Date_toYMD;
        function Date_toYMD() {
            var year, month, day;
            year = String(this.getFullYear());
            month = String(this.getMonth() + 1);
            if (month.length == 1) {
                month = "0" + month;
            }
            day = String(this.getDate());
            if (day.length == 1) {
                day = "0" + day;
            }
            return year + "-" + month + "-" + day;
          }
      })();

     this.on('mount', function(){

       // IF firefox then
       if(navigator.userAgent.toLowerCase().indexOf('firefox') > -1){
         //maskedinput
         $("#birthdate").mask("99/99/9999");
      }


       //recaptcha loading
      grecaptcha.render('recaptcha', {
        'sitekey' : '6LflHxsTAAAAAJd8J1vtxys-GZRNVLAq2ipGAP_x',
      });

      // Ajax to register
      $('.btn-register').click(function () {
        // console.log('register');

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
                var dt = new Date(dataform[3].value);
                var dtstr = dt.toYMD();
                // console.log(md5(dataform[2].value));
                $.api.register(dataform[0].value, dataform[1].value, md5(dataform[2].value), dtstr, dataform[4].value);
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

      // // initialize the datepicker
      // $('.datepicker').pickadate({
      //   selectMonths: true, // Creates a dropdown to control month
      //   selectYears: 15 // Creates a dropdown of 15 years to control year
      // });

    });

    view.addUnmountListener('register', function() {
      self.unmount(true);
    }, 'modal');
  </script>

</register>
