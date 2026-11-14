# Vagrant Registry

* [https://github.com/hashicorp/vagrant-registry-export](https://github.com/hashicorp/vagrant-registry-export) is an export tool for the Vagrant Cloud registry.

## Registry in docker
System uses a standard apache2 image with root files configured to serve `metadata.json`.  

## Local Dev
* Bring up the read-only (`ro`) vagrant machine:
```
vagrant up ro
```
* Port forwards 8080 on your host to 8080 on the VM

## Future work
* Support metadata.json generation for new versions
* Support registry.json generation for new images and new versions
* Look into [drakkan/sftpgo](https://hub.docker.com/r/drakkan/sftpgo) image on docker hub, it may provide the means for the registry to become a write registry not just read only


