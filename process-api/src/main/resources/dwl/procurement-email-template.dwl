%dw 2.0
output application/java
---
{
    subject: "Stock Load SUCCESS - " ++ (vars.sourceFileName default "STOCK_WHHYD01_202610241002.csv"),
    body: "Inventory Integration Load Summary
--------------------------------------------------
File Name     : " ++ (vars.sourceFileName default "STOCK_WHHYD01_202610241002.csv") ++ "
Warehouse     : " ++ (vars.warehouseCode default "WHHYD01") ++ "
Status        : SUCCESS

Rows Read     : " ++ (vars.totalRows default 0) ++ "
Rows Applied  : " ++ (vars.acceptedRows default 2) ++ "
Rows Rejected : " ++ (vars.rejectedRows default 0) ++ "
SKUs Changed  : " ++ (vars.skusChanged default 2) ++ "
Reorder Events: " ++ (vars.reorderEvents default 0) ++ "

Archived To   : " ++ (vars.targetDirectory default "C:/data/inventory/archive") ++ "/" ++ (vars.sourceFileName default "") ++ "
Correlation ID: " ++ (vars.correlationId default "file-STOCK_WHHYD01_202610241002.csv") ++ "

Inventory Integration Service"
}