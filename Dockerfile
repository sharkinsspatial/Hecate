FROM rustlang/rust:nightly

# Creates a dummy project used to grab dependencies
RUN USER=root cargo new --bin hecate
WORKDIR /hecate

# Copies over *only* your manifests
COPY ./Cargo.lock ./Cargo.lock
COPY ./Cargo.toml ./Cargo.toml

# Builds your dependencies and removes the
# fake source code from the dummy project
#RUN cargo build --release
RUN cargo build
RUN rm src/*.rs

# Copies only your actual source code to
# avoid invalidating the cache at all
COPY ./src ./src

# Builds again, this time it'll just be
# your actual source files being built
RUN cargo build --release
#RUN cargo build

# Configures the startup!
CMD ['./target/release/hecate', '--database', 'hecate:password@postgres:5432/hecatedb']
#CMD ['cargo', 'run', '--', '--database', 'hecate:password@postgres:5432/hecatedb']
