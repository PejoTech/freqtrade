# Codex Environment Setup

This repository includes a helper script `codex_setup.sh` which installs Freqtrade and all dependencies required for backtesting and hyperopt.

## Usage

Run the script from the repository root:

```bash
./codex_setup.sh
```

The script performs the following steps:

1. Installs system packages required to build dependencies.
2. Builds and installs the TA-Lib C library.
3. Creates a Python 3.11 virtual environment in `.venv`.
4. Installs the `ta-lib` Python package and Freqtrade with hyperopt extras.
5. Verifies the installation by running `freqtrade --version`, `freqtrade backtesting --help` and `freqtrade hyperopt --help`.

After completion activate the environment with:

```bash
source .venv/bin/activate
```

You can then use all Freqtrade commands normally.
