---
name: file-ops
description: Perform file system operations. Use when the user asks to list directory contents, find files by name or pattern, search text inside files, or check file size and type.
---
# File Operations

## List files
```bash
ls -la PATH
```

## Search for files
```bash
find PATH -name "PATTERN" -type f
```

## Search content
```bash
grep -rn "PATTERN" PATH
```

## File info
```bash
wc -l FILE && file FILE
```
