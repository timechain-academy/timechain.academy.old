---
title: Lessons
description: git version control basics
---

## [LESSON 1](lessons/lesson1.md)
### Create a local branch

$`git checkout -b lesson1`

> Edit the lesson1.md file using a text editor
> or
> Pipe text into the leson1.md file using `echo`, `>` and `>>`

```
touch sources/git/lessons/lesson1.md
echo "example of piping text into a file..." > sources/git/lessons/lesson1.md
echo "another line of text..." >> sources/git/lessons/lesson1.md
git diff
```
> repeat, but this time edit lesson2.md
```
touch sources/git/lessons/lesson2.md
echo "example of piping text into a file..." > sources/git/lessons/lesson2.md
echo "another line of text..." >> sources/git/lessons/lesson2.md
git diff
```


## [LESSON 2](lessons/lesson2.md)
### Create a git commit
> We are going to create two git commits.
> First, we use `git add <path to file>`
```
git add sources/git/lessons/lesson1.md
git commit -m "lesson1.md: add file"
```
> Then we use `git checkout -b lesson2`
> Then we review the work we have done so far...
> `git status`
> `git log`
```
git add sources/git/lessons/lesson2.md
git commit -m "lesson2.md: add file"
```
> `git status`
> `git log`


## [LESSON 3](lesson3.md)
### Create a git commit