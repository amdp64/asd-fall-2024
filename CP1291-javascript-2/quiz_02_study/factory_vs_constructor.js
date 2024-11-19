// What about classes?
// Essentially constructors
// This applies to classes

// Why use factory functions?
// They are simpler (just a function)
// Just return an object
// Little more flexible (using closures)
// Achieving data privacy

function createPerson(name) {
    // Data privacy at play
    // More natural with factories
    return {
        talk() {
            return `${name}`;
        }
    }
}

const me = createPerson('Sina');

// Now Constructors

function Person(name) {
    this.name = name;
}

// Doing inheritance right
const ben = new Person('Ben');

Person.prototype.talk = function() {
    return `Ciao, io sono ${this.name}`;
}

const sam = new Person('Sam');


// We are creating 'copies' of name and talk()
// We are also occupying more space in memory

/*
function createPerson(name) {
    return {
        // It is a copy
        // Not a big deal for two.. but
        name,
        talk() {
            return `I am ${this.name}`;
        }
    }
}

const me = new createPerson('Sina');
const you = new createPerson('Qoli');

// if you want to change talk, you have to change every single object
me.talk = function() {
    return `Hello, I am ${this.name}`;
}

*/

/*
const myCoolProto = {
    talk() {
        return `Hello, I am ${this.name}`;
    }
}
*/

/*

function createPerson(name) {
    return Object.create(myCoolProto, {
        name: {
            value: name
        }
    });
}

*/