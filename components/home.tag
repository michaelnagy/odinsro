<home>
  <div class="container animated fadeInUp">
      <div class="row section1">
        <div class="col s12 m4 z-depth-1 white-card">

        </div>
        <div class="col s12 m8 z-depth-1">
          <h4 class="center-align">Ranking</h4>
          <img class="responsive-img" src="http://lorempixel.com/image_output/abstract-q-c-500-500-8.jpg" alt="" />
        </div>
      </div>
  </div>

  <script>
    var self = this;

    this.on('mount', function(){
      $('.main-menu').addClass('container');
    });

    view.addUnmountListener('home', function() {
      self.unmount(true);
    });
  </script>
</home>
