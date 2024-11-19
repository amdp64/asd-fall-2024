 
 /*
 let pizza 
 function orderPizza() {
    console.log('Order pizza');
    // setTimeout is async
    setTimeout(() => {
        pizza = "ZA";
    }, 2000);
    pizza = "PIZZA"
    console.log('Pizza was ordered')
 }
 orderPizza();
 console.log(`Eat ${pizza}`);
 */

 // Let's rewrite this.

 /*
 let pizza 
 function orderPizza() {
    console.log('Order pizza')
    setTimeout(() => {
        pizza = "ZA"
    }, 2000);
    console.log('Pizza was ordered');
 }
 orderPizza()
 console.log('Coll Qoli');
 console.log(`Eat ${pizza}`);
 */

 // Let's make another revision.

 /*
 let pizza 
 function orderPizza() {
    console.log('Order pizza')
    setTimeout(() => {
        pizza = "🍕";
        console.log(`${pizza} is ready`); // Bad.
    }, 2000);
    console.log('Pizza was ordered');
 }
 orderPizza()
 console.log('Coll Qoli');
 console.log(`Eat ${pizza}`);
 */

 // Now we get into Async. 
 // Previous code is terrible. 

 // callbacks

 // This function is synchronous
 // but what happens inside of it is async
 function orderPizza(callback) {
    setTimeout(() => {
        const pizza = `🍕`;
        callback(pizza);
    }, 2000);
 }

 function pizzaReady(pizza) {
    console.log(`Eat the ${pizza}`);
 }

 // Once you are done, call this guy.
 orderPizza(pizzaReady);
 console.log(`Call Qoli`)

 // Remember from adding event listeners 

 // This is async code.
 // We don't know when the button will be pressed, 
 // but when it does execute this function. 
 window.addEventListener('click', callback)

 function callback() {
    console.log('Clicked');
 }

 function thing1(callback) {
    callback()
 }

 function thing2(callback) {
    callback()
 }

 function thing3(callback) {
    callback()
 }

 // Callback hell. 
 thing1(() => {
    thing2(() => {
        thing3();
    });
 });

 // Async Examples
 /*
 Data Fetching
 Calling Backend APIs
 Loading Files
 Timers & Intervals
 */