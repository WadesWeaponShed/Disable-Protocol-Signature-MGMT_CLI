#!/bin/bash
printf "\nDetermining Objects Database Size\n"
total=$(mgmt_cli -r true show objects type "object" --format json |jq '.total')
printf "There are $total Objects\n"

file1="$PWD/disable_protocol_signature.txt"
if [ -f "$file1" ]
then
        rm $PWD/disable_protocol_signature.txt
fi

file2="$PWD/services_with_protcol_signature_enabled.txt"
if [ -f "$file2" ]
then
        rm $PWD/services_with_protcol_signature_enabled.txt
fi

printf "\nSearching $total Objects. This will take a bit.\n"
for I in $(seq 0 500 $total)
do
        mgmt_cli -r true show objects limit 500 offset $I type "object" details-level full --format json | jq --raw-output '.objects[] | select(."match-by-protocol-signature"==true) |("mgmt_cli -r true set " +  .type + " name " +  .name + " match-by-protocol-signature false")' >> disable_protocol_signature.txt

mgmt_cli -r true show objects limit 500 offset $I type "object" details-level full --format json | jq --raw-output '.objects[] | select(."match-by-protocol-signature"==true) | .name' >> services_with_protcol_signature_enabled.txt
done