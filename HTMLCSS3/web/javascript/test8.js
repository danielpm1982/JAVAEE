var header = document.getElementsByTagName("header");
var displayText = document.getElementById("displayText");
var body = document.getElementsByTagName("body")[0];
var saveButton = document.getElementById("saveButton");
var retrieveButton = document.getElementById("retrieveButton");
var clearButton = document.getElementById("clearButton");
var resetFieldsButton = document.getElementById("resetFieldsButton");
var localStorageButton = document.getElementById("localStorageButton");

header[0].innerHTML="Web Storage example:";

window.onload=function(){
    saveButton.onclick=function(){
        if(!checkIfFieldsAreEmpty()){
            if(checkData()){
                saveData();
                alert("Data Updated!");
            } else{
                saveData();
                alert("Data Saved!");
            }
            setAllFieldsNormal();
        } else{
            alert("Cannot save empty fields ! Fill out at least one!");
            setAllFieldsBorderRed();
        }
        displayText.innerHTML="";
        this.blur();
    };
    retrieveButton.onclick=function(){
        var dataArray = retrieveData();
        if(checkData()!==false&&dataArray.length>0){
            showData(dataArray);
        } else{
            alert("No Data at LocalStorage!");
        }
        this.blur();
        setAllFieldsNormal();
    };
    clearButton.onclick=function(){
        if(checkData()!==false){
            clearData();
            displayText.innerHTML="";
            alert("Data Cleared!");
        } else{
            alert("No Data at LocalStorage!");
        }
        this.blur();
        setAllFieldsNormal();
    };
    resetFieldsButton.onclick=function(){
        resetFields();
        displayText.innerHTML="";
        this.blur();
        setAllFieldsNormal();
    };
    localStorageButton.onclick=function(){
        showLocalStorage();
        this.blur();
    };
    setFieldsOnKeyPressHandler();
};

function checkIfFieldsAreEmpty(){
    if(document.getElementById("name").value||
        document.getElementById("address").value||
        document.getElementById("postalCode").value||
        document.getElementById("city").value||
        document.getElementById("state").value||
        document.getElementById("country").value){
        return false;
    } else{
        return true;
    }
}

function setAllFieldsBorderRed(){
    var query = document.querySelectorAll("div.tableCell2 input[type=text]");
    for(var i=0;i<query.length;i++){
        query[i].style.border="6px double red";
        query[i].onfocus=function(){
            this.style.border="";
        };
    }
}

function setAllFieldsNormal(){
    var query = document.querySelectorAll("div.tableCell2 input[type=text]");
    for(var i=0;i<query.length;i++){
        query[i].style.border="";
    }
}

function resetFields(){
    var query = document.querySelectorAll("div.tableCell2 input[type=text]");
    for(var i=0;i<query.length;i++){
        query[i].value="";
    }
}

function setFieldsOnKeyPressHandler(){
    var query = document.querySelectorAll("div.tableCell2 input[type=text]");
    for(var i=0;i<query.length;i++){
        query[i].onkeypress=function(k){
            if(k.keyCode===13){
                saveButton.click();
            }
        };
    }
}

function saveData(){
    /*
     In this app it wouldn't make sense to have multiple values for the same field,
    but in other apps, if it would, it could be used (new Date()).getTime concatenated
    to each key to make them unique (maybe this string also added as an id of the html element
    for getting it, if necessary, later (for deleting from the DOM, for instance), and maybe 
    another String, also concatenated to the key to indicate which app the key refers 
    to (like "test8" below). In localStorage or sessionStorage the key/value pairs of every input 
    of every app and web page of that domain are all mixed. So the key naming should be worked to be 
    the most meaningful and unique as possible for the app and for the input itself. And the keys
    could be put into an array stringified with JSON and stored as well, to make retrieving methods
    easier for the keys of that app alone (not of others). If other properties (like style or multiple
    values) would have to be stored for each key, they could be put into an object and the object
    stringified with JSON to be stored with that key at the localStore.
     */
    
    var arrayWithKeysForThisApp = JSON.parse(localStorage.getItem("arrayWithKeysForThisApp"));
    if(!arrayWithKeysForThisApp){
        arrayWithKeysForThisApp=[];
    }
    if(document.getElementById("name").value){
        var key = "name"+("Test8");
        localStorage.setItem(key,document.getElementById("name").value);
        if(!testArrayContainsKey(arrayWithKeysForThisApp,key))
            arrayWithKeysForThisApp.push(key);
    }
    if(document.getElementById("address").value){
        var key = "address"+("Test8");
        localStorage.setItem(key,document.getElementById("address").value);
        if(!testArrayContainsKey(arrayWithKeysForThisApp,key))
            arrayWithKeysForThisApp.push(key);
    }
    if(document.getElementById("postalCode").value){
        var key = "postalCode"+("Test8");
        localStorage.setItem(key,document.getElementById("postalCode").value);
        if(!testArrayContainsKey(arrayWithKeysForThisApp,key))
            arrayWithKeysForThisApp.push(key);
    }
    if(document.getElementById("city").value){
        var key = "city"+("Test8");
        localStorage.setItem(key,document.getElementById("city").value);
        if(!testArrayContainsKey(arrayWithKeysForThisApp,key))
            arrayWithKeysForThisApp.push(key);
    }
    if(document.getElementById("state").value){
        var key = "state"+("Test8");
        localStorage.setItem(key,document.getElementById("state").value);
        if(!testArrayContainsKey(arrayWithKeysForThisApp,key))
            arrayWithKeysForThisApp.push(key);
    }
    if(document.getElementById("country").value){
        var key = "country"+("Test8");
        localStorage.setItem(key,document.getElementById("country").value);
        if(!testArrayContainsKey(arrayWithKeysForThisApp,key))
            arrayWithKeysForThisApp.push(key);
    }
    localStorage.setItem("arrayWithKeysForThisApp",JSON.stringify(arrayWithKeysForThisApp));
}

