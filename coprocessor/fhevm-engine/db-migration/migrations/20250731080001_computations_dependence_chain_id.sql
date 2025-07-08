ALTER TABLE computations
ADD COLUMN IF NOT EXISTS dependence_chain_id BYTEA;

CREATE INDEX IF NOT EXISTS idx_computations_dependence_chain
       ON computations (dependence_chain_id)
       WHERE is_completed = false AND is_error=false;
