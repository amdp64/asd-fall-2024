document.getElementById('size-12').onclick = function() {
    document.body.style.fontSize = '12px';
}

document.getElementById('size-14').onclick = function() {
    document.body.style.fontSize = '14px';
}

document.getElementById('size-16').onclick = function() {
    document.body.style.fontSize = '16px';
}

function clickHandler(size) {
    return function() {
        document.body.style.fontSize = `${size}px`;
    }
}

// When assigning, you shouldn't invoke it. 
// We do need to invoke, to pass parameter, but need to return something
// other than undefined. 
document.getElementById('size-12').onclick = 
clickHandler(12);
// Each will get a copy of the inner function, 
// with size passed in as a dynamic value 
// the "12" will be kept as a reference as in the function
// we are returning. 

// Which is why they are valuable. 
// Higher order functions can return functions. 