function testArrayContainsKey(array,key){
   for(var i=0;i<array.length;i++){
       if(array[i]===key){
           return true;
       }
   }
   return false;
}

function retrieveData(){
    //Iteration using .key() and length of localStorage, as in showLocalStorage() method,
    //would not work for the other methods because it would iterate over all localStorage
    //and not only through data of this app... and that's what the arrayWithKeysForThisApp
    //array was created for. Otherwise each data would have to be got individually from 
    //localStore even when order did not matter, the data wouldn't be confounded with
    //other app's data.
    
    //if order is not needed:
//    var arrayWithKeysForThisApp = JSON.parse(localStorage.getItem("arrayWithKeysForThisApp"));
//    if(arrayWithKeysForThisApp&&arrayWithKeysForThisApp.length>0){
//        var personalInfoArray=[];
//        for (var i=0;i<arrayWithKeysForThisApp.length;i++){
//            personalInfoArray.push(localStorage.getItem(arrayWithKeysForThisApp[i]));
//        }
//        return personalInfoArray;
//    }
    
    //if order is needed:
    var personalInfoArray=[];
    var name = localStorage.getItem("name"+"Test8");
    var address = localStorage.getItem("address"+"Test8");
    var postalCode = localStorage.getItem("postalCode"+"Test8");
    var city = localStorage.getItem("city"+"Test8");
    var state = localStorage.getItem("state"+"Test8");
    var country = localStorage.getItem("country"+"Test8");
    if(name)
        personalInfoArray.push(name);
    if(address)
        personalInfoArray.push(address);
    if(postalCode)
        personalInfoArray.push(postalCode);
    if(city)
        personalInfoArray.push(city);
    if(state)
        personalInfoArray.push(state);
    if(country)
        personalInfoArray.push(country);
    return personalInfoArray;
}

function showData(data){
    displayText.innerHTML="";
    for (var i=0;i<data.length;i++){
        displayText.innerHTML+=data[i]+"<br>";
    }
}

function clearData(){
//  Not a good option 'cause it would erase any data stored from other apps too.
//    localStorage.clear();

//  Only the data from this app should be individually removed:
    var arrayWithKeysForThisApp = JSON.parse(localStorage.getItem("arrayWithKeysForThisApp"));
    if(arrayWithKeysForThisApp&&arrayWithKeysForThisApp.length>0){
        for (var i=0;i<arrayWithKeysForThisApp.length;i++){
            localStorage.removeItem(arrayWithKeysForThisApp[i]);
        }
        localStorage.removeItem("arrayWithKeysForThisApp");
    }

//to remove data by data
//localStorage.removeItem("name"+"Test8");
//localStorage.removeItem("address"+"Test8");
//localStorage.removeItem("postalCode"+"Test8");
//localStorage.removeItem("city"+"Test8");
//localStorage.removeItem("state"+"Test8");
//localStorage.removeItem("country"+"Test8");
}

function checkData(){
    //see if there is at least one field data stored, from this app, at localStorage.
    //In order to display alert messages according to updating or new savings.
    //Ideally, it should check if the exact filled field data existed, each saving time,
    //and not any field data previously saved. But, for this method, it was considered
    //the profile as a whole (if a new or an updating person profile being saved).
    //For the clear() method, instead, that wouldn't matter. If any data, of this app,
    //existed, it should be cleared no matter from which fields.
    var checked = false;
    var arrayWithKeysForThisApp = JSON.parse(localStorage.getItem("arrayWithKeysForThisApp"));
    if(arrayWithKeysForThisApp&&arrayWithKeysForThisApp.length>0){
        for (var i=0;i<arrayWithKeysForThisApp.length;i++){
            if(localStorage.getItem(arrayWithKeysForThisApp[i])){
                checked=true;
                break;
            }
        }
    }
    return checked;
    
    //if to check individual data:
//    if(localStorage.getItem("name"+"Test8")||
//        localStorage.getItem("address"+"Test8")||
//        localStorage.getItem("postalCode"+"Test8")||
//        localStorage.getItem("city"+"Test8")||
//        localStorage.getItem("state"+"Test8")||
//        localStorage.getItem("country"+"Test8")){
//    return true;
//    } else{
//        return false;
//    }
    
//  The option below wouldn't work properly 'cause other apps storage would give a
//  non empty localStorage status (length!=0), even when this app's fields data were empty.
//    if(localStorage.length){
//        return true;
//    } else{
//        return false;
//    }
}

function showLocalStorage(){
    if(localStorage.length>0){
        var stringToShow="Local Storage Key/Value data ("+localStorage.length+" items):\n"+"(not in any order)\n"+"\n";
        for(var i=0;i<localStorage.length;i++){
            var key = localStorage.key(i);
            var value = localStorage[key];
            stringToShow+=key+": "+value+"\n";
        }
        alert(stringToShow);
    } else{
        alert("Empty localStorage!");
    }
}
