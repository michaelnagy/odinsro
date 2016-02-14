<database>
  <div class="container">
    <div class="row section1">
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
</database>