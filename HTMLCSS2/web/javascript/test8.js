var header = document.getElementsByTagName("header");
var codeImg = document.getElementById("codeImg");

header[0].innerHTML="Object example:";

(function(){
    var display = document.getElementById("display");
    var name = document.getElementById("name");
    var address = document.getElementById("address");
    var city = document.getElementById("city");
    var state = document.getElementById("state");
    var country = document.getElementById("country");
    var button = document.getElementById("button");
    button.onclick=function(){
        var person = new Person(name,address,city,state,country);
        var output = new Output(person);
        output.sayHello();
    };
    function inputResponse(e){
        if(e.keyCode===13){
            e.preventDefault();
            var person = new Person(name,address,city,state,country);
            var output = new Output(person);
            output.sayHello();
        }
    }
    name.onkeypress=inputResponse;
    address.onkeypress=inputResponse;
    city.onkeypress=inputResponse;
    state.onkeypress=inputResponse;
    country.onkeypress=inputResponse;
    function Output(person){
        if(person.name){
            this.date=new Date();
            this.person=person;
            this.sayHello=function(){
                display.innerHTML="Hello, "+this.person.name+" !!"+"<br>";
                display.innerHTML+=this.person.address+"<br>";
                display.innerHTML+=this.person.city+" - "+this.person.state+"<br>";
                display.innerHTML+=this.person.country+"<br>";
                display.innerHTML+=this.date.toLocaleString()+"<br>";
            };
        }
        else{
            this.sayHello=function(){
                display.innerHTML="";
            };
        }
    }
    function Person(name,address,city,state,country){
        if(name.value){
            this.name=name.value;
            this.address=address.value;
            this.city=city.value;
            this.state=state.value;
            this.country=country.value;
        }
    }
})();

codeImg.src="images/code8.png";
