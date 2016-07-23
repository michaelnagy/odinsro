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
	              <li class="collection-item"><span>Base & Job (floating): </span><span class="badge">200x ~ 500x</span></li>
	              <li class="collection-item"><span>Quest: </span><span class="badge">200x</a></li>
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
              <li class="collection-item">Mining, Hunting and Fishing (Get Prizes!)</li>
              <li class="collection-item">Devil Square Shop</li>
              <li class="collection-item">Heal + Buffs</li>
              <li class="collection-item">Warper (fields, dungeons, towns, guilds, instances, special areas)</li>
              <li class="collection-item">PVP room with 6 room!</li>
              <li class="collection-item">Card Remover</li>
              <li class="collection-item">Platinum Skills NPC</li>
              <li class="collection-item">Lucy Roulette</li>
              <li class="collection-item">Stylist</li>
              <li class="collection-item">QG!</li>
              <li class="collection-item">Job Expert</li>
              <li class="collection-item">+500 Quests</li>
            </ul>
		    	</div>

        </div>


        <div class="col s6">
	        <div class="card-panel">
	        	<h5 class="align-center">Custom Server Features</h5>
	          <ul class="collection">
	            <li class="collection-item">Max Party Share Limit: 10 Base Levels</li>
	            <li class="collection-item">Any headgear can be made into a Costume headgear.</li>
	            <li class="collection-item">All Oficial Enchants functional</li>
	            <li class="collection-item">WoE, PvP and Battlegrounds</li>
	            <li class="collection-item">First Login Pack</li>
	            <li class="collection-item">3rd class Pack(after lvl 100)</li>
	            <li class="collection-item">Official Premium Palettes</li>
	            <li class="collection-item">Paramk Map</li>
	            <li class="collection-item">Automated Events</li>
	            <li class="collection-item">Eden - Quest up to 175</li>
	            <li class="collection-item">Commands: commands,autoloot,alootid,autoloottype,autotrade,showexp,showzeny,whereis,exp,mobinfo,iteminfo,whodrops,time,noask,noks,go,guild,help,rates,duel,accept,invite,leave,whosells,homtalk,pettalk,channel,changegm,storage,storeall,<b>mobalive,manager,database</b></li>
	          </ul>
	        </div>
        </div>

        <div class="col s6">
        	<div class="card-panel">
        	<h5 class="align-center">Oficial Features</h5>
          	<ul class="collection">
              <li class="collection-item">Episode 15.1 - In production</li>
              <li class="collection-item">Third Classes: Fully Available</li>
              <li class="collection-item">Doram/Rebellion/Kagerou/Oboro: Fully Available</li>
              <li class="collection-item">Quests Eclage, El Dicastes, Malangdo & Mora 100%</li>
              <li class="collection-item">Instances:
Nightmarish Jitterbug, Morse Cave, Bios Island, Geffen Magic Tournament, <b>Horror Toy Factory</b>, Ghost Palace, Faceworm's Nest, Old Glast Heim, Endless Tower, Bakonawa Lake, Hazy Forest, Sara's Memory, <b>Sarah & Fenrir</b>, <b>Airship Assault</b>, End of Morroc, <b>Infinity Space</b> and more!</li>
              <li class="collection-item">Nightmare Clock Tower, Nightmare Glast Heim, Nightmare Pyramids</li>

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
