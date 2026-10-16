%dw 2.0
output application/json
---
payload map ((item) -> do {
    var currentStock = (item.availableQty default 0) as Number
    var reorderPoint = (item.reorderPoint default 0) as Number
    var reorderQty = (item.reorderQty default 50) as Number
    var isBelowRop = currentStock <= reorderPoint
    ---
    {
        sku: item.sku,
        warehouseCode: item.location default "WH-01",
        supplierCode: item.supplierCode default "SUP-DEFAULT",
        availableQtyAllLocations: currentStock,
        reorderPoint: reorderPoint,
        reorderQty: reorderQty,
        unitCost: (item.unitCost default 0.00) as Number,
        shouldReorder: isBelowRop,
        source: "AUTOMATED_ROP_CHECK",
        eventId: uuid(),
        correlationId: vars.correlationId default uuid()
    }
}) filter ((res) -> res.shouldReorder)