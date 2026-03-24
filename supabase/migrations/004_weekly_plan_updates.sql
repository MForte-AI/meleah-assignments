-- Migration 004: Add additional_notes column to meleah_weekly_plans
-- Run this in Supabase SQL Editor: Settings → SQL Editor → paste + Run

ALTER TABLE meleah_weekly_plans
  ADD COLUMN IF NOT EXISTS additional_notes text;
