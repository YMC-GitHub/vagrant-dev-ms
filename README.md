# dev-ms

## Desc

YMC, dev sth. on this machine.

the ms  built with vagrant.

## Usage
- on win 10, before cloning this code. do as below:
```bash
git config --global core.autocrlf false
git config --global core.eol lf
```
- clone this code to your machine.
```bash
URL="xx"
DES=""
git clone "$URL" "$DES"
```

- on win 10, after cloning, do not forget to turn the behavior back if you want to run other windows projects:
```bash
git config --global core.autocrlf true
git config --global core.eol crlf

#ymc's dev-on-win-cnf:lg:safe
# when commit ,changes to LF. when checkout,  does not change.
# rebuse to commit with LF and CRLF
git config --global core.autocrlf input
git config --global core.safecrlf true

#ymc's dev-on-win-cnf:md:safe
#git config --global core.autocrlf input
#git config --global core.safecrlf warn

#git add .
#git commit -m "upate end of line to lf"
```

- on win 10, install vagrant plugin ,running git-bash as Administrator.

```bash
vagrant plugin install vagrant-winnfsd
vagrant plugin install vagrant-vbguest --plugin-version 0.21
vagrant plugin install vagrant-cachier
```
or, run bash script [`./vagrant-install-plugins.sh`](./vagrant-install-plugins.sh) as Administrator on pm.


- setup ms

```bash
vagrant up
```

- login ms

```bash
ms_name="DEV" ;vagrant ssh "$ms_name"
```

## Author

yemiancheng <ymc.github@gmail.com>

## License

MIT
