# Copyright 2020 the V8 project authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

load("//lib/lib.star", "GOMA", "greedy_batching_of_1", "in_branch_console", "multibranch_builder")

in_category = in_branch_console("ports")

in_category(
    "Arm",
    multibranch_builder(
        name = "V8 Arm - builder",
        triggering_policy = greedy_batching_of_1,
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        properties = {"builder_group": "client.v8.ports", "target_arch": "arm", "binary_size_tracking": {"category": "linux_arm32", "binary": "d8"}},
        use_goma = GOMA.DEFAULT,
    ),
    multibranch_builder(
        name = "V8 Arm - debug builder",
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        properties = {"target_arch": "arm", "builder_group": "client.v8.ports"},
        use_goma = GOMA.DEFAULT,
    ),
    multibranch_builder(
        name = "V8 Android Arm - builder",
        triggering_policy = greedy_batching_of_1,
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        properties = {"builder_group": "client.v8.ports", "target_arch": "arm", "target_platform": "android", "binary_size_tracking": {"category": "android_arm32", "binary": "d8"}},
        use_goma = GOMA.DEFAULT,
    ),
    multibranch_builder(
        name = "V8 Linux - arm - sim",
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        properties = {"builder_group": "client.v8.ports"},
        use_goma = GOMA.DEFAULT,
    ),
    multibranch_builder(
        name = "V8 Linux - arm - sim - debug",
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        properties = {"builder_group": "client.v8.ports"},
        use_goma = GOMA.DEFAULT,
    ),
    multibranch_builder(
        name = "V8 Linux - arm - sim - lite",
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        properties = {"builder_group": "client.v8.ports"},
        use_goma = GOMA.DEFAULT,
        close_tree = False,
    ),
    multibranch_builder(
        name = "V8 Linux - arm - sim - lite - debug",
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        properties = {"builder_group": "client.v8.ports"},
        use_goma = GOMA.DEFAULT,
        close_tree = False,
    ),
    multibranch_builder(
        name = "V8 Arm",
        parent_builder = "V8 Arm - builder",
        dimensions = {"host_class": "multibot"},
        execution_timeout = 28800,
        properties = {"builder_group": "client.v8.ports"},
        close_tree = False,
    ),
    multibranch_builder(
        name = "V8 Arm - debug",
        parent_builder = "V8 Arm - debug builder",
        dimensions = {"host_class": "multibot"},
        execution_timeout = 27000,
        properties = {"builder_group": "client.v8.ports"},
    ),
    multibranch_builder(
        name = "V8 Arm GC Stress",
        parent_builder = "V8 Arm - debug builder",
        dimensions = {"host_class": "multibot"},
        execution_timeout = 30600,
        properties = {"builder_group": "client.v8.ports"},
    ),
)

in_category(
    "Arm64",
    multibranch_builder(
        name = "V8 Arm64 - builder",
        triggering_policy = greedy_batching_of_1,
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        properties = {"target_arch": "arm", "target_bits": 64, "builder_group": "client.v8.ports"},
        use_goma = GOMA.DEFAULT,
    ),
    multibranch_builder(
        name = "V8 Android Arm64 - builder",
        triggering_policy = greedy_batching_of_1,
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        properties = {"builder_group": "client.v8.ports", "target_arch": "arm", "target_platform": "android", "binary_size_tracking": {"category": "android_arm64", "binary": "d8"}},
        use_goma = GOMA.DEFAULT,
    ),
    multibranch_builder(
        name = "V8 Android Arm64 - debug builder",
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        properties = {"target_platform": "android", "target_arch": "arm", "builder_group": "client.v8.ports"},
        use_goma = GOMA.DEFAULT,
    ),
    multibranch_builder(
        name = "V8 Android Arm64 - N5X",
        parent_builder = "V8 Android Arm64 - builder",
        dimensions = {"host_class": "multibot"},
        properties = {"builder_group": "client.v8.ports"},
        close_tree = False,
    ),
    multibranch_builder(
        name = "V8 Linux - arm64 - sim",
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        properties = {"builder_group": "client.v8.ports"},
        use_goma = GOMA.DEFAULT,
    ),
    multibranch_builder(
        name = "V8 Linux - arm64 - sim - debug",
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        properties = {"builder_group": "client.v8.ports"},
        use_goma = GOMA.DEFAULT,
    ),
    multibranch_builder(
        name = "V8 Linux - arm64 - sim - gc stress",
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        execution_timeout = 23400,
        properties = {"builder_group": "client.v8.ports"},
        use_goma = GOMA.DEFAULT,
    ),
    multibranch_builder(
        name = "V8 Linux64 - arm64 - sim - pointer compression - builder",
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        properties = {"builder_group": "client.v8"},
        use_goma = GOMA.DEFAULT,
    ),
    multibranch_builder(
        name = "V8 Linux64 - arm64 - sim - pointer compression",
        parent_builder = "V8 Linux64 - arm64 - sim - pointer compression - builder",
        dimensions = {"host_class": "multibot"},
        execution_timeout = 19800,
        properties = {"builder_group": "client.v8"},
    ),
)

