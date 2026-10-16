%dw 2.0
output application/json
---
{
    fileName: vars.sourceFileName default "unknown.csv",
    fileChecksum: vars.fileChecksum default uuid(),
    warehouseCode: vars.warehouseCode default "WH-01",
    snapshotTimestamp: now() as String {format: "yyyy-MM-dd HH:mm:ss"},
    totalRows: sizeOf(vars.validRows default []) + sizeOf(vars.invalidRows default []),
    correlationId: vars.correlationId default uuid()
}