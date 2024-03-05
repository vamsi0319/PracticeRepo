import { LightningElement } from 'lwc';

export default class LowerCaseToUpperCase extends LightningElement {
    fname;
    lname;
    display;
    uppercase(event){
        let {label,value}=event.target;
        if(label==="First Name"){
            this.fname=value;
        }
        else if(label==="Last Name"){
            this.lname=value;
        }
    }
    convertlowertoupper(event){
        this.display=this.fname.toUpperCase()+" "+this.lname.toUpperCase();
       
        //restting to null after converting into uppercase
        //this.fname="";
        //this.lname="";

    }
}