<home>
  <div class="container animated fadeIn">
      <div class="row section1">
        
        <div class="col s12 ">
         <div class="slider">
            <ul class="slides z-depth-1">
              <li>
                <img src="http://legendro.com.br/files/images/1.jpg"> <!-- random image -->
              </li>
              <li>
                <img src="http://legendro.com.br/files/images/2.jpg"> <!-- random image -->
              </li>
              <li>
                <img src="http://legendro.com.br/files/images/3.jpg"> <!-- random image -->
              </li>
            </ul>
          </div>
        </div>

      </div> <!-- ROW SECTION END -->

      <div class="row section-featured">
        <div class="col s6 news">

          <div class="card">
           
            <div class="card-content black-text server-features">
              <span class="card-title grey-text text-darken-4">Server Features</span>
               <ul class="collection">
                <li class="collection-item"><a href=""><span>Episode 14.3</span> <img class="right" src="img/tv.png"></a></li>
                <li class="collection-item"><a href=""><span>New Doram Race updates!</span> <img class="right" src="img/tv.png"></a></li>
                <li class="collection-item"><a href=""><span>New BG System!</span> <img class="right" src="img/tv.png"></a></li>
                <li class="collection-item"><a href=""><span>New Market System!</span> <img class="right" src="img/tv.png"></a></li>
              </ul>
            </div>

            <div class="card-action grey lighten-3">
              <span class="card-title grey-text text-darken-4">Server and Game Info<a href="#server-info" class="btn-game-info btn waves-effect waves-light right"><i class="material-icons">info_outline</i></a></span>
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


        <div class="row">
          <div class="col s12 z-depth-1 grey lighten-3">
            <div class="row news-item">
              <div class="col s2 news-date orange lighten-1 white-text">
                <span class="day">8</span>
                <span class="month">Jul</span>
              </div>
              <div class="col s10 news-content">
                <h5>I am a very simple card</h5>
                <img class="facebook circle" src="img/facebook.png">
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
    .video-container {
      margin-top: 0.5rem;
      padding-bottom: 78.25%;%; 
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

    this.on('mount', function(){
      $('.main-menu').addClass('container')
        $('.collapsible').collapsible({
        accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
        });
      });

    this.on('updated', function(){
      $('.slider').slider();
    });

    view.addUnmountListener('home', function() {
      self.unmount(true);
    });
  </script>
</home>
