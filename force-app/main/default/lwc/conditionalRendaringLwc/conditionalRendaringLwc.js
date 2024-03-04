import { LightningElement,track} from 'lwc';

export default class ConditionalRendaringLwc extends LightningElement {
    @track displayDiv=false;

    divHandler(event){
       this.displayDiv= event.target.checked;
    }

    @track cityArray=['Bangalore','Hyderabad','Chennai','Vizag']
    
}