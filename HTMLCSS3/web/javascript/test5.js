var header = document.getElementsByTagName("header");
var displayText = document.getElementById("displayText");
var codeImg = document.getElementById("codeImg");
var body = document.getElementsByTagName("body")[0];
var intervalId;
var webServiceOn = false;
var removePrevious = false;
var lastReportTime = 0;

header[0].innerHTML="Webservices example:";
displayText.innerHTML="JSONP (script tag with callback set) cross-domain requests results:<br>";

function updateSales(salesArray){
    /*If no sales record is newer than the lastreporttime passed at the URL, salesArray, when returned,
     * is undefined and its length is 0, thus no result will be displayed and the lastReportTime
     * will continue to be the same, until newer registers are produced and returned. This way, no
     * duplicates are returned or displayed, only those with different times.*/
    if(salesArray.length>0){
        if(removePrevious===true){
            removeAllSaleDivElements();
        }
        for(var i=0;i<salesArray.length;i++){
            var sale = salesArray[i];
            var saleDivElement = document.createElement("div");
            saleDivElement.setAttribute("class","salesRow");
            saleDivElement.innerHTML=sale.name+" (Lat:"+sale.latitude+" Lng: "+
                    sale.longitude+") sold "+sale.sales+" gumball(s) on "+(new Date(sale.time))+".";
            displayText.appendChild(saleDivElement);
        }
        lastReportTime=salesArray[salesArray.length-1].time;
    }
}

function refreshHandler(){
    var newScriptJSONP = document.createElement("script");
    /*&random URL parameter is a unique example number to avoid browser caching when 
    it eventually thinks repeated URLs would be the same page (not considering its modified content).
    With this URL parameter trick, URLs will always be different and no cache will happen.*/
    newScriptJSONP.setAttribute("src","http://gumball.wickedlysmart.com/?callback=updateSales&lastreporttime="+
            lastReportTime+"&random="+(new Date()).getTime());
    newScriptJSONP.setAttribute("id","scriptJSONP");
    var oldScriptJSONP = document.getElementById("scriptJSONP");
    if(oldScriptJSONP===null){
        body.appendChild(newScriptJSONP);
    } else{
//        body.removeChild(oldScriptJSONP);
//        body.appendChild(newScriptJSONP);
        body.replaceChild(newScriptJSONP,oldScriptJSONP);
    }
}

/* 
When removing elements from DOM, using getElementByClassName or any other node list collection,
remember that this collection is dynamic and its length, as well as every element index, is changed
after each of them is removed (from the first to the last one). When the first is removed, the
node list is updated and every other remaining element is shifted to n-1 index, and the length reduces by 1.
So, if a removal from the first to last is used, it will not work properly (some elements will be
skipped and others will be undefined ('cause of index dynamic change will change their position in the list).
One way of successfully removing a dynamic node list of DOM elements is to, prior the removing, pass the whole
list to a fixed array, and then deleting from the array and not from the list, which will still be dynamic changed
(as the DOM will be), but the removal will be oriented by the fixed array and not by the list. Another way is to
use the dynamic list but delete backwards... this way, no shifting will occur and the result will be just fine.
 */
function removeAllSaleDivElements(){
    var allSalesArray = document.getElementsByClassName("salesRow");
    var length = allSalesArray.length;
    for(var i=length-1;i>-1;i--){
        allSalesArray[i].parentNode.removeChild(allSalesArray[i]);
    }
}

function turnOn(){
    webServiceOn = true;
    intervalId = window.setInterval(refreshHandler,300);
}

function turnOff(){
    webServiceOn = false;
    if(intervalId){
        window.clearInterval(intervalId);
    }
}

window.onload=function(){
    var buttonOn = document.createElement("INPUT");
    buttonOn.setAttribute("type","button");
    buttonOn.setAttribute("value","WEBSERVICE ON");
    var buttonOff = document.createElement("INPUT");
    buttonOff.setAttribute("type","button");
    buttonOff.setAttribute("value","WEBSERVICE OFF");
    var buttonRemovePrevious = document.createElement("INPUT");
    buttonRemovePrevious.setAttribute("type","button");
    buttonRemovePrevious.setAttribute("value","REMOVE_PREVIOUS");
    var buttonReset = document.createElement("INPUT");
    buttonReset.setAttribute("type","button");
    buttonReset.setAttribute("value","RESET");
    displayText.appendChild(buttonOn);
    displayText.appendChild(buttonOff);
    displayText.appendChild(buttonRemovePrevious);
    displayText.appendChild(buttonReset);
    buttonOn.onclick=function(){
        if(webServiceOn===false){
            turnOn();
        }
        this.blur();
    };
    buttonOff.onclick=function(){
        if(webServiceOn===true){
            turnOff();
        }
        this.blur();
    };
    buttonRemovePrevious.onclick=function(){
        if(removePrevious===true){
            removePrevious=false;
            buttonRemovePrevious.style.backgroundColor="";
        } else{
            removePrevious=true;
            buttonRemovePrevious.style.backgroundColor="lightgreen";
        }
        this.blur();
    };
    buttonReset.onclick=function(){
        if(webServiceOn===true){
            turnOff();
        }
        removeAllSaleDivElements();
        this.blur();
    };
};

codeImg.src="images/code5.png";
