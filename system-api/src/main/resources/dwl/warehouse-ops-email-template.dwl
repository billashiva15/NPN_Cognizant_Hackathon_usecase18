%dw 2.0
output application/json
---
{
    subject: "Stock load " ++ (payload.loadStatus default "SUCCESS") ++ " - " ++ (vars.sourceFileName default "Unknown_File.csv"),
    body: "Inventory Integration Load Summary\n" ++
          "-----------------------------------\n" ++
          "File          : " ++ (vars.sourceFileName default "") ++ "\n" ++
          "Warehouse     : " ++ (vars.warehouseCode default "Unknown") ++ "\n" ++
          "Status        : " ++ (payload.loadStatus default "SUCCESS") ++ "\n\n" ++
          "Rows read     : " ++ (payload.totalRows default 0) ++ "\n" ++
          "Rows applied  : " ++ (payload.acceptedRows default 0) ++ "\n" ++
          "Rows rejected : " ++ (payload.rejectedRows default 0) ++ "\n" ++
          "SKUs changed  : " ++ (payload.skusChanged default 0) ++ "\n" ++
          "Reorder events: " ++ (payload.reorderEvents default 0) ++ "\n\n" ++
          "Archived to   : " ++ (vars.archivePath default "") ++ "\n" ++
          "Correlation ID: " ++ (vars.correlationId default "")
}