ALTER TABLE computations
ADD COLUMN IF NOT EXISTS transaction_id BYTEA;

CREATE INDEX IF NOT EXISTS idx_computations_transaction_id ON computations (transaction_id);

CREATE INDEX IF NOT EXISTS idx_computations_schedule_order
       ON computations USING BTREE (schedule_order)
       WHERE is_completed = false AND is_error=false;

CREATE INDEX IF NOT EXISTS idx_allowed_handles_handle on allowed_handles (handle);
