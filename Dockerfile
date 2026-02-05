FROM rust:1.85-slim-bookworm AS builder

WORKDIR /build

COPY Cargo.toml Cargo.lock ./
COPY src/ src/
COPY crates/ crates/

RUN cargo build --release && strip target/release/zeph

FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --create-home --shell /bin/bash zeph

WORKDIR /app

COPY --from=builder /build/target/release/zeph /app/zeph
COPY config/ /app/config/
COPY skills/ /app/skills/

RUN mkdir -p /app/data && chown -R zeph:zeph /app

USER zeph

ENTRYPOINT ["/app/zeph"]
