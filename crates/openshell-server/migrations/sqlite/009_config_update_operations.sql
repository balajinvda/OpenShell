-- Index pending configuration update operations by retry time.
ALTER TABLE objects
    ADD COLUMN next_attempt_at_ms INTEGER;

CREATE INDEX IF NOT EXISTS objects_type_status_due_idx
    ON objects (object_type, status, next_attempt_at_ms, id);
