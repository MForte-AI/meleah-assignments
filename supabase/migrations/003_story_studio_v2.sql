-- Migration 003: Story Studio v2 — add vocab cards column
-- ─────────────────────────────────────────────────────────
-- Run this in your Supabase Dashboard → SQL Editor
-- It is SAFE to run even if it was already run (IF NOT EXISTS prevents errors)
-- It does NOT change or delete any existing data
--
-- What it does:
--   Adds one new column "vocab_cards_json" to the meleah_daily_assignments table.
--   This column stores vocabulary card details (word, emoji, definition, synonyms,
--   example sentence) as JSON for the new 3-session Story Studio feature.
--   All existing rows will have NULL in this column — that is expected and fine.

ALTER TABLE meleah_daily_assignments
  ADD COLUMN IF NOT EXISTS vocab_cards_json text;
