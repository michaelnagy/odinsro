<sharer>

  <!-- Modal Structure -->
  <div id="modal-sharer" class="modal">
    <div class="modal-content center-align">
      <div class="share-step1">
        <h4>Share our video and get a Reward</h4>
        <iframe width="100%" height="270" src="https://www.youtube.com/embed/8guCjgK0-sM" frameborder="0" allowfullscreen></iframe>
        <p>After sharing follow the instructions and get your reward.</p>
        <a onclick="shareFB()" class="waves-effect waves-light btn share-btn"><i class="material-icons left">share</i>share</a>
      </div>
      <div class="share-step2" style="display:none">
        <h4>Share our video and get a Reward</h4>
        <h5>Thanks for sharing the video.</h5>

        <p>
          To redeem the reward, go ingame, use the command <b>@share</b> and insert the PIN: <b>{lastpin+1}</b>
        </p>
      </div>
    </div>
  </div>

  <style>

  </style>

  <script>
this.session = getToken('token');
this.id = getToken('odinid');
this.hwid = getToken('hwid');

var self = this;


this.on('mount', function() {
  // getting the last guildpin ID
  $.ajax({
      dataType: 'json',
      contentType: 'application/json; charset=utf-8',
      url: INSTANCE_URL + '/api/v2/odinsro/_table/guildpin?limit=1&order=id%20desc',
      cache:false,
      method:'GET',
      headers: {
          "X-DreamFactory-API-Key": APP_API_KEY,
          "X-DreamFactory-Session-Token": getToken('token')
      },
      success:function (response) {
        self.lastpin = response.resource[0].id;
        console.log("PIN: ",self.lastpin+1);
        self.update();
      }
    });

    // get the account_id and hwid
      $.ajax({
          dataType: 'json',
          contentType: 'application/json; charset=utf-8',
          url: INSTANCE_URL + '/api/v2/mysql/_table/sharer?id_field=account_id&ids='+this.id,
          cache:false,
          method:'GET',
          headers: {
              "X-DreamFactory-API-Key": APP_API_KEY,
              "X-DreamFactory-Session-Token": getToken('token')
          },
          success:function (response) {
            self.sharer = response.resource;
            console.log(self.sharer);
            self.update();
          },
          error: function (jqXHR) {
            // open modal only if it doesn't exist in the db
            self.sharerdb = true;
            // Check hwid
            $.ajax({
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                url: INSTANCE_URL + '/api/v2/odinsro/_table/login?filter=hwid%20like%20'+self.hwid,
                cache:false,
                method:'GET',
                headers: {
                    "X-DreamFactory-API-Key": APP_API_KEY,
                    "X-DreamFactory-Session-Token": getToken('token')
                },
                success:function (response) {
                  self.hwids = response.resource;
                  console.log('antes do if: ',self.hwids[0],self.hwids);
                  if (self.hwids.length > 1 || self.hwids[0].hwid == 0) {
                    console.log('entrou if hwid: ', self.hwids);
                    return;
                  }
                  else {
                    $('#modal-sharer').openModal();
                    console.log('N entrou if hwid: ', self.hwids);
                  }
                  self.update();
                }
              });
          }
        });

  // trigger share dialog
  $('.share-btn').click(function () {
    FB.ui(
      {
        method: 'share',
        href: 'https://www.youtube.com/watch?v=8guCjgK0-sM',
      },
      function(response) {
        if (response && !response.error_code) {
          // console.log("Compartilhou");
          // post and get PIN
          $.ajax({
              dataType: 'json',
              contentType: 'application/json; charset=utf-8',
              url: INSTANCE_URL + '/api/v2/odinsro/_table/guildpin',
              cache:false,
              method:'POST',
              data: JSON.stringify({
                "resource": [{
                    "amount": 2,
                    "claimed": 0,
                    "recipient": "0",
                    "codtransacao": "0",
                    "status": 0,
                    "Tipo": "0",
                    "valor": 0,
                    "code": self.lastpin+1
                  }]
              }),
              headers: {
                  "X-DreamFactory-API-Key": APP_API_KEY,
                  "X-DreamFactory-Session-Token": getToken('token')
              },
              success:function (response) {
                console.log(response);

              },
              error:function (response) {
              }
          });

          // Table sharer
          $.ajax({
              dataType: 'json',
              contentType: 'application/json; charset=utf-8',
              url: INSTANCE_URL + '/api/v2/mysql/_table/sharer',
              cache:false,
              method:'POST',
              data: JSON.stringify({
                "resource": [{
                  "account_id": self.id,
                  "shared": 1
                }]
              }),
              headers: {
                  "X-DreamFactory-API-Key": APP_API_KEY,
                  "X-DreamFactory-Session-Token": getToken('token')
              },
              success:function (response) {
                // console.log("Shared: ",response);

              },
              error:function (response) {
                // console.log("Shared: error ",response);
              }
          });

          $('.share-step1').hide();
          $('.share-step2').fadeIn();
        } else {
          alert('You really need to share to get the reward.');
        }
      }
    );
  });

});
  </script>

</sharer>
