<vote>
  <div class="container-fluid">
    <div class="row">
      <profile-sidebar></profile-sidebar>
      <div class="col s10">
        <div class="row">
          <div class="col s12">
            <div class="card-panel grey lighten-5 z-depth-1">
              <table class="striped vote centered">
                <thead>
                  <tr>
                      <th data-field="rank">Rank</th>
                      <th data-field="points">Points</th>
                      <th data-field="points">Interval</th>
                      <th data-field="vote">Vote</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>TOP RAGNAROK</td>
                    <td>2 pts</td>
                    <td>12h</td>
                    <td><a target="_blank" href="http://forum.odinsro.net/vote/voteA.php?user={name}" class="topr z-depth-1 hoverable"></a></td>
                  </tr>
                  <tr>
                    <td>TOP ORG</td>
                    <td>2 pts</td>
                    <td>12h</td>
                    <td><a target="_blank" href="http://forum.odinsro.net/vote/voteB.php?user={name}" class="toporg z-depth-1 hoverable"></a></td>
                  </tr>
                  <tr>
                    <td>TOP GAMES</td>
                    <td>2 pts</td>
                    <td>12h</td>
                    <td><a target="_blank" href="http://forum.odinsro.net/vote/voteC.php?user={name}"><img class="z-depth-1 hoverable" src=" http://www.topgamesites.net/images/14.jpg"/></a></td>
                  </tr>
                  <tr>
                    <td>TOP 100</td>
                    <td>2 pts</td>
                    <td>12h</td>
                    <td><a target="_blank" href="http://forum.odinsro.net/vote/voteD.php?user={name}"><img class="z-depth-1 hoverable" src="http://www.gtop100.com/images/votebutton.jpg"/></a></td>
                  </tr>
                  <tr>
                    <td>TOP 200</td>
                    <td>2 pts</td>
                    <td>12h</td>
                    <td><a target="_blank" href="http://forum.odinsro.net/vote/voteE.php?user={name}"><img class="z-depth-1 hoverable" src="http://www.topservers200.com/button/18033.png"/></a></td>
                  </tr>
                  <tr>
                    <td>TOP G</td>
                    <td>2 pts</td>
                    <td>12h</td>
                    <td><a target="_blank" href="http://forum.odinsro.net/vote/voteF.php?user={name}"><img class="z-depth-1 hoverable" src="http://topg.org/topg.gif"/></a></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>

  <style>
  .topr {
    background: url('http://www.live-ro.net/img/vote_br.png');
    background-size: cover;
    width: 90px;
    height: 50px;
    display: block;
    margin: 0 auto;
  }
  .toporg {
    background: url('http://www.topragnarok.org/images/selovotacaogold.jpg');
    background-size: cover;
    width: 90px;
    height: 50px;
    display: block;
    margin: 0 auto;
    background-size: 90px 35px;
    background-position: 0px 8px;
    background-color: #fff;
    background-repeat: no-repeat;
  }
  .vote td, .vote th {
    text-transform: uppercase;
    font-weight: bolder;
  }
  .vote th {
    font-size: 20px;
  }
  </style>
  <script>
    var self = this;

    //get session data
    this.session = getToken('token');
    this.odinid = getToken('odinid');
    this.email = getToken('email');
    this.name = getToken('name');
    // console.log(getToken('token'), APP_API_KEY);
    //cp_v4p_voters
    // this.register = new Date(getToken('created')).getTime()/1000;
    // console.log(this.register);
    //check if session is active
    if (!this.session) {
      riot.route('logout');
      return;
    }

    this.on('mount', function(){

    });

    view.addUnmountListener('vote', function() {
      self.unmount(true);
    });
  </script>
</vote>
