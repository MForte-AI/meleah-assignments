-- Migration 002: Weekly Assignment System
-- Run this in Supabase Dashboard → SQL Editor

-- ─────────────────────────────────────────────────────────────
-- Table: meleah_weekly_plans
-- One row per school week. Stores the FCL concept, teacher notes,
-- and publication status for that week.
-- ─────────────────────────────────────────────────────────────
create table if not exists meleah_weekly_plans (
  id            text primary key,         -- ISO date of Monday: '2026-03-02'
  week_start    date not null,
  fcl_concept   integer,                  -- 26–43
  concept_name  text,                     -- e.g. 'Beginning Consonant Blends'
  teacher_notes text,                     -- raw extracted text from teacher doc
  status        text default 'draft',     -- 'draft' | 'published'
  created_at    timestamptz default now(),
  updated_at    timestamptz default now()
);

-- ─────────────────────────────────────────────────────────────
-- Table: meleah_daily_assignments
-- One row per activity per day. Belongs to a weekly plan.
-- track: 'reading' | 'story' | 'plan'
-- day_of_week: 'monday' | 'tuesday' | 'wednesday' | 'thursday' | 'friday'
-- session_type: 'interactive' | 'paper' (reading track only)
-- ─────────────────────────────────────────────────────────────
create table if not exists meleah_daily_assignments (
  id             text primary key,
  week_id        text references meleah_weekly_plans(id) on delete cascade,
  day_of_week    text not null,
  track          text not null,
  session_type   text default 'paper',    -- 'interactive' | 'paper'
  activity_name  text,
  instructions   text,
  word_list      text,                    -- comma-separated
  coach_tips     text,
  duration_min   integer,
  sort_order     integer default 0,
  created_at     timestamptz default now()
);

-- ─────────────────────────────────────────────────────────────
-- Row Level Security (permissive — matches existing tables)
-- ─────────────────────────────────────────────────────────────
alter table meleah_weekly_plans enable row level security;
alter table meleah_daily_assignments enable row level security;

create policy "anon all on meleah_weekly_plans"
  on meleah_weekly_plans for all to anon
  using (true) with check (true);

create policy "anon all on meleah_daily_assignments"
  on meleah_daily_assignments for all to anon
  using (true) with check (true);

-- ─────────────────────────────────────────────────────────────
-- Add FCL concept tracker to existing meleah_state table
-- (safe to run even if column already exists)
-- ─────────────────────────────────────────────────────────────
alter table meleah_state
  add column if not exists current_fcl_concept integer default 26;

-- ─────────────────────────────────────────────────────────────
-- Add GitHub Pages base URL to meleah_state
-- (Melissa updates this once after GitHub Pages is set up)
-- ─────────────────────────────────────────────────────────────
alter table meleah_state
  add column if not exists assignments_base_url text default '';
