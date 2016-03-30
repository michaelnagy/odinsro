<rank>
  <div class="row">
      <div class="col s2 navigation">
        <ul class="side-nav fixed" id="mobile-demo">
        <li><a href="#profile">Profile</a></li>
          <li><a href="#rank">Rank</a></li>
          <li><a href="http://forum.odinsro.net/t/suport" target="_blank">Support</a></li>
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

    //checks if the user is logged
    if (!this.session) {
      riot.route('/');
      return;
    }

    this.on('mount', function(){

      $('ul.tabs').tabs();

      $.api.getRecords('pvpm_data?fields=kills,dies,name&limit=5&order=kills%20DESC', this.session);
      self.pvp = storage.get('pvp');
      console.log(storage.get('pvp'));
      self.update();
    });

    view.addUnmountListener('rank', function() {
      self.unmount(true);
    });
  </script>
</rank>
