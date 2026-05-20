# Git Quick Reference Guide

## Initial Setup (One Time)

```bash
# Configure your Git identity
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Verify configuration
git config --global --list
```

---

## Creating & Cloning Repositories

```bash
# Initialize a new Git repository
git init

# Clone an existing repository
git clone https://github.com/username/repository.git

# Clone into a specific folder
git clone https://github.com/username/repository.git folder-name
```

---

## Basic Workflow

```bash
# Check status of your files
git status

# Stage specific file
git add filename.sql

# Stage all files
git add .

# Unstage a file
git reset HEAD filename.sql

# Commit staged changes
git commit -m "Your commit message"

# View commit history
git log
git log --oneline  # Shorter version
```

---

## Remote Repository (GitHub)

```bash
# Add remote repository
git remote add origin https://github.com/username/repository.git

# View remote repositories
git remote -v

# Push to GitHub (first time)
git push -u origin main

# Push to GitHub (after first time)
git push

# Pull from GitHub
git pull

# Fetch without merging
git fetch
```

---

## Branches (For Advanced Use)

```bash
# Create new branch
git branch branch-name

# Switch to branch
git checkout branch-name

# Create and switch to new branch
git checkout -b branch-name

# List all branches
git branch -a

# Delete branch
git branch -d branch-name

# Merge branch into current branch
git merge branch-name
```

---

## Undo Changes

```bash
# Undo changes in working directory (not staged)
git checkout -- filename.sql

# Unstage file (keep changes)
git reset HEAD filename.sql

# View changes before committing
git diff

# View staged changes
git diff --staged

# Revert last commit (keep changes)
git reset --soft HEAD~1

# Revert last commit (discard changes)
git reset --hard HEAD~1
```

---

## Useful Daily Commands

```bash
# See what changed in a commit
git show commit-hash

# Search for a specific commit
git log --grep="keyword"

# See changes by author
git log --author="Author Name"

# Beautiful log visualization
git log --graph --oneline --all

# See file change history
git log -p filename.sql
```

---

## Typical GitHub Upload Workflow

```bash
# 1. Create repository on GitHub (skip if cloned)

# 2. In your project folder (if not cloned)
git init

# 3. Add all files
git add .

# 4. Create first commit
git commit -m "Initial commit: SQL Data Analysis project"

# 5. Add remote (if not cloned)
git remote add origin https://github.com/YOUR_USERNAME/SQL-Data-Analysis.git

# 6. Rename branch if needed
git branch -M main

# 7. Push to GitHub
git push -u origin main
```

---

## For Updates (After Initial Upload)

```bash
# 1. Make changes to files

# 2. Check what changed
git status

# 3. Stage changes
git add .

# 4. Commit changes
git commit -m "Updated: Add bonus queries"

# 5. Push to GitHub
git push
```

---

## Common Error Solutions

### "fatal: not a git repository"
```bash
# Solution: Initialize git first
git init
```

### "error: src refspec main does not match any"
```bash
# Solution: Make at least one commit
git commit -m "Initial commit"
# Then push
git push -u origin main
```

### "Permission denied (publickey)"
```bash
# Solution: Check SSH keys or use HTTPS instead
git remote set-url origin https://github.com/username/repo.git
```

### "Your branch is behind origin"
```bash
# Solution: Pull latest changes
git pull origin main
```

---

## Commit Message Best Practices

**Good commit messages:**
- ✅ "Add SQL queries for customer analysis"
- ✅ "Fix: Correct aggregate function in Query 3"
- ✅ "Update: Add more detailed documentation"
- ✅ "Docs: Add GitHub setup guide"

**Bad commit messages:**
- ❌ "update"
- ❌ "fix"
- ❌ "test"
- ❌ "asdf"

**Format:**
```
[Type]: Brief description (50 chars or less)

Optional detailed explanation
```

**Types:**
- `feat:` New feature or query
- `fix:` Bug fix
- `docs:` Documentation update
- `style:` Formatting, no code change
- `refactor:` Code reorganization
- `test:` Test additions
- `perf:` Performance improvements

---

## Helpful GitHub Links

- **GitHub Guides:** https://guides.github.com
- **Git Documentation:** https://git-scm.com/doc
- **GitHub SSH Setup:** https://docs.github.com/en/authentication/connecting-to-github-with-ssh
- **Creating a README:** https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-readmes

---

## Pro Tips

1. **Commit often** - Small, focused commits are better than large ones
2. **Write clear messages** - Future you will thank you
3. **Pull before push** - Always sync with remote before pushing
4. **Use branches** - Keep main branch clean with features in separate branches
5. **Review changes** - Use `git diff` before committing
6. **Keep history clean** - Avoid unnecessary merge commits

---

**Happy coding! 🚀**

