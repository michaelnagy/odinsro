<refund>
  <div class="container animated fadeIn">
      <div class="row">
        <div class="col s12">
        	<div class="card-panel">
	          <h4 class="align-center">Refund and Cancelation</h4>
	            <div class="privacy-content">
                <h5>Refund or Cancelation of VIP Ticket (VIP days)</h5>
                You can only be refunded for the remaining days since your purchase.
                For example: You bought 30 days of VIP and 2 days later you ask for refund. You will receive money back only for the remaining 28 days.
                <h5>Refund or Cancelation of Cash Points Purchased</h5>
                You can only be refunded for the unused CASH remaining in your account since your purchase.
                For example: You bought 5000 CASH Points and after use 2000 CASH Points, you ask for refund. You will receive money back only for the remaining 3000 CASH Points.
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

    view.addUnmountListener('refund', function() {
      self.unmount(true);
    });
  </script>
</refund>
