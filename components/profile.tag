<profile>
  <div class="container">
    <div class="row profile">
      <div class="col s12">
        database component
      </div>
    </div>
  </div>

  <script>
    var self = this;

    view.addUnmountListener('database', function() {
      self.unmount(true);
    });
  </script>
</profile>
