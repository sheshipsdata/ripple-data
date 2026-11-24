# 🌊 ripple-data

Welcome to Ripple, a fast-growing startup that sells self-care subscription boxes. Its revenue report runs on a laptop named Gerald. The board wants real numbers by Friday. Somewhere in here, there's a million-dollar order from 1970 that nobody can explain.

This repo holds Ripple's raw data and your work for the **She Ships Data** companion exercises. Every episode's exercise uses this same data, so your skills build all season.

📺 **Watch Episode 1:** [EPISODE 1 LINK]
🧰 **Exercise 1 walkthrough:** [EXERCISE 1 LINK]

## Start here

1. Click **Use this template**, then **Create a new repository**, to make your own copy. Don't work in this original repo.
2. Open your copy in **Codespaces**: click the green **<> Code** button, then **Codespaces**, then **Create codespace on main**. Everything you need installs itself.
3. Follow the Exercise 1 walkthrough.

**Check that your workspace works.** In the terminal, from inside the `ripple-data` folder, run:

```bash
duckdb -f check_setup.sql
```

You should see five row counts and **✅ Ripple is ready**.

### 🛟 Stuck on setup?

Open the Colab escape hatch to explore the data in your browser tonight, with nothing to install. It doesn't save your work, so come back to Codespaces when you're ready.

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/sheshipsdata/ripple-data/blob/main/notebooks/exercise-01-colab.ipynb)

## What's in here

| Folder or file | What it is |
| --- | --- |
| `data/raw/` | Ripple's source data, straight from each system. **Read it, but don't edit it.** |
| `my-notes/` | Your answers for each exercise. This is the folder you edit and commit. |
| `notebooks/` | Colab notebooks, the escape hatch if setup gets in your way |
| `check_setup.sql` | Checks that your workspace works |
| `.devcontainer/` | Tells Codespaces what to install. You don't need to touch it. |

## Ripple's sources

| File | Where it comes from |
| --- | --- |
| `app_orders.csv` | The app database: every order |
| `app_customers.csv` | The app database: every customer |
| `payments_export.csv` | The payments provider's nightly export |
| `support_tickets.csv` | The help-desk tool |
| `Revenue_FINAL_v3_USE_THIS.csv` | Marketing's influencer spreadsheet (yes, really) |

All names, people and companies in this data are made up.

> Breathe. Check the logs. Then panic if you still need to. — Jo
