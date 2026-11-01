# Student Task: Simple Student Information & File Checker

**Repository:** https://github.com/sidoncode/upgrad-cli-walkthrough\
**Difficulty:** Beginner\
**Duration:** 40 minutes

## Objective

Create a Bash script that collects student information, performs a
simple calculation, checks the student's result, and verifies whether a
student record file exists.

## Task

Create a Bash script named `student_info.sh`.

Your script must complete the following requirements:

1.  **Variables**
    -   Store the course name in a variable.
    -   Display the course name.
2.  **User Input**
    -   Ask the student to enter their name.
    -   Ask for marks in two subjects.
3.  **Arithmetic**
    -   Calculate the total marks of the two subjects.
4.  **Conditional Statements**
    -   If the total marks are greater than or equal to 40, display
        `PASS`.
    -   Otherwise, display `FAIL`.
5.  **File Handling**
    -   Check whether a file named `student.txt` exists.
    -   If it exists, display `Student record found`.
    -   Otherwise, display `Student record not found`.

## Expected Output

``` text
Welcome to Student Information System

Enter your name: Rahul

Enter marks for Subject 1: 25
Enter marks for Subject 2: 30

Student Name: Rahul
Course: Linux Basics
Total Marks: 55

Result: PASS

Student record found
```

*The output above is an example. Your script should also work with
different names and marks.*

## Hints

  Concept                       Bash hint
  ----------------------------- -------------------------------
  Variables                     `course="Linux Basics"`
  Display output                `echo`
  Accept input                  `read`
  Addition                      `total=$((a + b))`
  Conditional statement         `if ... then ... else ... fi`
  Check whether a file exists   `if [ -f "student.txt" ]`

## Execution Steps

Clone the repository and move into its directory:

``` bash
git clone https://github.com/sidoncode/upgrad-cli-walkthrough.git
cd upgrad-cli-walkthrough
```

Create the script:

``` bash
touch student_info.sh
```

Create a sample student record file:

``` bash
touch student.txt
```

Open `student_info.sh` in your preferred editor, write your script, and
run it:

``` bash
bash student_info.sh
```

## Submission Checklist

-   [ ] Created `student_info.sh`.
-   [ ] Used variables and `echo`.
-   [ ] Accepted input using `read`.
-   [ ] Performed addition using `$(( ))`.
-   [ ] Implemented `if-else`.
-   [ ] Checked file existence using `-f`.
-   [ ] Tested both PASS and FAIL scenarios.
-   [ ] Tested with and without `student.txt`.

## Suggested Time Allocation

  Activity                               Time
  -------------------------- ----------------
  Variables and user input         10 minutes
  Arithmetic operations             5 minutes
  Conditional statements           10 minutes
  File handling                    10 minutes
  Testing and debugging             5 minutes
  **Total**                    **40 minutes**

## Learning Outcome

By completing this task, students will practise Bash variables,
input/output, arithmetic operations, conditional statements, and basic
file handling in one small practical exercise.

**Trainer note:** Encourage students to complete the task independently
without copying the existing repository scripts.
