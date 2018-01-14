var header = document.getElementsByTagName("header");
var display = document.getElementById("display");
var codeImg = document.getElementById("codeImg");

header[0].innerHTML="Closure example:";

function makeCounter(){
    var countVariable = 0;
    return {
        increment : function(){
            countVariable++;
            return countVariable;
        }
    };
}

var enclosureManipulator = makeCounter();
var res1 = enclosureManipulator.increment();
var res2 = enclosureManipulator.increment();
var res3 = enclosureManipulator.increment();

display.innerHTML+="res1: "+res1+"<br>"+"res2: "+res2+"<br>"+"res3: "+res3;

codeImg.src="images/code4.png";
