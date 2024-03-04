import { LightningElement,track } from 'lwc';

export default class TestLwc extends LightningElement {
    @track dynamicNameChange ='Lwc'
    testHnadler(event){
        this.dynamicNameChange= event.target.value;
    }
}