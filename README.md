# gitscan

GitScan is a tiny Windows utility that recursively scans the current directory and all subdirectories for Git repositories, then reports only the repositories with uncommitted changes.

Eg: `C:\Users\User>gitscan` will return the project directory that has uncommitted repos.

## Installation

1. Download or clone this repository

```cmd
git clone https://github.com/yourusername/gitscan.git
cd gitscan
```

2. Run the installer

```cmd
install.cmd
```

3. Restart your terminal
4. Run GitScan from anywhere

```cmd
gitscan
```

## Requirements

- Windows
- Git installed and available in PATH

Check:

```cmd
git --version
```
