CREATE OR ALTER PROCEDURE silver.sales_order_detail_cleanup
AS
BEGIN
      TRUNCATE TABLE silver.fac_sales_order_detail
END