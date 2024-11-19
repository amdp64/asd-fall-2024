document.getElementById('size-12').onclick = function() {
    document.body.style.fontSize = `12px`;
}

document.getElementById('size-14').onclick = function() {
    document.body.style.fontSize = `14px`;
}

document.getElementById('size-16').onclick = function() {
    document.body.style.fontSize = `16px`;
}


function clickHandler(size) {
    return function() {
        document.body.style.fontSize = `${size}px`;    
    }
}


// Think we are doing good here
document.getElementById('size-12').onclick =
// invoking it, assigns on return (which is undefined)
// ... after rewrite, we get the value when returning (we keep size)
// this is due to closures
clickHandler(12);

document.getElementById('size-14').onclick =
clickHandler(14);

document.getElementById('size-16').onclick =
clickHandler(16);

function human(n) {
    const name = n;
    function sayHi() {
        console.log(`Hi I am ${name}`);
    }
    function sayHowYouFeel() {
        console.log(`${name} is feeling good`);
    }

    return {
        sayHi,
        sayHowYouFeel
    }
}

const sina = human('Sina');
const qoli = human('Qoli');

// not executing human anymore
// sina.sayHi()