<download>
  <div class="container">
    <div class="row section1">
      <div class="col s12 download-container">
        <div class="card-panel grey lighten-5 z-depth-1">
          <div class="animated fadeIn">
            <h4 class="text-flow">DOWNLOAD SECTION</h4>
            <h5>Installation instructions:</h5>
            <ul>
              <li>1. Download both of the files.</li>
              <li>2. Install the "Install Odinsro.exe" file.</li>
              <li>3. Unzip de data.zip file.</li>
              <li>4. Move the unziped file "data.grf" to the installation folder. Usually in "C:\Program Files (x86)\odinsRO" path.</li>
            </ul>
            <div class="download-buttons">
              <img src="img/rubylit.gif" alt="" />
              <span class="installer">
                <h6>Mirror 1 (Mediafire)</h6>
                <a href="http://www.mediafire.com/download/20cgga4t6ga0dmt/odinsRO+install.exe" target="_blank" class="waves-effect waves-light btn-large orange" style="margin-right:20px"><i class="material-icons left">cloud</i>Installer</a>
                <h6>Mirror 2 (Mega)</h6>
                <a href="https://mega.nz/#!ldBH0Q4I!r4THr2mrq_tEMkRYRDXcevKuXlsI0ks6XaOEmuQGHJk" target="_blank" class="waves-effect waves-light btn-large orange" style="margin-right:20px"><i class="material-icons left">cloud</i>Installer</a>
              </span>
              <p>
                <a href="https://mega.nz/#!aRwCQKAZ!cy5mtAw2Hw1YTngST2FhVyHZEVqgox-yO8Gpx_hvmKE" target="_blank" class="waves-effect waves-light btn-large"><i class="material-icons left">system_update_alt</i>Recommended GRF: kRO</a>
              </p>
              <img src="img/sapphilit.gif" alt="" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <style>
  .installer {
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    -webkit-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
    -webkit-flex-wrap: nowrap;
    -ms-flex-wrap: nowrap;
    flex-wrap: nowrap;
    -webkit-justify-content: center;
    -ms-flex-pack: center;
    justify-content: center;
    -webkit-align-content: center;
    -ms-flex-line-pack: center;
    align-content: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
  }
  download ul li {
    font-size: 18px;
    line-height: 2;
  }
  download .card-panel {
    height: 85vh;
  }
  download .animated {
    height: 100%;
  }
  .download-buttons {
    padding-bottom: 20px;
    padding-top: 10px;
    height: 40%;
    background-color: #e3e5e6;
    width: 100%;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    -webkit-flex-direction: row;
    -ms-flex-direction: row;
    flex-direction: row;
    -webkit-flex-wrap: nowrap;
    -ms-flex-wrap: nowrap;
    flex-wrap: nowrap;
    -webkit-justify-content: space-around;
    -ms-flex-pack: space-around;
    justify-content: space-around;
    -webkit-align-content: center;
    -ms-flex-line-pack: center;
    align-content: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    border: 1px solid #d8d4d4;
    }

  }
  </style>

  <script>
    var self = this;

    view.addUnmountListener('download', function() {
      self.unmount(true);
    });
  </script>
</download>
