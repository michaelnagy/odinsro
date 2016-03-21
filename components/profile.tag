<profile>
  <div class="row">
    <div class="col s2 animated fadeInLeft navigation">
      <ul class="side-nav fixed" id="mobile-demo">
        <!-- <li><a href="shop">Shop</a></li> -->
        <!-- <li><a href="https://odinsro.freshdesk.com" target="_blank">Support</a></li> -->
      </ul>
    </div>
    <div class="col s10 animated fadeInUp content">
      <div class="row">

        <div class="col s6">
          <div class="card-panel grey lighten-5 z-depth-1">
              <h5>Profile  <i class="small material-icons right">perm_identity</i></h5>
                <p class="profile-tags"><span>Username:</span><span class="profile-info right">{name}</span></p>
                <p class="profile-tags"><span>E-mail:</span><span class="profile-info right"> {email}</span></p>
                <p if={birthdate != 'undefined'} class="profile-tags"><span>Birthdate:</span><span class="profile-info right"> {birthdate}</span></p>
          </div>
        </div>

        <div class="col s6">
          <div class="card-panel grey lighten-5 z-depth-1">
              <h5>Autotrade Items</h5> <a if={autotrade} class="btn-floating waves-effect waves-light green autotrade"><i class="material-icons">power_settings_new</i></a>
              <a if={!autotrade} class="btn-floating waves-effect waves-light red autotrade" title="Autotrade OFF"><i class="material-icons">power_settings_new</i></a>
                <p if={autotrade} class="profile-tags"><span>Quantity:</span><span class="profile-zeny right"> {autotrade}</span></p>
                <p if={!autotrade} class="profile-tags">Autotrade is OFF</p>
          </div>
        </div>

        <div class="col s6 right">
          <div class="card-panel grey lighten-5 z-depth-1">
              <h5>Zeny</h5>
              <div if={!zeny}>
                <p class="profile-tags"><span><img src="/img/zeny.png"></span><span class="profile-zeny right"> 0</span></p>
              </div>
              <div if={zeny}>
                <p class="profile-tags"><span><img src="/img/zeny.png"></span><span class="profile-zeny right"> {zeny}</span></p>
              </div>
                
          </div>
        </div>

        <div class="col s6 cash-col left">
          <div class="card-panel grey lighten-5 z-depth-1">
              <h5>Cash</h5>
              <div if={!cash}>
                <span  class="profile-zeny">0</span> <a class="waves-effect waves-light btn right"><i class="material-icons left">shopping_cart</i>buy more cash</a>
              </div>
              <div if={cash}>
                <span class="profile-zeny">{cash}</span> <a class="waves-effect waves-light btn right"><i class="material-icons left">shopping_cart</i>buy more cash</a>
              </div>
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
    .autotrade {
      left:93%;
      bottom: 40px;
    }
  </style>

  <script>
    var self = this;

    this.session = getToken('token');
    this.email = getToken('email');
    this.odinid = getToken('odinid');
    this.name = getToken('name');
    this.birthdate = getToken('birthdate');
    console.log('birth',getToken('birthdate'));

    if (!this.session) {
      riot.route('/');
      return;
    }

    this.on('mount', function(){
    $.api.getRecords('char', this.session, this.odinid);
    $.api.getRecords('vendings', this.session, this.odinid);
    $.api.getRecords('global_reg_value', this.session, this.odinid);
    });

    this.on('update', function(){
      
      this.autotrade = getToken('autotrade');
      this.zeny = getToken('zeny');
      this.cash = getToken('cash');
    });

    view.addUnmountListener('profile', function() {
      self.unmount(true);
    });
  </script>
</profile>

