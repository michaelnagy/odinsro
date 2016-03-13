<home>
  <div class="container animated fadeInUp">
      <div class="row section1">
        <div class="col s12 m4 z-depth-1 white-card">

        </div>

        <div class="col s12 ">
          <div class="slider">
            <ul class="slides z-depth-1">
              <li>
                <img src="http://lorempixel.com/580/250/nature/1"> <!-- random image -->
                <div class="caption center-align">
                  <h3>This is our big Tagline!</h3>
                  <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                </div>
              </li>
              <li>
                <img src="http://lorempixel.com/580/250/nature/2"> <!-- random image -->
                <div class="caption left-align">
                  <h3>Left Aligned Caption</h3>
                  <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                </div>
              </li>
              <li>
                <img src="http://lorempixel.com/580/250/nature/3"> <!-- random image -->
                <div class="caption right-align">
                  <h3>Right Aligned Caption</h3>
                  <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                </div>
              </li>
              <li>
                <img src="http://lorempixel.com/580/250/nature/4"> <!-- random image -->
                <div class="caption center-align">
                  <h3>This is our big Tagline!</h3>
                  <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                </div>
              </li>
            </ul>
          </div>
        </div>

      </div> <!-- ROW SECTION END -->

      <div class="row section-featured">
        <div class="col s6 news">

          <div class="card">
            <!-- <div class="card-image waves-effect waves-block waves-light">
              <img class="activator" src="images/office.jpg">
            </div> -->
            <div class="card-content black-text">

              <span class="card-title grey-text text-darken-4">Server Features</span>
               <ul class="collection">
                <li class="collection-item"><span>Episode 14.3</span> <i class="material-icons green-text right">done</i></li>
                <li class="collection-item"><span>New Doram Race updates!</span> <i class="material-icons green-text right">done</i></li>
                <li class="collection-item"><span>New BG System!</span> <i class="material-icons green-text right">done</i></li>
                <li class="collection-item"><span>New Market System!</span> <i class="material-icons green-text right">done</i></li>
              </ul>
            </div>
            <div class="card-action grey lighten-3">
              <span class="card-title grey-text text-darken-4">Server and Game Info<a href="#server-info" class="btn-game-info btn waves-effect waves-light blue darken-2 right"><i class="material-icons">info_outline</i></a></span>
            </div>
        
          </div>
          
        </div>

        <div class="col s6 video">
          <div class="video-container z-depth-1">
            <iframe width="853" height="480" src="https://www.youtube.com/embed/2vKt_xav6gI" frameborder="0" allowfullscreen></iframe>
          </div>
        </div>
      </div>

      <div class="row section-news">
        <div class="col s12">
          <ul class="collapsible popout" data-collapsible="accordion">
            <li>
              <div class="collapsible-header">First</div>
              <div class="collapsible-body grey lighten-4">
                
                <div class="row">
                  <div class="col s3">
                     <img class="responsive-img" src="http://img.levelup.com.br/ragnarok/_img/noticias/2012-09-05/120904_topo_ro_niver-ragna.jpg">
                  </div>
                  <div class="col s9">
                    <p style="padding: 10px;" class="">Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet<br>
                    Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet</p>
                  </div>
                </div>

              </div>

            </li>
            <li>
              <div class="collapsible-header">Second</div>
              <div class="collapsible-body grey lighten-4">

                <div class="row">
                  <div class="col s3">
                     <img class="responsive-img" src="http://img.levelup.com.br/ragnarok/_img/noticias/2012-09-05/120904_topo_ro_niver-ragna.jpg">
                  </div>
                  <div class="col s9">
                    <p style="padding: 10px;" class="">Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet<br>
                    Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet</p>
                  </div>
                </div>

              </div>
            </li>
            <li>
              <div class="collapsible-header">Third</div>
              <div class="collapsible-body grey lighten-4 left-align">

                <div class="row">
                  <div class="col s3">
                     <img class="responsive-img" src="http://img.levelup.com.br/ragnarok/_img/noticias/2012-09-05/120904_topo_ro_niver-ragna.jpg">
                  </div>
                  <div class="col s9">
                    <p style="padding: 10px;" class="">Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet<br>
                    Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet</p>
                  </div>
                </div>
  
              </div>
            </li>
          </ul>  
        </div>
        
      </div>

      <div class="row section-news-list">
        <div class="col s12 z-depth-1 news">
          
        </div>
      </div>
        
  </div><!-- CONTAINER END -->

  <style>
    .video-container {
      margin-top: 0.5rem;
      padding-bottom: 78.25%;%; 
    }
    .section-news img {
      margin-top: 25px;
      margin-left: 25px;
    }
    span.badge {
      font-weight: 400;
      font-size: 1.0rem;
      color: #fff;
      background-color: #26a69a;
      border-radius: 2px;
    }
  </style>

  <script>
    var self = this;

    this.on('mount', function(){
      $('.main-menu').addClass('container')
        $('.collapsible').collapsible({
        accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
        });
      });

    view.addUnmountListener('home', function() {
      self.unmount(true);
    });
  </script>
</home>
