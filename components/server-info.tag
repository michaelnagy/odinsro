<server-info>
  <div class="container animated fadeIn">
      <div class="row">
        <div class="col s6">
        	<div class="card-panel">
	          <h5 class="align-center">Basic Information</h5>
	            <ul class="collection">
	              <li class="collection-item"><span>Max Level: </span><span class="badge">175/60</span></li>
	              <li class="collection-item"><span>Max ASPD: </span><span class="badge">193</span></li>
	              <li class="collection-item"><span>Max Stats: </span><span class="badge">130 (3rd job)</span></li>
	              <li class="collection-item"><span>Base & Job: </span><span class="badge">50x</span></li>
	              <li class="collection-item"><span>Quest: </span><span class="badge">50x</a></li>
	              <li class="collection-item"><span>MVP Card: </span><span class="badge">1%</span></li>
	              <li class="collection-item"><span>MVP Drop: </span><span class="badge">20%</span></li>
	              <li class="collection-item"><span>Normal Card: </span><span class="badge">2%</span></li>
	              <li class="collection-item"><span>Normal Drop: </span><span class="badge">40%</span></li>
	            </ul>
	        </div>
        </div>
        <div class="col s6 right">
        	<div class="card-panel">
		    		<h5 class="align-center">NPCs</h5>
          	<ul class="collection">
              <li class="collection-item">Job Changer</li>
              <li class="collection-item">Login Settings (@autoloot, #main, etc.)</li>
              <li class="collection-item">Universal Tool Dealer</li>
              <li class="collection-item">Healer</li>
              <li class="collection-item">Stat Build Manager</li>
              <li class="collection-item">Dungeon Warper</li>
              <li class="collection-item">Stat and Skill Resetter</li>
              <li class="collection-item">Card Remover</li>
              <li class="collection-item">Platinum Skills NPC</li>
              <li class="collection-item">Feel Reset NPC</li>
              <li class="collection-item">Stylist</li>
              <li class="collection-item">Dead Branch Room</li>
              <li class="collection-item">Dailies System</li>
              <li class="collection-item">Telma (BG Only Consumables)</li>
              <li class="collection-item">Reno (Eden Crystals)</li>
              <li class="collection-item">Lottery</li>
            </ul>
		    	</div>
          
        </div>

        
        <div class="col s6">
	        <div class="card-panel">
	        	<h5 class="align-center">Custom Server Features</h5>
	          <ul class="collection">
	            <li class="collection-item">Max Party Share Limit: 30 Base Levels</li>
	            <li class="collection-item">Costume NPC: Any headgear can be made into a Costume headgear.</li>
	            <li class="collection-item">Customized Tool Dealer: Includes Grape Juice</li>
	            <li class="collection-item">WoE, PvP and Battlegrounds</li>
	            <li class="collection-item">Daily Log In Rewards</li>
	            <li class="collection-item">Vote For Points</li>
	            <li class="collection-item">Official Premium Palettes</li>
	            <li class="collection-item">Custom Vending Map</li>
	            <li class="collection-item">Automated Events</li>
	            <li class="collection-item">Overlook Water Dungeon</li>
	            <li class="collection-item">Quest Boards up to 175</li>
	            <li class="collection-item">Renewal Drop table removed</li>
	            <li class="collection-item">Commands: whosells, joinbg, listenbg, rates, refresh, autotrade, me, iteminfo, help, homtalk, noask, pettalk, reject, autoloottype, go, alootid, who, noks, time, channel, showexp, changegm, showdelay, accept, whereis, whodrops, leave, showzeny, hominfo, invite, commands, jailtime, request, autoloot, homstats, duel, mobinfo, rms, irowiki, search</li>
	          </ul>
	        </div>
        </div>

        <div class="col s6">
        	<div class="card-panel">
        	<h5 class="align-center">Official Server Features</h5>
          	<ul class="collection">
              <li class="collection-item">Episode 14.3</li>
              <li class="collection-item">Third Classes: Fully Available</li>
              <li class="collection-item">Rebellion/Kagerou/Oboro: Fully Available</li>
              <li class="collection-item">Functional Eclage, El Dicastes, Malangdo & Mora Quests</li>
              <li class="collection-item">Instance Dungeons Available: 
Nightmarish Jitterbug, Morse Cave, Bios Island, Geffen Magic Tournament, Nightmare Toy Factory, Ghost Palace, Faceworm's Nest, Old Glast Heim, Endless Tower, Bakonawa Lake, Hazy Forest, Sara's Memory and more!</li>
              <li class="collection-item">Nightmare Clock Tower, Nightmare Glast Heim, Nightmare Pyramids</li>
              <li class="collection-item">Champion Mob System</li>
            </ul>
        	</div>
        </div> 
  </div><!-- CONTAINER END -->

  <style>
    
  </style>

  <script>
    var self = this;

    this.on('mount', function(){
      $('.main-menu').addClass('container');
    });

    view.addUnmountListener('server-info', function() {
      self.unmount(true);
    });
  </script>
</server-info>
