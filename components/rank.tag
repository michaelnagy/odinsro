<rank>
  <div class="row">
      <div class="col s2 navigation">
        <ul class="side-nav fixed" id="mobile-demo">
        <li><a href="#profile">Profile</a></li>
          <li><a href="#rank">Rank</a></li>
          <li><a href="http://forum.odinsro.net/t/suport" target="_blank">Support</a></li>
          <li><a href="#rank">Tools</a></li>
          <li><a href="#rank">Shop</a></li>
        </ul>
      </div>
      <div class="col s10 animated fadeInUp content">
        <div class="row">
          <div class="col s12">
              <ul class="tabs">
                <li class="tab"><a class="active" href="#pvp">PVP</a></li>
                <li class="tab"><a href="#woe">WOE</a></li>
                <li class="tab"><a href="#mvp">MVP</a></li>
                <li class="tab"><a href="#hunter">HUNTER</a></li>
              </ul>
          </div>

          <div id="pvp" class="col s12">
            <div class="card-panel">
              <table class="striped">
              <h5 class="animated fadeIn">Rank PVP</h5>
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
              <h5 class="animated fadeIn">Rank WOE</h5>
                <thead>
                  <tr>
                      <th data-field="id">Guild Name</th>
                      <th data-field="name">Castles</th>
                      <th data-field="price">Guild Emblem</th>
                      <th data-field="price">Guild Master</th>
                  </tr>
                </thead>

                <tbody class="animated fadeInUp">
                  <tr each={woerank}>
                    <td>{name}</td>
                    <td>{rank}</td>
                    <td ><img if={emblem} src="data:image/png;base64,{emblem}"></td>
                    <td>{master}</td>
                  </tr>
                </tbody>
              </table>
            </div>
            
          </div>
          <div id="mvp" class="col s12">

          <div class="card-panel">

              <table class="striped">
              <h5 class="animated fadeIn">Rank MVP</h5>
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
                  <tr each={pvp}>
                    <td>{name}</td>
                    <td>{kills}</td>
                    <td>{dies}</td>
                  </tr>
                </tbody>
              </table>
            </div>
            
          </div>
      </div><!-- CONTAINER END -->     
    </div>   
  </div>

  <style>

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

    function str2ab(str) {
      var buf = new ArrayBuffer(str.length*2); // 2 bytes for each char
      var bufView = new Uint8Array(buf);
      for (var i=0, strLen=str.length; i < strLen; i++) {
        bufView[i] = str.charCodeAt(i);
      }
      return buf;
    }

    //checks if the user is logged
    if (!this.session) {
      riot.route('/');
      return;
    }

    this.on('mount', function(){

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
            }


            //reindex the array
              self.woerank.map(function(num, indice) {

                //get emblem data bin
                $.ajax({
                url: INSTANCE_URL +"/api/v2/odinsro/_table/guild?fields=guild_id,emblem_data&id_field=guild_id&ids="+num.id,
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                cache:false,
                method:'GET',
                headers: {
                    "X-DreamFactory-API-Key": APP_API_KEY,
                    "X-DreamFactory-Session-Token": self.session
                },
                success:function (response) {

                    var uint8array = new TextEncoder('utf-8').encode(response.resource[0].emblem_data);
                    var gunzip = new Zlib.Gunzip(uint8array);
                    var plain = gunzip.decompress();
                    // num.emblem = window.btoa(plain);
                    console.log(plain);
                  
                  
                  // var gunzip = new Zlib.Gunzip(response.resource[0].emblem_data);
                  // var plain = gunzip.decompress();
                  // num.emblem = window.btoa(plain);
                  // num.emblem = response.resource[0].emblem_data;
                 
                  self.update();
                }
                });

                $.ajax({
                url: INSTANCE_URL +"/api/v2/odinsro/_table/guild?fields=name,guild_id,char_id,master&id_field=guild_id&ids="+num.id,
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
