@AbapCatalog.sqlViewName: 'ZVI_DEPLOY_TEST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ZCDS_DEPLOY_TEST'
@Search.searchable : true
@Metadata.allowExtensions: true
define view ZCDS_DEPLOY_TEST as select from zdeploy_test as Booking
   association [0..1] to I_Country  as _Country  on $projection.country = _Country.Country
   association [0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency {
    key booking              as Booking,
         
         customername         as CustomerName,
         numberofpassengers   as NumberOfPassengers,
         emailaddress         as EmailAddress,
         country,
         dateofbooking        as DateOfBooking,
         dateoftravel         as DateOfTravel,
         @Semantics.amount.currencyCode: 'CurrencyCode'
         cost,
         @Semantics.currencyCode: true
         currencycode          as CurrencyCode,
         lastchangedat         as LastChangedAt,

         _Country,
         _Currency       
}
