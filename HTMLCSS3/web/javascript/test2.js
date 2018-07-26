var header = document.getElementsByTagName("header");
var display = document.getElementById("display");
var codeImg = document.getElementById("codeImg");
var originLatitude = document.getElementById("originLatitude");
var originLongitude = document.getElementById("originLongitude");
var button = document.getElementById("button");
var mapOrigin;

header[0].innerHTML="Geolocation example:";

function getMyLocation(){
    createWaitAlert();
    navigator.geolocation.getCurrentPosition(displayLocation,displayError,{enableHighAccuracy: true,timeout: Infinity, maximumAge: 0});
}

function displayLocation(position){
    display.innerHTML+=new Date(position.timestamp)+":<br>";
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
    originLatitude.value=latitude;
    originLongitude.value=longitude;
    display.innerHTML+="Origin Latitude: ";
    createDisplayP(latitude);
    display.innerHTML+="<br>";
    display.innerHTML+="Origin Longitude: ";
    createDisplayP(longitude);
    display.innerHTML+="<br>";
    display.innerHTML+="Accuracy (in meters): ";
    createDisplayP(position.coords.accuracy);
    display.innerHTML+="<br><br>";
    removeWaitAlert();
    showMapOrigin(position.coords);
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
    display.innerHTML=errorMessage;
}

function createDisplayP(text){
    var elementObject = document.createElement("P");
    elementObject.innerHTML+=text;
    elementObject.setAttribute("class","displayP");
    display.appendChild(elementObject);
}

function createWaitAlert(){
    var waitAlert = document.createElement("P");
    waitAlert.innerHTML="Waiting geolocation search...";
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
    var objectToRemove = document.getElementById("waitAlert");
    if(objectToRemove){
        display.removeChild(objectToRemove);
    }
}

function showMapOrigin(coords){
    var googleLatAndLong = new google.maps.LatLng(coords.latitude,coords.longitude);
    var mapOptions = {
        zoom: 14,
        center: googleLatAndLong,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    mapOrigin = new google.maps.Map(createMapDiv(),mapOptions);
    addMarker(mapOrigin,googleLatAndLong,"locationPin",createPinP(coords));
}

function createMapDiv(){
    var mapDiv=document.getElementById("mapOrigin");
    if(mapDiv){
        display.removeChild(mapDiv);
        mapDiv=null;
    }
    mapDiv = document.createElement("div");
    mapDiv.setAttribute("id","mapOrigin");
    display.appendChild(mapDiv);
    return mapDiv;
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

button.onclick=function(){
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

codeImg.src="images/code2.png";
