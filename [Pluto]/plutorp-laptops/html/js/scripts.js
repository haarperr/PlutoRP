window.addEventListener('message', function(event) {
    if (event.data.type == "open") {
        //   $('.boosting_container').hide(); // come up with more of an efficient way to do this later on [not really too bad]
          $('.test').show();
          $('.vehiclecont-VxPVnb').html(event.data.vehicle1)
          $('.vehiclecont-5ArFWQ').html(event.data.vehicleclass1)
          $('.x1250-VxPVnb').html(event.data.vehicleprice1)
          // vehicle 2
          $('.vehiclecont-gpaNVy').html(event.data.vehicle2)
          $('.vehiclecont-xot29j').html(event.data.vehicleclass2)
          $('.x1250-Lk3E3L').html(event.data.vehicleprice2)
          // vehicle 3

          $('.vehiclecont-xRLCe7').html(event.data.vehicle3)
          $('.vehiclecont-Jdxl3b').html(event.data.vehicleclass3)
          $('.x1250-5ArFWQ').html(event.data.vehicleprice3)
          // vehicle 3
        console.log(event.data.vehicleclass3)
        console.log(event.data.vehicleclass2)
        console.log(event.data.vehicleclass1)
        } else if (event.data.type == 'close') {
          $('.test').hide();
        } else if (event.data.type == 'hidebutton') {
          if (event.data.button == 1) {
            $('.accept-contract-K7RlbL').hide()
            $('.rectangle-9-K7RlbL').hide()
          } else if (event.data.button == 2) {
            $('.accept-contract-oh8PSB').hide()
            $('.rectangle-21-oh8PSB').hide()
          } else if (event.data.button == 3) {
            $('.accept-contract-VBlkL2').hide()
            $('.rectangle-24-VBlkL2').hide()
          }
        }
    });

    // 
    document.onkeydown = function(evt) {
        evt = evt || window.event;
        var isEscape = false;
        if ("key" in evt) {
            isEscape = (evt.key === "Escape" || evt.key === "Esc");
        } else {
            isEscape = (evt.keyCode === 27);
        }
        if (isEscape) {
          $('.test').fadeOut(250)
          $('.import_export_cont').fadeOut(250)
          $.post('http://plutorp-boosting/close');
        }
    }
function openGUI(){
  $('.import_export_cont').show();
}

function closeGUI() {
  $('.test').fadeOut(250)
  $('.import_export_cont').fadeOut(250)
  $.post('http://plutorp-boosting/close');
}

function acceptContract(cunt) {
  $('.test').fadeOut(250)
  $('.import_export_cont').fadeOut(250)
  $.post('http://plutorp-boosting/accept', JSON.stringify({id: cunt}));
}
 //