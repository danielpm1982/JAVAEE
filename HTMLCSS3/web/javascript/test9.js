var header = document.getElementsByTagName("header")[0];
var displayText = document.getElementById("displayText");
var displayVideo = document.getElementById("displayVideo");
var body = document.getElementsByTagName("body")[0];
var audio1 = document.getElementById("audio1");
var audio2 = document.getElementById("audio2");
var audio3 = document.getElementById("audio3");
var audio4 = document.getElementById("audio4");
var timesWorker1=1;
var timesWorker2=1;
var timesWorker3=1;
var intervalId;

header.innerHTML="Web Workers example:";

window.onload=function(){
    if(window["Worker"]){
        init();
    } else{
        displayText.innerHTML="NO, Web Workers NOT supported!";
    }
};

function init(){
    audio4.play();
    var mainMessage = "PING...";
    var worker1 = new Worker("javascript/test9_2.js");
    var worker2 = new Worker("javascript/test9_2.js");
    var worker3 = new Worker("javascript/test9_2.js");
    worker1.onmessage = function(e){
        audio1.play();
        displayText.innerHTML+="worker1: "+e.data+"<br>";
        if(timesWorker1<5){
            window.setTimeout(post1,2000);
            timesWorker1++;
            audio1.play();
        } else{
            displayText.innerHTML+="Worker1 ended! "+(timesWorker1)+" times communication done (main thread/thread worker1).<br>";
            timesWorker1++;
        }
        displayText.scrollIntoView(false);
    };
    worker2.onmessage = function(e){
        audio2.play();
        displayText.innerHTML+="worker2: "+e.data+"<br>";
        if(timesWorker2<5){
            window.setTimeout(post2,4000);
            timesWorker2++;
        } else{
            displayText.innerHTML+="Worker2 ended! "+(timesWorker2)+" times communication done (main thread/thread worker2).<br>";
            timesWorker2++;
            
        }
        displayText.scrollIntoView(false);
    };
    worker3.onmessage = function(e){
        audio3.play();
        displayText.innerHTML+="worker3: "+e.data+"<br>";
        displayText.scrollIntoView(false);
        if(timesWorker3<5){
            window.setTimeout(post3,6000);
            timesWorker3++;
        } else{
            displayText.innerHTML+="Worker3 ended! "+(timesWorker3)+" times communication done (main thread/thread worker3).<br>";
            timesWorker3++;
        }
        displayText.scrollIntoView(false);
    };
    post1();
    post2();
    post3();
    function post1(){
        worker1.postMessage(mainMessage);
    }
    function post2(){
        worker2.postMessage(mainMessage);
    }
    function post3(){
        worker3.postMessage(mainMessage);
    }
    intervalId = window.setInterval(setVideo,1500);
}

function setVideo(){
    if(timesWorker1>=6&&timesWorker2>=6&&timesWorker3>=6){
        audio4.pause();
        var iframe = document.createElement("iframe");
        iframe.setAttribute("src","https://www.youtube.com/embed/aTF2Rw_VVII?rel=0&autoplay=1");
        iframe.setAttribute("frameborder","0");
        iframe.setAttribute("allowfullscreen","");
        iframe.setAttribute("id","iframe");
        displayVideo.appendChild(iframe);
        displayVideo.scrollIntoView(false);
    //    location.href="#displayVideo";
        window.clearInterval(intervalId);
    }
}
