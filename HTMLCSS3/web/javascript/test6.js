var header = document.getElementsByTagName("header");
var displayText = document.getElementById("displayText");
var codeImg = document.getElementById("codeImg");
var buttonCanvas = document.getElementById("previewButton");
var buttonTweets = document.getElementById("updateTweetsButton");
var canvas;
var waitingTimeOutDisplay=false;
var waitingTimeOutFace=false;
var body = document.getElementsByTagName("body")[0];
var JSONPScript;

header[0].innerHTML="Canvas example:";

window.onload=function(){
    buttonTweets.onclick=setJSONP;
    buttonCanvas.onclick=previewHandler;
};

function previewHandler(){
    if(!canvas){
        canvas = createCanvas();
    }
    var context = canvas.getContext("2d");
    fillBgColor(canvas,context);
    var selectObject = document.getElementById("shape");
    var index = selectObject.selectedIndex;
    var shape = selectObject[index].value;
    if(shape==="squares"){
        for(var i=0;i<20;i++){
            drawSquare(canvas,context);
        }
    } else if(shape==="circles"){
        for(var i=0;i<20;i++){
            drawCircle(canvas,context);
        }
    }
    drawTriangle(canvas,context);
    drawText(canvas,context);
    drawImageTweet(canvas,context);
    if(waitingTimeOutFace===false){
        waitingTimeOutFace=true;
        window.setTimeout(function(){fillBgColor(canvas,context);drawFace(canvas,context);waitingTimeOutFace=false;},25000);
    }
}

function createCanvas(){
    var canvas = document.createElement("canvas");
    canvas.setAttribute("width",600);
    canvas.setAttribute("height",300);
    canvas.setAttribute("id","myCanvas");
    document.getElementById("draw").appendChild(canvas);
    return canvas;
}

function fillBgColor(canvas,context){
    var selectObject = document.getElementById("backgroundColor");
    var index = selectObject.selectedIndex;
    var bgColor = selectObject[index].value;
    if(bgColor==="white"){
        context.fillStyle="white";
    } else{
        context.fillStyle="black";
    }
    context.fillRect(0,0,canvas.width,canvas.height);
}

function drawSquare(canvas,context){
    var w = Math.floor(Math.random()*40);
    var x = Math.floor(Math.random()*canvas.width);
    var y = Math.floor(Math.random()*canvas.height);
    context.fillStyle = "lightblue";
    context.fillRect(x,y,w,w);
};

function drawTriangle(canvas,context){
    var pointA = {x:Math.floor(Math.random()*canvas.width),y:Math.floor(Math.random()*canvas.height)};
    var pointB = {x:Math.floor(Math.random()*canvas.width),y:Math.floor(Math.random()*canvas.height)};
    var pointC = {x:Math.floor(Math.random()*canvas.width),y:Math.floor(Math.random()*canvas.height)};
    context.beginPath();
    context.moveTo(pointA.x,pointA.y);
    context.lineTo(pointB.x,pointB.y);
    context.lineTo(pointC.x,pointC.y);
    context.closePath();
    context.lineWidth=5;
    context.strokeStyle="chartreuse";
    context.stroke();
    context.fillStyle="blue";
    context.fill();
};

function drawCircle(canvas,context){
    var radius = Math.floor(Math.random()*30);
    var x = Math.floor(Math.random()*canvas.width);
    var y = Math.floor(Math.random()*canvas.height);
    context.beginPath();
    context.arc(x,y,radius,0,degreeToRad(360),true);
    context.fillStyle="lightblue";
    context.fill();
    context.lineWidth=2;
    context.strokeStyle="red";
    context.stroke();
}

function degreeToRad(degree){
    return degree*Math.PI/180;
}

