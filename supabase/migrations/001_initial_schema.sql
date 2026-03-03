-- ============================================================
-- Meleah's World — Supabase Database Schema
-- Run this in: Supabase Dashboard → SQL Editor → paste → Run
-- ============================================================

-- ─── MAIN STATE ────────────────────────────────────────────
-- Stores coins, goals, dates, and counters for Meleah
create table if not exists meleah_state (
  id           uuid    default gen_random_uuid() primary key,
  user_id      text    not null unique,
  coins_total  integer default 0,
  coins_quick_earned integer default 0,
  coins_dream_earned integer default 0,
  coin_value_cents   numeric default 0.05,
  quick_goal_name    text    default 'Movie Night 🍿',
  quick_goal_target  integer default 50,
  dream_goal_name    text    default 'NYC Trip ✈️',
  dream_goal_target  integer default 500,
  last_date          text    default '',
  total_tasks_done   integer default 0,
  total_days_active  integer default 0,
  week_data          jsonb   default '{}',
  updated_at         timestamptz default now()
);

-- ─── TASKS (Melissa sets these) ────────────────────────────
create table if not exists meleah_tasks (
  id         text    primary key,          -- client-generated UUID
  user_id    text    not null default 'meleah',
  emoji      text    not null,
  name       text    not null,
  coins      integer not null default 5,
  done       boolean default false,
  sort_order integer default 0,
  created_at timestamptz default now()
);

-- ─── TODOS (Meleah adds her own) ───────────────────────────
create table if not exists meleah_todos (
  id         text    primary key,          -- client-generated UUID
  user_id    text    not null default 'meleah',
  emoji      text    not null,
  text       text    not null,
  done       boolean default false,
  coins      integer default 2,
  date_added text    not null,             -- YYYY-MM-DD
  created_at timestamptz default now()
);

-- ─── JOURNAL ───────────────────────────────────────────────
create table if not exists meleah_journal (
  id           uuid default gen_random_uuid() primary key,
  user_id      text not null default 'meleah',
  entry_date   text not null,              -- YYYY-MM-DD
  date_display text not null,              -- e.g. "Sunday, March 1"
  mood         text not null,
  mood_emoji   text not null,
  entry_text   text default '',
  created_at   timestamptz default now()
);
-- One journal entry per day per user
create unique index if not exists meleah_journal_date_idx
  on meleah_journal(user_id, entry_date);

-- ─── COIN HISTORY (append-only log) ───────────────────────
create table if not exists meleah_coin_history (
  id        uuid default gen_random_uuid() primary key,
  user_id   text not null default 'meleah',
  amount    integer not null,
  reason    text    not null,
  timestamp timestamptz default now()
);

-- ─── LEARNING TRACKS ───────────────────────────────────────
create table if not exists meleah_tracks (
  id        uuid default gen_random_uuid() primary key,
  user_id   text    not null default 'meleah',
  track_key text    not null,              -- 'reading' | 'story' | 'plan'
  done      boolean default false,
  streak    integer default 0,
  coins     integer not null,
  unique(user_id, track_key)
);

-- Insert default track rows (safe to re-run)
insert into meleah_tracks (user_id, track_key, done, streak, coins) values
  ('meleah', 'reading', false, 0, 10),
  ('meleah', 'story',   false, 0, 10),
  ('meleah', 'plan',    false, 0,  5)
on conflict (user_id, track_key) do nothing;

-- ─── CALENDAR EVENTS (future planning) ────────────────────
create table if not exists meleah_calendar_events (
  id               text primary key,       -- client-generated UUID
  user_id          text    not null default 'meleah',
  event_date       text    not null,        -- YYYY-MM-DD
  emoji            text    not null default '⭐',
  title            text    not null,
  done             boolean default false,
  coins            integer default 2,
  migrated_to_todo boolean default false,   -- set true after moving to todos
  created_at       timestamptz default now()
);

-- ─── ROW LEVEL SECURITY ────────────────────────────────────
-- Allow the anonymous key (used by the app) to read/write all tables.

alter table meleah_state          enable row level security;
alter table meleah_tasks          enable row level security;
alter table meleah_todos          enable row level security;
alter table meleah_journal        enable row level security;
alter table meleah_coin_history   enable row level security;
alter table meleah_tracks         enable row level security;
alter table meleah_calendar_events enable row level security;

create policy "anon_all" on meleah_state          for all to anon using (true) with check (true);
create policy "anon_all" on meleah_tasks          for all to anon using (true) with check (true);
create policy "anon_all" on meleah_todos          for all to anon using (true) with check (true);
create policy "anon_all" on meleah_journal        for all to anon using (true) with check (true);
create policy "anon_all" on meleah_coin_history   for all to anon using (true) with check (true);
create policy "anon_all" on meleah_tracks         for all to anon using (true) with check (true);
create policy "anon_all" on meleah_calendar_events for all to anon using (true) with check (true);
