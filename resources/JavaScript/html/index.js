console.log('i Like Pizza');
console.log('it is tasty');
//window.alert("Do you like it too?");
// this is a single line comment
/*this is a multi line
comment here*/

/* there are two steps to */
let age=23;
let names='Odette';
let stats= true;
let year;
let year2;
year=Number('2017')
year2=String(2017)


console.log('you are ',age);
console.log('hello',names);
console.log('you are a mage:', stats);

document.getElementById('p1').innerHTML='Hello '+ names;
document.getElementById('p2').innerHTML='Your age is: '+ age;
document.getElementById('p3').innerHTML='Your Hero status is: '+ stats ;
document.getElementById('p4').innerHTML='Year created: '+ year ;
document.getElementById('p5').innerHTML="data type of 'year' "+ typeof year ;
document.getElementById('p6').innerHTML="data type of 'year2' "+ typeof year2 ;
