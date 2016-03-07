<profile>
  <div class="row">
    <div class="col s2 animated fadeInLeft navigation">
      <ul class="side-nav fixed" id="mobile-demo">
        <li><a href="shop">Shop</a></li>
        <li><a href="sass.html">System</a></li>
        <li><a href="badges.html">Tools</a></li>
      </ul>
    </div>
    <div class="col s10 animated fadeInUp content">
      <div class="row">

        <div class="col s6">
          <div class="card-panel grey lighten-5 z-depth-1">
              <h5>Profile</h5>
                <p class="profile-tags"><span>Username:</span><span class="profile-info right">{name}</span></p>
                <p class="profile-tags"><span>E-mail:</span><span class="profile-info right"> {email}</span></p>
          </div>
        </div>

        <div class="col s6">
          <div class="card-panel grey lighten-5 z-depth-1">
              <h5>Autotrade Itens</h5>
                <p class="profile-tags"><span>Username:</span><span class="profile-editable">{username}</span></p>
                <p class="profile-tags"><span>E-mail</span></p>
          </div>
        </div>

        <div class="col s6">
          <div class="card-panel grey lighten-5 z-depth-1">
              <h5>Zeny</h5>
                <p class="profile-tags"><span><img src="/img/zeny.png"></span><span class="profile-zeny right">{zeny}</span></p>
          </div>
        </div>

        <div class="col s6 cash-col">
          <div class="card-panel grey lighten-5 z-depth-1">
              <h5>Cash</h5>
                <p class="profile-tags"><span><img src="/img/cash.png"></span><span class="profile-zeny right">{zeny}</span></p>
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
    .profile-zeny {
      font-weight: bold;
      font-size: 30px;
    }
    .profile-info {
      font-size: 20px;
    }
  </style>

  <script>
    var self = this;

    this.session = getToken('token');
    this.email = getToken('email');
    this.odinid = getToken('odinid');
    this.name = getToken('name');

    if (!this.session) {
      riot.route('/');
      return;
    }

    this.on('mount', function(){
    $.api.getRecords('char', this.session, this.odinid);
    });

    this.on('update', function(){
      this.zeny = getToken('zeny');
    });

    view.addUnmountListener('profile', function() {
      self.unmount(true);
    });
  </script>
</profile>

