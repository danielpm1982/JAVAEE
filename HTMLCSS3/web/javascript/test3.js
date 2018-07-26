var header = document.getElementsByTagName("header");
var displayMap = document.getElementById("displayMap");
var displayText = document.getElementById("displayText");
var codeImg = document.getElementById("codeImg");
var originLatitude = document.getElementById("originLatitude");
var originLongitude = document.getElementById("originLongitude");
var buttonSearch = document.getElementById("buttonSearch");
var buttonWatch = document.getElementById("buttonWatch");
var buttonClearWatch = document.getElementById("buttonClearWatch");
var mapOrigin=null;
var watchId;
var previousCoords;

header[0].innerHTML="Geolocation example:";

function getMyLocation(){
    createWaitAlert();
    navigator.geolocation.getCurrentPosition(displayLocation,displayError,{enableAccuracyHigh: true, timeout: Infinity, maximumAge: 0});
}

function watchMyLocation(){
    createWaitAlert();
    watchId = navigator.geolocation.watchPosition(displayLocation,displayError,{enableAccuracyHigh: true, timeout: Infinity, maximumAge: 0});
    alert("started watching");
}

function clearWatch(){
    navigator.geolocation.clearWatch(watchId);
    alert("stopped watching");
}

function displayLocation(position){
    if(mapOrigin===null){
        showMapOrigin(position.coords);
        previousCoords=position.coords;
        displayCoords();
    } else{
        if(computeDistance(previousCoords,position.coords)*1000>0){
            scrollMapToPosition(position.coords);
            previousCoords=position.coords;
            displayCoords();
        }
    }
    function displayCoords(){
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;
        originLatitude.value=latitude;
        originLongitude.value=longitude;
        displayText.innerHTML+="Origin Latitude ("+new Date(position.timestamp)+"): ";
        createDisplayP(latitude);
        displayText.innerHTML+="<br>";
        displayText.innerHTML+="Origin Longitude ("+new Date(position.timestamp)+"): ";
        createDisplayP(longitude);
        displayText.innerHTML+="<br>";
    }
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
    displayText.innerHTML=errorMessage;
    displayText.innerHTML+="<br>";
    removeWaitAlert();
}

function createDisplayP(text){
    var elementObject = document.createElement("P");
    elementObject.innerHTML+=text;
    elementObject.setAttribute("class","displayP");
    displayText.appendChild(elementObject);
}

function createWaitAlert(){
    var waitAlert = document.createElement("P");
    waitAlert.innerHTML="Waiting geolocation search or watch...";
    waitAlert.setAttribute("class","waitAlert");
    waitAlert.style.fontSize="0.8em";
    waitAlert.style.fontFamily="cursive";
    waitAlert.style.borderStyle="solid";
    waitAlert.style.width="18em";
    waitAlert.style.margin="auto";
    waitAlert.style.marginTop="1.5em";
    waitAlert.style.marginBottom="1em";
    displayText.insertBefore(waitAlert,displayText.childNodes[0]);
}

function removeWaitAlert(){
    var arrayResult = displayText.getElementsByClassName("waitAlert");
    Array.prototype.forEach.call(arrayResult,function(element){displayText.removeChild(element);});
}

function showMapOrigin(coords){
    var googleLatAndLong = new google.maps.LatLng(coords.latitude,coords.longitude);
    var mapOptions = {
        zoom: 14,
        center: googleLatAndLong,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    if(displayMap.childNodes[0]){
        displayMap.removeChild(document.getElementById("mapOrigin"));
    }
    var mapDiv = document.createElement("div");
    mapDiv.setAttribute("id","mapOrigin");
    displayMap.appendChild(mapDiv);

    mapOrigin = new google.maps.Map(mapDiv,mapOptions);
    addMarker(mapOrigin,googleLatAndLong,"initialLocation",createPinP(coords));
}

function scrollMapToPosition(coords){
    var googleLatAndLong = new google.maps.LatLng(coords.latitude,coords.longitude);
    mapOrigin.panTo(googleLatAndLong);
    addMarker(mapOrigin,googleLatAndLong,"new location",createPinP(coords));
}

function createPinP(coords){
    var pinP = document.createElement("P");
    pinP.innerHTML="Latitude: "+coords.latitude+"<br>Longitude: "+coords.longitude;
    pinP.style.fontSize="0.7em";
    pinP.style.fontWeight="400";
    pinP.style.fontFamily="cursive";
    pinP.style.backgroundColor="black";
    pinP.style.color="blanchedalmond";
    return pinP;
}

function addMarker(map,latlong,title,content){
    var markerOptions = {
        map: map,
        position: latlong,
        title: title,
        clickable: true
    };
    var marker = new google.maps.Marker(markerOptions);
    var infoWindowOptions = {
        content: content,
        position: latlong
    };
    var infoWindow = new google.maps.InfoWindow(infoWindowOptions);
    google.maps.event.addListener(marker,"click",function(){infoWindow.open(map);});
}

buttonSearch.onclick=function(){
    getMyLocation();
    this.blur();
};

buttonWatch.onclick=function(){
    watchMyLocation();
    this.blur();
};

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

buttonClearWatch.onclick=function(){
    clearWatch();
    this.blur();
};

function addButtonStyleHandlers(button){
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
}
addButtonStyleHandlers(buttonSearch);
addButtonStyleHandlers(buttonWatch);
addButtonStyleHandlers(buttonClearWatch);

codeImg.src="images/code3.png";
