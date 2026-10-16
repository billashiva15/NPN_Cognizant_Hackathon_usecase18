%dw 2.0
output application/json
---
payload map (dbRow) -> {
    snapshotId: dbRow.snapshot_id default "",
    fileName: dbRow.file_name default "",
    warehouseCode: dbRow.warehouse_code default "",
    status: dbRow.status default "",
    totalRows: dbRow.total_rows default 0,
    acceptedRows: dbRow.accepted_rows default 0,
    rejectedRows: dbRow.rejected_rows default 0,
    skusChanged: dbRow.skus_changed default 0,
    reorderEvents: dbRow.reorder_events default 0,
    startedAt: dbRow.started_at default "",
    finishedAt: dbRow.finished_at default ""
}