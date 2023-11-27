#!/usr/bin/env python3
"""
File:           analyze_aggregate_errors.py
Description:    Utility script that reads-in the output from `percy aggregate` and gathers statistics on error messages.
                This is useful for debugging recipe parsing issues.

                To generate the file, run:
                    percy aggregate order -r RENDERER &> file
"""
from __future__ import annotations

import json
import re
import sys


def main() -> None:
    """
    Primary execution point of the script.
    """
    if len(sys.argv) != 2:
        print("usage: analyze_aggregate_errors.py file")
        sys.exit(1)

    error_re = re.compile(r"^(ERROR:root:Render issue )(.*-feedstock)( : )(.*)$")
    feedstocks: dict[str, list[str]] = {}
    hist: dict[str, int] = {}
    error_cntr = 0

    with open(sys.argv[1], encoding="utf-8") as file:
        for line in file:
            match = error_re.match(line)
            if match is not None:
                error_cntr += 1
                error: str = match.group(4)
                feedstock: str = match.group(2)
                if error not in hist:
                    hist[error] = 1
                    feedstocks[error] = [feedstock]
                else:
                    hist[error] += 1
                    feedstocks[error].append(feedstock)

    print("==== Feedstock-Breakdown ====")
    print(json.dumps(feedstocks, indent=2, sort_keys=True))
    print("==== Histogram ====")
    print(json.dumps(hist, indent=2, sort_keys=True))
    print("==== Stats ====")
    print(f"Total error count: {error_cntr}")


if __name__ == "__main__":
    main()
