var header = document.getElementsByTagName("header");
var displayText = document.getElementById("displayText");
var codeImg = document.getElementById("codeImg");

header[0].innerHTML="Webservices example:";
displayText.innerHTML="AJAX (XMLHttpRequest) same-domain request result:<br><br>";

window.onload = function(){
    var request = new XMLHttpRequest();
    var url = "json/sales.json";
    request.open("GET",url);
    request.onload=function(){
        if(request.status===200){
            var salesArray = JSON.parse(request.responseText);
            updateSales(salesArray);
        }
    };
    request.send(null);
};

function updateSales(salesArray){
    for(var i=0;i<salesArray.length;i++){
        var sale = salesArray[i];
        var saleDivElement = document.createElement("div");
        saleDivElement.setAttribute("class","salesRow");
        saleDivElement.innerHTML=sale.name+" sold "+sale.sales+" gumball(s).";
        displayText.appendChild(saleDivElement);
    }
}

codeImg.src="images/code4.png";
