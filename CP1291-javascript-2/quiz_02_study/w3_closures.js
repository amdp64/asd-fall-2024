// Example inner scope
myFunction()
document.getElementById("not_const").innerHTML = a * a;

function myFunction() {
    a = 4;
    document.getElementById("inner").innerHTML = a * a;
}

// Example global scope
const b = 5
function myFunction2() {
    document.getElementById("outer").innerHTML = b * b;
}

myFunction();
myFunction2();