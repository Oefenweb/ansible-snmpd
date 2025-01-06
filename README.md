## snmpd

[![CI](https://github.com/Oefenweb/ansible-snmpd/workflows/CI/badge.svg)](https://github.com/Oefenweb/ansible-snmpd/actions?query=workflow%3ACI)
[![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-snmpd-blue.svg)](https://galaxy.ansible.com/Oefenweb/snmpd)

Set up snmp(d) in Debian-like systems.

#### Requirements


On **Debian** the **non-free** repository must be enabled to download the `snmp-mibs-downloader` package,
on **Ubuntu** this package is in **multiverse**. See the *"Recommended"* section below.

#### Variables

* `snmpd_install` [default: `[lm-sensors]`]: Additional packages to install
* `snmpd_mibs` [default: `UCD-SNMP-MIB`]: MIBs to load
* `snmpd_run` [default: `true`]: Snmpd control (true means start daemon)
* `snmpd_opts` [default: `'-LS4d -Lf /dev/null -u snmp -g snmp -I -smux -p /var/run/snmpd.pid'`]: Snmpd options (use syslog, close stdin/out/err)
* `snmpd_trapd_run` [default: `false`]: Snmptrapd control (true means start daemon)
* `snmpd_trapd_opts` [default: `'-Lsd -p /var/run/snmptrapd.pid'`]: Snmptrapd options (use syslog)
* `snmpd_snmpd_compat` [default: `false`]: Create symlink on Debian legacy location to official RFC path

* `snmpd_agent_address` [default: `['udp:161', 'udp6:[::1]:161']: Agent address

* `snmpd_internal_user`: [default: see defaults.yml]: Internal user. **Make sure to change!**

* `snmpd_users`: [default: see defaults.yml]: Additional users. **Make sure to change!**
* `snmpd_sys_location` [default: `''`]: System location
* `snmpd_sys_contact` [default: `Root <root@localhost>`]: System contact
* `snmpd_sys_description` [default: `{{ inventory_hostname }}`]: System description

* `snmpd_disks_include_all`: [default: `false`]: Include all disks mounted on the system in the SNMP table
* `snmpd_disks_include_all_threshold_minpercent`: [default: `10%`]: Minimum free space specified as a percentage
* `snmpd_disks`: [default: `[]`]: List of disk paths and their corresponding thresholds to be included in the SNMP table
* `snmpd_disks.{n}.path`: [required]: The disks mountpoint (e.g. `/`)
* `snmpd_disks.{n}.threshold`: [required]: The disks minimum threshold either be specified in kB (MINSPACE) or as a percentage of the total disk (MINPERCENT% with a '%' character) (e.g. `10%`)

* `snmpd_load` [optional]: Unacceptable `1`, `5` and `15`-minute load averages (e.g. `12 10 5`)

* `snmpd_default_monitors` [default: `true`]: Configure the Event `MIB` tables to monitor the various `UCD-SNMP-MIB` tables for problems
* `snmpd_link_up_down_notifications` [default: `true`]: Configure the Event `MIB` tables to monitor the `fTable` for network interfaces being taken up or down, and triggering a `linkUp` or `linkDown` notification as appropriate

* `snmpd_extensions`: [default: `[]`]: Extension MIB declaration(s)
* `snmpd_extensions.{n}.name`: [required]: An identifying string for the extension
* `snmpd_extensions.{n}.prog`: [required]: The program to run
* `snmpd_extensions.{n}.args`: [default: `[]`]: The arguments to give the program

* `snmpd_passes`: [default: `[]`]: Pass MIB declaration(s)
* `snmpd_passes.{n}.name`: [required]: An identifying string for the extension (OID)
* `snmpd_passes.{n}.prog`: [required]: The program to run

## Dependencies

None

## Recommended

* `ansible-apt` ([see](https://github.com/Oefenweb/ansible-apt), to manage `apt` repositories (in `/etc/apt/sources.list`)

#### Example

```yaml
---
- hosts: all
  roles:
    - oefenweb.snmpd
```

#### License

MIT

#### Author Information

Mischa ter Smitten

#### Feedback, bug-reports, requests, ...

Are [welcome](https://github.com/Oefenweb/ansible-snmpd/issues)!