function drawFace(canvas,context){
    context.beginPath();
    context.arc(canvas.width/2,canvas.height/2,canvas.width/4-10,0,degreeToRad(360),true);
    context.fillStyle="#ffff00";
    context.fill();
    context.strokeStyle="black";
    context.lineWidth=1;
    context.stroke();
    
    context.beginPath();
    context.arc(canvas.width/2-35,60,10,0,degreeToRad(360),true);
    context.fillStyle="lightgreen";
    context.fill();
    context.strokeStyle="black";
    context.stroke();
    
    context.beginPath();
    context.arc(canvas.width/2+35,60,10,0,degreeToRad(360),true);
    context.fillStyle="lightgreen";
    context.fill();
    context.strokeStyle="black";
    context.stroke();
    
    context.beginPath();
    context.moveTo(canvas.width/2,90);
    context.lineTo(canvas.width/2,110);
    context.strokeStyle="black";
    context.stroke();
    
    context.beginPath();
    context.arc(canvas.width/2,canvas.height/1.7,canvas.width/9,degreeToRad(150),degreeToRad(30),true);
    context.strokeStyle="black";
    context.stroke();
    
    context.beginPath();
    context.moveTo(canvas.width/2-45,40);
    context.lineTo(canvas.width/2-20,30);
    context.strokeStyle="black";
    context.stroke();
    
    context.beginPath();
    context.moveTo(canvas.width/2+45,40);
    context.lineTo(canvas.width/2+20,30);
    context.strokeStyle="black";
    context.stroke();
}

function setJSONP(){
    var src = "http://tweetshirt.wickedlysmart.com/?callback=updateTweets";
    JSONPScript = document.createElement("script");
    JSONPScript.setAttribute("id","JSONPScript");
    JSONPScript.setAttribute("src",src);
    body.replaceChild(JSONPScript,document.getElementById("JSONPScript"));
}

function updateTweets(tweets){
    var tweetsSelection = document.getElementById("tweets");
    for(var i=tweetsSelection.options.length-1; i>-1;i--){
        tweetsSelection.options.remove(tweetsSelection.options[i]);
    }
    var blankObj = document.createElement("option");
    blankObj.text="choose one";
    blankObj.value="choose one";
    tweetsSelection.options.add(blankObj);
    for(var i=0; i<tweets.length;i++){
        var tweet = tweets[i];
        var option = document.createElement("option");
        option.text=tweet.text;
        option.value=tweet.text.replace("\"","'");
        tweetsSelection.options.add(option);
    }
    tweetsSelection.selectedIndex = 0;
    confirmUpdateOnDisplay();
}

function confirmUpdateOnDisplay(){
    var confirmTextP = document.createElement("p");
    confirmTextP.style.backgroundColor="red";
    confirmTextP.style.fontSize="0.8em";
    confirmTextP.style.marginTop="-1em";
    confirmTextP.innerHTML="Tweets Updated Successfully !!<br>"+(new Date());
    displayText.insertBefore(confirmTextP,displayText.firstChild);
    if(waitingTimeOutDisplay===false){
        waitingTimeOutDisplay=true;
        window.setTimeout(clearDisplay,10000);
        function clearDisplay(){
            while(displayText.childNodes.length!==0){
                displayText.removeChild(displayText.lastChild);
            }
            waitingTimeOutDisplay=false;
        }
    }
}

function drawText(canvas,context){
    var selectObject = document.getElementById("foregroundColor");
    var index = selectObject.selectedIndex;
    var fgColor = selectObject[index].value;
    
    context.font="normal 3em serif";
    context.textAlign="left";
    context.strokeStyle="chartreuse";
    context.lineWidth=2;
    context.strokeText("I saw this tweet",15,50);
    
    context.font="bold 1.2em sans-serif";
    context.fillStyle=fgColor;
    context.textAlign="right";
    context.textBaseline="bottom";
    context.fillText("and all I got was this lousy t-shirt!",0.98*canvas.width,0.9*canvas.height);
    context.beginPath();
    context.moveTo(0.45*canvas.width,0.9*canvas.height);
    context.lineTo(canvas.width,0.9*canvas.height);
    context.stroke();
    
    selectObject = document.getElementById("tweets");
    index = selectObject.selectedIndex;
    var tweet = selectObject[index].value;
    context.font="italic 1.0em sans-serif";
    context.fillStyle=fgColor;
    context.textAlign="center";
    context.shadowBlur=10;
    context.shadowColor="red";
    context.fillText(tweet,canvas.width/2,canvas.height/2);
    context.shadowBlur=0;
}

function drawImageTweet(canvas,context){
    var imageTweet = new Image();
    imageTweet.src="images/tweet.png";
    imageTweet.onload = function(){
        context.drawImage(imageTweet,10,0.6*canvas.height,120,120);
    };
}
