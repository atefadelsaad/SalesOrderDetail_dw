CREATE OR ALTER PROCEDURE gold.sales_order_detail_import_marge
AS
BEGIN 
      MERGE gold.fac_sales_order_detail AS target
      USING silver.fac_sales_order_detail AS source
            ON target.sales_orderid = source.sales_orderid

      WHEN MATCHED AND(
                target.Sales_Order_detailid <> source.Sales_Order_detailid
             OR target.Carrier_tracking_number <> source.Carrier_tracking_number
             OR target.unit_price <> source.unit_price
             OR target.total_value <> source.total_value
      )
      THEN UPDATE SET 
                target.Sales_Order_detailid = source.Sales_Order_detailid,
                target.Carrier_tracking_number = source.Carrier_tracking_number,
                target.unit_price = source.unit_price,
                target.total_value = source.total_value   
     WHEN NOT MATCHED BY target
     THEN
          INSERT(sales_orderid,Sales_Order_detailid,Carrier_tracking_number,unit_price,total_value,last_update)
          VALUES(source.sales_orderid,source.Sales_Order_detailid,source.Carrier_tracking_number,source.unit_price,source.total_value,GETDATE());
END
