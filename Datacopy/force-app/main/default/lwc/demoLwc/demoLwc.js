import { LightningElement ,api} from 'lwc';

export default class DemoLwc extends LightningElement {
    @api Name='raj';
    @api AccountNumber='123456';
    @api recordId;
    phone='6677889900';
}