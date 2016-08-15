<home>
  <!-- Server Status -->
  <div class="info-widgets">
    <div class="server-status grey lighten-5 z-depth-1 ">
      status<br><span class="server" style="color:#00c853;">ON</span><br>
      time<br>
      <b></b>
    </div>
    <div class="server-woe grey lighten-5 z-depth-1 ">
      WOE<br><span class="woe" style="color:#ef9a9a;">OFF</span><br>
      <a class="woe-link"><i class="material-icons">event</i></a>
    </div>
    <!-- <div class="server-time grey lighten-5 z-depth-1 ">
      server time<br><span class="server" style="color:#00c853;">ON</span>
    </div> -->
  </div>


  <div class="container animated fadeIn">
      <!-- ROW SECTION -->
      <div class="row section1">
      <!-- Slider -->
        <div class="col s8 ">
         <div class="slider">
            <ul class="slides z-depth-1">
              <li>
                <img src="img/1.jpg">
              </li>
              <li>
                <img src="img/2.jpg">
              </li>
              <li>
                <img src="img/3.jpg">
              </li>
              <li>
                <img src="img/4.jpg">
              </li>
            </ul>
          </div>
        </div>
        <!-- Slider END -->
        <!-- Server Features -->
        <div class="col s4 news">

          <div class="card">

            <div class="card-content black-text server-features">
              <span class="card-title grey-text text-darken-4">Server Features</span>
               <ul class="collection">
                <li class="collection-item"><span>Episode 15.1</span> </li>
                <li class="collection-item"><span>New Doram Race updates!</span> </li>
                <li class="collection-item"><span>New BG System!</span> </li>
                <li class="collection-item"><span>New Market System!</span> </li>
              </ul>
            </div>

            <div class="card-action grey lighten-3">
              <span class="card-title grey-text text-darken-4">Server Info<a href="#server-info" class="btn-game-info btn waves-effect waves-light right"><i class="material-icons">info_outline</i></a></span>
            </div>

          </div>

        </div>
        <!-- Server Features END -->
      </div> <!-- ROW SECTION END -->

      <div class="row section-featured">
        <div class="col s6 facebook-widget">
          <div class="fb-page z-depth-1" data-href="https://www.facebook.com/oficialodinsro" data-tabs="timeline" data-width="450" data-height="361" data-small-header="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/oficialodinsro"><a href="https://www.facebook.com/oficialodinsro">Odinsro</a></blockquote></div></div>
        </div>

        <div class="col s6 z-depth-1 video-col">
          <div class="video">
            <div>
              <iframe width="100%" height="270" src="https://www.youtube.com/embed/2vKt_xav6gI" frameborder="0" allowfullscreen></iframe>
            </div>
            <div>
              <iframe width="100%" height="270" src="https://www.youtube.com/embed/86efD2Bxtr0" frameborder="0" allowfullscreen></iframe>
            </div>
            <div>
              <iframe width="100%" height="270" src="https://www.youtube.com/embed/cnqQPwt8Om8" frameborder="0" allowfullscreen></iframe>
            </div>
          </div>
          <div class="arrows">
            <button class="arrow-left waves-effect waves-light btn"><i class="material-icons left">skip_previous</i>Prev</button>
            <button class="arrow-right waves-effect waves-light btn"><i class="material-icons right">skip_next</i>Next</button>
          </div>
        </div>

      </div>

      <div class="row section-news">
        <div class="col s12">

        <div class="row" each={new, key in news}>
          <div class="col s12 z-depth-1 grey lighten-3">
            <div class="row news-item">
              <!-- <div class="col s2 news-date orange lighten-1 white-text">
                <span class="day">{time[key].day}</span>
                <span class="month">{time[key].month}</span>
              </div> -->
              <div class="col s12 news-content">
                <h5><a target="_blank" href="http://forum.odinsro.net/d/{news[key].id}">{news[key].attributes.title}</a></h5>
                <span class="truncate">{posts[key].attributes.contentHtml}</span>
                <a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http://forum.odinsro.net/d/{news[key].id}&title=OdinsRO - {news[key].attributes.title}"><img class="facebook circle" src="img/facebook.png"></a>
              </div>
            </div>
          </div>
        </div>

        </div>

      </div>

      <div class="row section-news-list">
        <div class="col s12 z-depth-1 news">

        </div>
      </div>

  </div><!-- CONTAINER END -->
  <style>
    .arrows {
      width: 100%;
      position: relative;
      display: flex;
      align-items: center;
      align-content: center;
      justify-content: center;
      margin-top: 20px;
    }
    .arrows button {
      margin: 0 10px;
    }
    .video {
      height: 270px;
    }
    .video-col {
      background-color: #eee;
      padding: 0.75rem !important;
      height: 361px;
    }
    .section-news .news-img {
      margin-top: 25px;
      margin-left: 25px;
    }
    .section-news .col-s3 {
      padding-left: 20px;
      padding-right: 20px;
    }

    .news-header-img {
      width: 30px;
    }

    span.badge {
      font-weight: 400;
      font-size: 1.0rem;
      color: #fff;
      background-color: #26a69a;
      border-radius: 2px;
    }
    .server-features i {
      font-size: 30px;
      line-height: 0.8;
    }
    .server-features img {
      width: 30px;
      width: 30px;
      position: relative;
      bottom: 5px;
    }
    .btn-game-info {
      background-color: #FF9438;
    }
    .day {
      font-size: 56pt;
      font-weight: 100;
      line-height: 1;
      width: 100%;
      display: block;
      text-align: center;
    }
    .month {
      font-size: 24pt;
      font-weight: 900;
      line-height: 1;
      width: 100%;
      display: block;
      text-align: center;
    }
    .news-item {
      margin-bottom: 0;
    }
    .facebook {
     float: right;
    }
  </style>

  <script>
    var self = this;
    self.strip = [];
    self.time = [];
    var date = {};
    var month = new Array();

    this.on('update', function() {
    });

    this.on('mount', function(){

      // WOE informations notie
      var notiehtml = '<table class="centered"><thead><tr><th data-field="id">Castle</th><th data-field="name">Date</th><th data-field="price">Time</th></tr></thead><tbody><tr><td>Leprion</td><td>08/14/16</td><td>4 PM</td></tr><tr><td>Leprion</td><td>08/14/16</td><td>4 PM</td></tr><tr><td>Leprion</td><td>08/14/16</td><td>4 PM</td></tr></tbody></table>';
      var woecoming = '<h4>Calendar Coming Soon</4><br><img width="250px" class="z-depth-2" src="http://www.myro-ph.com/images/forum/animepapernetpicture-standard-.jpg" alt="animepapernetpicture-standard-.jpg">'

      $('.woe-link').click(function () {
        notie.alert(4, woecoming, 60);
      });

      // Get and Set servertime widget
      $('.server-status b').text(moment().locale('pt-br').tz("America/Sao_Paulo").format('HH:mm'));

      $('.video').slick({
        appendArrows: '.arrows',
        nextArrow:'.arrow-right',
        prevArrow:'.arrow-left'
      });

      // adds the container class to the page
      $('.main-menu').addClass('container');

      // initializes the collapsible menu
      $('.collapsible').collapsible({
        accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
        });

      //get the news from forum
      $.get("http://forum.odinsro.net/api/discussions?include=startPost%2Ctags&filter%5Bq%5D=%20tag%3Anews&", function( data ) {

        if (!data.included) {
          return
        }
        // console.log(data.data);
        self.news = data.data;
        self.posts = data.included;
        // console.log(data.data, self.posts);
        // console.log('TITLE: ',data.data[0].attributes.title, 'POST: ',data.included[0].attributes.contentHtml);
        for (i = 0; i < self.posts.length; i++) {
          if (self.posts[i].attributes.contentHtml === undefined) {
            self.posts.splice(i, 1);
          }
          else {
            self.posts[i].attributes.contentHtml = self.posts[i].attributes.contentHtml.replace(/<\/?[^>]+(>|$)/g, "");
            // console.log(self.posts[i].attributes.contentHtml);
            //convert the posts date to time object
            date = new Date(self.posts[i].attributes.time);
            //set months
            month[0] = "Jan";
            month[1] = "Feb";
            month[2] = "Mar";
            month[3] = "Apr";
            month[4] = "May";
            month[5] = "Jun";
            month[6] = "Jul";
            month[7] = "Aug";
            month[8] = "Sep";
            month[9] = "Oct";
            month[10] = "Nov";
            month[11] = "Dec";
            //create the day and month objects
            self.time[i] = {month:month[date.getMonth()], day:date.getDay()};
            }
         }
        //order results by day
        self.time = self.time.sort(function(a,b) {return (a.day > b.day) ? 1 : ((b.day > a.day) ? -1 : 0);} );
        //update the tag instance
        self.update();
      });
    });

    this.on('updated', function(){
      //initializes the slider
      $('.slider').slider();
      //initializes facebook widget
      FB.XFBML.parse();
    });

    view.addUnmountListener('home', function() {
      self.unmount(true);
    });
  </script>
</home>
