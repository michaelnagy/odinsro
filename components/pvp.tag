<pvp>

  <div class="pvp-widget grey lighten-5 z-depth-1 align-center">
    <b>PVP RANK<br></b>
    <img src="/img/trophy.png" alt="" /><br>
    <div class="woe-schedule">
      <table class="centered">
        <thead>
          <tr>
            <th data-field=""></th>
            <th data-field="char">Char</th>
            <th data-field="id">Kills</th>
            <th data-field="name">Death</th>
            <th data-field="price">Streak</th>
          </tr>
        </thead>
        <tbody>
          <tr each={pvp}>
            <td>
              <img src="img/{medal}" alt="" />
            </td>
            <td>{name}</td>
            <td>{kills}</td>
            <td>{deaths}</td>
            <td>{streaks}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>

<style>
</style>

<script>
var self = this;
this.session = getToken('token');

$.ajax({
    dataType: 'json',
    contentType: 'application/json; charset=utf-8',
    url: INSTANCE_URL + '/api/v2/odinsro/_table/pvpladder?filter=(char_id%20!%3D%20600)%20and%20(char_id%20!%3D%201377)&limit=3&order=kills%20DESC',
    cache:false,
    method:'GET',
    headers: {
        "X-DreamFactory-API-Key": APP_API_KEY
    },
    success:function (response) {
      self.pvp = response.resource;
      self.pvp[0].medal = 'gold.png';
      self.pvp[1].medal = 'silver.png';
      self.pvp[2].medal = 'bronze.png';
      console.log(self.pvp);
      self.update();
    }
  });
</script>

</pvp>
