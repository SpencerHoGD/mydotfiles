# Linux Administration

### How to list all enabled services from systemctl?

`systemctl list-unit-files | grep enabled` will list all enabled ones.

If you want which ones are currently running, you need `systemctl | grep` running.

### firewalld
```sh
firewall-cmd --state # to see the status of the service
systemctl status firewalld 
firewall-config # My firewall is disable on hxm-mjr
```

<++>
