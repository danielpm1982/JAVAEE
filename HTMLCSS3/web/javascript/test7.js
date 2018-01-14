var header = document.getElementsByTagName("header");
var displayText = document.getElementById("displayText");
var body = document.getElementsByTagName("body")[0];
var position = 0;
var playlist;
var video;
var effectFunction;
var filterColorButtonPressed=false;
var sepiaColorButtonPressed=false;
var invertColorButtonPressed=false;
var bwcartoonColorButtonPressed=false;

header[0].innerHTML="Video/Canvas example:";

window.onload=function(){
    setButtons();
    setPlayList();
    video = document.getElementById("video");
    video.addEventListener("ended",nextVideo,false);
    video.src=playList[position]+getFormatExtension();
    video.poster=playList[position]+".png";
    video.load();
    video.play();
    video.addEventListener("play",processFrame,false);
    console.log("Playing: "+video.src);
};

function setButtons(){
    var controls = document.querySelectorAll("a.controls");
    for (var i=0;i<controls.length;i++){
        controls[i].addEventListener("click",controlHandler,false);
    }
    var selectors = document.querySelectorAll("a.selectors");
    for (var i=0;i<selectors.length;i++){
        selectors[i].addEventListener("click",selectorHandler,false);
    }
    var effects = document.querySelectorAll("input[type=button].effects");
    for (var i=0;i<effects.length;i++){
        effects[i].addEventListener("click",effectHandler,false);
    }
}

function controlHandler(e){
    var eventListenerId = e.target.getAttribute("id");
    if(eventListenerId==="play"){
        if(video.ended){
            video.load();
            video.play();
        }
        video.play();
    } else if(eventListenerId==="pause"){
        video.pause();
    } else if(eventListenerId==="stop"){
        video.load();
    } else if(eventListenerId==="next"){
        nextVideo();
    } else if(eventListenerId==="previous"){
        previousVideo();
    }
}

function selectorHandler(e){
    var eventListenerId = e.target.getAttribute("id");
    if(eventListenerId==="video1"){
        position=1;
        video.src="videos/video1"+getFormatExtension();
        video.poster="images/video1.png";
        video.load();
        video.play();
    } else if(eventListenerId==="video2"){
        position=3;
        video.src="videos/video2"+getFormatExtension();
        video.poster="images/video2.png";
        video.load();
        video.play();
    } else if(eventListenerId==="video3"){
        position=5;
        video.src="videos/video3"+getFormatExtension();
        video.poster="images/video3.png";
        video.load();
        video.play();
    } else if(eventListenerId==="video4"){
        position=7;
        video.src="videos/video4"+getFormatExtension();
        video.poster="images/video4.png";
        video.load();
        video.play();
    }
}

function effectHandler(e){
    var eventListenerId = e.target.getAttribute("id");
    if(eventListenerId==="filterColorButton"){
        if(!filterColorButtonPressed){
            setButtonPressedAllFalse();
            setStyleBackgroundAllEmpty();
            filterColorButtonPressed=true;
            e.target.style.backgroundColor="chartreuse";
            effectFunction=filterColorFunction;
        } else{
            effectFunction="";
            setButtonPressedAllFalse();
            setStyleBackgroundAllEmpty();
        }
    }
    if(eventListenerId==="sepiaColorButton"){
        if(!sepiaColorButtonPressed){
            setButtonPressedAllFalse();
            setStyleBackgroundAllEmpty();
            sepiaColorButtonPressed=true;
            e.target.style.backgroundColor="chartreuse";
            effectFunction=sepiaColorFunction;
        } else{
            effectFunction="";
            setButtonPressedAllFalse();
            setStyleBackgroundAllEmpty();
        }
    }
    if(eventListenerId==="invertColorButton"){
        if(!invertColorButtonPressed){
            setButtonPressedAllFalse();
            setStyleBackgroundAllEmpty();
            invertColorButtonPressed=true;
            e.target.style.backgroundColor="chartreuse";
            effectFunction=invertColorFunction;
        } else{
            effectFunction="";
            setButtonPressedAllFalse();
            setStyleBackgroundAllEmpty();
        }
    }
    if(eventListenerId==="bwcartoonColorButton"){
        if(!bwcartoonColorButtonPressed){
            setButtonPressedAllFalse();
            setStyleBackgroundAllEmpty();
            bwcartoonColorButtonPressed=true;
            e.target.style.backgroundColor="chartreuse";
            effectFunction=bwcartoonColorFunction;
        } else{
            effectFunction="";
            setButtonPressedAllFalse();
            setStyleBackgroundAllEmpty();
        }
    }
    function setStyleBackgroundAllEmpty(){
        var effectsButtons = document.querySelectorAll("input[type=button].effects");
        for (var i=0;i<effectsButtons.length;i++){
            effectsButtons[i].style.backgroundColor="";
        }
    }
    function setButtonPressedAllFalse(){
        filterColorButtonPressed=false;
        sepiaColorButtonPressed=false;
        invertColorButtonPressed=false;
        bwcartoonColorButtonPressed=false;
    }
}

