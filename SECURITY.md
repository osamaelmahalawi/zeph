# Security Policy

## Supported Versions

| Version | Supported |
|---------|-----------|
| 0.1.x | Yes |

## Reporting a Vulnerability

If you discover a security vulnerability, please report it responsibly.

**Do not open a public issue.**

Instead, email the maintainer directly or use [GitHub Security Advisories](https://github.com/bug-ops/zeph/security/advisories/new) to submit a private report.

Please include:

- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if any)

You can expect an initial response within 72 hours.

## Security Practices

- Dependencies are audited weekly via [cargo-deny](https://github.com/EmbarkStudios/cargo-deny)
- Dependabot monitors for known vulnerabilities in dependencies
- Shell execution is sandboxed with a 30-second timeout
- Telegram bot supports user whitelisting to restrict access
