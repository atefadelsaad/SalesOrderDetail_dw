CREATE OR ALTER PROCEDURE silver.sales_order_detail_import
AS
BEGIN
      INSERT INTO silver.fac_sales_order_detail(sales_orderid,Sales_Order_detailid,Carrier_tracking_number,unit_price,total_value)
SELECT 
       salesorderid,
       [SalesOrderDetailID],
       ISNULL ([CarrierTrackingNumber] , 'N/A'),
       NULLIF([UnitPrice],0),
       NULLIF(SUM(UnitPrice) OVER(ORDER  BY salesorderid ASC),0)
FROM [bronze].[erp_SalesOrderbetail] 
END
