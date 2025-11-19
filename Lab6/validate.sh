#!/bin/bash

# Check for unwanted files
for file in *; do
  if [[ $file != "venv" && $file != "solve.py" && $file != "chal" && $file != "chal.c" && $file != "Makefile" && $file != "README.md" && $file != "validate.sh" && $file != "ans" && $file != "1.txt" && $file != "2.txt" ]]; then
    echo "[!] Unwanted file detected: $file."
    exit 1
  fi
done

test_path="${BASH_SOURCE[0]}"
solution_path="$(realpath .)"
tmp_dir=$(mktemp -d -t lab6-XXXXXXXXXX)
answer=""

cd $tmp_dir

rm -rf *
cp $solution_path/Makefile .
cp $solution_path/ans .
cp $solution_path/chal .
cp $solution_path/*.txt .

make run$1 > out
result=$(diff --strip-trailing-cr ans out)
if [[ -n $result ]]; then
  echo "[!] Expected: "
  cat ans
  echo ""
  echo "[!] Actual:   "
  cat out
  echo ""
  exit 1
else
  echo "[V] Pass"
fi

rm -rf $tmp_dir

exit 0

# vim: set fenc=utf8 ff=unix et sw=2 ts=2 sts=2:
