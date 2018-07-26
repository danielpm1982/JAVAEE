var header = document.getElementsByTagName("header");
var codeImg = document.getElementById("codeImg");
var display = document.getElementById("display");

header[0].innerHTML="Object example:";

display.innerHTML+="Chained prototypes - object/constructors inheritance"+"<br><br>";

function Animal(name,age,size,color){
    this.name=name;
    this.age=age;
    this.size=size;
    this.color=color;
}
Animal.prototype.creator="God";
Animal.prototype.isBorn=false;
Animal.prototype.walk=function(){
    if(this.isBorn){
        return "Animal started Walking!...";
    }
    return "Animal not born yet!...";
};
Animal.prototype.eat=function(){
    if(this.isBorn){
        return "Animal started Eating!...";
    }
    return "Animal not born yet!...";
};

function Dog(name,age,size,color){
    Animal.call(this,name,age,size,color);
    this.isBorn=true;
}
Dog.prototype=new Animal();
Dog.prototype.constructor=Dog;
Dog.prototype.species="Canis lupus familiaris";
Dog.prototype.communicate=function(){
    return "AuAuAuAu Whoof Whoof Whoof...";
};

function Cat(name,age,size,color){
    Animal.call(this,name,age,size,color);
    this.isBorn=true;
}
Cat.prototype=new Animal();
Cat.prototype.constructor=Cat;
Cat.prototype.species="Felis catus";
Cat.prototype.communicate=function(){
    return "MiowMiowMiow Ghrrr Ghrrr...";
};

function ClownFish(name,age,size,color){
    Animal.call(this,name,age,size,color);
    this.isBorn=true;
}
ClownFish.prototype=new Animal();
ClownFish.prototype.constructor=ClownFish;
ClownFish.prototype.species="Amphiprion ocellaris";
ClownFish.prototype.communicate=function(){
    return "GlupGlupGlup...";
};

(function(){
    var abstractAnimal = new Animal();
    printObject(abstractAnimal);
    var dog1 = new Dog("Luke","2 years","30 cm","white");
    printObject(dog1);
    var dog2 = new Dog("Appolo","6 years","100 cm","beige");
    printObject(dog2);
    var cat1 = new Cat("Mimi","10 years","15 cm","grey");
    printObject(cat1);
    var fish1 = new ClownFish("Nemo","1 year","5 cm","red");
    printObject(fish1);
    
    function printObject(object){
        if(object instanceof Animal){
            display.innerHTML+=("constructor: "+object.constructor);
            display.innerHTML+="<br>";
            display.innerHTML+=("name: "+object.name);
            display.innerHTML+="<br>";
            display.innerHTML+=("age: "+object.age);
            display.innerHTML+="<br>";
            display.innerHTML+=("size: "+object.size);
            display.innerHTML+="<br>";
            display.innerHTML+=("color: "+object.color);
            display.innerHTML+="<br>";
            display.innerHTML+=("creator: "+object.creator);
            display.innerHTML+="<br>";
            display.innerHTML+=("isBorn: "+object.isBorn);
            display.innerHTML+="<br>";
            display.innerHTML+=("walk method: "+object.walk());
            display.innerHTML+="<br>";
            display.innerHTML+=("eat method: "+object.eat());
            display.innerHTML+="<br>";
        }
        if(object instanceof Dog || object instanceof Cat || object instanceof ClownFish){
            display.innerHTML+=("species: "+object.species);
            display.innerHTML+="<br>";
            display.innerHTML+=("communicate method: "+object.communicate());
            display.innerHTML+="<br>";
        }
        display.innerHTML+="<br>";
    }
})();

codeImg.src="images/code9.png";
