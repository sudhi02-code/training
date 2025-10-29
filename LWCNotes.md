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

const user = { name: "Sudeeshna" };
user.name = "Developer"; // ✅ allowed

📘 In LWC: You’ll often use const for constants and let for variables
5. Destructuring Assignment
Destructuring is a special ES6 syntax that allows you to extract values from arrays or objects into separate variables

Extract values from arrays or objects into variables easily.

✅ Example:

const person = { name: "Sudeeshna", city: "Hyderabad" };
const { name, city } = person;
console.log(name); // Sudeeshna


✅ Array Destructuring:

const colors = ["red", "green", "blue"];
const [first, second] = colors;
console.log(first); // red
2____________
const fruits = ["apple"];
const [a, b = "banana"] = fruits;

console.log(a); // apple
console.log(b); // banana (default used)


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
why do we not use this .carname in the below code
<!DOCTYPE html>
<html>
<body>
<h1>JavaScript Functions</h1>

<p>Outside myFunction() carName is undefined.</p>

<p id="demo1"></p>
<p id="demo2"></p>

<script>
let text = "Outside: " + typeof carName;
document.getElementById("demo1").innerHTML = text;

function myFunction() {
  let carName = "Volvo";
  let text = "Inside: " + typeof carName + " " + carName; 
  document.getElementById("demo2").innerHTML = text;
}

myFunction();
</script>

</body>
</html>


💬 Behavior:

Click Save → shows “✅ Data Saved!”

Click Cancel → shows “❌ Cancelled!”
because when we need to print the values outside the function then only we need to use the this.value

why we need arrow function:
import { LightningElement } from 'lwc';

export default class Demo extends LightningElement {
    message = 'Hello LWC!';

    handleClick() {
        console.log(this.message); // ✅ Works — prints "Hello LWC!"
    }
}
handleClick() {
    setTimeout(function () {
        console.log(this.message); // ❌ undefined
    }, 1000);
}
here inside other function we cannot use the this in normal methods this can be sloved by using arrow function
import { LightningElement } from 'lwc';

export default class MyComp extends LightningElement {
    message = 'Hello LWC!';

    handleClick() {
        setTimeout(() => {
            console.log(this.message); // ✅ "Hello LWC!"
        }, 1000);
    }
}
spread operator___________: used when we want to copy elements and merger ,add multiple values
const arr1 = [1, 2];
const arr2 = [3, 4];
const merged = [...arr1, ...arr2];
console.log(merged); // [1, 2, 3, 4]
Used to copy or update objects:
const user = { name: "Sudeeshna", age: 22 };
const updatedUser = { ...user, city: "Hyderabad" };
console.log(updatedUser);
output:{name:"sudeeshna",age:22,city:"Hyderabad"};
function sum(a, b, c) {
  return a + b + c;
}
const numbers = [10, 20, 30];
console.log(sum(...numbers));  // 60

REST OPERATOR ________:








Map:
const nums = [1, 2, 3];
const doubled = nums.map(n => n * 2);
console.log(doubled); // [2, 4, 6]


Filter:
const ages = [15, 22, 18, 30];
const adults = ages.filter(age => age >= 18);
console.log(adults); // [22, 18, 30]
Reduce:
const nums = [1, 2, 3, 4];
const sum = nums.reduce((total, n) => total + n, 0);
console.log(sum); 
here 0 means the initial value
