DROP TABLE IF EXISTS silver.fac_sales_order_detail

CREATE TABLE silver.fac_sales_order_detail(
sales_orderid VARCHAR(20) NOT NULL,
Sales_Order_detailid VARCHAR(20) NOT NULL,
Carrier_tracking_number  VARCHAR(20) NOT NULL,
unit_price MONEY NOT NULL,
total_value MONEY NOT NULL
) 
