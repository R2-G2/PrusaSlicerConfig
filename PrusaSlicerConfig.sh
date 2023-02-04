#!/bin/sh

# Copyright (c) 2022-2023 Ralf Grawunder

cd "$(dirname "$(readlink -m "${0}";)";)" || exit 1;
[ -f config.sh ] && . ./config.sh || . ./config.dist.sh;

dir_prusa_slicer="$(readlink -m "${dir_prusa_slicer}";)";
dir_dedicated="$(readlink -m "${dir_dedicated}";)";

[ -d "${dir_prusa_slicer}" ] && mkdir -vp "${dir_dedicated}" || exit 1;

ext=".ini";

normalize_configurations() {
    local folder="${dir_dedicated}/${1}";

    [ -d "${folder}" ] &&
    find "${folder}/"*"${ext}" -type f -regextype posix-extended ! -regex ".+/${2}\\${ext}$" | while read file; do
        sed -Ei "s/=$/= /; s/(${3}_settings_id =).*/\1 $(basename "${file}" "${ext}";)/;" "${file}";
    done;
}

find "${dir_dedicated}/"* -maxdepth 0 -type d -printf "%f\n" | while read folder; do
    folder_backup="${dir_prusa_slicer}/${folder}";

    [ ! -L "${folder_backup}" ] &&
    mv -vf "${folder_backup}" "${dir_dedicated}" && ln -vs "${dir_dedicated}/${folder}" "${dir_prusa_slicer}";
done;

normalize_configurations "printer" "${exclude_printer}" "printer";
normalize_configurations "sla_material" "${exclude_sla_material}" "material";
normalize_configurations "sla_print" "${exclude_sla_print}" "print";
