#!/usr/bin/env bash
# Runs once when a codespace is created. Viewers never need to run this themselves.
set -e

echo "Installing the DuckDB command-line tool..."
curl -fsSL https://install.duckdb.org | sh
sudo ln -sf "$HOME/.duckdb/cli/latest/duckdb" /usr/local/bin/duckdb

echo "Installing Python packages..."
pip install --quiet -r requirements.txt

echo "Checking the Ripple data..."
duckdb -f check_setup.sql
