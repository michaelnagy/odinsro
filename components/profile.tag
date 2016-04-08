<profile>
  <div class="row">
    <div class="col s2 navigation">
      <ul class="side-nav green lighten-5 fixed" id="mobile-demo">
      <li><a class="side-profile" href="#profile"><i class="material-icons menu-icons">face</i> Profile</a></li>
          <li class="no-padding">
            <ul class="collapsible collapsible-accordion">
              <li>
                <a class="collapsible-header waves-effect waves-light"><i class="material-icons">settings</i> System<i class="mdi-navigation-arrow-drop-down right"></i></a>
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
                <a class="collapsible-header waves-effect waves-light"><i class="material-icons">build</i> Tools<i class="mdi-navigation-arrow-drop-down right"></i></a>
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
                <a class="collapsible-header waves-effect waves-light"><i class="material-icons">bubble_chart</i> Community<i class="mdi-navigation-arrow-drop-down right"></i></a>
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
                <a class="collapsible-header waves-effect waves-light"><i class="material-icons menu-icons">shopping_cart</i> Shop<i class="mdi-navigation-arrow-drop-down right"></i></a>
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
              <h5>Autotrade: <span if={autotrade} class="profile-info right">{autotrade[0].title}</span></h5>
              <hr>
                <p if={!autotrade} class="profile-info">Autotrade is OFF</p>
                <div class="chip" style='margin: 10px;' each={names}>
                  <img src="http://www.divine-pride.net/img/items/item/iRO/{id}" alt="Contact Person">
                  {name_japanese}
                </div>
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
    .profile-info {
      font-weight:300; 
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


    if (!this.session) {
      $.api.logout();
      return;
    }

    this.on('mount', function(){

    $('.collapsible').collapsible({
        accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
      });  
      
    $.api.getRecords('char?id_field=account_id&ids='+this.odinid,this.session);
    $.api.getRecords('global_reg_value?id_field=account_id&ids='+this.odinid,this.session);
    
    //get autotrade info

    $.ajax({
      dataType: 'json',
      contentType: 'application/json; charset=utf-8',
      cache:false,
      headers: {
        "X-DreamFactory-API-Key": APP_API_KEY,
        "X-DreamFactory-Session-Token": getToken('token'),
      },
      url: INSTANCE_URL + '/api/v2/odinsro/_table/vendings?id_field=account_id&ids='+this.odinid,
      method:'GET'
    }).then(function (data) {
      self.vendingid = data.resource[0].id; 
    }).then(function (data) {
        $.ajax({
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        cache:false,
        headers: {
          "X-DreamFactory-API-Key": APP_API_KEY,
          "X-DreamFactory-Session-Token": getToken('token'),
        }, 
        url: INSTANCE_URL + '/api/v2/odinsro/_table/vending_items?filter=vending_id='+self.vendingid,
        method:'GET'
      }).then(function (data) {
          self.vendingitems = [];
          data.resource.forEach(function (value,index,ar) {
            self.vendingitems[index] = value;
          });
        }).then(function (data) {
          self.nameid = [];
          self.vendingitems.forEach(function (value,index,ar) {
            $.ajax({
              dataType: 'json',
              contentType: 'application/json; charset=utf-8',
              cache:false,
              headers: {
                "X-DreamFactory-API-Key": APP_API_KEY,
                "X-DreamFactory-Session-Token": getToken('token'),
              },
              url: INSTANCE_URL + '/api/v2/odinsro/_table/cart_inventory?ids='+value.cartinventory_id,
              method:'GET'
            }).then(function (data) {

              self.nameid[index] = data.resource[0].nameid;
              callNames(self.nameid);
              // console.log(self.nameid);
            });
          });
        });
    });

      function callNames (nameids) {
        self.names = [];
        nameids.forEach(function (value,index,ar) {
          $.ajax({
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            cache:false,
            headers: {
              "X-DreamFactory-API-Key": APP_API_KEY,
              "X-DreamFactory-Session-Token": getToken('token'),
            },
            url: INSTANCE_URL + '/api/v2/odinsro/_table/item_db_re?ids='+value,
            method:'GET'
          }).then(function (data) {

            self.names[index] = data.resource[0];

            self.update();
            // console.log(self.names);
          });
        });
      }
      console.log(self.name);
    });

    this.on('update', function(){
      
      this.autotrade = storage.get('autotrade');
      this.vending = storage.get('vending');
      this.cartinventory = storage.get('cartinventory');
      this.zeny = getToken('zeny');
      this.cash = getToken('cash');
    });

    view.addUnmountListener('profile', function() {
      self.unmount(true);
    });
  </script>
</profile>

