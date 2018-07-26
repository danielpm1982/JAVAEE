var header = document.getElementsByTagName("header");
var display = document.getElementById("display");
var codeImg = document.getElementById("codeImg");

header[0].innerHTML="Closure example:";

function makeTimer(doneMessage, n) {
    var interval = startInterval(n);
    window.setTimeout(function() {
        stopInterval(interval);
        display.innerHTML+=doneMessage;
    }, n);
    function startInterval(time){
        return window.setInterval(function() {
            display.innerHTML+=(time/1000)+"s...<br>";time-=1000;
        },1000);
    }
    function stopInterval(interval){
        clearInterval(interval);
    }
}

doneMessage="Cookies have overcooked!<br>"+
                "Actually, they're completely burnt!<br>"+
                "<img src=\"images/cookiesBurnt.png\">";

makeTimer("Cookies are done!<br><br><img src=\"images/cookiesOK.png\">", 5000);

codeImg.src="images/code5.png";
