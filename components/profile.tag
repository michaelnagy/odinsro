<profile>
  <div class="row">
    <div class="col s2 navigation">
      <ul class="side-nav green lighten-5 fixed" id="mobile-demo">
      <li><a class="side-profile" href="#profile"><i class="material-icons menu-icons">face</i> Profile</a></li>
          <li class="no-padding">
            <ul class="collapsible collapsible-accordion">
              <li>
                <a class="collapsible-header"><i class="material-icons">settings</i> System<i class="mdi-navigation-arrow-drop-down right"></i></a>
                <div class="collapsible-body">
                  <ul>
                    <li><a href="#!">Vote Point</a></li>
                    <li><a href="#rank">Rank</a></li>
                  </ul>
                </div>
              </li>
            </ul>
          </li>
          <li class="no-padding">
            <ul class="collapsible collapsible-accordion">
              <li>
                <a class="collapsible-header"><i class="material-icons">build</i> Tools<i class="mdi-navigation-arrow-drop-down right"></i></a>
                <div class="collapsible-body">
                  <ul>
                    <li><a href="#!">Char Problem</a></li>
                    <li><a href="#!">Account Problem</a></li>
                  </ul>
                </div>
              </li>
            </ul>
          </li>
          <li class="no-padding">
            <ul class="collapsible collapsible-accordion">
              <li>
                <a class="collapsible-header"><i class="material-icons">bubble_chart</i> Community<i class="mdi-navigation-arrow-drop-down right"></i></a>
                <div class="collapsible-body">
                  <ul>
                    <li><a href="https://www.facebook.com/oficialodinsro/" target="_blank">Facebook</a></li>
                    <li><a href="#!">Youtube</a></li>
                    <li><a href="http://forum.odinsro.net/t/suport" target="_blank">Discussions</a></li>
                  </ul>
                </div>
              </li>
            </ul>
          </li>
          <li class="no-padding">
            <ul class="collapsible collapsible-accordion">
              <li>
                <a class="collapsible-header"><i class="material-icons menu-icons">shopping_cart</i> Shop<i class="mdi-navigation-arrow-drop-down right"></i></a>
                <div class="collapsible-body">
                  <ul>
                    <li><a href="" target="_blank">Cash</a></li>
                    <li><a href="#!">VIP</a></li>
                  </ul>
                </div>
              </li>
            </ul>
          </li>
        </ul>
    </div>
    <div class="col s10 animated fadeInUp content">
      <div class="row">

        <div class="col s6">
          <div class="card-panel grey lighten-5 z-depth-1">
              <h5>Profile  <i class="small material-icons right">perm_identity</i></h5>
              <hr>
                <p class="profile-tags"><span>Username:</span><span class="profile-info right">{name}</span></p>
                <p class="profile-tags"><span>E-mail:</span><span class="profile-info right"> {email}</span></p>
                <p if={birthdate != 'undefined'} class="profile-tags"><span>Birthdate:</span><span class="profile-info right"> {birthdate}</span></p>
                <p if={autotrade} class="profile-tags"><span>Autotrade:</span><span class="profile-info right on">ON</span></p>
                <p if={!autotrade} class="profile-tags"><span>Autotrade:</span><span class="profile-info right off">OFF</span></p>
                <p class="profile-tags"><span>Zeny:</span><span class="profile-info right">{zeny}</span></p>
                <p class="profile-tags"><span>Cash:</span><span class="profile-info right">{cash} <span class="buy right">buy more</span></span></p>
                <p class="profile-tags"><span>Last Login:</span><span class="profile-info right">{last}</span></p>
          </div>
        </div>

        <div class="col s6">
          <div class="card-panel grey lighten-5 z-depth-1">
              <h5>Autotrade Items</h5> <!-- <a if={autotrade} class="btn-floating waves-effect waves-light green autotrade"><i class="material-icons">power_settings_new</i></a> -->
              <hr>
              <!-- <a if={!autotrade} class="btn-floating waves-effect waves-light red autotrade" title="Autotrade OFF"><i class="material-icons">power_settings_new</i></a> -->
                <p if={autotrade} class="profile-tags"><span>Quantity:</span><span class="profile-zeny right"> {autotrade}</span></p>
                <p if={!autotrade} class="profile-tags">Autotrade is OFF</p>
          </div>
        </div>

        <div class="col s12 cash-col left">
          <div class="card-panel grey lighten-5 z-depth-1">
              
              </div>
          </div>
        </div>

      </div>
        
    </div>
       
  </div>
  
  <style>
    .buy {
      position: relative;
      font-weight: 400;
      font-size: 1.0rem;
      color: #fff;
      background-color: #26a69a;
      border-radius: 2px;
      padding: 4px;
      margin-left:10px;
    }
    .off {
      color: red;
      font-size: 18px;
    }
    .on {
      color: green;
      font-size: 18px;
    }
    .navigation {
      height: 100vh;
    }
    profile .side-nav {
      top: inherit;
    }

    /*profile .side-nav {
      width: 100%;
    */}
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
    this.last = getToken('last');

    // console.log('birth',getToken('birthdate'));



    if (!this.session) {
      riot.route('/');
      return;
    }

    this.on('mount', function(){

    $('.collapsible').collapsible({
        accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
      });  
      
    $.api.getRecords('char?id_field=account_id&ids='+this.odinid,this.session);
    $.api.getRecords('vendings?id_field=account_id&ids='+this.odinid,this.session);
    $.api.getRecords('global_reg_value?id_field=account_id&ids='+this.odinid,this.session);
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

