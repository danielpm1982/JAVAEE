var header = document.getElementsByTagName("header");
var display = document.getElementById("display");
var codeImg = document.getElementById("codeImg");
var originLatitude = document.getElementById("originLatitude");
var originLongitude = document.getElementById("originLongitude");
var destinationLatitude = document.getElementById("destinationLatitude");
var destinationLongitude = document.getElementById("destinationLongitude");
var button = document.getElementById("button");

header[0].innerHTML="Geolocation example:";

var destCoords =  {
    latitude: 0,
    longitude: 0 
};

function getMyLocation(){
    createWaitAlert();
    navigator.geolocation.getCurrentPosition(displayLocation,displayError,{enableHighAccuracy:true,timeout:5000,maximumAge:0});
}

function displayLocation(position){
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
    var accuracy = position.coords.accuracy;
    var altitude = position.coords.altitude;
    var altitudeAccuracy = position.coords.altitudeAccuracy;
    var heading = position.coords.heading;
    var speed = position.coords.speed;
    var timestamp = position.timestamp;
    originLatitude.value=latitude;
    originLongitude.value=longitude;
    display.innerHTML="Origin Latitude:";
    createDisplayP(latitude);
    display.innerHTML+="<br>";
    display.innerHTML+="Origin Longitude:";
    createDisplayP(longitude);
    display.innerHTML+="<br>";
    display.innerHTML+="DateTime:";
    createDisplayP(new Date(timestamp));
    display.innerHTML+="<br>";
    display.innerHTML+="Accuracy (in meters):";
    createDisplayP(accuracy);
    display.innerHTML+="<br>";
    if(altitude){
        display.innerHTML+="Altitude:";
        createDisplayP(altitude);
        display.innerHTML+="<br>";
        display.innerHTML+="AltitudeAccuracy:";
        createDisplayP(altitudeAccuracy);
        display.innerHTML+="<br>";
    }
    if(heading){
        display.innerHTML+="Heading:";
        createDisplayP(heading);
        display.innerHTML+="<br>";
    }
    if(speed){
        display.innerHTML+="Speed:";
        createDisplayP(speed);
        display.innerHTML+="<br>";
    }
    display.innerHTML+="Destination Latitude: ";
    createDisplayP(destCoords.latitude);
    display.innerHTML+="<br>";
    display.innerHTML+="Destination Longitude: ";
    createDisplayP(destCoords.longitude);
    display.innerHTML+="<br>";
    var distance = computeDistance(position.coords,destCoords);
    display.innerHTML+="Distance from local coordinates to<br>destination coordinates is about (Km): ";
    display.innerHTML+="<br>";
    createDisplayP(Math.floor(distance));
    display.innerHTML+="<br>";
    display.innerHTML+="<br>";
    removeWaitAlert();
}

function displayError(error){
    var errorTypes = {
        0: "Unknown error",
        1: "Permission denied by user",
        2: "Position not available",
        3: "Request timed out"
    };
    var errorMessage = errorTypes[error.code];
    if(error.code === 0 || error.code === 2){
        errorMessage+="<br>"+error.message;
    }
    display.innerHTML+=errorMessage+"<br>";
}

function computeDistance(startCoords, destCoords) {
    var startLatRads = degreesToRadians(startCoords.latitude);
    var startLongRads = degreesToRadians(startCoords.longitude);
    var destLatRads = degreesToRadians(destCoords.latitude);
    var destLongRads = degreesToRadians(destCoords.longitude);
    var Radius = 6371;
    var distance = Math.acos(Math.sin(startLatRads) * Math.sin(destLatRads) + 
            Math.cos(startLatRads) *Math.cos(destLatRads) * 
            Math.cos(startLongRads - destLongRads)) * Radius;
    return distance; 
    
    function degreesToRadians(degrees) {
        var radians = (degrees * Math.PI)/180;
        return radians;
    }
}

function createDisplayP(text){
    var elementObject = document.createElement("P");
    elementObject.innerHTML+=text;
    elementObject.setAttribute("class","displayP");
    display.appendChild(elementObject);
}

function createWaitAlert(){
    var waitAlert = document.createElement("P");
    waitAlert.innerHTML="Waiting geolocation calculation...";
    waitAlert.setAttribute("id","waitAlert");
    waitAlert.style.fontSize="0.8em";
    waitAlert.style.fontFamily="cursive";
    waitAlert.style.borderStyle="solid";
    waitAlert.style.width="18em";
    waitAlert.style.margin="auto";
    waitAlert.style.marginTop="1.5em";
    waitAlert.style.marginBottom="1em";
    display.insertBefore(waitAlert,display.childNodes[0]);
}

function removeWaitAlert(){
    var elementToRemove=document.getElementById("waitAlert");
    if(elementToRemove){
        display.removeChild(elementToRemove);
    }
}

button.onclick=function(){
    if(destinationLatitude.value){
        destCoords.latitude=destinationLatitude.value;
    } else{
        destCoords.latitude=0;
        destinationLatitude.value=0;
    }
    if(destinationLongitude.value){
        destCoords.longitude=destinationLongitude.value;
    } else{
        destCoords.longitude=0;
        destinationLongitude.value=0;
    }
    getMyLocation();
    this.blur();
};

button.onmousedown=function(){
    button.style.backgroundColor="#0F0EAE";
    button.style.color="white";
};

button.onmouseup=function(){
    button.style.backgroundColor="";
    button.style.color="black";
};

button.ontouchstart=function(){
    button.style.backgroundColor="#0F0EAE";
    button.style.color="white";
};

button.ontouchend=function(){
    button.style.backgroundColor="";
    button.style.color="black";
};

codeImg.src="images/code1.png";
