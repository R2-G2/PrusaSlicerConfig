#!/bin/sh

# Copyright (c) 2022-2024 Ralf Grawunder

cd "$(dirname "$(readlink -m "${0}";)";)" || exit 1;
[ -f config.sh ] && . ./config.sh || . ./config.dist.sh;

dir_prusa_slicer="$(readlink -m "${dir_prusa_slicer}";)";
dir_dedicated="$(readlink -m "${dir_dedicated}";)";

[ -d "${dir_prusa_slicer}" ] && mkdir -vp "${dir_dedicated}" || exit 1;

ext=".ini";

maintain_settings() {
    local folder_prusa_slicer="${dir_prusa_slicer}/${1}";
    local folder_dedicated="${dir_dedicated}/${1}";

    if [ ! -L "${folder_prusa_slicer}" ]; then
        cp -vrf "${folder_prusa_slicer}" "${dir_dedicated}" && rm -vrf "${folder_prusa_slicer}" ||
            mkdir -vp "${folder_dedicated}";
        ln -vs "${folder_dedicated}" "${dir_prusa_slicer}";
    fi

    find "${folder_dedicated}/"*"${ext}" -type f -regextype posix-extended ! -regex ".+/${3}\\${ext}$" |
        while read file; do
            sed -i "s/=$/= /" "${file}";
            [ true = ${2} ] && sed -Ei "s/^(${1}_settings_id = )(\"?).*/\1\2$(basename "${file}" "${ext}" |
                sed -E "s/${strip_from_settings_id}//g";)\2/" "${file}";
        done;
}

maintain_settings "filament" true "${exclude_filament}";
maintain_settings "physical_printer" false "${exclude_physical_printer}";
maintain_settings "print" true "${exclude_print}";
maintain_settings "printer" true "${exclude_printer}";
maintain_settings "sla_material" true "${exclude_sla_material}";
maintain_settings "sla_print" true "${exclude_sla_print}";
