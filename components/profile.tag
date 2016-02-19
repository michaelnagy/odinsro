<profile>
  <div class="navbar-fixed">
    <nav>
      <div class="nav-wrapper">
        <!-- <a href="#!" class="brand-logo">Logo</a>
        <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
        <ul class="right hide-on-med-and-down">
          <li><a href="sass.html">Sass</a></li>
          <li><a href="badges.html">Components</a></li>
          <li><a href="collapsible.html">Javascript</a></li>
          <li><a href="mobile.html">Mobile</a></li>
        </ul> -->
        <ul class="side-nav " id="mobile-demo">
          <li><a href="shop">Shop</a></li>
          <li><a href="sass.html">Sistema</a></li>
          <li><a href="badges.html">Ferramentas</a></li>
        </ul>
      </div>
    </nav>
  </div>
  

  <div class="container">
    <div class="row profile">
      <div class="col s12">
        
        <div class="card-panel grey lighten-5 z-depth-1">
          <div class="row valign-wrapper">
            <div class="col s10">
              <p class="profile-tags"><span>Username:</span><span class="profile-editable">{username}</span></p>
              <p class="profile-tags"><span>e-mail</span></p>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>

  <script>
    var self = this;
    
    this.session = getToken('token');

    if (!this.session) {
      riot.route('/');

    }

    view.addUnmountListener('profile', function() {
      self.unmount(true);
    });
  </script>
</profile>
