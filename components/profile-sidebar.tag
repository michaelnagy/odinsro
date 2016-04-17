<profile-sidebar>
  <div class="col s2 navigation">
      <ul class="side-nav green lighten-5 fixed" id="mobile-demo">
      <li><a class="side-profile" href="#profile"><i class="material-icons menu-icons">face</i> Profile</a></li>
      <li><a class="side-profile" href="#reset"><i class="material-icons menu-icons">build</i> Char Reset</a></li>
      <li><a class="side-profile" onclick="passChange()"><i class="material-icons menu-icons">vpn_key</i> Password change</a></li>
          <li class="no-padding">
            <ul class="collapsible collapsible-accordion">
              <li>
                <a class="collapsible-header waves-effect waves-light"><i class="material-icons">settings</i> System<i class="mdi-navigation-arrow-drop-down right"></i></a>
                <div class="collapsible-body">
                  <ul>
                    <li><a href="#!">Vote Point</a></li>
                    <li><a href="#rank">Rank</a></li>
                  </ul>
                </div>
              </li>
            </ul>
          </li>
          <li class="no-padding">
            <ul class="collapsible collapsible-accordion">
              <li>
                <a class="collapsible-header waves-effect waves-light"><i class="material-icons">bubble_chart</i> Community<i class="mdi-navigation-arrow-drop-down right"></i></a>
                <div class="collapsible-body">
                  <ul>
                    <li><a href="https://www.facebook.com/oficialodinsro/" target="_blank">Facebook</a></li>
                    <li><a href="#!">Youtube</a></li>
                    <li><a href="http://forum.odinsro.net/t/suport" target="_blank">Discussions</a></li>
                  </ul>
                </div>
              </li>
            </ul>
          </li>
          <li class="no-padding">
            <ul class="collapsible collapsible-accordion">
              <li>
                <a class="collapsible-header waves-effect waves-light"><i class="material-icons menu-icons">shopping_cart</i> Shop<i class="mdi-navigation-arrow-drop-down right"></i></a>
                <div class="collapsible-body">
                  <ul>
                    <li><a href="" target="_blank">Cash</a></li>
                    <li><a href="#!">VIP</a></li>
                  </ul>
                </div>
              </li>
            </ul>
          </li>
        </ul>
    </div>

  <style>
  a {
    cursor: pointer;
  }  
  </style>

  <script>
  this.on('mount', function() {
    // activates accordion menu behavior
      $('.collapsible').collapsible({
          accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
        }); 
  });

  </script>
</profile-sidebar>