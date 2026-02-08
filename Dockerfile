FROM rust:1.88-slim-bookworm AS builder

WORKDIR /build

COPY Cargo.toml Cargo.lock ./
COPY src/ src/
COPY crates/ crates/

RUN cargo build --release && strip target/release/zeph

FROM container-registry.oracle.com/os/oraclelinux:9-slim

RUN microdnf install -y shadow-utils ca-certificates && \
    microdnf clean all && \
    useradd --system --no-create-home --shell /sbin/nologin zeph

WORKDIR /app

COPY --from=builder /build/target/release/zeph /app/zeph
COPY config/ /app/config/
COPY skills/ /app/skills/

RUN chown -R zeph:zeph /app

USER zeph

ENTRYPOINT ["/app/zeph"]
