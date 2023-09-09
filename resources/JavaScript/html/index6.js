let money=window.prompt("enter your salary");
money=Number(money)
let x;
switch(true){
    case money<=30000 && money> 25000:
        x="You are poor";
        break;
    case money>=150000 && money>30000:
        x="you are not so poor...";
        break;
    case money >150000:
        x="you are rich"
        break;
    case money < 25000:
        x= 'get an actual job!!'
        break;
    default:
        x='Incorrect input type, we only accept numbers!!!'
        break;

}
document.getElementById('cash').innerHTML=x
console.log(x)
let numb = window.prompt('enter a number');

if (numb < 100 && numb >= 50) {
    do {
        console.log(numb);
        numb -= 1;
    } while (numb >49);
} 
else if (numb<50){
    for(;numb<50;numb++){
        console.log(numb)
    }
}
else {
    console.log('incorrect input!!!');
}
//
constructor()
function constructor(){
    let name='Maya';
    let age='26';
    morning(name,age)
    checkAge(age)
    console.log(`your name is ${name} and your age is ${age}`)// template literals demo
}
function morning(name, age){
    console.log('Your name is ', name)
    console.log('Your age is ', age)
}
//ternary operator demo condition ? iftruedothis : ifnotdothis
function checkAge(age){
    return age >=18 ? true :false
}
let currency=100;
currency=currency.toLocaleString("en-US",{style:'currency', currency:'USD'})
console.log(currency)
let degrees=1;
degrees=degrees.toLocaleString(undefined, {style:'percent'})
console.log(degrees)


//arrays demo
let domestic = ['cat', 'dog', 'parrot'];
let wild = ['penguin', 'dolphin', 'bear'];
let insects = ['fly', 'roach', 'mantis', 'spider'];
let animals = [domestic, wild, insects];
animals[0][0]='hamster' //put hamster in the first index of the first string
for (let list of animals) {
    console.log(list + ' Array list');
    for (let animal of list) {
        console.log(animal);
    }
}

// Sorting animals array without modifying the original
let sortedAnimals = [...animals]; // .... spread operator unpacks elements into individual arguments
sortedAnimals.sort();

console.log(sortedAnimals);
console.log(sortedAnimals.length);

console.log(domestic.indexOf('dog'));

console.log(domestic.push('rabbit')); // adds at the end
console.log(domestic.pop()); // removes at the end

console.log(wild.unshift('tiger')); // adds at the beginning
console.log(wild.shift()); // removes at the beginning

console.log(wild[0]); // Access the first element of 'wild'


//callback demo
sum(b=50,a=60,myConsole)
//sum(50,60,myInnerhtml)
function sum(a, b, thefirstfuntiontoexecute){
    result=a+b;
    return thefirstfuntiontoexecute(result)
}
function myConsole(output){
    console.log("console output is ",output);
}
/*function myInnerhtml(output) {
    var outputElement = document.getElementById('outputs');
    if (outputElement) {
      outputElement.innerHTML = output;
    } else {
      console.error("Element with ID 'output' not found.");
    }
  }*/
 // callback function and foreach demo
 let myarray=['student','teacher', 'staff'] 

 function myCapitalizeFunction(firstelem){
    
    return firstelem.charAt(0).toUpperCase() + firstelem.slice(1)
 }
 myarray.forEach(function (element, index, array) {
    array[index] = myCapitalizeFunction(element);
});
 console.log(myarray)

 //map method/function
let numbers=[1,2,3,4,5,6,7,10,9,99]
let answer=numbers.map(square)

function square(num){
    return num*num
}
function print(num){
    console.log(num)
}
answer.forEach(print)

