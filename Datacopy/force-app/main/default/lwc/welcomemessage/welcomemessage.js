import { LightningElement } from 'lwc';

export default class Welcomemessage extends LightningElement {
    greeting="Hello Wel Come";
    Welcome="Its ur first day session";
    clickhandler(event){
        this.greeting="This will Work only";
        this.Welcome="After clicking click on me button";
    }
    revertHandler(event){
        this.greeting="Hello Wel Come";
        this.Welcome="Its ur first day session";
    }
}