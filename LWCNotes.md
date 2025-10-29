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


Functions And Arrow functions:
Normal Function:
const person = {
  name: "Sudeeshna",
  sayName: function() {
    console.log(this.name);
  }
};

person.sayName(); // Output: Sudeeshna
Arrow Function:
const person = {
  name: "Sudeeshna",
  sayName: () => {
    console.log(this.name);
  }
};

person.sayName(); // Output: undefined (because arrow function doesn’t have its own this)

example 2:
class Example {
  constructor() {
    this.name = "Sudeeshna";
  }

  normalFunction() {
    setTimeout(function() {
      console.log(this.name); // ❌ undefined
    }, 1000);
  }

  arrowFunction() {
    setTimeout(() => {
      console.log(this.name); // ✅ "Sudeeshna"
    }, 1000);
  }
}

const obj = new Example();
obj.normalFunction();
obj.arrowFunction();
here normal function can not get values because it can have only functional values it can not get from outside the function
but arrow function get the values from out side but not from the same function

example 2:
class Student {
  constructor() {
    this.value = "Sudeeshna";
  }

  showValue = () => {
    console.log(this.value);
  };
}

const s1 = new Student();
s1.showValue(); // ✅ Output: Sudeeshna
In side an eventListener:
Wrong Way (arrow function loses this)
<button id="myBtn" value="Hello">Click Me</button>

<script>
  const button = document.getElementById("myBtn");

  // ❌ Arrow function does NOT have its own 'this'
  button.addEventListener("click", () => {
    console.log(this.value); // undefined
  });
</script>

✅ Correct Way (use event.target.value)
<button id="myBtn" value="Hello">Click Me</button>

<script>
  const button = document.getElementById("myBtn");

  button.addEventListener("click", (event) => {
    console.log(event.target.value); // ✅ Output: Hello
  });
</script>


⚠️ Reason:
Inside an arrow function, this does not refer to the button.
Instead, use event.target.value — this is the correct and safe approach.
example____:
Example 3 — In Lightning Web Component (LWC)
🧩 HTML
<template>
  <lightning-button label="Save" value="Save" onclick={handleClick}></lightning-button>
  <lightning-button label="Cancel" value="Cancel" onclick={handleClick}></lightning-button>

  <p>Last Action: {action}</p>
</template>

🧩 JS
import { LightningElement, track } from 'lwc';

export default class MyButtons extends LightningElement {
  @track action = '';

  handleClick = (event) => {
    this.action = event.target.value;  // ✅ gets the value of the clicked button
    console.log("Button clicked:", this.action);

    if (this.action === 'Save') {
      console.log('✅ Data Saved!');
    } else if (this.action === 'Cancel') {
      console.log('❌ Cancelled!');
    }
  };
}

💬 Behavior:

Click Save → shows “✅ Data Saved!”

Click Cancel → shows “❌ Cancelled!”
