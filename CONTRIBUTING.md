# Contributing to Zeph

Thank you for considering contributing to Zeph.

## Getting Started

1. Fork the repository
2. Clone your fork and create a branch from `main`
3. Install Rust 1.85+ (Edition 2024 required)
4. Run `cargo build` to verify the setup

## Development

### Build

```bash
cargo build
```

### Test

```bash
cargo nextest run
```

### Lint

```bash
cargo +nightly fmt --check
cargo clippy --all-targets
```

### Coverage

```bash
cargo llvm-cov --all-features --workspace
```

## Workspace Structure

| Crate | Purpose |
|-------|---------|
| `zeph-core` | Agent loop, config, channel trait |
| `zeph-llm` | LlmProvider trait, Ollama + Claude backends |
| `zeph-skills` | SKILL.md parser, registry, prompt formatter |
| `zeph-memory` | SQLite conversation persistence |
| `zeph-channels` | Telegram adapter |

## Pull Requests

1. Create a feature branch: `feat/<scope>/<description>` or `fix/<scope>/<description>`
2. Keep changes focused — one logical change per PR
3. Add tests for new functionality
4. Ensure all checks pass: `cargo +nightly fmt`, `cargo clippy`, `cargo nextest run`
5. Write a clear PR description following the template

## Commit Messages

- Use imperative mood: "Add feature" not "Added feature"
- Keep the first line under 72 characters
- Reference related issues when applicable

## Code Style

- Follow workspace clippy lints (pedantic enabled)
- Use `cargo +nightly fmt` for formatting
- Avoid unnecessary comments — code should be self-explanatory
- Comments are only for cognitively complex blocks

## License

By contributing, you agree that your contributions will be licensed under the [MIT License](LICENSE).
