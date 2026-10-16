%dw 2.0
output application/json
---
// Since it's a single item, we take the first row [0] from the DB array
if (isEmpty(payload)) {} else {
    sku: payload[0].sku default "",
    totalAvailableQty: payload[0].available_qty default 0,
    reorderPoint: payload[0].reorder_point default 0,
    maximumLevel: payload[0].maximum_level default 0,
    lastSnapshotTime: payload[0].last_updated default "",
    locations: [
        {
            locationCode: payload[0].warehouse_code default "",
            availableQty: payload[0].available_qty default 0,
            unitCost: 0.00
        }
    ]
}