let age;
age=document.getElementById('age');
age.ideas ='age'

document.getElementById('ageForm').onsubmit= function(){
   
   if( Number(age.value >60)){    
    document.getElementById('status').innerHTML="You are a senior";
    console.log("You are a senior")
    console.log(age.ideas)
   }
   else if(Number (age.value <= 0)){    
    document.getElementById('status').innerHTML="You cannot be younger than zero!!";
    console.log("You cannot be younger than zero!")
   }
   else if(Number(age.value <18)){
    document.getElementById('status').innerHTML="You are a minor";
    console.log("You are a minor")
   }
   else if( Number (age.value >= 18)){    
    document.getElementById('status').innerHTML="You are an adult";
    console.log("You are an adult")
   }
    else{
    document.getElementById('status').innerHTML="Invalid input.";
    console.log("Invalid input.")
   }
   return false
}
let female = document.getElementById("Female");
let male = document.getElementById("Male");

document.getElementById('genderForm').onsubmit = function () {
    if (female.checked) {
        document.getElementById('gender').innerHTML = "Your gender is Female";
        console.log('Is Female');
    } else if (male.checked) {
        document.getElementById('gender').innerHTML = "Your gender is Male";
        console.log('Is Male');
    } else {
        document.getElementById('gender').innerHTML = 'No gender selected';
    }
    return false; // Prevent the form from submitting
}
 
