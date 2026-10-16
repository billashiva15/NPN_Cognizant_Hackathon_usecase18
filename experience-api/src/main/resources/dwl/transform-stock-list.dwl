%dw 2.0
output application/json
---
payload map (dbRow) -> {
    sku: dbRow.sku default "",
    totalAvailableQty: dbRow.available_qty default 0,
    reorderPoint: dbRow.reorder_point default 0,
    maximumLevel: dbRow.maximum_level default 0,
    lastSnapshotTime: dbRow.last_updated default "",
    locations: [
        {
            locationCode: dbRow.warehouse_code default "",
            availableQty: dbRow.available_qty default 0,
            unitCost: 0.00
        }
    ]
}