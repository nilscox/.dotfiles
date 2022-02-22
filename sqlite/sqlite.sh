#!/bin/env bash

source "$(dirname $0)/../functions.sh"

ln -s "$dot/sqlite/sqliterc" "$dest/.sqliterc"
