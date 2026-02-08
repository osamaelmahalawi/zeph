FROM rust:1.88-slim-bookworm AS builder

WORKDIR /build

COPY Cargo.toml Cargo.lock ./
COPY src/ src/
COPY crates/ crates/

RUN cargo build --release && strip target/release/zeph

FROM gcr.io/distroless/cc-debian12:nonroot

WORKDIR /app

COPY --from=builder /build/target/release/zeph /app/zeph
COPY config/ /app/config/
COPY skills/ /app/skills/

USER nonroot:nonroot

ENTRYPOINT ["/app/zeph"]
