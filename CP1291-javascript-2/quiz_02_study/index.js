// JSON = (JavaScript Object Notation) data-interchange format
//      Used for exchanging data between a server and a web application
//      JSON files {key:value} OR [value1, value2, value3]

//      JSON.stringify() = converts a JS object to a JSON string.
//      JSON.parse() = converts a JSON string to a JS object

const jsonNames = `["Spongebob", "Patrick", "Squidward", "Sandy"]`;
const jsonPerson = `{"name":"Spongebob", "age": 30, "isEmployed": true, "hobbies":["Jellyfishing", "Karate", "Cooking"]}`;
const jsonPeople = `[{"name":"Spongebob","age": 30,"isEmployed": true},
                {"name":"Patric","age": 34,"isEmployed": false},
                {"name":"Squidward","age": 50,"isEmployed": true},
                {"name":"Sandy","age": 27,"isEmployed": false}]`;

const parsedData = JSON.parse(jsonPeople);
//console.log(parsedData);

// Fetching JSON
// Relative or absolute

// A promise

fetch("names.json")
    // returns a promise
    // provided with a reponse object
    .then(response => response.json())
    .then(value => console.log(value))

fetch("people.json")
    // returns a promise
    // provided with a reponse object
    .then(response => response.json())
    .then(values => values.forEach(value => console.log(value.name)))
    .catch(error => console.error(error))

// Using require()
/*
let json = require("./people.json");
console.log(json);
*/