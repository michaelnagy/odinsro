<profile>
  <div class="row">
    <div class="col s2 animated fadeInLeft navigation">
      <ul class="side-nav fixed" id="mobile-demo">
        <li><a href="shop">Shop</a></li>
        <li><a href="sass.html">Sistema</a></li>
        <li><a href="badges.html">Ferramentas</a></li>
      </ul>
    </div>
    <div class="col s10 animated fadeInUp content">
      <div class="row">

        <profile-info></profile-info>

        <div class="col s4">
          <div class="card-panel grey lighten-5 z-depth-1">
              <h5>Profile</h5>
                <p class="profile-tags"><span>Username:</span><span class="profile-editable">{username}</span></p>
                <p class="profile-tags"><span>E-mail</span></p>
          </div>
        </div>

        <div class="col s4">
          <div class="card-panel grey lighten-5 z-depth-1">
              <h5>Autotrade Itens</h5>
                <p class="profile-tags"><span>Username:</span><span class="profile-editable">{username}</span></p>
                <p class="profile-tags"><span>E-mail</span></p>
          </div>
        </div>

        <div class="col s8">
          <div class="card-panel grey lighten-5 z-depth-1">
              <h5>Zeny</h5>
                <p class="profile-tags"><span>Username:</span><span class="profile-editable">{username}</span></p>
                <p class="profile-tags"><span>E-mail</span></p>
          </div>
        </div>

        <div class="col s4">
          <div class="card-panel grey lighten-5 z-depth-1">
              <h5>Cash</h5>
                <p class="profile-tags"><span>Username:</span><span class="profile-editable">{username}</span></p>
                <p class="profile-tags"><span>E-mail</span></p>
          </div>
        </div>

      </div>
        
    </div>
       
  </div>
  
  <style>
    .navigation {
      height: 100vh;
    }
    profile > ul.side-nav.fixed {
      top: 100px;
    }

    profile .side-nav {
      width: 100%;
    }
  </style>

  <script>
    var self = this;

    this.session = getToken('token');

    if (!this.session) {
      riot.route('/');
    }

    view.addUnmountListener('profile', function() {
      self.unmount(true);
    });
  </script>
</profile>

<profile-info>
  <div class="col s4">
    <div class="card-panel grey lighten-5 z-depth-1">
        <h5>Profile</h5>
          <p class="profile-tags"><span>Username:</span><span class="profile-editable">Teste</span></p>
          <p class="profile-tags"><span>E-mail</span></p>
    </div>
  </div>

  <script>
    var self = this; 
    
    view.addUnmountListener('profile', function() {
      self.unmount(true);
    });

    this.on('mount', function(){
      
    });
  </script>
</profile-info>

