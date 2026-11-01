# upgrad-cli-walkthrough

Hands-on practice files from a Linux command-line walkthrough. The repo covers two things:

1. **Shell scripting basics**: variables, user input, arithmetic and conditionals, in four small scripts.
2. **Basic file handling**: a few sample text files used for practising `touch`, `echo`, `cat` and redirection.

## Repository contents

| File | Type | What it is |
|---|---|---|
| `script1.sh` | Script | Declares a variable and prints it |
| `scr2.sh` | Script | Asks for your name and greets you |
| `scr3.sh` | Script | Reads two numbers and prints their sum |
| `scr4.sh` | Script | Checks whether `Data.txt` exists |
| `file1.txt` | Data | One line of text: `pooja` |
| `file2.txt` | Data | One line of text: `priyadarshini` |
| `Data.txt` | Data | Empty file. `scr4.sh` looks for it |
| `hello.text` | Data | Empty file. Note the `.text` extension, not `.txt` |

## How to run

The scripts have no shebang line (`#!/bin/bash`), so run them by passing them to a shell:

```bash
git clone https://github.com/sidoncode/upgrad-cli-walkthrough.git
cd upgrad-cli-walkthrough

bash script1.sh
```

Alternatively, add `#!/bin/bash` as the first line, then make the script executable and run it directly:

```bash
chmod +x script1.sh
./script1.sh
```

---

## Script walkthrough

### 1. `script1.sh`: variables

```bash
name="sid"
echo $name
```

| Line | Explanation |
|---|---|
| `name="sid"` | Creates a variable called `name` and stores the string `sid` in it. There must be **no spaces** around `=`. `name = "sid"` fails because the shell reads `name` as a command. |
| `echo $name` | `echo` prints text to the terminal. `$name` is replaced with the variable's value before `echo` runs. |

Output:

```
sid
```

### 2. `scr2.sh`: reading user input

```bash
echo "enter your name"
read name
echo "hello, $name!"
echo "welcome to linux"
```

| Command | Explanation |
|---|---|
| `echo "enter your name"` | Prints a prompt so the user knows what to type. |
| `read name` | Pauses until the user types a line and presses Enter, then stores it in the variable `name`. |
| `echo "hello, $name!"` | Prints a greeting. Inside **double quotes** `$name` is still expanded. Single quotes would print the literal text `$name`. |
| `echo "welcome to linux"` | Prints a fixed message. |

Sample run (user types `Sid`):

```
enter your name
Sid
hello, Sid!
welcome to linux
```

### 3. `scr3.sh`: arithmetic

```bash
echo "enter first number"
read a
echo "enter second number"
read b
sum=$((a + b))
echo "sum: $sum"
```

| Command | Explanation |
|---|---|
| `read a`, `read b` | Read two values into the variables `a` and `b`. |
| `sum=$((a + b))` | `$(( ... ))` is **arithmetic expansion**. The shell evaluates the expression and substitutes the result. Variables inside don't need a `$` prefix. |
| `echo "sum: $sum"` | Prints the result. |

Sample run (user types `7` and `5`):

```
enter first number
7
enter second number
5
sum: 12
```

Notes:
- Bash arithmetic is integer only. `7.5` causes an error.
- Input that isn't a number, such as `abc`, is silently treated as `0` in `$(( ))`. Entering `abc` and `5` gives `sum: 5`. The script does no validation.

### 4. `scr4.sh`: conditionals and file tests

```bash
filename="Data.txt"

if [ -f "$filename" ]
then
	echo "file exists"
else
	echo "file doesn't exists"
fi
```

| Part | Explanation |
|---|---|
| `filename="Data.txt"` | Stores the file name in a variable. |
| `if [ -f "$filename" ]` | `[ ... ]` is the `test` command. `-f` is true if the path exists **and is a regular file**. The variable is quoted so names containing spaces still work. Keep the spaces inside the brackets. |
| `then` / `else` / `fi` | The true branch, the false branch, and the end of the `if` block (`if` spelled backwards). |

Output, with `Data.txt` present (it is in this repo):

```
file exists
```

Output, if `Data.txt` is deleted or renamed:

```
file doesn't exists
```

Related file tests: `-d` (directory), `-e` (exists, any type), `-r` / `-w` / `-x` (readable / writable / executable), `-s` (exists and is non-empty). Note that `Data.txt` is empty, so `-s` would report false.

---

## Command reference

Every command and shell construct used in the scripts:

| Command / syntax | Purpose | Example from this repo |
|---|---|---|
| `echo` | Print text or variable values | `echo "hello, $name!"` |
| `read` | Read a line of keyboard input into a variable | `read name` |
| `VAR=value` | Assign a variable (no spaces around `=`) | `name="sid"` |
| `$VAR` | Expand a variable's value | `echo $name` |
| `"..."` (double quotes) | Group text and still expand variables | `"hello, $name!"` |
| `$(( ))` | Integer arithmetic expansion | `sum=$((a + b))` |
| `[ -f file ]` | Test whether a regular file exists | `[ -f "$filename" ]` |
| `if` / `then` / `else` / `fi` | Conditional branching | `scr4.sh` |

## File-handling commands

`file1.txt`, `file2.txt`, `Data.txt` and `hello.text` are plain text files for practising file commands. This repo only stores the files, not a record of the commands that made them. These commands will recreate and inspect them:

```bash
touch Data.txt hello.text          # create empty files
echo "pooja" > file1.txt           # write text, overwriting the file
echo "priyadarshini" > file2.txt
cat file1.txt file2.txt            # print contents
ls -l                              # list files with size and permissions
wc -c hello.text                   # count bytes (0 for an empty file)
```

| Command | Purpose |
|---|---|
| `touch` | Create an empty file, or update an existing file's timestamp |
| `>` | Redirect output into a file, overwriting it |
| `>>` | Redirect output into a file, appending |
| `cat` | Print a file's contents |
| `ls -l` | List files in long format |
| `wc` | Count lines, words or bytes |

## Known quirks

- **No shebang line.** Running `./script1.sh` directly relies on your current shell. Use `bash script1.sh` or add `#!/bin/bash`.
- **`hello.text` vs `.txt`.** The `.text` extension looks like a typo, but it is a valid name.
- **`scr3.sh` has no input validation.** Non-numeric input is treated as `0`.
- **Message grammar.** `scr4.sh` prints `file doesn't exists`, which should be `file doesn't exist`.
- **Inconsistent script names.** `script1.sh` versus `scr2.sh`, `scr3.sh` and `scr4.sh`.
