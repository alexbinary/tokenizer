# Tokenizer

A simple tokenizer written in Swift.

A tokenizer is a device that takes an input string and produces a list of tokens from a known list of tokens.

Example input string :

```sql
CREATE TABLE COLORS (
    NAME TEXT,
    RGB TEXT
);
```

Given the known tokens :

|name|pattern|
|-|-|
|CREATE|`CREATE`|
|TABLE|`TABLE`|
|OPENPAREN|`(`|
|CLOSEPAREN|`)`|
|COMMA|`,`|
|SEMICOLON|`;`|
|TYPETEXT|`TEXT`|
|WHITESPACE |`\s+`|
|IDENTIFIER |`[A-Z]+`|

Expected output :

- CREATE
- WHITESPACE
- TABLE
- WHITESPACE
- IDENTIFIER“COLORS“
- WHITESPACE
- OPENPAREN
- WHITESPACE
- IDENTIFIER“NAME"
- WHITESPACE
- TYPETEXT
- COMMA
- WHITESPACE
- IDENTIFIER"RGB"
- WHITESPACE
- TYPETEXT
- WHITESPACE
- CLOSEPAREN
- SEMICOLON

This is a Swift Package.
