var header = document.getElementsByTagName("header");
var display = document.getElementById("display");
var codeImg = document.getElementById("codeImg");

header[0].innerHTML="Closure example:";

function makePassword(password){
    return function (guess){
        return guess===password;
    };
}

var enclosureManipulator = makePassword("dpm");
var res1 = enclosureManipulator("123");
var res2 = enclosureManipulator("dpm");

display.innerHTML+="res1: "+res1+"<br>"+"res2: "+res2;

codeImg.src="images/code2.png";
