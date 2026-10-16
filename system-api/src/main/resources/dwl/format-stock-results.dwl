%dw 2.0
output application/json
---
{
    status: vars.loadStatus default "SUCCESS",
    correlationId: vars.correlationId,
    timestamp: now(),
    summary: {
        totalProcessed: sizeOf(vars.validRows default []) + sizeOf(vars.invalidRows default []),
        acceptedRows: sizeOf(vars.validRows default []),
        rejectedRows: sizeOf(vars.invalidRows default [])
    },
    records: vars.validRows default []
}