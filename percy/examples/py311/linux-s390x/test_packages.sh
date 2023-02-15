#!/bin/bash
# Script to test local packages
# If a test is successful, the package gets copied to the target dir.
# Example of use: ./test_packages.sh /ci_py311/linux-64/ /ci_py311_tested/
# author: cbousseau@anaconda.com

SOURCE=$1
TARGET=$2

mkdir $TARGET

for filename in `ls -tr $SOURCE/*.tar.bz2`; do
  if [[ ! -f "$TARGET/$(basename $filename)" ]]; then
    echo "Testing $filename"
    (conda build -c $(dirname "$SOURCE") -t $filename 2>&1 >d 2>&1 && rm -f d && ( cp $filename $TARGET ) && true) || ( (echo "$filename" >>failed.test ) && (echo "$filename" >>errors_test.dump ) && ( cat d >>errors_test.dump ) && cat d && rm -f d && true) || true
    echo "Done testing $filename"
  fi
done
echo "Failure summary"
cat failed.test