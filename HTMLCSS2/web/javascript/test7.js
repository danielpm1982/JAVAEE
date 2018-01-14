var header = document.getElementsByTagName("header");
var codeImg = document.getElementById("codeImg");

header[0].innerHTML="Closure example:";

(function (doneMessage,n) {
    var originalDoneMessageString = doneMessage;
    var count=0;
    var display = document.getElementById("display");
    display.innerHTML+="Click anywhere to start counting!<br>";
    window.onclick=function(){
        count++;
        if(count===1){
            display.innerHTML="";
        }
        display.innerHTML+=count+"...<br>";
        if(count===n){
            display.innerHTML+=doneMessage+"<br>";
        } else if(count>n){
            display.innerHTML+=originalDoneMessageString+
                    " [said it already "+(count-n)+" time(s)!]<br>";
        }
    };
    doneMessage=doneMessage+"<br><br>"+
                "<img src=\"images/cookiesOK.png\">";
})("Cookies are done!",5);

codeImg.src="images/code7.png";