in_category(
    "Mips",
    multibranch_builder(
        name = "V8 Linux - mipsel - sim - builder",
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        properties = {"builder_group": "client.v8.ports"},
        use_goma = GOMA.DEFAULT,
        close_tree = False,
    ),
    multibranch_builder(
        name = "V8 Linux - mips64el - sim - builder",
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        properties = {"builder_group": "client.v8.ports"},
        use_goma = GOMA.DEFAULT,
        close_tree = False,
    ),
    multibranch_builder(
        name = "V8 Linux - mipsel - sim",
        parent_builder = "V8 Linux - mipsel - sim - builder",
        dimensions = {"host_class": "multibot"},
        execution_timeout = 19800,
        properties = {"builder_group": "client.v8.ports"},
        close_tree = False,
    ),
    multibranch_builder(
        name = "V8 Linux - mips64el - sim",
        parent_builder = "V8 Linux - mips64el - sim - builder",
        dimensions = {"host_class": "multibot"},
        execution_timeout = 19800,
        properties = {"builder_group": "client.v8.ports"},
        close_tree = False,
    ),
)

in_category(
    "IBM",
    multibranch_builder(
        name = "V8 Linux - ppc64 - sim",
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        execution_timeout = 19800,
        properties = {"builder_group": "client.v8.ports"},
        use_goma = GOMA.DEFAULT,
        close_tree = False,
    ),
    multibranch_builder(
        name = "V8 Linux - s390x - sim",
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        execution_timeout = 19800,
        properties = {"builder_group": "client.v8.ports"},
        use_goma = GOMA.DEFAULT,
        close_tree = False,
    ),
)

in_category(
    "RISC-V",
    multibranch_builder(
        name = "V8 Linux - riscv64 - sim - builder",
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        properties = {"builder_group": "client.v8.ports"},
        use_goma = GOMA.DEFAULT,
        close_tree = False,
        first_branch_version = "8.9",
    ),
    multibranch_builder(
        name = "V8 Linux - riscv64 - sim",
        parent_builder = "V8 Linux - riscv64 - sim - builder",
        dimensions = {"host_class": "multibot"},
        execution_timeout = 19800,
        properties = {"builder_group": "client.v8.ports"},
        close_tree = False,
        first_branch_version = "8.9",
    ),
)

in_category(
    "Loongson",
    multibranch_builder(
        name = "V8 Linux - loong64 - sim - builder",
        triggered_by_gitiles = True,
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        properties = {"builder_group": "client.v8.ports"},
        use_goma = GOMA.DEFAULT,
        close_tree = False,
        first_branch_version = "9.5",
    ),
    multibranch_builder(
        name = "V8 Linux - loong64 - sim",
        parent_builder = "V8 Linux - loong64 - sim - builder",
        dimensions = {"host_class": "multibot"},
        execution_timeout = 19800,
        properties = {"builder_group": "client.v8.ports"},
        close_tree = False,
        first_branch_version = "9.5",
    ),
)