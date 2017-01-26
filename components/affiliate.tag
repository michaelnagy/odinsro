<affiliate>
  <div class="card-content">
    <h4>Bring players and get rewards</h4>
    <h5>Rules</h5>
      <ul>
        <li>Only one account per person per computer is allowed</li>
        <li>Minimun of 5 players registered under your affiliation link</li>
      </ul>
    <h5>Rewards</h5>
    <ul class="collection">
      <li class="collection-item"> 3.000 Cash Point</li>
      <li class="collection-item"> <img src="http://imgs.ratemyserver.net/items/small/12531.gif" alt="" /> 2 White Potion Box | Item ID# 12531 (White_Potion_Box)</li>
      <li class="collection-item"> <img src="http://imgs.ratemyserver.net/items/small/13810.gif" alt="" /> 2 Blue Potion Box | Item ID# 13810 (Blue_Potion_Box)</li>
      <li class="collection-item"> Ticket VIP 30 days</li>
      <li class="collection-item"> 1 Box Costume</li>
      <li class="collection-item"> 3 random scrolls</li>
    </ul>
    <h5>How to get affiliates</h5>
    <p>
      Make your friends write down your username in the affiliate field when registering to get them as your affiliate.
    </p>
    <img src="" alt="" />
  </div>
  <div class="card-action">
    <h5>My affiliates</h5>
    <div class="chip">Jane Doe</div>
    <div class="chip">Jane Doe</div>
    <div class="chip">Jane Doe</div>
  </div>

<style>

</style>

<script>
this.session = getToken('token');
this.id = getToken('odinid');
this.hwid = getToken('hwid');
this.name = getToken('name');

var self = this;


this.on('mount', function() {
  // getting the last guildpin ID
  // $.ajax({
  //     dataType: 'json',
  //     contentType: 'application/json; charset=utf-8',
  //     url: INSTANCE_URL + '/api/v2/odinsro/_table/guildpin?limit=1&order=id%20desc',
  //     cache:false,
  //     method:'GET',
  //     headers: {
  //         "X-DreamFactory-API-Key": APP_API_KEY,
  //         "X-DreamFactory-Session-Token": getToken('token')
  //     },
  //     success:function (response) {
  //       self.lastpin = response.resource[0].id;
  //       console.log("PIN: ",self.lastpin+1);
  //       self.update();
  //     }
  //   });

    // get the account_id and hwid
      // $.ajax({
      //     dataType: 'json',
      //     contentType: 'application/json; charset=utf-8',
      //     url: INSTANCE_URL + '/api/v2/mysql/_table/sharer?id_field=account_id&ids='+this.id,
      //     cache:false,
      //     method:'GET',
      //     headers: {
      //         "X-DreamFactory-API-Key": APP_API_KEY,
      //         "X-DreamFactory-Session-Token": getToken('token')
      //     },
      //     success:function (response) {
      //       self.sharer = response.resource;
      //       console.log(self.sharer);
      //       self.update();
      //     },
      //     error: function (jqXHR) {
      //       // open modal only if it doesn't exist in the db
      //       self.sharerdb = true;
      //       // Check hwid
      //       $.ajax({
      //           dataType: 'json',
      //           contentType: 'application/json; charset=utf-8',
      //           url: INSTANCE_URL + '/api/v2/odinsro/_table/login?filter=hwid%20like%20'+self.hwid,
      //           cache:false,
      //           method:'GET',
      //           headers: {
      //               "X-DreamFactory-API-Key": APP_API_KEY,
      //               "X-DreamFactory-Session-Token": getToken('token')
      //           },
      //           success:function (response) {
      //             self.hwids = response.resource;
      //             console.log('antes do if: ',self.hwids[0],self.hwids);
      //             if (self.hwids.length > 1 || self.hwids[0].hwid == 0) {
      //               console.log('entrou if hwid: ', self.hwids);
      //               return;
      //             }
      //             else {
      //               $('#modal-sharer').openModal();
      //               console.log('N entrou if hwid: ', self.hwids);
      //             }
      //             self.update();
      //           }
      //         });
      //     }
      //   });

          //get affiliate link
          // $.ajax({
          //     dataType: 'json',
          //     contentType: 'application/json; charset=utf-8',
          //     url: INSTANCE_URL + '/api/v2/odinsro/_table/guildpin',
          //     cache:false,
          //     method:'POST',
          //     data: JSON.stringify({
          //       "resource": [{
          //           "amount": 2,
          //           "claimed": 0,
          //           "recipient": "0",
          //           "codtransacao": "0",
          //           "status": 0,
          //           "Tipo": "0",
          //           "valor": 0,
          //           "code": self.lastpin+1
          //         }]
          //     }),
          //     headers: {
          //         "X-DreamFactory-API-Key": APP_API_KEY,
          //         "X-DreamFactory-Session-Token": getToken('token')
          //     },
          //     success:function (response) {
          //       console.log(response);
          //
          //     },
          //     error:function (response) {
          //     }
          // });
        });
  </script>

</affiliate>
