// Initiate Counter
// var counter = 0;

// Function to increase counter
const add = (function() {
    let counter = 0;
    return function() {
        counter += 1;
        console.log(counter);
        return counter;
    }
})();

add();
add();
add();
