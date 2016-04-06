<rank>
  <div class="row">
      <div class="col s2 navigation">

        <ul class="side-nav green lighten-5 fixed" id="mobile-demo">
        <li><a href="#profile"><i class="material-icons menu-icons">face</i> Profile</a></li>
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
          <div class="col s12">
              <ul class="tabs">
                <li class="tab"><a class="active" href="#pvp">PVP</a></li>
                <li class="tab"><a href="#woe">WOE</a></li>
                <li class="tab"><a href="#hunter">HUNTER</a></li>
              </ul>
          </div>

          <div id="pvp" class="col s12">
            <div class="card-panel">
              <table class="striped">
              <h5 class="animated fadeIn">Rank PVP <img class="animated pulse woe-img"</h5>
                <thead>
                  <tr>
                      <th data-field="id">User</th>
                      <th data-field="name">Kills</th>
                      <th data-field="price">Dies</th>
                  </tr>
                </thead>

                <tbody class="animated fadeInUp">
                  <tr each={pvp}>
                    <td>{name}</td>
                    <td>{kills}</td>
                    <td>{dies}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          
          <div id="woe" class="col s12">

            <div class="card-panel">

              <table class="striped">
              <h5 class="animated fadeIn">Rank WOE <img class="animated pulse woe-img" src="/img/woe.png"></h5>
                <thead>
                  <tr>
                      <th data-field="id">Guild Name</th>
                      <th data-field="name">Castles Owned</th>
                      <th data-field="price">Guild Emblem</th>
                      <th data-field="price">Guild Master</th>
                  </tr>
                </thead>

                <tbody class="animated fadeInUp">
                  <tr each={woerank}>
                    <td>{name}</td>
                    <td>{rank}</td>
                    <td ><img if={emblem} src="http://rathena.code-lab.co/?module=guild&action=emblem&login=FluxRO&charmap=FluxRO&id={id}"></td>
                    <td>{master}</td>
                  </tr>
                </tbody>
              </table>
            </div>
            
          </div>
          <div id="hunter" class="col s12">

          <div class="card-panel">

              <table class="striped">
              <h5 class="animated fadeIn">Rank HUNTER</h5>
                <thead>
                  <tr>
                      <th data-field="id">User</th>
                      <th data-field="name">Kills</th>
                      <th data-field="price">Dies</th>
                  </tr>
                </thead>

                <tbody class="animated fadeInUp">
                  <tr>
                    <td>Coming Soon</td>
                  </tr>
                </tbody>
              </table>
            </div>
            
          </div>
      </div><!-- CONTAINER END -->     
    </div>   
  </div>

  <style>
  .woe-img {
    animation-duration: 3.5s;
    animation-delay: 0s;
    animation-iteration-count: infinite;
    width: 30px;
    margin-bottom: -5px;
    padding-left: 10px;
  }

  @keyframes pulse {
  from {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }

  50% {
    -webkit-transform: scale3d(1.20, 1.20, 1.20);
    transform: scale3d(1.20, 1.20, 1.20);
  }

  to {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }
}

  rank .side-nav { 
    top:inherit;
  }
  .tabs {
    overflow: hidden;
  }
  .tabs .indicator {
    height: 4px;
    background-color: #FF9438;
  }
  
  .tabs .tab a { 
    color: black;
  }
  .tabs .tab a.active { 
    background-color: #e4e4e4;
  }
  .tabs .tab a:hover {
    color: #2196F3;
  }

  tbody {
  animation-duration: 0.6s !important;
}

  </style>

  <script>
    var self = this;
    //get the session
    this.session = getToken('token');
    self.pvp = {};
    self.woerank = [];
    self.woeranki = [];
    var j = 0;

    //checks if the user is logged
    if (!this.session) {
      riot.route('/');
      return;
    }

    this.on('mount', function(){
      //initialize side submenus
      $('.collapsible').collapsible({
        accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
      });

      $('ul.tabs').tabs();
      //get PVP data
      $.api.getRecords('pvpm_data?fields=kills,dies,name&limit=5&order=kills%20DESC', this.session);
      self.pvp = storage.get('pvp');
      // console.log(storage.get('pvp'));
      //get WOE data
      $.api.getRecords('guild_castle?fields=castle_id,guild_id', this.session);
      self.woe = storage.get('woe');

            
            var filtered = [];
            for (var i = 0; i < self.woe.length; i++){
               
              filtered = self.woe.filter(function (woe) {
                if (self.woe[i].guild_id == woe.guild_id) {
                  // console.log(self.woe[i].guild_id);

                  return true
                }
               });
              // console.log(filtered.length);
              self.woerank[self.woe[i].guild_id] = {id: self.woe[i].guild_id,rank:filtered.length, name: ''};
              console.log(self.woerank);  
            }


            //reindex the array
              self.woerank.map(function(num, indice) {

                $.ajax({
                url: INSTANCE_URL +"/api/v2/odinsro/_table/guild?fields=name,guild_id,char_id,master,emblem_data&id_field=guild_id&ids="+num.id,
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                cache:false,
                method:'GET',
                headers: {
                    "X-DreamFactory-API-Key": APP_API_KEY,
                    "X-DreamFactory-Session-Token": self.session
                },
                success:function (response) {
                  
                  // self.woerank[indice].name = response.resource[0].name;
                  // console.log(self.woerank[indice]);
                  num.name = response.resource[0].name;
                  num.master = response.resource[0].master;
                  num.emblem = response.resource[0].emblem_data;
                  // console.log(response);
                  self.update();
                }
                });
                
              });
              self.woerank = self.woerank.sort(function(a, b) {
                if (a.rank > b.rank)
                  return -1;
                else if (a.rank < b.rank)
                  return 1;
                else 
                  return 0;
              });
              console.log(self.woerank);
              
    });
    this.on('update', function(){
      // self.woerank = self.woerank.sort(function(a, b) {
      //   if (a.rank > b.rank)
      //     return -1;
      //   else if (a.rank < b.rank)
      //     return 1;
      //   else 
      //     return 0;
      // });
      // console.log(self.woerank);
    });

    view.addUnmountListener('rank', function() {
      self.unmount(true);
    });
  </script>
</rank>
