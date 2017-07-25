#!/bin/bash
# Make the script executable, Copy it and Enable it.
chmod +x ./profile.d/00-alias.sh
cp ./profile.d/00-alias.sh /etc/profile.d/
source /etc/profile.d/00-alias.sh
exit 0
