#!/bin/bash
# This script installs and configures a Sun Grid Engine installation for use
# on a Travis instance.
#
# Written by Dan Blanchard (dblanchard@ets.org), September 2013

sudo sed -i -r "s/^(127.0.0.1\s)(localhost\.localdomain\slocalhost)/\1localhost localhost.localdomain $(hostname) /" /etc/hosts
sudo apt-get update -qq
echo "gridengine-master shared/gridenginemaster string localhost" | sudo debconf-set-selections
echo "gridengine-master shared/gridenginecell string default" | sudo debconf-set-selections
echo "gridengine-master shared/gridengineconfig boolean true" | sudo debconf-set-selections
sudo apt-get install 'gridengine-*' libdrmaa1.0
sleep 5  # Wait for the server to come up, just in case
export CORES=$(grep -c '^processor' /proc/cpuinfo)
sed -i -r "s/template/$USER/" user_template
sudo qconf -Auser user_template
sudo qconf -au $USER arusers
sudo qconf -as localhost
export LOCALHOST_IN_SEL=$(qconf -sel | grep -c 'localhost')
if [ $LOCALHOST_IN_SEL != "1" ]; then sudo qconf -Ae host_template; else sudo qconf -Me host_template; fi
sed -i -r "s/UNDEFINED/$CORES/" queue_template
sudo qconf -Aq queue_template
export SGE_ROOT=/var/lib/gridengine
export SGE_CELL=default
export DRMAA_LIBRARY_PATH=/usr/lib/libdrmaa.so.1.0
echo "Printing queue info to verify that things are working correctly."
qstat -f -q all.q
echo "You should see sge_execd and sge_qmaster running below:"
ps aux | grep "sge"