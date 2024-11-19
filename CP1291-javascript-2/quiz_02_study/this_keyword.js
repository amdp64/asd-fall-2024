function Person(n) {
    this.name = n;
    this.talk = function() {
        console.log(this);
    }

    // run in an entirely difference context
    // doesn't have 'nice' binding to alsoMe
    // use bind to fix
    
    //setTimeout(function() {
    //    console.log(this);
    //}.bind(this), 100);

    // arrow functions fix this also...
    setTimeout(() => {
        console.log(this)
    }, 100)
}

const alsoMe = new Person('Sina');

function talk(lang, isPolite) {
    if (isPolite) {
        if (lang === 'en') {
            return `Hello, I am ${this.name}`;
        } else if (lang === 'it') {
            return `Cia bella, sono ${this.name}`;
        }
    }

    if (!isPolite) {
        if (lang === 'en') {
            return `${this.name}, what you want?`;
        } else if (lang === 'it') {
            return `Sono ${this.name}, 🤌🏼`;
        }
    }
}

const me = {
    name: 'Sina'
}

/*
function talk() {
    return `I am ${this.name}`;
}

const me = {
    name: 'Sina',
    talk
}

const you = {
    name: 'Qoli',
    talk
}
*/

// this gets access to window
/*
if (true) {
    console.log(this)
}
*/

/*
function talk() {
    return this;
}
*/

/*
const me = {
    name: 'Sina',
    talk
}

console.log(me.talk());
*/

// talk()
// on the window object itself
// browser assumes window.talk()
