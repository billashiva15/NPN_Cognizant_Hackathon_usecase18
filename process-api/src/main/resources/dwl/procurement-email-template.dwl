%dw 2.0
output application/json
---
{
    subject: "Daily Procurement Digest: " ++ (vars.skuCount default 0) ++ " Items Below Reorder Point",
    body: "Automated Daily Inventory Digest\n"
          ++ "-----------------------------------\n"
          ++ "Total SKUs requiring reorder : " ++ (vars.skuCount default 0) ++ "\n"
          ++ "Total Suppliers affected     : " ++ (vars.supplierCount default 0) ++ "\n"
          ++ "Purchase Orders Auto-Raised  : " ++ (vars.poRaisedCount default 0) ++ "\n"
          ++ "Orders Suppressed (Rules)    : " ++ (vars.suppressedCount default 0) ++ "\n"
          ++ "Order Failures               : " ++ (vars.failedCount default 0) ++ "\n\n"
          ++ "Please review the system dashboard to approve pending Purchase Orders."
}