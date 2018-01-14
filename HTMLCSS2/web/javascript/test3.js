var header = document.getElementsByTagName("header");
var display = document.getElementById("display");
var codeImg = document.getElementById("codeImg");

header[0].innerHTML="Closure example:";

function multN(n){
    return function (input){
        return input*n;
    };
}

var enclosureManipulator = multN(5);
var res = enclosureManipulator(2);

display.innerHTML+="res: "+res;

codeImg.src="images/code3.png";
