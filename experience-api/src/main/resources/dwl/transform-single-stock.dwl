%dw 2.0
output application/json
var dbRow = payload[0] default {}
---
{
    sku: dbRow.sku default "",
    totalAvailableQty: dbRow.available_qty default 0,
    reorderPoint: 10,
    maximumLevel: 100,
    lastSnapshotTime: dbRow.last_counted_at default "",
    locations: [
        {
            locationCode: dbRow.location_code default "",
            availableQty: dbRow.available_qty default 0,
            unitCost: dbRow.unit_cost default 0.00
        }
    ]
}