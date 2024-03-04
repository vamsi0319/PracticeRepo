import { LightningElement } from 'lwc';

import { loadScript, loadStyle } from 'lightning/platformResourceLoader';
import MindFusionVs from '@salesforce/resourceUrl/daypilot';



export default class Calendartest extends LightningElement {

    renderedCallback(){
        Promise.all([
        
        //loadScript(this, ProjectSchedule),
        loadScript(this, MindFusionVs),

        ]).then(() => {
            console.log('Resource loaded');
           //this.p = MindFusion.Scheduling;
            //console.log('p loaded'+this.p);
            //this.calendar =new p.Calendar(this.template.querySelector('div'));
            //console.log('MindFusion loaded');
        })
        .catch(error=>{
            console.log('Failed to load  : ' +error);
        });
    }

}