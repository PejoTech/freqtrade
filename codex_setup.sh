#!/usr/bin/env bash
set -euo pipefail

# Use Python 3.11 for compatibility with ta-lib wheels
if command -v pyenv >/dev/null; then
    pyenv global 3.11.12
fi

# Install build dependencies
apt-get update
apt-get install -y gcc build-essential autoconf libtool pkg-config make wget git curl python3-dev python3-venv

# Build and install the ta-lib C library
cd build_helpers
./install_ta-lib.sh
cd ..

# Symlink expected library name
ln -sf /usr/local/lib/libta_lib.so /usr/local/lib/libta-lib.so

# Create Python virtual environment
python3 -m venv .venv
source .venv/bin/activate

# Environment variables to help build python ta-lib
export TA_INCLUDE_PATH=/usr/local/include
export TA_LIBRARY_PATH=/usr/local/lib

pip install --upgrade pip setuptools wheel
pip install ta-lib

# Install freqtrade with hyperopt extras
pip install -r requirements.txt -r requirements-hyperopt.txt
pip install -e .

# Validate installation
freqtrade --version
freqtrade backtesting --help >/dev/null
freqtrade hyperopt --help >/dev/null

echo "Freqtrade setup completed." 
