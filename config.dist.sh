#!/bin/sh

# Copyright (c) 2022-2023 Ralf Grawunder

# PrusaSlicer configuration folder; can be relative
dir_prusa_slicer="${HOME}/.config/PrusaSlicer";

# dedicated configuration folder; can be relative
dir_dedicated="../PrusaSlicer.config/cfg";

# printer exclusion regex; can be empty
exclude_printer="AnyCubic Photon Mono"; # UVtools

# SLA material exclusion regex; can be empty
exclude_sla_material="";

# SLA print exclusion regex; can be empty
exclude_sla_print="Universal .*"; # UVtools
