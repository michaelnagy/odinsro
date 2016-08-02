<contact>
  <div class="container animated fadeIn">
      <div class="row">
        <div class="col s12">
        	<div class="card-panel center">
	          <h4 class="align-center">CONTACT CHANNELS</h4>
	            <div class="content">
                <p>
                  If you want to talk to us you can use the following channels:
                </p>
                <div class="contact-discord">
                  <h5>Chat</h5>
                  <iframe src="https://discordapp.com/widget?id=158976519077756928&theme=dark" width="550" height="500" allowtransparency="true" frameborder="0"></iframe>
                </div>
                <div class="contact-facebook">
                  <h5>Facebook</h5>
                    <a href="https://www.facebook.com/oficialodinsro/" target="_blank" class="waves-effect waves-teal btn-large">Facebook Page</a>
                </div>
                <div class="contact-forum">
                  <h5>Forum</h5>
                  <a href="http://forum.odinsro.net/" target="_blank" class="waves-effect waves-teal btn-large">Forum</a>
                </div>

                <div class="contact-email">
                  <h5>Email</h5>
                  <a href="mailto:support@odinsro.net">support@odinsro.net</a>
                </div>
              </div>
	        </div>
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

    view.addUnmountListener('contact', function() {
      self.unmount(true);
    });
  </script>
</contact>
