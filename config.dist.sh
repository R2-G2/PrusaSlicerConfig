#!/bin/sh

# Copyright (c) 2022-2023 Ralf Grawunder

# PrusaSlicer configuration folder; can be relative
dir_prusa_slicer="${HOME}/.var/app/com.prusa3d.PrusaSlicer/config/PrusaSlicer";

# dedicated configuration folder; can be relative
dir_dedicated="../PrusaSlicer.config/cfg";

# settings ID keyword stripping regex; can't be empty, try [()]
strip_from_settings_id="\.(new|old|tmp)"

# filaments exclusion regex; can be empty
exclude_filament="";

# machines exclusion regex; can be empty
exclude_physical_printer="";

# print settings exclusion regex; can be empty
exclude_print="";

# printers exclusion regex; can be empty
exclude_printer="";

# SLA materials exclusion regex; can be empty
exclude_sla_material="";

# SLA print settings exclusion regex; can be empty
exclude_sla_print="";
