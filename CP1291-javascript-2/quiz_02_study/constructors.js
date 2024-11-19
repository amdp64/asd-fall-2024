// Constructor functions
// A function that creates objects for us

// They don't return the object to you
// 'new' and 'this'

// Constructors typically begin with capital letter
function Person(name) {
    this.name = name
    this.talk = () => {
        return `Hello I am ${this.name}`
    }
}

function SuperElement(type, content) {
    this.el = document.createElement(type);
    this.el.innerText = content;
    document.body.append(this.el);
    this.el.addEventListener('click', () => {
        console.log(this.el);
    });
}