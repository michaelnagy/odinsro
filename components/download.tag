<download>
  <div class="container">
    <div class="row section1">
      <div class="col s12 download-container">
        <div class="card-panel grey lighten-5 z-depth-1">
          <div class="animated fadeIn">
            <h4 class="text-flow">DOWNLOAD SECTION</h4>
            <h5>Installation instructions:</h5>
            <ul>
              <li>1. Download the <b>Installer</b> and the <b>GRF Data File</b>.</li>
              <li>2. Install the Installer "Install Odinsro.exe" file.</li>
              <li>3. Unzip the GRF Data File "data.zip".</li>
              <li>4. Move the unziped file "data.grf" to the installation folder. Usually in "C:\Program Files (x86)\odinsRO" path.</li>
              <li style="font-size:16px;">PS: You can also use a kRO data.grf</li>
            </ul>
            <div class="download-buttons">
              <img src="img/rubylit.gif" alt="" />
              <span class="installer">
                <h6>Installer option 1</h6>
                <a href="https://drive.google.com/folderview?id=0BwjVctmIbqF5dGFvN25ma3VQZlU&usp=sharing" target="_blank" class="waves-effect waves-light btn-large orange" style="margin-right:20px"><i class="material-icons left">cloud</i>Installer</a>
                <!-- <a href="http://www.mediafire.com/download/20cgga4t6ga0dmt/odinsRO+install.exe" target="_blank" class="waves-effect waves-light btn-large orange" style="margin-right:20px"><i class="material-icons left">cloud</i>Installer</a> -->
                <h6>Installer option 2</h6>
                <a href="https://mega.nz/#!ldBH0Q4I!r4THr2mrq_tEMkRYRDXcevKuXlsI0ks6XaOEmuQGHJk" target="_blank" class="waves-effect waves-light btn-large orange" style="margin-right:20px"><i class="material-icons left">cloud</i>Installer</a>
              </span>
              <span class="installer">
                <h6>Data GRF option 1</h6>
                <a href="https://mega.nz/#!aRwCQKAZ!cy5mtAw2Hw1YTngST2FhVyHZEVqgox-yO8Gpx_hvmKE" target="_blank" class="waves-effect waves-light btn-large"><i class="material-icons left">system_update_alt</i>GRF Data File</a>

                <h6>Data GRF option 2</h6>
                <a href="https://drive.google.com/folderview?id=0BwjVctmIbqF5dGFvN25ma3VQZlU&usp=sharing" target="_blank" class="waves-effect waves-light btn-large"><i class="material-icons left">system_update_alt</i>GRF Data File</a>
              </span>
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
