# Stage 1: Build
FROM rust:1.92-slim AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y \
    pkg-config \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy manifests to cache dependencies
COPY Cargo.toml Cargo.lock ./
# Create dummy main.rs to build dependencies only
RUN mkdir src && echo "fn main() {}" > src/main.rs
RUN cargo build --release

# Copy the actual source code and sqlx metadata
COPY src/ ./src/
COPY .sqlx/ ./.sqlx/

# Touch main.rs to ensure it builds correctly
RUN touch src/main.rs
ENV SQLX_OFFLINE=true
RUN cargo build --release

# Stage 2: Runtime
FROM debian:bookworm-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libssl3 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/target/release/wiss-estudio-backend /app/wiss-estudio-backend

EXPOSE 3001

CMD ["./wiss-estudio-backend"]
