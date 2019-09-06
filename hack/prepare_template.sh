#!/bin/bash
prep_ICP_ADDITIONAL_CONFIG=$(printf '%s\n'"${1}" |sed 's/\\/&&/g;s/^[[:blank:]]/\\&/;s/$/\\/')
sed -i -e "/__ICP_ADDITIONAL_CONFIG__/a\\ ${prep_ICP_ADDITIONAL_CONFIG%?}" "${2}"
sed -i -e '/__ICP_ADDITIONAL_CONFIG__/d' "${2}"
