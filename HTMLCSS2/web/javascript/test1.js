var header = document.getElementsByTagName("header");
var display = document.getElementById("display");
var codeImg = document.getElementById("codeImg");

header[0].innerHTML="Closure example:";

function external(){
    var freeVariable = 0;
    function internal(){
        freeVariable++;
        return freeVariable;
    }
    return internal;
}

var enclosureManipulator = external();
var res1 = enclosureManipulator();
var res2 = enclosureManipulator();
var res3 = enclosureManipulator();

display.innerHTML+="res1: "+res1+"<br>"+"res2: "+res2+"<br>"+"res3: "+res3;

codeImg.src="images/code1.png";
