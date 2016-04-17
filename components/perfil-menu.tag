<perfil-menu>

  <a if={!session} class="dropdown-button1" href="#" data-activates="dropdown2">
    <div class="chip wrapper">
      <img src="img/avatar.png">
      Login/Register
    </div><i class="material-icons right">arrow_drop_down</i>
  </a>

  <a if={session} class="dropdown-button2" href="#" data-activates="dropdown1"><div class="chip wrapper">
    <img src="img/logged.png">{usermail}</div><i class="material-icons right">arrow_drop_down</i>
  </a>

  <!-- Dropdown Structure -->
  <ul if={session} id="dropdown1" class="dropdown-content">
    <li><a href="#profile">Account</a></li>
    <li class="divider"></li>
    <li><a class="logout" href="#logout">Logout</a></li>
  </ul>

  <ul if={!session} id="dropdown2" class="dropdown-content">
    <li><a class="modal-log" href="#login"><i class="material-icons right">account_circle</i>Login</a></li>
    <li><a class="modal-log" href="#register"><i class="material-icons right">perm_identity</i>Register</a></li>
  </ul>

  <style>
  .modal-log:hover {
    border-bottom: 0;
    margin-top: 0;
  }
  </style>

  <script>

    var self = this;

    this.on('update', function(){
      this.session = getToken('token');
      this.usermail = getToken('email');
      // console.log(self.session, 'update');
    });

    this.on('updated', function(){

      // this.session = getToken('token');
      // this.usermail = getToken('email');

      $(".dropdown-button1").dropdown();
      $(".dropdown-button2").dropdown();

    });

  </script>

</perfil-menu>
