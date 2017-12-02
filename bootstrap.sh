#!/bin/bash

# Install Dependencies

yum update -y
yum install -y epel-release
yum install -y openscap-scanner wget libcurl4-gnutls-dev expat-devel jq
yum install -y scap-security-guide

# Run openSCAP scan
oscap xccdf eval --profile C2S --results-arf arf.xml --report report.html /usr/share/xml/scap/ssg/content/ssg-centos7-xccdf.xml

# Convert XML to JSON
yum install -y libcurl4-gnutls-dev expat-devel jq
wget -qO- https://get.haskellstack.org/ | sh
echo "run: stack setup"
echo "run: stack install xml-to-json"
echo "run: xml-to-json arf.xml > results.json"
