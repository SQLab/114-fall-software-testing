#!/bin/bash

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
