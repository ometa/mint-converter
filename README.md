# mint-converter
Ruby tools to munge exported Mint.com data.

Right now all this does is negate the Amount column if the Transaction Type is a credit
and dump the output to stdout.

## Usage

```bash
./bin/mint-converter /path/to/your/mint-transaction-export.csv
```
