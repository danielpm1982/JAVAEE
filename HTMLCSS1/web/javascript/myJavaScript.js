var userNameDialogue = document.getElementById("userNameDialogue");
var userName = document.getElementById("userName");
var button = document.getElementById("button");
var errorImage = document.getElementById("errorImage");
var userNameDialogueIsChangingColor = true;
var interval;

//Example of using function references as a first class value (in this case, an argument) with polimorphic and more generic functions
//in this case, it could be used validateInput directly, as the only thing in this page to be validated is, for now, the userName field value.
//But other kinds of validation, or elements, and also, generic algorithmic code for all of such different validations, could be add to 
//the validadeAnything function in order to create a more mantainable, extensible and less error-prone design.
function validateAnyThing(thingToValidade,validatorFunction){
    var valid = false;
    valid = validatorFunction(thingToValidade);
    return valid;
}

function validateInput(input){
    var validInput = false;
    if(input!==null&&input.trim()!==""){
        validInput = true;
        changeUserNameDialogue(validInput,input);
        changeForm(validInput);
        switchChangingColor("off");
    } else{
        validInput = false;
        changeUserNameDialogue(validInput);
        changeForm(validInput);
        switchChangingColor("on");
    }
    printConsole(userNameDialogue);
    return validInput;
}

function changeUserNameDialogue(validInput,input){
    if(validInput){
        userNameDialogue.removeAttribute("class");
        userNameDialogue.style.color="";
        userNameDialogue.innerHTML = "Hello "+input+",";
    } else{
        userNameDialogue.setAttribute("class","redText");
        userNameDialogue.innerHTML = "The name you entered is null or empty!";
    }
}

function changeForm(validInput){
    if(validInput){
        userName.parentNode.removeChild(userName);
        button.parentNode.removeChild(button);
    } else{
        if(userName.parentNode===null){
            addForm();
        }
    }
}

function addForm(){
    userName.value="";
    userName.style.marginRight="0.4em";
    document.getElementById("form").appendChild(userName);
    document.getElementById("form").appendChild(button);
}

function switchChangingColor(option){
    if(option==="on"){
        if(!userNameDialogueIsChangingColor){
            startInterval();
            userNameDialogueIsChangingColor=true;
        }
    }
    else {
        stopInterval();
        userNameDialogueIsChangingColor=false;
    }
}

function startInterval(){
    interval = window.setInterval(changeColor,300);
    function changeColor(){
        var r = Math.floor(Math.random()*256);
        var g = Math.floor(Math.random()*256);
        var b = Math.floor(Math.random()*256);
        var rgb = "rgb("+r+","+g+","+b+")";
        userNameDialogue.style.color=rgb;
    }
}

function stopInterval(){
    window.clearInterval(interval);
}

function printConsole(element){
    console.log(element.innerHTML);
    console.log("innerHTML: "+element.innerHTML);
    console.log("outerHTML: "+element.outerHTML);
}

function proceedInputValidation(x){
    var valid = false;
    valid=validateAnyThing(x,validateInput);
    //if valid, userName.value must be set to not null and not empty in order to the userNameDialogue.onmouseout not make it start glowing!
    //although the value itself will not be used or shown in this case... only the x value.
    if(valid){
        userName.value=x;
    } else{
        userName.value="";
    }
    userNameDialogue.onmouseout();
//    userName.blur();
}

userNameDialogue.onclick=function(){
    var x = prompt("What's your name ?");
    proceedInputValidation(x);
};

button.onclick = function(){
    var x = userName.value;
    proceedInputValidation(x);
};

userName.onkeypress=function(eventObject){
    var x = userName.value;
    if(eventObject.keyCode===13){
        eventObject.preventDefault();
        proceedInputValidation(x);
    }
};

userName.onfocus=function(){
    switchChangingColor("off");
    userNameDialogue.style.color="";
};

userName.onblur=function(){
    if(userName===null||userName.value.trim()===""){
        switchChangingColor("on");
    }
};

userNameDialogue.onmouseover=function(){
    switchChangingColor("off");
    userNameDialogue.style.color="";
    if(userNameDialogue.getAttribute("class")==="redText"){
        userNameDialogue.style.fontWeight="bolder";
        userNameDialogue.style.fontSize="3em";
        userNameDialogue.style.border="dashed 0.1em white";
    }
};

userNameDialogue.onmouseout=function(){
    if(userNameDialogue.getAttribute("class")==="redText"||userName.value===null||userName.value.trim()===""){
        switchChangingColor("on");
    }
    userNameDialogue.style.color="";
    userNameDialogue.style.backgroundColor="";
    userNameDialogue.style.fontWeight="";
    userNameDialogue.style.fontSize="";
    userNameDialogue.style.border="";
};

errorImage.onmouseover=function(){
    errorImage.src="images/error2.png";
};

errorImage.onmouseout=function(){
    errorImage.src="images/error.png";
};

window.onload = startInterval;