#!/bin/bash
# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

set -e

# Increase the test_timeout due to slow performance on CI
ci/bazelisk.sh test \
    --build_tests_only=true \
    --test_timeout=2400,2400,3600,-1 \
    --local_test_jobs=4 \
    --local_cpu_resources=4 \
    --test_timeout_filters=short,moderate \
    --test_tag_filters=verilator,-failing_verilator,-broken \
    --test_output=errors \
    --//hw:verilator_options=--threads,1 \
    //sw/device/...