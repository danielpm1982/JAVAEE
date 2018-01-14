var answer = "PONG.";
onmessage = function(e){
    postMessage(e.data+" "+answer);
};
