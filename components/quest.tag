<quest>
  <h5>Instances</h5>
  <hr>
  <div if={chars} class="input-field col s12">
    <select id='charselect' onchange="{loadquest}">
      <option value="" disabled selected>First Choose your Char</option>
      <option each={chars} value="{char_id}">{name}</option>
    </select>
  </div>

  <table class="striped">
    <thead>
      <tr>
          <th data-field="id">Instance</th>
          <th data-field="name">Countdown</th>
      </tr>
    </thead>
    <tbody>
      <tr each={filtered_quests}>
        <td if={quest}> {quest}</td>
        <td if={time.seconds <= 0}>You can go to the instance now! <img class="right" style="margin-right: 5px;" src="{img}"></td>
        <td if={!time}>You can go to the instance now! <img class="right" style="margin-right: 5px;" src="{img}"></td>
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
    self.quests = [{id:3045, quest:"Sealed Shrine", img:"http://www.divine-pride.net/img/items/item/iRO/750"}, {id:12059, quest:"Orc's Memory", img:"http://static.divine-pride.net/images/items/item/2299.png"}, {id:3136, quest:"Nidhoggur's Nest", img:"http://static.divine-pride.net/images/items/item/2554.png"}, {id:7211, quest:"Hazy Forest", img:"/img/instance.png"}, {id:12254, quest:"Malangdo Culverts", img:"http://static.divine-pride.net/images/items/item/16750.png"}, {id:4197, quest:"Octopus", img:"/img/quest/6772.png"}, {id:9224, quest:"Bangungot Hospital", img:"/img/quest/6517.png"}, {id:4229, quest:"Buwaya Cave", img:"/img/quest/6518.png"}, {id:12278, quest:"Bakonawa Lake", img:"/img/quest/6516.png"} , {id:5112, quest:"Wolfchev's Laboratory", img:"/img/quest/6470.png"}, {id:12317, quest:"Old Glast Heim", img:"/img/quest/7566.png"}, {id:23182, quest:"Jitterbug", img:"/img/quest/2988.png"}, {id:13185, quest:"Charleston Crisis", img:"/img/quest/15110.png"}, {id:15050, quest:"Airship Assault", img:"/img/quest/5359.png"}, {id:15002, quest:"Sara's Memories", img:"/img/quest/28311.png"}, {id:13999, quest:"Faceworm Nest", img:"/img/quest/20717.png"}, {id:13994, quest:"Devil's Tower", img:"/img/quest/16027.png"}, {id:13997, quest:"Ghost Palace", img:"/img/quest/13093.png"}, {id:60201, quest:"Endless Tower", img:"/img/quest/7026.png"}, {id:18134, quest:"Isle of Bios", img:"/img/quest/15094.png"}, {id:13182, quest:"Geffen Magic Tournament", img:"/img/quest/15074.png"}];

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
    loadquest(e) {
      //get the select char value
      var select = document.getElementById("charselect");
      var charid = select.options[select.selectedIndex].value;
      // console.log('charid: ', charid, 'e: ', select);
      //make the ajax call
      $.ajax({
      dataType: 'json',
      contentType: 'application/json; charset=utf-8',
      cache:false,
      headers: {
        "X-DreamFactory-API-Key": APP_API_KEY,
        "X-DreamFactory-Session-Token": getToken('token'),
      },
      url: INSTANCE_URL + '/api/v2/odinsro/_table/quest?filter=char_id='+charid,
      method:'GET'
      }).then(function (data) {
        // console.log('query',data.resource);
        if (data.resource.length > 0) {
          // console.log('if');
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
          // console.log('filtered',self.filtered_quests);
        } else {
          self.filtered_quests = self.quests;
          // console.log(self.filtered_quests);
        }
        console.log(self.filtered_quests);
        // self.vendingid = data.resource[0];
        self.update();
      });
    }

    this.on('mount', function(){

      window.addEventListener("charLoaded", function () {
        self.chars = session.get('chars');
        // console.log('chars', self.chars);
        self.update();
      });
      $('.main-menu').addClass('container');

    });

    this.on('update', function(){
      //materialize initialize select form
      $('select').material_select();
    });
  </script>
</quest>
