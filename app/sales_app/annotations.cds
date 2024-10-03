using MyService as service from '../../srv/service';
annotate service.PurchaseEnquiry with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'purchaseEnquiryID',
                Value : purchaseEnquiryID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'customerID',
                Value : customerID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'deliveryLocation',
                Value : deliveryLocation,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Quotation',
            ID : 'Quotation',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Vehicle Details',
                    ID : 'VehicleDetails',
                    Target : 'enquiryToVehicle/@UI.LineItem#VehicleDetails',
                },
            ],
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'purchaseEnquiryID',
            Value : purchaseEnquiryID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'customerID',
            Value : customerID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'deliveryLocation',
            Value : deliveryLocation,
        },
    ],
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Requests',
    },
    UI.LineItem #tableView : [
        {
            $Type : 'UI.DataField',
            Value : purchaseEnquiryID,
            Label : 'purchaseEnquiryID',
        },
        {
            $Type : 'UI.DataField',
            Value : customerID,
            Label : 'customerID',
        },
        {
            $Type : 'UI.DataField',
            Value : deliveryLocation,
            Label : 'deliveryLocation',
        },
    ],
    UI.SelectionPresentationVariant #tableView1 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
                {
                    $Type : 'UI.SelectOptionType',
                    PropertyName : status,
                    Ranges : [
                        {
                            Sign : #I,
                            Option : #EQ,
                            Low : 'In Process',
                        },
                    ],
                },
            ],
        },
        Text : 'In Process',
    },
    UI.LineItem #tableView1 : [
        {
            $Type : 'UI.DataField',
            Value : customerID,
            Label : 'customerID',
        },
        {
            $Type : 'UI.DataField',
            Value : purchaseEnquiryID,
            Label : 'purchaseEnquiryID',
        },
        {
            $Type : 'UI.DataField',
            Value : deliveryLocation,
            Label : 'deliveryLocation',
        },
    ],
    UI.SelectionPresentationVariant #tableView2 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView1',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
                {
                    $Type : 'UI.SelectOptionType',
                    PropertyName : status,
                    Ranges : [
                        {
                            Sign : #I,
                            Option : #EQ,
                            Low : 'Nego',
                        },
                    ],
                },
            ],
        },
        Text : 'Negotetion',
    },
    UI.LineItem #tableView2 : [
        {
            $Type : 'UI.DataField',
            Value : customerID,
            Label : 'customerID',
        },
        {
            $Type : 'UI.DataField',
            Value : purchaseEnquiryID,
            Label : 'purchaseEnquiryID',
        },
        {
            $Type : 'UI.DataField',
            Value : deliveryLocation,
            Label : 'deliveryLocation',
        },
    ],
    UI.SelectionPresentationVariant #tableView3 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView2',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
                {
                    $Type : 'UI.SelectOptionType',
                    PropertyName : status,
                    Ranges : [
                        {
                            Sign : #I,
                            Option : #EQ,
                            Low : 'Approved',
                        },
                    ],
                },
            ],
        },
        Text : 'Purchus Order',
    },
    UI.HeaderInfo : {
        TypeName : 'Customer Information',
        TypeNamePlural : '',
        Title : {
            $Type : 'UI.DataField',
            Value : enquiryToCustomer.name,
        },
    },
    UI.FieldGroup #TotalPrice : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : enquiryToCustomer.customerToEnquiry.enquiryToVehicle.totalPrice,
                Label : 'totalPrice',
            },
        ],
    },
    UI.FieldGroup #TotalPrice1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : enquiryToVehicle.totalPrice,
                Label : 'totalPrice',
            },
        ],
    },
    UI.DeleteHidden : true,
);

annotate service.Vehicle with @(
    UI.LineItem #VehicleDetails : [
        {
            $Type : 'UI.DataField',
            Value : vehicleCode,
            Label : 'Vehicle Code',
        },
        {
            $Type : 'UI.DataField',
            Value : vehicleName,
            Label : 'Vehicle Name',
        },
        {
            $Type : 'UI.DataField',
            Value : vehicleColor,
            Label : 'Vehicle Color',
        },
        {
            $Type : 'UI.DataField',
            Value : quantity,
            Label : 'Quantity',
        },
        {
            $Type : 'UI.DataField',
            Value : pricePerUnit,
            Label : 'Price Per Unit',
        },
        {
            $Type : 'UI.DataField',
            Value : atualPrice,
            Label : 'Actual Price',
        },
        {
            $Type : 'UI.DataField',
            Value : discount,
            Label : 'Discount',
        },
        {
            $Type : 'UI.DataField',
            Value : price,
            Label : 'Discounted Price',
        },
    ]
);

annotate service.Vehicle with {
    vehicleCode @Common.FieldControl : #ReadOnly
};

annotate service.Vehicle with {
    vehicleName @Common.FieldControl : #ReadOnly
};

annotate service.Vehicle with {
    vehicleColor @Common.FieldControl : #ReadOnly
};

annotate service.Vehicle with {
    quantity @Common.FieldControl : #ReadOnly
};

annotate service.Vehicle with {
    price @Common.FieldControl : #ReadOnly
};

annotate service.PurchaseEnquiry with {
    purchaseEnquiryID @Common.FieldControl : #ReadOnly
};

annotate service.PurchaseEnquiry with {
    customerID @Common.FieldControl : #ReadOnly
};

annotate service.PurchaseEnquiry with {
    status @Common.FieldControl : #ReadOnly
};

annotate service.PurchaseEnquiry with {
    deliveryLocation @Common.FieldControl : #ReadOnly
};

