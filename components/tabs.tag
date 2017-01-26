<tabs>

  <div class="pvp-widget grey lighten-5 z-depth-1 align-center" style="top:200px">
    <b>WOE RANK<br></b>
    <img src="/img/emperium.png" style="width:35px" /><br>
    <div class="woe-schedule">
      <table class="centered">
        <thead>
          <tr>
            <th data-field="id">Castle</th>
            <th data-field="char">Guild</th>
          </tr>
        </thead>
        <tbody>
          <tr each={castle}>
            <td><b>{name}</b></td>
            <td>{guild_by_guild_id.name} <img style="float:right; margin-left:10px;" src="http://forum.odinsro.net/emblem/index.php?id={guild_id}" alt="" /></td>
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
    url: INSTANCE_URL + '/api/v2/odinsro/_table/guild_castle?related=guild_by_guild_id&id_field=castle_id&ids=8,16,29',
    cache:false,
    method:'GET',
    headers: {
        "X-DreamFactory-API-Key": APP_API_KEY
    },
    success:function (response) {
      self.castle = response.resource;
      console.log(self.castle);
      self.castle.forEach(function (element, index, array) {
        if (element.castle_id == 8) {
          self.castle[index].name = 'Bergel'
        }
        if (element.castle_id == 16) {
          self.castle[index].name = 'Swanhild'
        }
        if (element.castle_id == 29) {
          self.castle[index].name = 'Mardol'
        }
      });
      self.update();
    }
  });
</script>

</tabs>
