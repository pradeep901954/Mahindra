using {  db}  from '../db/schema';

service MyService {

    @odata.draft.enabled
    entity Customer as projection on db.Customer;
    @odata.draft.enabled
    entity PurchaseEnquiry as projection on db.PurchaseEnquiry;
   @odata.draft.bypass
    @Common.SideEffects  : {
        $Type : 'Common.SideEffectsType',
        SourceProperties : [
            'discount'
        ],
        TargetProperties : [
            'price','atualPrice','pricePerUnit','totalPrice'
        ],
    }
    entity Vehicle as projection on db.Vehicle;
    entity Quotation as projection on db.Quotation;
    entity PaymentDetails as projection on db.PaymentDetails;
    @odata.draft.enabled
    entity Sales as projection on db.SalesOrder;
    @odata.draft.enabled
    entity PurchaseOrder as projection on db.PurchaseOrder;
    @odata.draft.enabled
    entity Invoice as projection on db.Invoice;
    entity Stocks as projection on db.Stocks;
    function postattach(p : String) returns String;

}


