import { LightningElement, track } from 'lwc';

export default class GreetingCard extends LightningElement {
    @track userName = '';
    @track greeting = 'Hello!';
    @track message = 'Please enter your name to get a personalized greeting.';

    handleNameChange(event) {
        this.userName = event.target.value;
    }

    handleShowGreeting() {
        if (this.userName) {
            this.greeting = `Hello, ${this.userName}!`;
            this.message = `Welcome to Salesforce! We're glad to have you here, ${this.userName}.`;
        } else {
            this.greeting = 'Hello!';
            this.message = 'Please enter your name to get a personalized greeting.';
        }
    }

    handleReset() {
        this.userName = '';
        this.greeting = 'Hello!';
        this.message = 'Please enter your name to get a personalized greeting.';
    }
}