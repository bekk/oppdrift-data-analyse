#!/usr/bin/env python
import os
import sys
if len(sys.argv) != 2:
  print("Usage: ./create_profiles.py <brukernavn>")
  sys.exit(1)
brukernavn = sys.argv[1]

text = f"""
oppdrift_dbt:
  outputs:
    dev:
      dataset: dbt # default/fallback dataset for transformations
      fixed_retries: 1
      location: EU
      method: oauth
      priority: interactive
      project: oppdrift-369209
      threads: 4
      timeout_seconds: 300
      type: bigquery
  target: dev
"""

filename = os.path.expanduser("~/.dbt/profiles.yml")
os.makedirs(os.path.dirname(filename), exist_ok=True)
with open(filename, "w+") as f:
  f.write(text)