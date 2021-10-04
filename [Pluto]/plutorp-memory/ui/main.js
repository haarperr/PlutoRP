const MAX_SQUARES = 7;
let AmountOfSquares = 0;
let CorrectlySelectedSquares = 0;

let CONTAINER = document.querySelector('.memory-wrapper');
let Actives = [];
let CanClick = false;

window.addEventListener('message', function(event) {
    let data = event.data;

    if (data.action === 'start') {
        console.log('starting')
        SetupMemoryGame();
    }
});

function SetupMemoryGame() {
    CanClick = false;
    Actives = [];
    CorrectlySelectedSquares = 0;
    AmountOfSquares = 0;

    $('.memory-wrapper').html('');
    $('.memory-wrapper').css('display', 'none');
    $('.memory-container').fadeIn(500);

    [].forEach.call(document.querySelectorAll('.box-active'), function(element) {
        element.classList.remove('box-active');
    });


    $('.text').html('Preparing hack...')

    $('.help-text').fadeIn(100, () => {
        $('.memory-container').fadeIn(1000)
        setTimeout(() => {
            $('.text').html('Breaching systems...')
            setTimeout(() => {
                $('.help-text').fadeOut(0)
                $('.memory-wrapper').fadeIn(500);

                for (let i = 1; i < 7; i++) {
                    let row = document.createElement('div');
                    row.classList.add('row');
            
                    for (let k = 1; k < 7; k++) {
                        let square = document.createElement('div');
                        square.classList.add('box');
                        let id = `${i}-${k}`;
                        square.setAttribute('id', id);
            
                        if (RandomNum(1, 5) == 3 && (AmountOfSquares < MAX_SQUARES)) {
                            AmountOfSquares++;
                            square.classList.add('box-active');
                            Actives[id] = true;
                        }
            
                        square.addEventListener('click', ClickSquare)
            
                        row.appendChild(square);
                    }
            
                    CONTAINER.appendChild(row);
                }
            
                setTimeout(() => {
                    CONTAINER.style.opacity = '0';
            
                    setTimeout(() => {
                        [].forEach.call(document.querySelectorAll('.box-active'), function(element) {
                            element.classList.remove('box-active');
                        });
                
                        setTimeout(() => {
                            CONTAINER.style.opacity = '100';
                            CanClick = true;
                        }, 2000);
                    }, 2500);
                }, 5000);
            
                $('.memory-wrapper').css('display', 'inline-block');
            }, 4500);
        }, 4000);
    });

}

function RandomNum(min, max) {
    return Math.floor(Math.random() * (max - min) + min);
} 

function ClickSquare(e) {
    if (!CanClick) return;

    let ClickedId = e.target.id;

    let sound = new Audio('sounds/click.mp3');
    sound.volume = 0.8;
    sound.play();
    
    if (Actives[ClickedId]) {
        CanClick = false;
        CorrectlySelectedSquares++;

        Actives[ClickedId] = false;
        this.style.background = 'white';

        if (CorrectlySelectedSquares >= AmountOfSquares) {
            CanClick = false;
            $('.text').html('Hack success');

            $('.memory-wrapper').fadeOut(250, () => {
                $('.help-text').fadeIn(250);
                setTimeout(() => {
                    $.post('http://plutorp-memory/success')
                    $('.memory-container').fadeOut(500);
                }, 2000);
            });
        } else {
            CanClick = true;
        }
    } else {
        CanClick = false;
        $('.text').html('Hack failed');

        $('.memory-wrapper').fadeOut(250, () => {
            $('.help-text').fadeIn(250);
            setTimeout(() => {
                $.post('http://plutorp-memory/fail')
                $('.memory-container').fadeOut(500);
            }, 2000);
        });
    }
    
}