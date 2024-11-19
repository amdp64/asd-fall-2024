// Learning closures


// Now a "factor function" 
// Creates objects and sends them back to you
function human(n) {
    const name = n;
    function sayHi() {
        console.log(`Hi I am ${name}`);
    }
    function sayHowYouFeel() {
        console.log(`${name} is feeling good!`)
    }

    return {
        sayHi,
        sayHowYouFeel
    }
}
// Closures remember the outer function scope even after creation time.

const sina = human('Sina');
const qoli = human('Qoli');

// name is remembered from above
sina.sayHi();





