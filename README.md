# 🌊 ripple-data

Welcome to Ripple, a fast-growing startup that sells self-care subscription boxes. Its revenue report runs on a laptop named Gerald. The board wants real numbers by Friday. Somewhere in here, there's a million-dollar order from 1970 that nobody can explain.

This repo holds Ripple's raw data and the **She Ships Data** companion exercises. Every exercise uses the same data, so your skills build all season.

## Start here

1. Click **Use this template**, then **Create a new repository**, to make your own copy. Don't work in this original repo.
2. Open [Exercise 1](exercises/01-kitchen/) and follow it step by step. It walks you through everything, including setup.

📚 **New to GitHub or Codespaces?** The [wiki](https://github.com/sheshipsdata/ripple-data/wiki) has a click-by-click [Getting Started](https://github.com/sheshipsdata/ripple-data/wiki/Getting-Started) guide, plus [Troubleshooting](https://github.com/sheshipsdata/ripple-data/wiki/Troubleshooting), a [Glossary](https://github.com/sheshipsdata/ripple-data/wiki/Glossary) and an [FAQ](https://github.com/sheshipsdata/ripple-data/wiki/FAQ).

## Exercises

| # | Episode | Exercise | Walkthrough |
| --- | --- | --- | --- |
| 1 | Day One | Set up your workspace and map Ripple's kitchen | [exercises/01-kitchen](exercises/01-kitchen/) |
| 2 | *Coming soon* | | |

Each exercise has its own folder with:

- `README.md`: the step-by-step walkthrough (GitHub shows it when you open the folder)
- `my-notes.md`: where you write your answers. This is the file you edit and commit.
- Starter files and a Colab notebook, when the exercise needs them

## Get a new exercise

New exercises come out with each episode. Your copy doesn't update by itself, so you pull each new exercise's folder from this repo. Run these from inside your `ripple-data` folder.

**The first time only,** connect your copy to the original Ripple repo. Engineers call the original the **upstream**.

```bash
git remote add upstream https://github.com/sheshipsdata/ripple-data.git
```

**Each new episode,** download the latest exercises, then copy in the new folder. Replace `02-warehouse` with the folder name from the table above.

```bash
git fetch upstream
```

```bash
git checkout upstream/main -- exercises/02-warehouse
```

Then save it to your copy like any other change:

```bash
git commit -m "Add Exercise 2"
```

```bash
git push
```

> [!WARNING]
> Only run the `checkout` command for a **new** exercise. Running it again for an exercise you've already started replaces that folder, including your `my-notes.md` answers.

## Check that your workspace works

From inside the `ripple-data` folder, run:

```bash
duckdb -f check_setup.sql
```

You should see five row counts and **✅ Ripple is ready**.

## What's in here

| Folder or file | What it is |
| --- | --- |
| `data/raw/` | Ripple's source data, straight from each system. **Read it, but don't edit it.** |
| `exercises/` | One folder per episode: walkthrough, your notes and starter files |
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
