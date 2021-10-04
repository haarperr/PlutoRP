
let openingPack = false

$(document).ready(function () {
    window.addEventListener('message', function (event) {
        let data = event.data;
        if (data.open == true) {
            if (data.cards) {
                openPack(data.cards);
            };
            if (data.card) {
                viewCard(data.card, data.hollow);
            };
        };
    });

    $(".card").on("mousemove", function(e) {
        let $card = $(this);
        let l = e.offsetX;
        let t = e.offsetY;
        let h = $card.height();
        let w = $card.width();
        let lp = Math.abs(Math.floor(100 / w * l)-100);
        let tp = Math.abs(Math.floor(100 / h * t)-100);
        let bg = `background-position: ${lp}% ${tp}%;`
        let style = `.card.active:before { ${bg} }`
        $(".card").removeClass("active");
        $card.addClass("active");
        $(".hover").html(style);
    }).on("mouseout", function() {
        $(".card").removeClass("active");
    });

    const resetTransform = (el, perspective = 800) =>
    (el.style.transform = `translate3d(0%, 0%, -${perspective / 2}px) rotateX(0deg) rotateY(0deg)`);

    const onMove = (ev, el) => {
    const { pageX, pageY } = ev;
    const { offsetWidth, offsetHeight } = el;
    const { left, top } = el.getBoundingClientRect();
    const cardX = left + offsetWidth / 5;
    const cardY = top + offsetHeight / 5;

    const angle = 40;
    const rotX = (cardY - pageY) / angle;
    const rotY = (cardX - pageX) / -angle;

    el.style.transform = `translate3d(0%, 0%, -350px) rotateX(${rotX}deg) rotateY(${rotY}deg)`;
    };

    const perspective = getComputedStyle($(".card")[0].parentElement).getPropertyValue("perspective").replace("px", "") || 800;

    const onCardMove = ev => onMove(ev, ev.target);
    const onHover = ev => ev.target.addEventListener("mousemove", onCardMove);
    const onOut = ev => {
    resetTransform(ev.target, perspective); // reset card
    ev.target.removeEventListener("mousemove", onCardMove);
    };

    [...$(".card").toArray()].forEach(card => {
        card.addEventListener("mouseover", onHover);
        card.addEventListener("mouseout", onOut);
    })
});

document.onkeyup = function (data) {
    if (data.which == 27) {
        if (!openingPack) {
            closePack();
        };
    };
};

function closePack() {
    $("body").fadeOut(250);
    $(".card").fadeOut(250)
    $.post('https://pokemon/close', JSON.stringify({}));
};

function openPack(cards) {
    openingPack = true;
    $("body").fadeIn(250);
    $(".card").fadeOut(0)
    let i = 1
    $.each(cards, function (index, value) {
        setTimeout(function(){
            $(`#card${i}`).fadeIn(250);
            let hollow = ""
            if (value.hollow) {
                hollow = "hollow"
            };
            $(`#card${i}`).attr("class",`card ${value.name} ${hollow}`);
            $.post('https://pokemon/giveCard', JSON.stringify({cardName: value.name, hollow: value.hollow}));
            i++
            if (i == 6) {
                openingPack = false;
            };
        }, 750 * (index + 1));
    });
};

function viewCard(name, hollow) {
    $("body").fadeIn(250);
    $(".card").fadeOut(0)
    $("#card3").fadeIn(250);
    let hollowClass = ""
    if (hollow) {
        hollowClass = "hollow"
    };
    $("#card3").attr("class",`card ${name} ${hollowClass}`);
}