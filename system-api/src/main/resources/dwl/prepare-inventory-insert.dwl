%dw 2.0
output application/json
import * from dw::core::Strings

fun cleanRow(row) = do {
    var parsedQty = if (!isEmpty(row.countedQty)) (row.countedQty as Number default 0) else 0
    var parsedCost = if (!isEmpty(row.unitCost)) (row.unitCost as Number default 0.00) else 0.00
    var cleanSku = trim(row.sku default "")
    var cleanLocation = trim(row.location default "")
    
    var isValid = !isEmpty(cleanSku) and !isEmpty(cleanLocation) and parsedQty >= 0
    ---
    {
        sku: cleanSku,
        location: cleanLocation,
        countedQty: parsedQty,
        unitCost: parsedCost,
        currency: trim(row.currency default "USD"),
        countedAt: trim(row.countedAt default now() as String {format: "yyyy-MM-dd HH:mm:ss"}),
        uom: trim(row.uom default "EA"),
        valid: isValid,
        reason: if (isEmpty(cleanSku)) "Missing SKU" 
                else if (isEmpty(cleanLocation)) "Missing Location" 
                else if (parsedQty < 0) "Invalid Counted Quantity" 
                else "VALID"
    }
}
---
if (isEmpty(payload)) 
    []
else 
    payload map ((item, index) -> cleanRow(item))