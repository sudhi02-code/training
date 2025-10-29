java script:

Order of Lifecycle Hooks Execution
Stage	Hook	When it Runs	Common Use
🟢 1. Creation	constructor()	When component instance is created	Initialize variables, set defaults
🔵 2. Insertion into DOM	connectedCallback()	When component is inserted into DOM	Call APIs, start data loading (wire, imperative Apex)
🟣 3. First Render	render()	Before the component renders	Control which template to render (rarely used)
🟢 4. After Render	renderedCallback()	After the template is rendered in DOM	Access DOM elements, run DOM manipulation, timers
🔴 5. Removal	disconnectedCallback()	When component is removed from DOM	Cleanup (clear intervals, remove listeners)
🟠 6. Error Handling	errorCallback(error, stack)	When an error occurs in a child component	Handle child errors gracefully
@api_____:
without Api:

html:
<template>
    <div> Message:{message}</div>
    <div> RecordId:{recordId}</div>
</template>
js:
import { LightningElement } from 'lwc';

export default class FirstApiExample extends LightningElement {
 message ='First Lwc Component';
 recordId;
}
you can only get msg but not id as it is in private
with API
same code but one change
in js file addd @api
import { LightningElement ,api} from 'lwc';

export default class FirstApiExample extends LightningElement {
 message ='First Lwc Component';
  @api recordId;
}

2.@wire____:



for...of Loop (for arrays)

✅ Example:

let names = ["Sudeeshna", "Priya", "Anu"];
for (let name of names) {
  console.log(name);
}

🔹 for...in Loop (for objects)

✅ Example:

let account = { name: "ABC Corp", rating: "Hot" };
for (let key in account) {
  console.log(key, "=", account[key]);
}



 to call one object from another object
const person = {
  firstName:"John",
  lastName: "Doe",
  fullName: function () {
    return this.firstName + " " + this.lastName;
  }
}

const member = {
  firstName:"Hege",
  lastName: "Nilsen",
}

let fullName = person.fullName.bind(member);

ES6:

1.let and const

Before ES6, we only had var for variables (which caused bugs due to function-scope).
ES6 introduced:

let → block-scoped variable

const → block-scoped constant (cannot be reassigned)

✅ Example:

let name = "Sudeeshna";
name = "Priya"; // ✅ Allowed

const country = "India";
country = "USA"; // ❌ Error: Assignment to constant variable
2.Arrow Function:
let Hello=()=>{
Console.log('welcome');
}

📘 In LWC: You’ll often use const for constants and let for variables
5. Destructuring Assignment

Extract values from arrays or objects into variables easily.

✅ Example:

const person = { name: "Sudeeshna", city: "Hyderabad" };
const { name, city } = person;
console.log(name); // Sudeeshna


✅ Array Destructuring:

const colors = ["red", "green", "blue"];
const [first, second] = colors;
console.log(first); // red


📘 In LWC: Common when working with objects or Apex responses.
Template Literals (` `)

Allows embedding variables and expressions directly into strings using backticks and ${}.

✅ Example:

let name = "Sudeeshna";
let city = "Hyderabad";
console.log(`Hello ${name}, welcome to ${city}!`);
