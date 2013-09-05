#U.B.E.R Vagrant Setup for BEI
- - -
##Setup
git clone the repo, cd into the repo, then run:
```bash
$ rm -rf .git*
```
or you can just git add your own repo to the remote list and push to that.
- - -
##Structure
The /www folder in the file root currently contains an index.php that prints phpinfo(); as well as doing simple MongoDB php, so if Mongo didn't install properly, loading the page will fail.
All project work will go into the /www folder as it is mounted to the /var/www on the guest.
- - -
##Info
The machine will respond the to the url 10.8.0.15
The vhost has the following URLs aliased to that IP address:
*uber.vg.blueearth.net
*edward.vg.blueearth.net
*jacob.vg.blueearth.net

- - -
##Installed
*Aache
*Mongo DB
*PHP
**PECL
**PEAR
