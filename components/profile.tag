<profile>
  <div class="row">
    <profile-sidebar></profile-sidebar>

    <div class="col s10 animated fadeInUp content">
      <div class="row">

        <div class="col s6">
          <div class="card-panel grey lighten-5 z-depth-1 profile">
            <div class="animated fadeIn">

              <h5>Profile  <i class="small material-icons right">perm_identity</i></h5>
              <hr>
                <p class="profile-tags"><span>Username:</span><span class="profile-info right">{name}</span></p>
                <p class="profile-tags"><span>E-mail:</span><span class="profile-info right"> {email}</span></p>
                <p if={birthdate != 'undefined'} class="profile-tags"><span>Birthdate:</span><span class="profile-info right"> {birthdate}</span></p>
                <p if={names} class="profile-tags"><span>Autotrade:</span><span class="profile-info right on">ON</span></p>
                <p if={!names} class="profile-tags"><span>Autotrade:</span><span class="profile-info right off">OFF</span></p>
                <p if={vip == 1} class="profile-tags"><span>VIP:</span><span class="profile-info right on">ON</span></p>
                <p if={vip == 0} class="profile-tags"><span>VIP:</span><span class="profile-info right off">OFF</span></p>
                <p if={!vip} class="profile-tags"><span>VIP:</span><span class="profile-info right off">OFF</span></p>
                <p class="profile-tags"><span>Zeny:</span><span if={zeny} class="profile-info right">{zeny}</span><span if={!zeny} class="profile-info right">0</span></p>
                <p class="profile-tags"><span>Cash:</span><span if={cash} class="profile-info right">{cash} <span class="buy right">buy more</span></span><span if={!cash} class="profile-info right">0 <span class="buy right">buy more</span></span></p>
                <p class="profile-tags"><span>Last Login: </span><span if={lasttime} class="profile-info right">{lasttime}</span></p>
              
            </div> 
          </div>
        </div>

        <div class="col s6">
          <div class="card-panel grey lighten-5 z-depth-1 autotrade">

            <div class="animated fadeIn">

              <h5>Autotrade: <span if={names} class="profile-info right">{vendingid.title}</span></h5>
              <hr>
                <p if={!names} class="profile-info">Autotrade is OFF</p>
                <ul>
                  <li each={filter(names)}>
                    <div class="chip z-depth-1" style='margin: 10px;'>
                      <img src="http://www.divine-pride.net/img/items/item/iRO/{id}" alt="Contact Person">
                      {name_japanese} <span style="font-weight:bolder;"> x{amount}</span>
                    </div>
                  </li>
                </ul>
                
            </div>
              
          </div>
          <ul class="pagination">
            <li class="waves-effect"><a onclick={prev}><i class="material-icons">chevron_left</i></a></li>
            <li>{ page + 1 } / { Math.ceil(names.length / pagesize) }</li>
            <li class="waves-effect"><a onclick={next}><i class="material-icons">chevron_right</i></a></li>
          </ul>
        </div>

        <div class="col s12">
            <div class="card-panel grey lighten-5 z-depth-1 quest">
              <div class="animated fadeIn">
                <quest></quest>
              </div>
            </div>
        </div>
      </div>

      </div>
        
    </div>
  
  <style>
  .chip img {
    width: 24px !important;
    height: 24px !important;
    margin-top: 3px;
    margin-left: -4px;
    margin-right: 3px;
  }
  .autotrade {
      left:93%;
      bottom: 40px;
      height: 430px;
      background-image: url('/img/autotradebg.png');
      background-repeat: no-repeat;
      background-size: 40%;
      background-position: 80% 50%;
    }
    .profile {
      height: 430px;
      background-image: url('/img/profilebg.png');
      background-repeat: no-repeat;
      background-size: 50%;
      background-position: 50% 50%;
    }
    .chip {
      font-weight: 400;
    }
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

    .profile-zeny {
      font-weight: bold;
      font-size: 30px;
    }
    .profile-info {
      font-size: 20px;
    }
    .profile-info {
      font-weight:300; 
    }
    .pagination {
      position: relative;
      bottom: 70px;
    }
  </style>

  <script>
    var itemsProcessed = 0;
    var self = this;
    //attribute basic profile info to sessionStorage
    this.session = getToken('token');
    this.email = getToken('email');
    this.odinid = getToken('odinid');
    this.name = getToken('name');
    this.birthdate = getToken('birthdate');
    this.lasttime = getToken('lasttime');
    this.vip = getToken('vip');


    //autotrade widgets pagination function 
    self.page = 0;
    self.pagesize = 5;
    
    first() {
    self.page = 0;
    }
    prev() {
      // console.log('prev');
      if (self.page > 0) {
        self.page--;
      }
    }
    next() {
      // console.log('next', self.page, (self.names.length / self.pagesize) - 1, self.names.length);
      if (self.page < (self.names.length / self.pagesize) - 1) {
        self.page++;
      }
    }
    last() {
      self.page = Math.ceil(self.names.length / self.pagesize) - 1;
    }
    filter(array) {
      return array.slice(self.page * self.pagesize, (self.page + 1) * self.pagesize);
    }

    //check if session is active
    if (!this.session) {
      riot.route('logout');
      return;
    }

    this.on('mount', function(){

      //initialize preloaders
      preLoader(element, preloader); 
      //API calls to get basic profile info  
      $.api.getRecords('char?filter=account_id='+this.odinid,this.session);
      // $.api.getRecords('global_reg_value?id_field=account_id&ids='+this.odinid,this.session);
      
      //get autotrade info and start getting items name here
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
        // console.log(data);
        self.vendingid = data.resource[0];
         
      }).then(function (data) {
          $.ajax({
          dataType: 'json',
          contentType: 'application/json; charset=utf-8',
          cache:false,
          headers: {
            "X-DreamFactory-API-Key": APP_API_KEY,
            "X-DreamFactory-Session-Token": getToken('token'),
          }, 
          url: INSTANCE_URL + '/api/v2/odinsro/_table/vending_items?filter=vending_id='+self.vendingid.id,
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

                self.nameid[index] = {id: data.resource[0].nameid, amount: data.resource[0].amount};
                // console.log(self.nameid);
                callNames(self.nameid);
                
              });
            });
          });
        });
        //finally we can get the names with this function
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
              url: INSTANCE_URL + '/api/v2/odinsro/_table/item_db_re?ids='+value.id,
              method:'GET'
            }).then(function (data) {
              data.resource[0].amount = value.amount;
              self.names[index] = data.resource[0];
              // console.log(self.names);

              self.update();
              itemsProcessed++;
              if (nameids.length == itemsProcessed) {
                window.dispatchEvent(widgetLoaded);
              }
            });
          });
        }
    });

    this.on('update', function(){
      
      this.autotrade = session.get('autotrade');
      this.vending = session.get('vending');
      this.cartinventory = session.get('cartinventory');
      this.zeny = getToken('zeny');
      this.cash = getToken('cash');
    });

    view.addUnmountListener('profile', function() {
      self.unmount(true);
    });
  </script>
</profile>

