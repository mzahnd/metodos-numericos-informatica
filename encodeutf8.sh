#!/bin/bash

folder="not-conv"

for file in $(find "${folder}" -type f); do
    org_fn="${file}"
    org_type=$(file -i "${org_fn}" | awk -F '=' '{print $2}')
    out_fn="${org_fn##*/}"
    
    if [[ ! "${org_type,,}" =~ .*utf-8.* ]]; then
        # dos -> unix
        sed -i 's@$@@' "${org_fn}"
        # ?? -> utf-8
        iconv -f "${org_type,,}" -t "UTF-8//TRANSLIT" "${org_fn}" \
            -o "${out_fn}"
    fi
done
