/*let a;
let b;

document.getElementById('sub').onclick=function(){
    a= document.getElementById('a').value;
    a=Number(a)

    b= document.getElementById('b').value;
    b=Number(b);

    c= Math.sqrt(Math.pow(2,a)+ Math.pow(2,b));
    document.getElementById('c').innerHTML='c is: '+ c;
}
document.getElementById('c').innerHTML='c is: '+ c;*/
let count=0;
document.getElementById('increase').onclick=function(){
    count =count+1;
    document.getElementById('count').innerHTML=count;
}
document.getElementById('reset').onclick=function(){
    count=0;
    document.getElementById('count').innerHTML=count;
}
document.getElementById('decrease').onclick=function(){
    count=count-1;
    document.getElementById('count').innerHTML=count;
}
