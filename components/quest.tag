<quest>
  <h5>Instances <img class="right img-instance" src="/img/instance.png"></h5>
  <hr>
  <table class="striped">
    <thead>
      <tr>
          <th data-field="id">Instance</th>
          <th data-field="name">Time Left</th>
      </tr>
    </thead>

    <tbody>
      <tr each={filtered_quests}>
        <td> {quest}</td>
        <td if={time.seconds <= 0}>You can go to the quest now! <img class="right" style="margin-right: 5px;" src="{img}"></td>
        <td if={!time}>You can go to this quest now! <img class="right" style="margin-right: 5px;" src="{img}"></td>
        <td if={time.seconds > 0}>days: {time.days} hours: {time.hours} minutes: {time.minutes} left <img class="right" style="margin-right: 5px;" src="{img}"></td>
      </tr>
    </tbody>
  </table>

  <style>
  .img-instance {
    position: relative;
    width: 50px;
    bottom: 20px;
    right: 30px;
  }
    
  </style>

  <script>
    var self = this;
    self.quests = [{id:3045, quest:"Sealed Shrine", img:"http://www.divine-pride.net/img/items/item/iRO/750"}, {id:12059, quest:"Orc's Memory", img:"http://static.divine-pride.net/images/items/item/2299.png"}, {id:3136, quest:"Nidhoggur's Nest", img:"http://static.divine-pride.net/images/items/item/2554.png"}, {id:7211, quest:"Hazy Forest"}, {id:12254, quest:"Malangdo Culverts", img:"http://static.divine-pride.net/images/items/item/16750.png"}, {id:4197, quest:"Octopus"}, {id:9224, quest:"Bangungot Hospital"}, {id:4229, quest:"Buwaya Cave"}, {id:12278, quest:"Bakonawa Lake"} , {id:5112, quest:"Wolfchev's Laboratory"}, {id:12317, quest:"Old Glast Heim"}, {id:23182, quest:"Jitterbug"}, {id:13185, quest:"Charleston Crisis"}, {id:15050, quest:"Airship Assault"}, {id:15002, quest:"Endless Tower"}, {id:13999, quest:"Faceworm Nest"}, {id:13994, quest:"Devil's Tower"}, {id:13997, quest:"Ghost Palace"}, {id:60201, quest:"Bangungot Hospital"}, {id:18134, quest:"Isle of Bios"}, {id:13182, quest:"Geffen Magic Tournament"}];

    // console.log('chars quest', self.chars);

    function getTimeRemaining(endtime){
      var t = Date.parse(endtime) - Date.parse(new Date());
      var seconds = Math.floor( (t/1000) % 60 );
      var minutes = Math.floor( (t/1000/60) % 60 );
      var hours = Math.floor( (t/(1000*60*60)) % 24 );
      var days = Math.floor( t/(1000*60*60*24) );
      return {
        'total': t,
        'days': days,
        'hours': hours,
        'minutes': minutes,
        'seconds': seconds
      };
    }

    this.on('mount', function(){

      window.addEventListener("charLoaded", function () {

      self.chars = session.get('chars');
      self.filtered_quests = [];
      console.log('chars',session.get('chars'));

      self.chars.forEach(function (value,index,ar) {
        
        $.ajax({
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        cache:false,
        headers: {
          "X-DreamFactory-API-Key": APP_API_KEY,
          "X-DreamFactory-Session-Token": getToken('token'),
        },
        url: INSTANCE_URL + '/api/v2/odinsro/_table/quest?filter=char_id='+value.char_id,
        method:'GET'
        }).then(function (data) {
          console.log('query',data.resource.length);

          if (data.resource.length > 0) {
            data.resource.forEach(function (value,index,ar) {
              // value.quest_id
              self.filtered_quests = self.quests.filter(function (obj) {
                if (obj.id == value.quest_id) {
                  obj.time = new Date(value.time * 1000);
                  obj.time = getTimeRemaining(obj.time);
                  // console.log(obj.time);
                }
                return obj
              });
            });
            
            console.log('filtered',self.filtered_quests);
          } else {
            self.filtered_quests = self.quests;
          }
          // console.log(index, data, data.resource.length);
          // self.vendingid = data.resource[0];
        });

      });


        
      });

      

      $('.main-menu').addClass('container');
    });

    view.addUnmountListener('server-info', function() {
      self.unmount(true);
    });
  </script>
</quest>