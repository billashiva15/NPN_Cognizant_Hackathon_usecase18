%dw 2.0
output application/json
---
{
    supplierCode: payload.supplierCode default "SUP-DEFAULT",
    deliverToWarehouse: payload.warehouseCode default "WH-01",
    idempotencyKey: uuid(),
    lines: [
        {
            sku: payload.sku,
            quantity: (payload.reorderQty default 10) as Number,
            unitCost: (payload.unitCost default 0.00) as Number
        }
    ]
}