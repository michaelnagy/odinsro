<pass-recover>
  <div class="animated slideInLeft">
    <h4 class="center-align">Password Recovery</h4>
    <div class="row">
      <form class="col s12 reset-form">
        <div class="row">
          <div class="input-field col s12">
            <input id="email" type="email" name="email" class="validate" required="" aria-required="true">
            <label for="email" data-error="Isso não um e-mail válido :(">E-mail</label>
          </div>
          <div style="display:none" class="reset2">
            <div class="input-field col s12">
              <input id="code" type="text" name="code" class="validate" required="" aria-required="true">
              <label for="code">Confirmation Code</label>
            </div>
            <div class="input-field col s12">
              <input id="new_password" type="password" name="new_password" class="validate" required="" aria-required="true">
              <label for="new_password">New Password</label>
            </div>
          </div>
        </div>
      </form>
      <div class="row buttons">
          <div class="col s6">
            <button class="btn waves-effect waves-light btn-reset" name="action">Send new password
              <i class="material-icons right">send</i>
            </button>
            <button style="display:none" class="btn waves-effect waves-light btn-reset2" name="action">Send new password
              <i class="material-icons right">send</i>
            </button>
          </div>
          <div class="col s6">
            <a href="#login" class="light-blue darken-3 btn waves-effect waves-light btn-go-back" name="action">Go back
              <i class="material-icons right">replay</i>
            </a>
          </div>
      </div>
    </div>
  </div>

  <style>
  </style>

  <script>

    var self = this;

    // riot.route('login', function(name) {
      // console.log('montou e desmontou 2');
      // riot.mount('.login','login');
      // self.unmount(true);
    // });

    view.addUnmountListener('pass-recover', function() {
      self.unmount(true);
    });


    this.on('mount', function(){
      // Ajax to register
      $('.btn-reset').click(function () {

      dataform = $('.reset-form').serializeArray();
      console.log(dataform[0].value);

        $.api.reset(dataform[0].value);

      });
      // Ajax to register
      $('.btn-reset2').click(function () {

      dataform = $('.reset-form').serializeArray();
      console.log(dataform[0].value);

        $.api.reset2(dataform[0].value, dataform[1].value, dataform[2].value );

      });
    });

    this.on('update', function(){

    });

    this.on('updated', function(){

    });

  </script>

</pass-recover>
