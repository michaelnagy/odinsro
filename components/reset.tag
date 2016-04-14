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
                  <td>{name}</td>
                  <td>{last_map} <a onclick={charreset} data-char-id={char_id} class=" char-id waves-effect waves-light btn right"><i class="material-icons left">redo</i>reset</a></td>
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

    charreset(e) {
      console.log(e.currentTarget.getAttribute('data-char-id'));
      // e.currentTarget.getAttribute('data-char-id')
      $.ajax({
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        url: INSTANCE_URL + '/api/v2/odinsro/_table/char?fields=last_map,char_id&id_field=char_id&ids='+e.currentTarget.getAttribute('data-char-id'),
        data: JSON.stringify({                    
            "resource": [{"last_map": ""}]
        }),
        headers: {
            "X-DreamFactory-API-Key": APP_API_KEY,
            "X-DreamFactory-Session-Token": getToken('token')
        },
        cache:false,
        method:'PATCH',
        success:function (response) {
            Materialize.toast('<i class="material-icons left green-text">done</i><span>Done</span>', 8000);
          }
        ,
        error:function (response) {
            if (response.responseJSON.error.message == 'Token has expired') {
            Materialize.toast('<span>Session expired. Please log in again</span>', 8000);
            riot.route('logout');
            }
            Materialize.toast("<span class>We couldn't reset your position.<br>Please try again!</span>", 6000, 'toast-red');
          }

        });
    }

   
    this.on('mount', function(){
      //get char data only when it finishes loading
      window.addEventListener("charLoaded", function () {
       self.char = session.get('char');
      });
      self.char = session.get('chars');
      self.update();
      console.log('reset', session.get('chars'));
      //gets the char_id to pass to the POST request
      $()
    });

    view.addUnmountListener('reset', function() {
      self.unmount(true);
    });
  </script>

</reset>