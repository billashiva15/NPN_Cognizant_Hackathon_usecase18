%dw 2.0
output application/java
---
{
    subject: "Stock Load SUCCESS - " ++ (vars.sourceFileName default "N/A"),
    body: "Inventory Integration Load Summary
--------------------------------------------------
File Name     : " ++ (vars.sourceFileName default "N/A") ++ "
Warehouse     : " ++ (vars.warehouseCode default "WHHYD01") ++ "
Status        : SUCCESS

Rows Read     : " ++ (payload.totalRows default 0) ++ "
Rows Applied  : " ++ (payload.acceptedRows default 0) ++ "
Rows Rejected : " ++ (payload.rejectedRows default 0) ++ "
SKUs Changed  : " ++ (payload.skusChanged default 0) ++ "
Reorder Events: " ++ (payload.reorderEvents default 0) ++ "

Archived To   : " ++ (vars.targetDirectory default "C:/data/inventory/archive") ++ "/" ++ (vars.sourceFileName default "") ++ "
Correlation ID: " ++ (vars.correlationId default "N/A") ++ "

Inventory Integration Service
Nurture Partner Network (NPN) - Cognizant"
}