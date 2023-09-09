/*let username= window.prompt('Enter username: ')
let email= window.prompt('Enter your email: ')

console.log('rour name is: ',username ," And your email is: ", email)*/

let username;
let email;
let fullnames='Maryanne Mare'
let lastname;
let firstname;

console.log(firstname=fullnames.slice(0,fullnames.indexOf(' ')))
console.log(lastname=fullnames.slice(fullnames.indexOf(' ')+1))

document.getElementById('submit').onclick = function(){
    username=document.getElementById('username').value;
    email=document.getElementById('email').value;
    console.log('username: ', username, ' email: ', email)
    document.getElementById('name').innerHTML=username

}
