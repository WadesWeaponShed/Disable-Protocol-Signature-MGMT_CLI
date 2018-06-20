Simple script to fix a potential upgrade problem from R77.30 to R80 when using APP & URL.

By default on R80 fresh install the option for 'Protocol Signature' is off by default on services. When upgrading to from 77.30 to R80 this can be enabled and can cause potential issues with performance.

This script will output two files:
  - disable_protocol_signature.txt (this can be ran to disable the 'protocol signature' on all services that have it enabled)
  - services_with_protcol_signature_enabled.txt (will output the names of the services with 'protocol signature' enabled)

## How to Use ##
 - place disable_protocol_signature.sh unto your managment station
 - chmod 755 disable_protocol_signature.sh
 - Execute: ./disable_protocol_signature.sh

 You can review the output of the files referenced above

## Automatic Remediation ##
  - chmod 755 disable_protocol_signature.txt
  - Execute: ./disable_protocol_signature.txt
