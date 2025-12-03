# run0-wrappers

This package provides a polkit rule to simulate sudo behavior
for run0 and wrappers for pkexec, su and sudo.

With the polkit rules:
1. Users in the \_run0\_nopasswd list don't need to enter a password.
2. Users that are in the wheel group always authenticate with their
   own password.
3. The remaining users need to provide the root password.

This matches sudo-policy-auth-wheel-self configuration on openSUSE
Tumbleweed, MicroOS and SLES 16.

To specify a list of users who don't need a password, create
a file `/etc/polkit-1/rules.d/51-run0-nopasswd.rules` with the
following example content:

``` 
polkit._run0_nopasswd.push("user1","user2",...);
```
