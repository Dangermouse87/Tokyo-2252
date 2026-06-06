// console.log("Hello");

// Static variable, something that shouldn't change
// const name = "James";

// Let for something that you do want to reassign
let name = "James"
console.log(name);

name = "Thomas";
console.log(name);

// typeof -> determine class
console.log(typeof(54.3));

// String Interpolation

const message = `This is a message for ${name}`
console.log(message);

// Changing Types
let number = "234";
number = parseInt(number, 10);
console.log(typeof(number));

let stringNumber = 234
console.log(typeof((stringNumber).toString()));

// Arrays

const fruits = []

// // CRUD
fruits.push("Apple"); // create / adding elements
fruits.push("Banana");
console.log(fruits);

console.log(fruits[0]); // read

fruits[0] = "Mango"; // update
console.log(fruits);

fruits.splice(1, 1); // delete -> arguments -> start, how many
console.log(fruits);

const student = {
  firstName: "Boris",
  lastName: "Paillard"
}

console.log(student.firstName); // looking at one thing
console.log(student["firstName"]); // looking at multiple things (in an iteration)

student.firstName = "Bob"
console.log(student.firstName);

// Other data types

// undefined

let something; 
console.log(something);
something = "something";
console.log(something);

// // null

let name = null

// if

let trafficLight = "yellow"

if (trafficLight === "red") {
  console.log("Stop");
} else if (trafficLight === "yellow") {
  console.log("Slow Down!");
} else {
  console.log("Go!")
}

// switch -> case

let day = "Wednesday"

switch (day) {
  case "Monday":
    console.log("I hate waking up on Mondays");
    break;
  case "Saturday":
    console.log("Woohoo! It's the weekend!");
    break;
  default:
    console.log("Oh Crap! Hurry Up Weekend!");
}

// Functions

// Function Delaration
// starts with function keyword, functionName(argument)
function greet(name) {
  return `Hello ${name}`
}

console.log(greet("Ben"));

// Function Variable
// variable name = function(argument)
const greets = function(name) {
  return `Hello ${name}`
}

console.log(greets("Sammy"));

// Arrow Function

const greeting = (name) => {
  return `Hello ${name}`
}

// Anonymous Functions

() => {
  // Something 
}