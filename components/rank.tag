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
          <div class="card-panel">

            <table class="striped">
            <h5>Rank PVP</h5>
              <thead>
                <tr>
                    <th data-field="id">User</th>
                    <th data-field="name">Kills</th>
                    <th data-field="price">Dies</th>
                </tr>
              </thead>

              <tbody>
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
    
  </style>

  <script>
    var self = this;
    self.pvp = {};

    //checks if the user is logged
    if (!this.session) {
      riot.route('/');
      return;
    }

    this.on('mount', function(){
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
