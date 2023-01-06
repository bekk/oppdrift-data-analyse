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
      dataset: dbt_{brukernavn}
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

filename = os.path.expanduser("~/.dbt22/profiles.yml")
os.makedirs(os.path.dirname(filename), exist_ok=True)
with open(filename, "w+") as f:
  f.write(text)