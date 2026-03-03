# Meleah's World — Setup Guide for Melissa

Everything you need to get the app running on iPad and iMac, step by step. No tech experience needed!

---

## Step 1 — Run the Database Setup in Supabase

You only need to do this **once**.

1. Go to **[supabase.com](https://supabase.com)** and sign in
2. Click your project (the one you set up for Meleah's World)
3. In the left sidebar, click **SQL Editor**
4. Click **New query** (top right)
5. Open the file `supabase/migrations/001_initial_schema.sql` in a text editor (TextEdit on Mac works fine)
6. Copy everything in that file and paste it into the SQL Editor box
7. Click the green **Run** button
8. You should see "Success" — the database tables are now created!

> **If you see an error about policies already existing**, that's okay — just skip to Step 2. It means the tables were already created.

---

## Step 2 — Open the App in a Browser

The app is the file called **`Meleahs_World.html`** in this folder.

**On your iMac:**
- Double-click `Meleahs_World.html` — it will open in Safari or Chrome
- The app should load and show Meleah's home screen

**On iPad:**
- Email yourself the `Meleahs_World.html` file, OR
- Put it in iCloud Drive and open it from there in Safari
- Tap the file to open it in Safari

> **Tip:** The app needs the internet the first time to connect to Supabase. After that, it works offline too and syncs when you reconnect.

---

## Step 3 — Add to iPad Home Screen (makes it look like a real app!)

1. Open `Meleahs_World.html` in **Safari** on the iPad
2. Tap the **Share button** (the box with an arrow pointing up) at the top or bottom of Safari
3. Scroll down and tap **"Add to Home Screen"**
4. Name it **Meleah's World** and tap **Add**
5. The app icon now appears on the home screen — tap it to open like any app!

---

## Step 4 — Unlock Melissa's Management Area

The **Melissa tab** (👩‍💼) is password-protected.

- Default password: **`meleah2024`**
- Tap the Melissa tab, type the password, and tap **Unlock 🔓**
- From there you can add tasks, set goals, adjust coin values, and read Meleah's journal

### To change the password:
1. Open `Meleahs_World.html` in a text editor (right-click → Open With → TextEdit)
2. Press **⌘F** (Command+F) to search
3. Search for: `meleah2024`
4. Change it to your new password (keep the quotes around it)
5. Save the file — done!

---

## Step 5 — Using the Calendar (New Feature!)

The **📅 Calendar tab** lets Meleah plan ahead:

- **Tap any future date** to see a day detail sheet
- **Add a plan** by picking an emoji, typing what's happening, and tapping "Add Plan ⭐"
- **On the day it arrives**, the planned item automatically appears in Meleah's To-Do's so she earns coins for it!
- **Purple circle** = today
- **Gold dot** = future date with a plan
- **Pink dot** = a date with a journal entry

---

## How the Coin System Works

| Activity | Coins Earned |
|----------|-------------|
| Melissa's Task | 5–10 🪙 (you set this) |
| Reading Studio | 10 🪙 (adjustable) |
| Story Studio | 10 🪙 (adjustable) |
| My Plan | 5 🪙 (adjustable) |
| Meleah's own to-do | 2 🪙 |
| Calendar plan (completed) | 2 🪙 |

To cash out: go to **Melissa tab → Cash Out Reward**, enter the $ value per coin, and click Calculate. Then send the amount via **Apple Cash** or add it to Meleah's **Greenlight card**.

---

## Syncing Between iPad and iMac

The app automatically syncs through Supabase whenever both devices are online. Changes made on the iPad (like completing a task) will appear on the iMac, and vice versa.

If one device is offline, changes are saved locally and uploaded automatically when internet returns. You'll see a yellow banner at the top when offline.

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| App shows old data after switching devices | Pull down to refresh the browser page |
| Yellow "Offline" banner shows | Check WiFi connection — app still works and will sync when back online |
| Melissa tab won't unlock | Check that the password matches what's in the file (default: `meleah2024`) |
| App is blank or won't load | Make sure you have internet for the first load; also check the Supabase SQL was run |
| Calendar events didn't move to To-Do's | They migrate on the next app open when the date changes |

---

## Step 6 — Run the Weekly Assignments Database Update

The weekly assignment system needs two new database tables. You only do this **once**.

1. Go to **[supabase.com](https://supabase.com)** and sign in
2. Click **SQL Editor** → **New query**
3. Open `supabase/migrations/002_weekly_assignments.sql` in TextEdit
4. Copy everything and paste into the SQL Editor box
5. Click the green **Run** button
6. You should see "Success" — the new tables are ready!

---

## Step 7 — Set Up GitHub Pages (One-Time, ~10 minutes)

GitHub Pages hosts the assignment files online so Dad and Aunt can open the link from their phones. You only do this once.

### Create the repository:

1. Go to **[github.com](https://github.com)** and sign in
2. Click the **+** button (top right) → **New repository**
3. Name it: `meleah-assignments`
4. Make sure **Public** is selected (required for free GitHub Pages)
5. Click **Create repository**

### Upload the files:

6. On the new repo page, click **"uploading an existing file"** (or drag and drop)
7. Drag ALL of these files/folders from your `Dylexia Tutor` folder onto the GitHub upload page:
   - `WeeklyPlan.html`
   - `print.css`
   - The entire `activities/` folder
   - The entire `worksheets/` folder
8. Type a description like "Weekly assignments for Meleah"
9. Click the green **Commit changes** button

### Turn on GitHub Pages:

10. Click the **Settings** tab in your repository
11. Scroll down to the **Pages** section (in the left sidebar)
12. Under "Branch", select **main** and click **Save**
13. Wait about 2 minutes, then your site is live at:
    `https://yourusername.github.io/meleah-assignments/`

### Connect GitHub Pages to the app:

14. Open `Meleahs_World.html` in your browser
15. Go to **Melissa tab** → unlock → scroll to **📋 Weekly Plans**
16. In the **"Your GitHub Pages URL"** field, paste your URL (e.g. `https://melissaforte.github.io/meleah-assignments`)
17. Click **Save URL** — this is saved permanently

> **After you upload new files to GitHub:** You'll need to upload the updated files again the same way (drag and drop → Commit changes). GitHub Pages updates within a minute or two.

---

## Using Weekly Plans (Every Friday)

1. Open `Meleahs_World.html` → **👩‍💼 Melissa tab** → unlock
2. Scroll to **📋 Weekly Plans**
3. The current week is auto-selected — use ◀ ▶ to navigate weeks
4. Click **"Upload Teacher Doc"** → find the teacher's .docx file in your Downloads
5. The teacher's notes appear for reference
6. Fill in the FCL concept number and name
7. Click through **Mon / Tue / Wed / Thu / Fri** tabs and fill in each day's activity
   - **Mon & Wed** are iPad interactive days (Meleah does activities on her iPad)
   - **Tue, Thu, Fri** are paper days (print and do together)
8. Fill in the **Story Studio** section for Aunt's FaceTime prompts
9. Click **📤 Publish & Get Share Link**
10. Copy the message and paste it into iMessage to Dad and Aunt!

---

## How the Coin System Works

| Activity | Coins Earned |
|----------|-------------|
| Melissa's Task | 5–10 🪙 (you set this) |
| Reading Studio | 10 🪙 (adjustable) |
| Story Studio | 10 🪙 (adjustable) |
| My Plan | 5 🪙 (adjustable) |
| Meleah's own to-do | 2 🪙 |
| Calendar plan (completed) | 2 🪙 |
| Interactive iPad activity (each) | 5 🪙 (automatic!) |

Interactive activities (Tap Word, Drag Sort, Spell It, Read & Answer) automatically add coins to Meleah's balance when she finishes — no action needed from you!

To cash out: go to **Melissa tab → Cash Out Reward**, enter the $ value per coin, and click Calculate. Then send the amount via **Apple Cash** or add it to Meleah's **Greenlight card**.

---

## Syncing Between iPad and iMac

The app automatically syncs through Supabase whenever both devices are online. Changes made on the iPad (like completing a task) will appear on the iMac, and vice versa.

If one device is offline, changes are saved locally and uploaded automatically when internet returns. You'll see a yellow banner at the top when offline.

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| App shows old data after switching devices | Pull down to refresh the browser page |
| Yellow "Offline" banner shows | Check WiFi connection — app still works and will sync when back online |
| Melissa tab won't unlock | Check that the password matches what's in the file (default: `meleah2024`) |
| App is blank or won't load | Make sure you have internet for the first load; also check the Supabase SQL was run |
| Calendar events didn't move to To-Do's | They migrate on the next app open when the date changes |
| Weekly plan link doesn't work | Make sure you clicked "Save URL" in the Weekly Plans section with your GitHub Pages URL |
| Dad/Aunt says the link doesn't open | Check that GitHub Pages is enabled in your repository settings |
| Activities don't show words | Publish the week's plan first (set status to Published), then try again |

---

## File Overview

```
Dylexia Tutor/
├── Meleahs_World.html           ← The entire app (open this!)
├── WeeklyPlan.html              ← Shareable weekly plan (uploaded to GitHub Pages)
├── print.css                    ← Print styles (uploaded to GitHub Pages)
├── README.md                    ← This guide
├── MeleahsWorld_ClaudeCode_Spec.md  ← Original design notes
├── activities/                  ← Interactive games for Meleah (uploaded to GitHub Pages)
│   ├── tap-word.html            ← Tap the Right Word game
│   ├── drag-sort.html           ← Drag & Sort Words game
│   ├── spell-word.html          ← Spell It Out! game
│   └── read-comprehension.html  ← Read & Answer game
├── worksheets/                  ← Printable paper sheets (uploaded to GitHub Pages)
│   ├── reading-worksheet.html   ← Reading Studio worksheet
│   └── myplan-worksheet.html    ← My Plan weekly sheet
└── supabase/
    └── migrations/
        ├── 001_initial_schema.sql  ← Original database setup (run once)
        └── 002_weekly_assignments.sql  ← Weekly plans database update (run once)
```

---

*App built for Meleah Forte by Melissa Forte with Claude Code — March 2026*
