%dw 2.0
output application/json
---
payload map (dbRow) -> {
    lineNumber: dbRow.line_number default 0,
    sku: dbRow.sku default "",
    reasonCode: dbRow.reason_code default "",
    reason: dbRow.reason default ""
}