function processFrame(){
    if(video.paused||video.ended){
        return;
    }
    var bufferCanvas = document.getElementById("buffer");
    var displayCanvas = document.getElementById("display");
    var buffer = bufferCanvas.getContext("2d");
    var display = displayCanvas.getContext("2d");
    buffer.drawImage(video,0,0,bufferCanvas.width,bufferCanvas.height);
    var frame = buffer.getImageData(0,0,bufferCanvas.width,bufferCanvas.height);
    var length = frame.data.length/4;
    for(var i=0;i<length;i++){
        var r = frame.data[i*4+0];
        var g = frame.data[i*4+1];
        var b = frame.data[i*4+2];
        if(effectFunction){
            effectFunction(i,r,g,b,frame.data);
        }
    }
    display.putImageData(frame,0,0);
    window.setTimeout(processFrame,0);
}

function filterColorFunction(pos,r,g,b,data){
     var brightness = (3*r + 4*g + b) >>> 3;
     if (brightness < 0) brightness = 0;
     data[pos * 4 + 0] = brightness;
     data[pos * 4 + 1] = brightness;
     data[pos * 4 + 2] = brightness; 
}

function sepiaColorFunction(pos,r,g,b,data){
     var brightness = (3*r + 4*g + b) >>> 3;
     data[pos * 4 + 0] = brightness+40;
     data[pos * 4 + 1] = brightness+20;
     data[pos * 4 + 2] = brightness-20; 
}

function invertColorFunction(pos,r,g,b,data){
     var offset =  pos * 4;
     data[offset] = Math.round(255 - r);
     data[offset+1] = Math.round(255 - g);
     data[offset+2] = Math.round(255 - b); 
}

function bwcartoonColorFunction(pos,r,g,b,outputData){
     var offset =  pos * 4;
     if( outputData[offset] < 120 ) {
         outputData[offset] = 80;
         outputData[++offset] = 80;
         outputData[++offset] = 80;
     } else {
         outputData[offset] = 255;
         outputData[++offset] = 255;
         outputData[++offset] = 255;
     }
     outputData[++offset] = 255;
     ++offset; 
}

function setPlayList(){
    playList = ["videos/countdown","videos/video1","videos/countdown","videos/video2","videos/countdown","videos/video3","videos/countdown","videos/video4"];
}

function nextVideo(){
    position++;
    if(position>=playList.length){
        position=0;
    }
    video.src=playList[position]+getFormatExtension();
    video.poster=playList[position]+".png";
    video.load();
    video.play();
    console.log("Playing: "+video.src);
}

function previousVideo(){
    position--;
    if(position<0){
        position=playList.length-1;
    }
    video.src=playList[position]+getFormatExtension();
    video.poster=playList[position]+".png";
    video.load();
    video.play();
    console.log("Playing: "+video.src);
}

function getFormatExtension(){
    if(video.canPlayType("video/mp4")!==""){
        return ".mp4";
//    } else if(video.canPlayType("video/webm")!==""){
//        return ".webm";
//    } else if(video.canPlayType("video/ogg")!==""){
//        return ".ogg";
    }
}
