import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {
    name;
    fullname = 'Salesforce LWC';
    age = 25;
    location = {
        city: "Ottawa",
        country: "Canada",
        postalCode: 'K3T0O6'
    };
    fruits = ["Banana", "Orange"];
}