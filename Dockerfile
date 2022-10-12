# Rust as the base image
FROM rust as build

# Create a new empty shell project
RUN USER=root cargo new --bin webserver
WORKDIR /webserver

# Copy our manifests
COPY ./Cargo.lock ./Cargo.lock
COPY ./Cargo.toml ./Cargo.toml

# Build only the dependencies to cache them
RUN cargo build --release
RUN rm src/*.rs

# Copy the source code
COPY ./src ./src

# Build for release.
RUN rm ./target/release/deps/webserver*
RUN cargo build --release

# The final base image
FROM debian:buster-slim

# Copy from the previous build
COPY --from=build /webserver/target/release/webserver /usr/src/webserver
# COPY --from=build /webserver/target/release/webserver/target/x86_64-unknown-linux-musl/release/webserver .

# Run the binary
CMD ["/usr/src/webserver"]