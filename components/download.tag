<download>
  <div class="container">
    <div class="row section1">
      <div class="col s12">
        download component
      </div>
    </div>
  </div>

  <script>
    var self = this;

    view.addUnmountListener('download', function() {
      self.unmount(true);
    });
  </script>
</download>