<reset>
  
  <div class="row">
    <profile-sidebar></profile-sidebar>
    <div class="col s10">
        <div class="card-panel grey lighten-5 z-depth-1 quest">
          <div class="animated fadeInUp">
            <h5>Char Reset Position</h5>
            <hr>
            <table class="striped">
              <thead>
                <tr>
                    <th data-field="id">Char</th>
                    <th data-field="name">Location</th>
                </tr>
              </thead>

              <tbody>
                <tr each={char}>
                  <td>{char}</td>
                  <td>Location!</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
    </div>
  </div>
  
  <style>
    .side-nav.fixed {
        top: inherit;
    }
  </style>

  <script>
   var self = this;

    this.session = getToken('token');
    this.email = getToken('email');
    this.odinid = getToken('odinid');

   //check if session is active
    if (!this.session) {
      riot.route('logout');
      return;
    }
    console.log('reset', self.char);
    
    this.on('mount', function(){
      //get char data only when it finishes loading
      window.addEventListener("charLoaded", function () {
       self.char = session.get('char');
       console.log('reset', self.char);
      });
      self.char = session.get('chars');
      console.log('reset', session.get('chars'));
    });

    view.addUnmountListener('reset', function() {
      self.unmount(true);
    });
  </script>

</reset>