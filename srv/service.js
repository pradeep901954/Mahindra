const { update } = require('@sap/cds');
const cds = require('@sap/cds');
const { select } = require('@sap/cds/libx/_runtime/hana/execute');

module.exports = async function (params, srv) {
    let { PurchaseEnquiry,Vehicle,Stocks } = this.entities;


    this.on('UPDATE',Vehicle.draft, async (req) => {
        debugger
        var finalPrice;
        
           if(req.data.discount){
            var vehicleData = await SELECT.from(Vehicle.drafts).where({ vehicleID: req.data.vehicleID });
            
            var originalData = await SELECT.from(Stocks).where({ vehicleCode: vehicleData[0].vehicleCode });

            const pricePerUnit = originalData[0].pricePerUnit;
            vehicleData[0].atualPrice = originalData[0].pricePerUnit * vehicleData[0].quantity; 

            // Calculate the discounted price
            const discountAmount = (pricePerUnit * req.data.discount) / 100;
            discountedPrice = pricePerUnit - discountAmount;
            finalPrice = discountedPrice * vehicleData[0].quantity;

            
            // Add to total price
            var  totalPrice = parseFloat(finalPrice);

            var allDrafts = await SELECT.from(Vehicle.drafts);
             allDrafts.forEach(draft => {
                 if (draft.vehicleID !== req.data.vehicleID) {
                    totalPrice = totalPrice + parseFloat(draft.price); 
                }
             });
             
             vehicleData[0].totalPrice = totalPrice;
           
             await cds.update(Vehicle.drafts).set({
                atualPrice : vehicleData[0].atualPrice,
                pricePerUnit : originalData[0].pricePerUnit,
                price: finalPrice,
                discount: req.data.discount,
                totalPrice: vehicleData[0].totalPrice
             }).where({ vehicleID: req.data.vehicleID });

             await cds.update(Vehicle).set({
                atualPrice : vehicleData[0].atualPrice,
                pricePerUnit : originalData[0].pricePerUnit,
                price: finalPrice,
                discount: req.data.discount,
                totalPrice: vehicleData[0].totalPrice
            }).where({ vehicleID: req.data.vehicleID });
            vehicleData[0].totalPrice = 0;
           }
    });

    this.on('postattach', async (req) => {
        debugger
        var editbut = 'false';
        if (req.data.p) {
            var status = await SELECT.from(PurchaseEnquiry).where({ purchaseEnquiryUuid: req.data.p });
            console.log("functionImport triggered");
                if (status[0].status == 'Pending' || status[0].status == 'Nego' ) {
                    editbut = "true";
                }
            return editbut;
        }
    });

}