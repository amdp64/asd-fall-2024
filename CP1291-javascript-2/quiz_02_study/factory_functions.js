// More practical example
function createElement(type, text, color) {
    const el = document.createElement(type);
    el.innerText = text;
    el.style.color = color;
    document.body.append(el);
    return {
        // return an object that has reference to the element
        // el: el,
        el,
        setText(text) {
            el.innerText = text;
        },
        setColor(color) {
            el.style.color = color;
        }
    }
}

const h1 = createElement('h1', 'Hey guys', 'red');
console.log(h1);

// Factory functions
function personFactory(name) {
    return {
        // same as name: name "ES6 life"
        // name,
        talk() {
            return `Hello I am ${name}`
        }
    }

}

const me = personFactory('Sina');
console.log(me.talk());
// good because me.name doesn't work.

const ben = personFactory('Ben');
console.log(ben.talk());

const jill = personFactory('Dr. Jill');
console.log(jill.talk());


// You should only write your logic once.

/*
const me = {
    name: 'Andrew',
    talk() {
        return `Hello I am ${this.name}`;
    }
}

const ben = {
    name: 'Ben',
    talk() {
        return `Hello I am ${this.name}`;
    }
}

console.log(me.talk());
console.log(ben.talk());

console.log(me);
console.log(ben);

// This is bad. Hard to know where problem is.
me.name = 'Sam';
console.log(me.talk());
*/
