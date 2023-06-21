#!/bin/bash

target_count=`wc -l  < python_3.10_*_package_list.yaml`
skipped_count=`wc -l < python_3.10_*_package_list_missing.yaml`
done_count=`ls ../ci_py311_tested/*.tar.bz2 | wc -l`
todo_count=$((target_count-skipped_count-done_count))

echo todo:$todo_count done:$done_count skipped:$skipped_count
