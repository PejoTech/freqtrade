# 🧠 Cline Workspace Rules — Freqtrade Project

These rules define how Cline interacts with the **Freqtrade** repository and its **user_data** sub-repository.  
They are derived from `user_data/AGENTS.md` and the project’s architecture.

---

## 📁 Project Context

- **Root Directory:** `/home/pejotech/Source/Freqtrade/freqtrade`
- **Subrepository:** `user_data` (symbolic link to `/workspace/freqtradeuserdata`)
- **Primary Purpose:** Develop, test, and optimize algorithmic trading strategies using the Freqtrade framework.

---

## ⚙️ Working Directory Rules

- Always execute commands from the root of the workspace:
  ```bash
  cd /workspace/freqtrade
  ```
- The `user_data` directory is a symlink to `/workspace/freqtradeuserdata`.  
  Changes in either location affect both runtime and repository data.

---

## 🧩 Strategy Management

- Strategy files are located in:
  ```
  /workspace/freqtrade/user_data/strategies
  ```
- Use the following commands for testing and optimization:
  ```bash
  freqtrade backtesting --config {path-to-config} --strategy <StrategyName>
  freqtrade hyperopt --config {path-to-config} --strategy <StrategyName> --spaces all
  ```

---

## 📊 Data Management

- Download trading data using:
  ```bash
  freqtrade download-data -c {path-to-config} -t <timeframe> --timerange <timerange> --trading-mode spot
  freqtrade download-data -c {path-to-config} -t <timeframe> --timerange <timerange> --trading-mode futures
  ```
- Reference: [Freqtrade Data Download Guide](https://www.freqtrade.io/en/develop/data-download/)

---

## 🧪 Environment Setup

- Activate the Python environment before running tests or backtests:
  ```bash
  source $FT_DIR/.env/bin/activate
  ```

---

## 🧠 Memorybank Integration

- The project-level knowledge base is located at:
  ```
  user_data/memorybank/config.json
  ```
- It stores structured insights, experiment results, and analysis notes.
- Categories include:
  - `strategies`
  - `backtesting`
  - `hyperopt`
  - `data-analysis`
  - `notebooks`
  - `experiments`

---

## 🧰 Debugging & Development

- Run the custom debug script for deeper analysis:
  ```bash
  python /workspace/freqtrade_userdata/develop/debug.py
  ```
- Validate JSON configuration files:
  ```bash
  jq . path/to/file.json >/dev/null
  ```
- Lint and test before committing:
  ```bash
  flake8 strategies
  pytest
  ```

---

## 🧾 Commit & CI Guidelines

- Write concise, descriptive commit messages.
- Avoid committing large binaries or secrets.
- Ensure all pre-commit checks pass before pushing.

---

## 📚 Documentation References

- [Configuration Guide](https://www.freqtrade.io/en/develop/configuration/)
- [Strategy 101](https://www.freqtrade.io/en/develop/strategy-101/)
- [Customization Guide](https://www.freqtrade.io/en/develop/strategy-customization/)
- [Callback Hooks](https://www.freqtrade.io/en/develop/strategy-callbacks/)
- [Stoploss Strategies](https://www.freqtrade.io/en/develop/stoploss/)
- [Leverage Management](https://www.freqtrade.io/en/develop/leverage/)
- [Backtesting Guide](https://www.freqtrade.io/en/develop/backtesting/)
- [Strategy Analysis Example](https://www.freqtrade.io/en/develop/strategy_analysis_example/)

---

## ✅ Summary

Cline should:
1. Operate from the root workspace.
2. Manage strategies and data within `user_data`.
3. Use the memorybank for persistent project knowledge.
4. Follow Freqtrade’s official documentation and best practices.
