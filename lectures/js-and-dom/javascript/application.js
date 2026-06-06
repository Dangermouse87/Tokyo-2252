console.log("Hello from JavaScript!");

// // selecting ids
// document.querySelector("#id");

// // selecting css classes
// document.querySelector(".css-class-name")

// // selecting tags
// document.querySelector("ul")

// Nested Elemeents

// child selector -> the element directly nested inside

// directly nested element inside #players that has the active css class
child = document.querySelector("#players > .active");
// console.log(child);

// // space selector -> any element with the selected class

// any element inside players, nested any level deep
space = document.querySelectorAll("#players .active");
// console.log(space)

// // compound selector

// selecting an element that has all of the selectors joined together
compound = document.querySelector("#players.active");
// console.log(compound);

list = document.querySelector("#players");
// console.log(list);

// // Inserting Information
// // 4 positions -> beforebegin, afterbegin, beforeend, afterend

list.insertAdjacentHTML("beforeend", "<li class='red'>Bob</li>")
list.insertAdjacentHTML("afterbegin", "<li class='green'>Andy</li>")

// // Grabbing Info
list.innerHTML // grabbing HTML inside the list element
bob = list.querySelector(".red");
// console.log(bob.innerText); // Grabbing only text inside element

// Selecting multiple elements

countries = document.querySelectorAll("#fifa-wins li");
// console.log(countries);

countries.forEach((country) => {
  // console.log(country.innerText);
  country.classList.toggle("red");
})

// Inputs (forms etc)
// Change values
input = document.querySelector("#email");
// console.log(input.value);
input.value = "email@email.com"