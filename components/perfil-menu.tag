<perfil-menu>

  <a if={!session} class="modal-trigger" href="#modal1">
    <div class="chip wrapper">
      <img src="img/avatar.png">
      Anonymous
    </div>
  </a>

  <a if={session} class="dropdown-button" href="#!" data-activates="dropdown1"><div class="chip wrapper">
    <img src="img/logged.png">{usermail}</div><i class="material-icons right">arrow_drop_down</i>
  </a>

  <!-- Dropdown Structure -->
  <ul id="dropdown1" class="dropdown-content">
    <li><a href="#!">Account</a></li>
    <li><a href="#!">System</a></li>
    <li><a href="#!">Shop</a></li>
    <li class="divider"></li>
    <li><a class="logout" href="#logout">Logout</a></li>
  </ul>

  <style>

  </style>

  <script>

    var self = this;

    this.on('mount', function(){

      this.session = getToken('token');
      this.usermail = getToken('email');
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
