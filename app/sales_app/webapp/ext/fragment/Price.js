sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return Controller.exten ("salesapp.ext.fragment.Price", {
        onPress: async function(oEvent) {
            debugger
            // Call method to calculate total of all discounted prices on initialization
            var discountValue = parseFloat(oEvent.getParameter("value")) || 0;
        
            // Access the model and Vehicle data
            var oModel = this.getView().getModel();
            var aVehicles = oModel.getProperty("/Vehicle");
        
            // Calculate the discounted total price
            var discountedTotal = aVehicles.reduce(function (total, vehicle) {
                var originalPrice = vehicle.price;
                var discountedPrice = originalPrice - (originalPrice * (discountValue / 100));
                return total + discountedPrice;
            }, 0);
        
            // Update the model with the new discounted total price
            oModel.setProperty("/discountedTotalPrice", discountedTotal);
 
            this.onDiscountChange();
        },

        onDiscountChange: function (oEvent) {
            debugger
            // Get the discount value from the input
            var discountValue = parseFloat(oEvent.getParameter("value")) || 0;
        
            // Access the model and Vehicle data
            var oModel = this.getView().getModel();
            var aVehicles = oModel.getProperty("/Vehicle");
        
            // Calculate the discounted total price
            var discountedTotal = aVehicles.reduce(function (total, vehicle) {
                var originalPrice = vehicle.price;
                var discountedPrice = originalPrice - (originalPrice * (discountValue / 100));
                return total + discountedPrice;
            }, 0);
        
            // Update the model with the new discounted total price
            oModel.setProperty("/discountedTotalPrice", discountedTotal);
        }
        
    });
});

