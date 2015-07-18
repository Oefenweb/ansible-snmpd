#!/usr/bin/env bash
#
# set -x;
set -e;
set -o pipefail;
#
thisFile="$(readlink -f ${0})";
thisFilePath="$(dirname ${thisFile})";

# Only provision once
if [ -f /provisioned ]; then
  exit 0;
fi

export DEBIAN_FRONTEND=noninteractive;

shopt -s expand_aliases;
alias apt-update='apt-get update -qq';
alias apt-install='apt-get install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"';

# Enable non-free repository in Debian
if lsb_release -id | grep -q Debian; then
  codename="$(lsb_release -c | awk '{ print $2 }')";

  echo "deb http://ftp.nl.debian.org/debian/ ${codename} contrib non-free" > /etc/apt/sources.list.d/non-free.list;
  echo "deb-src http://ftp.nl.debian.org/debian/ ${codename} contrib non-free" >> /etc/apt/sources.list.d/non-free.list;
fi

touch /provisioned;
