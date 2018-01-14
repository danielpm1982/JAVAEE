var header = document.getElementsByTagName("header");
var display = document.getElementById("display");
var codeImg = document.getElementById("codeImg");

header[0].innerHTML="Closure example:";

function makeTimer(doneMessage, n) {
    var interval = startInterval(n);
    function handler() {
        stopInterval(interval);
        display.innerHTML+=doneMessage;
    }
    window.setTimeout(handler, n);
    function startInterval(time){
        return window.setInterval(function() {
            display.innerHTML+=(time/1000)+"s...<br>";time-=1000;
        },1000);
    }
    function stopInterval(interval){
        clearInterval(interval);
    }
    doneMessage="Cookies have overcooked!<br>"+
                "Actually, they're completely burnt!<br><br>"+
                "<img src=\"images/cookiesBurnt.png\">";
}

makeTimer("Cookies are done!", 5000);

codeImg.src="images/code6.png";
