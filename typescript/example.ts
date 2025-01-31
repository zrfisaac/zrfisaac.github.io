#!/usr/bin/tsc
// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.typescript.example : 0.0.1

// # [ typescript ]

// Define an interface to type the shape of a person object
interface Person {
    name: string;
    age: number;
    greet(): string;
}

// Create a class that implements the Person interface
class Employee implements Person {
    name: string;
    age: number;
    position: string;

    constructor(name: string, age: number, position: string) {
        this.name = name;
        this.age = age;
        this.position = position;
    }

    // Method from the Person interface
    greet(): string {
        return `Hello, my name is ${this.name}, and I am a ${this.position}.`;
    }

    // Method specific to the Employee class
    work(): string {
        return `${this.name} is working as a ${this.position}.`;
    }
}

// Function that takes a Person as a parameter and logs their greeting
function introducePerson(person: Person): void {
    console.log(person.greet());
}

// Create a new Employee object
const employee1 = new Employee('Alice', 30, 'Software Developer');

// Introduce the employee
introducePerson(employee1);

// Call the work method specific to Employee
console.log(employee1.work());
