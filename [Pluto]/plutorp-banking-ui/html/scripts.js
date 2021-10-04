// Credit to Kanersps @ llrp-mode and Eraknelo @FiveM
function addGaps(nStr) {
    nStr += '';
    var x = nStr.split('.');
    var x1 = x[0];
    var x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + '<span style="margin-left: 3px; margin-right: 3px;"/>' + '$2');
    }
    return x1 + x2;
}



$(document).ready(function() {
    window.addEventListener('message', function(event) {
        var item = event.data;
        // Update HUD Balance
        if (item.updateBalance == true) {
            $('.balance').hide();
            if (item.show != false) {
                $('.balance').show();
            }
            $('.balance').html('<p id="balance"><img id="icon" src="bank-icon.png" alt=""/>' + addGaps(event.data.balance) + '</p>');

            if (item.show != false) {
                setTimeout(function() {
                    $('.balance').fadeOut(600)
                }, 4000)
            }
        }
     
        if (item.viewBalance == true) {
            $('.balance').show();
            $('.cash').show();
            setTimeout(function() {
                $('.balance').fadeOut(600)
                $('.cash').fadeOut(600)
            }, 8000)
        }
        if (item.viewCash == true) {
            $('.balance').show();
            $('.cash').show();
            setTimeout(function() {
                $('.balance').fadeOut(600)
                $('.cash').fadeOut(600)
            }, 8000)
        }
        if (item.updateCash == true) {
            $(".cashrightnow").html("Cash: $" + item.cash)

            $('.cash').hide();
            if (item.show != false) {
                $('.cash').show();
            }
            $('.cash').html('<p id="cash"><span class="green"> $ </span>' + addGaps(event.data.cash) + '</p>');
            if (item.show != false) {
                setTimeout(function() {
                    $('.cash').fadeOut(600)
                }, 4000)
            }
        }

        // Trigger Add Balance Popup
        if (item.addBalance == true) {
            $('.transaction').show();
            var element = $('<p id="add-balance"><span class="pre">+</span><span class="green"> $ </span>' + addGaps(event.data.amount) + '</p>');
            $(".transaction").append(element);

            setTimeout(function() {
                $(element).fadeOut(600, function() { $(this).remove(); })
            }, 2000)
        }
        //Trigger Remove Balance Popup
        if (item.removeBalance == true) {
            $('.transaction').show();
            var element = $('<p id="add-balance"><span class="pre">-</span><span class="red"> $ </span>' + addGaps(event.data.amount) + '</p>');
            $(".transaction").append(element);
            setTimeout(function() {
                $(element).fadeOut(600, function() { $(this).remove(); })
            }, 2000)
        }
        // Trigger Add Balance Popup
        if (item.addCash == true) {
            $('.cashtransaction').show();
            var element = $('<p id="add-balance"><span class="pre">+</span><span class="green"> $ </span>' + addGaps(event.data.amount) + '</p>');
            $(".cashtransaction").append(element);

            setTimeout(function() {
                $(element).fadeOut(600, function() { $(this).remove(); })
            }, 2000)
        }
        //Trigger Remove Balance Popup
        if (item.removeCash == true) {
            $('.cashtransaction').show();
            var element = $('<p id="add-balance"><span class="pre">-</span><span class="red"> $ </span>' + addGaps(event.data.amount) + '</p>');
            $(".cashtransaction").append(element);
            setTimeout(function() {
                $(element).fadeOut(600, function() { $(this).remove(); })
            }, 2000)
        }
 

    })
});