%dw 2.0
output application/json
var isPayloadEmpty = isEmpty(payload)
var item = if (isPayloadEmpty) {} 
           else payload match {
               case data is Object -> data
               case data is String -> read(data, "application/json")
               case data is Binary -> read(data, "application/json")
               else -> {}
           }
---
{
    message: item.message default "Manual reorder successfully triggered",
    poNumber: item.poNumber default ("PO-" ++ upper(uuid()[0 to 7])),
    sku: attributes.uriParams.sku default item.sku default "",
    status: item.status default "SUBMITTED"
}