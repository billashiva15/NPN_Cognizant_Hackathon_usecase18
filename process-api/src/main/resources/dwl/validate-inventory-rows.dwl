%dw 2.0
output application/json
import * from dw::core::Strings
---
payload map ((row, index) -> do {
    // Safely check and cast fields
    var cleanSku = trim(row.sku default "")
    var parsedQty = (row.available_qty default row.countedQty default 0) as Number {class: "java.math.BigDecimal"} default -1
    
    var hasValidSku = !isEmpty(cleanSku)
    var hasValidQty = parsedQty >= 0
    ---
    {
        lineNumber: index + 1,
        sku: cleanSku,
        location: trim(row.location default ""),
        availableQty: parsedQty,
        valid: hasValidSku and hasValidQty,
        reasonCode: if (!hasValidSku) "UNKNOWN_SKU" else if (!hasValidQty) "NEGATIVE_QTY" else "OK",
        reason: if (!hasValidSku) "SKU missing or invalid" else if (!hasValidQty) "Quantity below zero" else "Passed validation"
    }
})