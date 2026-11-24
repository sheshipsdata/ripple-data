# 🧰 Exercise 1: Set Up Your Workspace and Map Ripple's Kitchen

> [!NOTE]
> **Goes with:** Episode 1, "Day One"
> **Time:** 45–60 minutes the first time (most of it is one-time setup), then about 20 minutes for the exercise itself
> **You'll need:** a computer with a web browser and an email address. That's it.

## What you'll do

1. Make your own copy of Ripple's data and open a workspace
2. Learn just enough terminal to get around
3. Look inside Ripple's raw data with DuckDB
4. Map Ripple's pipeline (the "kitchen" from the episode)
5. Hunt for the ghost row (bonus)
6. Save your work with Git

> [!TIP]
> **If you get stuck, that's normal.** Every engineer you admire has typed the wrong command hundreds of times. Check the [Troubleshooting](#troubleshooting) section at the bottom, and post your question in the YouTube comments with the exact error message.
>
> 📚 The [Ripple wiki](https://github.com/sheshipsdata/ripple-data/wiki) has more help: [Using Codespaces](https://github.com/sheshipsdata/ripple-data/wiki/Using-Codespaces), [Saving Your Work](https://github.com/sheshipsdata/ripple-data/wiki/Saving-Your-Work), a [Glossary](https://github.com/sheshipsdata/ripple-data/wiki/Glossary) and an [FAQ](https://github.com/sheshipsdata/ripple-data/wiki/FAQ).

## Part 0: Words you'll see

| Word | What it means |
| --- | --- |
| **Terminal** | A text window where you type commands instead of clicking. Also called the command line, shell or console. |
| **Command** | An instruction you type into the terminal and run by pressing **Enter**. |
| **Folder / directory** | Same thing. Engineers usually say "directory." |
| **Git** | A tool that saves snapshots of your work so you can track changes and undo mistakes. |
| **GitHub** | A website that stores Git projects online. |
| **Repository (repo)** | A project folder tracked by Git. Ripple's data lives in a repo called `ripple-data`. |
| **Commit** | One saved snapshot of your work, with a short message describing it. |
| **CSV file** | A spreadsheet saved as plain text, with commas between the columns. |
| **DuckDB** | A free database that can read CSV files directly with SQL. It plays the role of Ripple's data warehouse. |
| **SQL** | The language used to ask databases questions. |

> [!NOTE]
> **How to read the commands on this page:** each gray box is something to type (or copy and paste) into the terminal, then press **Enter**. Type one box at a time and wait for it to finish before typing the next one.

## Part 1: Make your copy and open your workspace

### Step 1.1: Create a free GitHub account

1. Go to [github.com](https://github.com) and click **Sign up**.
2. Enter your email, create a password and choose a username. Pick a username you'd be happy to show an employer, because your GitHub profile can become part of your portfolio.
3. Verify your email address using the code GitHub sends you.

Already have an account? Sign in and skip to Step 1.2.

### Step 1.2: Make your own copy of the Ripple repo

The Ripple repo is a **template**: a starter project you copy, not edit. Your copy belongs to you, so you can save your work to it without touching the original that everyone else copies.

1. Make sure you're **signed in** to GitHub. You'll see your profile picture in the top right corner.
2. Open the Ripple repo: [github.com/sheshipsdata/ripple-data](https://github.com/sheshipsdata/ripple-data) (also in the video description).
3. Find the green **Use this template** button. It's near the top right, just above the list of files. On a narrow screen, it may be below the repo name instead.
4. Click **Use this template**. A small menu drops down with two choices. Click **Create a new repository**.

> [!WARNING]
> Don't choose **Open in a codespace** from that menu. It opens a workspace that isn't saved to your own repo, so your work has nowhere to go. You'll open Codespaces the right way in Step 1.3.

5. A page called **Create a new repository** opens. Fill it in:
   - **Owner:** click the dropdown and choose **your own username**. If you belong to any organizations (like a company or school), don't pick those, because Codespaces is only free on your personal account.
   - **Repository name:** type `ripple-data`.
   - **Description:** leave it blank, or write something like "My She Ships Data exercises."
   - **Include all branches:** leave it **unchecked**.
   - **Public or Private:** choose **Public** (anyone can see it, which is great for your portfolio) or **Private** (only you can see it). Either works.
6. Click the green **Create repository** button at the bottom.
7. Wait a few seconds while GitHub copies the files.

**Check that it worked.** You should now be on your new repo's page:

- The top left says **YOUR-USERNAME / ripple-data** (with your username, not `sheshipsdata`).
- Just under the name, small gray text says **generated from sheshipsdata/ripple-data**.
- You see the same folders as the original: `.devcontainer`, `data`, `exercises` and a few files.

🎉 This is **your copy**. From now on, always work here, at `github.com/YOUR-USERNAME/ripple-data`. Bookmark it.

> [!TIP]
> **Lost your copy?** Click your profile picture (top right), then **Your repositories**, then **ripple-data**.

### Step 1.3: Choose where to work

Pick **one** path: **Option A (Codespaces)**, **Option B (Mac)** or **Option C (Windows)**. If you're not sure, choose Codespaces.

> [!TIP]
> **Setup fighting you?** Don't quit. Open the Colab escape hatch to do Parts 3–5 in your browser tonight with just a Google account:
>
> [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/sheshipsdata/ripple-data/blob/main/exercises/01-kitchen/colab-escape-hatch.ipynb)
>
> Colab doesn't save your work, so come back here and finish setup when you're ready. Part 6 (saving with Git) needs Codespaces, a Mac or Windows.

#### ☁️ Option A: Codespaces (recommended)

A **codespace** is a computer in the cloud that you use through your web browser. It comes with Git, a terminal and DuckDB already installed, so there's nothing to install on your own machine. It works on any computer with a modern browser, including Chromebooks.

**Is it free?** Yes, for these exercises. Free personal GitHub accounts include 120 "core hours" of Codespaces every month. The standard codespace uses 2 cores, so that's about **60 hours a month**, far more than you need. GitHub emails you if you ever get close to the limit.

**Open your codespace (first time only):**

1. Go to **your copy** of the repo: `github.com/YOUR-USERNAME/ripple-data`. Check the top left: it must show your username, not `sheshipsdata`.
2. Click the green **<> Code** button, above the list of files.
3. In the box that opens, click the **Codespaces** tab (next to **Local**).
4. Click the green **Create codespace on main** button.
5. A new browser tab opens with a **Setting up your codespace** screen. Wait 1–3 minutes. Don't close the tab.
6. A code editor appears. It might look busy. Here's what you're looking at:
   - **Left side:** the Explorer, a list of the repo's folders and files.
   - **Middle:** where files open when you click them. The project README opens here automatically.
   - **Bottom:** the **terminal**. This is where you'll type commands.

**Wait for setup to finish.** The first time, the codespace keeps installing DuckDB for another minute or two after the editor appears. You'll see text scrolling in the terminal. It's done when the terminal shows five row counts and **✅ Ripple is ready**.

- If the terminal then says **press any key to close the terminal**, click inside it and press any key.
- If no terminal is open at all, open one: click the menu icon (three lines, top left), then **Terminal**, then **New Terminal**.

When the terminal is ready for you, the last line looks something like this:

```text
@your-username ➜ /workspaces/ripple-data (main) $
```

That's the **prompt**. It means the terminal is waiting for you to type. The `$` at the end is where your typing goes.

**Pop-ups you can ignore:** small boxes in the bottom right corner about extensions, Git or settings are normal. Close them with the **×**. If one asks whether to open the codespace in the **Visual Studio Code app**, stay in the browser.

**Check that everything is ready.** Click inside the terminal, then type each command and press Enter:

```bash
git --version
```

```bash
duckdb --version
```

Each should print a version number, like `git version 2.x.x` and `v1.x.x`. Any version number is fine.

If `duckdb --version` says **command not found**, setup may still be running. Wait one minute, close the terminal (trash can icon on the terminal's top edge), open a new one and try again.

**Coming back later (every time after the first):**

1. Go to [github.com/codespaces](https://github.com/codespaces).
2. Find your codespace in the list (its name is random, like `fluffy-space-waddle`, with `ripple-data` underneath) and click it.
3. Your files and your work are exactly where you left them.

> [!IMPORTANT]
> **Reopen your existing codespace. Don't create a new one each time.** Each new codespace starts from a fresh copy and uses your free storage. One codespace is all you need for the whole season.

**Saving your free hours:** a codespace stops itself after about 30 minutes without activity, so closing the browser tab is enough. To stop it right away, go to [github.com/codespaces](https://github.com/codespaces), click the **…** next to your codespace and choose **Stop codespace**. Stopping doesn't delete anything.

> [!WARNING]
> **Push your work at the end of every exercise** (Part 6 shows you how). GitHub deletes a codespace you haven't opened in about 30 days. Anything you pushed is safe in your repo, and you can create a fresh codespace from it. Anything you didn't push is gone.

✅ **Done?** Skip to [Part 2](#part-2-terminal-survival-kit).

#### 🍎 Option B: Mac

**Open the terminal**

1. Press **Command (⌘) + Space** to open Spotlight.
2. Type `Terminal` and press **Enter**.
3. A window opens with a line ending in `%` or `$`. That's the prompt, waiting for you to type.

**Install Git**

Type this and press Enter:

```bash
git --version
```

- If you see something like `git version 2.x.x`, Git is installed. Move on.
- If a pop-up asks to install the **command line developer tools**, click **Install**, accept the agreement, and wait (it can take 5–15 minutes). Then run `git --version` again.

**Install DuckDB**

Copy and paste this, then press Enter:

```bash
curl https://install.duckdb.org | sh
```

When it finishes, read the last lines it prints. If it tells you to run a line that starts with `export PATH=`, copy that exact line, paste it into the terminal and press Enter. Then close the Terminal window and open a new one.

(If you already use Homebrew, `brew install duckdb` works too.)

Check it worked:

```bash
duckdb --version
```

**Tell Git who you are** (one time only). Replace the name and email with yours, keeping the quotation marks. Use the same email as your GitHub account.

```bash
git config --global user.name "Your Name"
```

```bash
git config --global user.email "you@example.com"
```

**Download your copy of the repo**

These commands go to your home folder, make a `Projects` folder, move into it, then download your repo. Replace `YOUR-USERNAME` with your GitHub username.

```bash
cd ~
```

```bash
mkdir -p Projects
```

```bash
cd Projects
```

```bash
git clone https://github.com/YOUR-USERNAME/ripple-data.git
```

```bash
cd ripple-data
```

✅ **Done?** Continue to [Part 2](#part-2-terminal-survival-kit). Keep this terminal window open.

#### 🪟 Option C: Windows

**Install Git**

1. Go to [git-scm.com](https://git-scm.com) and click **Download for Windows**.
2. Run the installer. Clicking **Next** on every screen with the default settings is fine.
3. Click **Finish**.

**Open the terminal**

1. Click the **Start** button.
2. Type `PowerShell` and click **Windows PowerShell**.
3. A window opens with a line ending in `>`. That's the prompt, waiting for you to type.

**Install DuckDB**

Type this and press Enter:

```powershell
winget install DuckDB.cli
```

If it asks you to agree to terms, type `Y` and press Enter. When it finishes, **close PowerShell and open a new one** (new installs only show up in new windows).

Check both tools work:

```powershell
git --version
```

```powershell
duckdb --version
```

**Tell Git who you are** (one time only). Replace the name and email with yours, keeping the quotation marks. Use the same email as your GitHub account.

```powershell
git config --global user.name "Your Name"
```

```powershell
git config --global user.email "you@example.com"
```

**Download your copy of the repo**

These commands go to your home folder, make a `Projects` folder, move into it, then download your repo. Replace `YOUR-USERNAME` with your GitHub username.

```powershell
cd ~
```

```powershell
mkdir Projects
```

```powershell
cd Projects
```

```powershell
git clone https://github.com/YOUR-USERNAME/ripple-data.git
```

```powershell
cd ripple-data
```

If `mkdir Projects` says the folder already exists, that's fine. Just continue.

✅ **Done?** Continue to Part 2. Keep this PowerShell window open.

## Part 2: Terminal survival kit

You only need a handful of commands. Try each one now. They work the same in Codespaces, Mac and Windows PowerShell.

| Command | What it does | Kitchen version |
| --- | --- | --- |
| `pwd` | Shows which folder you're in ("print working directory") | "Where am I standing?" |
| `ls` | Lists what's in the current folder | "What's on this shelf?" |
| `cd foldername` | Moves into a folder | Walk into the pantry |
| `cd ..` | Moves up one folder | Walk back out |
| `clear` | Clears the screen (nothing is deleted) | Wipe the counter |

**Keyboard shortcuts that save you:**

- **Up arrow:** brings back your last command so you don't retype it.
- **Tab:** finishes file and folder names for you. Type `cd da` and press Tab.
- **Ctrl + C:** stops whatever is running. Your emergency brake.

### Practice

Make sure you're inside `ripple-data`:

```bash
pwd
```

The output should end with `ripple-data`. If it doesn't, see **"I'm in the wrong folder"** in [Troubleshooting](#troubleshooting).

See what's in the repo:

```bash
ls
```

You should see at least `data`, `exercises` and `README.md`.

Look inside the raw data folder:

```bash
ls data/raw
```

You should see five files. These are Ripple's **sources**, straight from each system:

| File | Where it comes from |
| --- | --- |
| `app_orders.csv` | The app database: every order |
| `app_customers.csv` | The app database: every customer |
| `payments_export.csv` | The payments provider's nightly export |
| `support_tickets.csv` | The help-desk tool |
| `Revenue_FINAL_v3_USE_THIS.csv` | Marketing's influencer spreadsheet (yes, really) |

### Check that the data works

Run this from inside `ripple-data`:

```bash
duckdb -f check_setup.sql
```

You should see five row counts and **✅ Ripple is ready**. If you see an error instead, check [Troubleshooting](#troubleshooting).

## Part 3: Look inside Ripple's data with DuckDB

### Step 3.1: Start DuckDB

From inside the `ripple-data` folder, run:

```bash
duckdb ripple.duckdb
```

The prompt changes to `D`. You're now talking to the database, not the terminal, so **terminal commands like `ls` won't work here**, and SQL will.

> [!WARNING]
> **Two DuckDB rules:**
> 1. Every SQL command ends with a semicolon `;`. If you forget it and press Enter, the prompt changes to `‣` and waits. Just type `;` and press Enter.
> 2. To leave DuckDB and go back to the terminal, type `.exit` and press Enter.

### Step 3.2: Peek at the orders

This shows the first 5 rows of the orders file. DuckDB can read a CSV directly, just like a table.

```sql
SELECT * FROM 'data/raw/app_orders.csv' LIMIT 5;
```

**What this means:** `SELECT *` = show every column. `FROM 'file'` = from this file. `LIMIT 5` = only the first 5 rows.

### Step 3.3: See the columns

```sql
DESCRIBE SELECT * FROM 'data/raw/app_orders.csv';
```

This lists each column's name and type (number, text, date). Engineers call this the **schema**.

### Step 3.4: Count the rows in each source

Run this, then repeat it for each file by changing the file name. **Tip:** press the Up arrow to bring back the last command, then edit the file name.

```sql
SELECT COUNT(*) FROM 'data/raw/app_orders.csv';
```

Write each count down. You'll need them in Part 4.

### Step 3.5: Peek at the marketing spreadsheet

```sql
SELECT * FROM 'data/raw/Revenue_FINAL_v3_USE_THIS.csv' LIMIT 5;
```

Look at the column names. Would you trust this file to calculate revenue? Hold that thought.

## Part 4: Map Ripple's kitchen

Leave DuckDB first:

```sql
.exit
```

### Step 4.1: Open your notes file

Your notes file is `my-notes.md`, in the same folder as this walkthrough.

- **Codespaces:** in the Explorer on the left, click `exercises`, then `01-kitchen`, then `my-notes.md`.
- **Mac:** run `open exercises/01-kitchen/my-notes.md` to open it in your default text editor.
- **Windows:** run `notepad exercises\01-kitchen\my-notes.md`.

### Step 4.2: Fill in the map

Replace each `___` with your answers, using what you saw in Part 3 and in the episode. The file looks like this:

```markdown
# Exercise 1: Ripple's kitchen

## Sources (the farms)
| Source | File | Row count |
| --- | --- | --- |
| ___ | ___ | ___ |

## Ingestion (the delivery truck)
How does data get from the sources to the report today?
___

## Storage (the walk-in fridge)
Where does all the data live together today?
___

## Transformation (prep)
What cleaning or calculating needs to happen before revenue is trustworthy?
___

## Serving (the plate)
Who looks at the final numbers, and where?
___

## The source I trust least
___ because ___
```

Save the file:

- **Codespaces:** Ctrl + S (Windows/Linux) or Command + S (Mac).
- **Text editor or Notepad:** File, then Save.

<details>
<summary><b>Need a nudge? Hints for each section</b></summary>

- **Ingestion:** remember Gerald. What runs at 3am, and on what?
- **Storage:** does Ripple have a data warehouse yet?
- **Transformation:** think about duplicates, refunds and discount codes.
- **Least trusted source:** which file is edited by hand?

</details>

## Part 5 (bonus): Hunt for the ghost row

Start DuckDB again:

```bash
duckdb ripple.duckdb
```

Now find the biggest orders Ripple has ever had:

```sql
SELECT * FROM 'data/raw/app_orders.csv' ORDER BY amount DESC LIMIT 5;
```

`ORDER BY amount DESC` sorts from the biggest amount to the smallest.

Does anything look… haunted? Write down the row in your notes file under a new heading, `## Ghost row sighting`, along with **one theory** about where it came from.

<details>
<summary><b>Stuck? Hint</b></summary>

Look at the date and the customer ID on the top row. Then find out who that customer is:

```sql
SELECT * FROM 'data/raw/app_customers.csv' WHERE customer_id = 0;
```

</details>

> [!IMPORTANT]
> 👻 **Don't delete it.** It comes back. Keep your theory. We'll find out who's right by launch night.

Leave DuckDB when you're done:

```sql
.exit
```

## Part 6: Save your work with Git

You're going to take a snapshot (a **commit**) of your notes and send it to GitHub.

### Step 6.1: See what changed

```bash
git status
```

You should see `exercises/01-kitchen/my-notes.md` listed in red as **modified**. Git noticed your edits.

### Step 6.2: Choose what to save

```bash
git add exercises/01-kitchen/my-notes.md
```

Run `git status` again. The file is now green, which means it's ready to be saved.

### Step 6.3: Take the snapshot

```bash
git commit -m "Exercise 1: map Ripple's kitchen"
```

The text in quotation marks is your commit message: a short note to future you about what changed.

### Step 6.4: Send it to GitHub

```bash
git push
```

- **Codespaces:** this just works.
- **Windows:** the first time, a window may ask you to sign in to GitHub. Choose **Sign in with your browser** and approve it.
- **Mac:** pushing from your own Mac needs a one-time sign-in setup. For Exercise 1, committing (Step 6.3) is enough. Your work is saved on your computer, and we'll set up pushing in Exercise 2.

### Step 6.5: Check it on GitHub

Go to `github.com/YOUR-USERNAME/ripple-data`, click `exercises`, then `01-kitchen`, then `my-notes.md`. Your map is there. That's your first commit. 🎉

## Check your work

There's no single right kitchen map, so use this self-check. If you can answer yes to most of these, you're on track.

### Part 3: expected results

| Query | What you should see |
| --- | --- |
| Peek at the orders (Step 3.2) | 5 rows with columns including `order_id`, `customer_id`, `order_date` and `amount` |
| Row counts (Step 3.4) | `app_orders.csv`: **18160** rows · `app_customers.csv`: **2420** · `payments_export.csv`: **17588** · `support_tickets.csv`: **640** · `Revenue_FINAL_v3_USE_THIS.csv`: **159** |
| Marketing file (Step 3.5) | Messy, inconsistent column names and amounts stored as text, signs the file is edited by hand |
| Ghost row hunt (Part 5) | The top row has `customer_id` 0, an order date of `1970-01-01` and an amount of `1000000.0` (one million dollars, more than Ripple has ever sold). The customer lookup shows TEST TEST… twice. |

### Part 4: self-check for your kitchen map

- [ ] **Sources:** did you list all five files and the system each one comes from (app database, payments, support tool, marketing spreadsheet)?
- [ ] **Ingestion:** did you notice that Gerald (one laptop running a script at 3am) is the only "delivery truck"?
- [ ] **Storage:** did you notice Ripple has no data warehouse yet?
- [ ] **Transformation:** did you mention at least one of duplicates, refunds, discount codes or the suspicious 1970 order?
- [ ] **Serving:** did you name who uses the numbers (Greg, Lena, the board) and where (the dashboard)?
- [ ] **Least trusted source:** did you give a reason? (Most people pick the marketing spreadsheet because it's edited by hand. Any well-argued answer counts.)

> 🎬 **Want to compare with Jo?** Episode 2 opens with Jo's own version of the kitchen map.

## You're done when…

- [ ] You have your own copy of `ripple-data` on GitHub
- [ ] `git --version` and `duckdb --version` both print version numbers
- [ ] You ran a query and saw Ripple's orders
- [ ] Your kitchen map is filled in and saved
- [ ] You committed your notes (and pushed them, if you're on Codespaces or Windows)
- [ ] **Bonus:** you found the ghost row and wrote down a theory

Post your pipeline sketch or ghost row theory in the YouTube comments. Bonus points for the most dramatic theory.

## Troubleshooting

| What you see | What it means | What to do |
| --- | --- | --- |
| `command not found: duckdb` (Mac or Codespaces) or `'duckdb' is not recognized` (Windows) | The terminal can't find DuckDB yet | Close the terminal and open a new one. Still failing? Redo the DuckDB install step for your path. In Codespaces, run `curl https://install.duckdb.org \| sh` and follow the last lines it prints. |
| An error mentioning `vcruntime` or `VCRUNTIME140.dll` (Windows) | Windows is missing a free Microsoft component DuckDB needs | Search for "Microsoft Visual C++ Redistributable latest," download the **x64** version from Microsoft's site, install it, then reopen PowerShell. |
| `No such file or directory` or `File not found` | You're in the wrong folder, or there's a typo | Run `pwd`. If it doesn't end with `ripple-data`, see the next row. Check spelling; capital letters matter. |
| I'm in the wrong folder | You moved somewhere else | Codespaces: run `cd /workspaces/ripple-data`. Mac/Windows: run `cd ~/Projects/ripple-data`. |
| The prompt shows `D` and `ls` doesn't work | You're inside DuckDB | Type `.exit` and press Enter to go back to the terminal. |
| The prompt shows `‣` and nothing happens | DuckDB is waiting for the end of your SQL | Type `;` and press Enter. |
| A screen full of text with `(END)` or `:` at the bottom | Git is showing a long result one page at a time | Press `q`. |
| A strange editor with `~` down the left side, after `git commit` | You forgot the `-m "message"` part, so Git opened an editor | Type `:q!` and press Enter, then rerun the commit with `-m "your message"`. |
| `Permission denied` or `403` when pushing | You're trying to push to the original Ripple repo, not your copy | Make sure you used **Use this template** (Step 1.2) and are working in `YOUR-USERNAME/ripple-data`. |
| `nothing to commit, working tree clean` | Git doesn't see changes | Make sure you saved the notes file, then run `git status` again. |
| My codespace disappeared | It stopped to save your free hours | Go to [github.com/codespaces](https://github.com/codespaces) and click its name to reopen it. |
| My codespace isn't listed at [github.com/codespaces](https://github.com/codespaces) | It was deleted after about 30 days unused | Go to your copy of the repo and create a new codespace (Option A, steps 2–4). Everything you pushed is still there. |
| I can't find **Use this template** | You're signed out, or you're on your own copy | Sign in, then open [github.com/sheshipsdata/ripple-data](https://github.com/sheshipsdata/ripple-data). The button only appears on the original. |
| The top left of my repo says `sheshipsdata/ripple-data` | You're on the original, not your copy | Go to your copy: click your profile picture, **Your repositories**, then **ripple-data**. |
| I already have a repo named `ripple-data` | You made a copy before | Use that copy, or name the new one `ripple-data-2`. |
| Codespaces says you've used your included usage, or asks for payment | You created the copy under an organization, or used up your monthly hours | Make the copy under your personal username (Step 1.2). Delete codespaces you don't use at [github.com/codespaces](https://github.com/codespaces). Your hours reset every month. |

> 📘 **Want the full walkthrough?** The Season 1 Workbook has step-by-step solutions for every exercise, the reasoning behind each answer, common mistakes and bonus challenges.
