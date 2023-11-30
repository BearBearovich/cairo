#!/bin/bash

# Check if cargo is installed
if ! command -v cargo &> /dev/null; then
    echo "Error: cargo not found. Please install Rust and Cargo."
    exit 1
fi

# Check if cairo-format binary is present
if [ ! -f "./target/debug/cairo-format" ]; then
    echo "Error: cairo-format binary not found. Please build the Rust program first."
    exit 1
fi

# Run the Rust program with the provided arguments
cargo run --bin cairo-format -- --recursive "$@"

# Check the exit code of the Rust program
if [ $? -ne 0 ]; then
    echo "Error: Rust program failed."
    exit 1
fi

echo "Script completed successfully."
