%dw 2.0
output application/json
---
payload map (dbRow) -> {
    eventId: dbRow.id default "", // Adjust if your primary key is named differently
    sku: dbRow.sku default "",
    warehouseCode: dbRow.warehouse_code default "",
    status: dbRow.status default "",
    poNumber: dbRow.po_number default "",
    raisedAt: dbRow.raised_at default ""
}