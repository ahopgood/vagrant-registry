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
* Build and run the Dockerfile via docker compose
```
cd /vagrant/
docker compose up --build 
```
* Registry is available at [http://localhost:8080/](http://localhost:8080/)

## Future work
* Support metadata.json generation for new versions
* Support registry.json generation for new images and new versions
* Support dynamic or placeholders box urls in `metadata.json` and `registry.json` , this helps support registries in different environment; prod / staging domains or being served locally on the host filesystem
* Look into [drakkan/sftpgo](https://hub.docker.com/r/drakkan/sftpgo) image on docker hub, it may provide the means for the registry to become a write registry not just read only


## Registry structure
The registry stored boxes according to vagrant's [box repository](https://developer.hashicorp.com/vagrant/docs/boxes/box_repository) guidelines.  

The Directory structure is as follows:
* The registry name is the root.
* Box name 
* `versions`
* Box Version
* `provisioner`
* Box Provisioner (e.g. virtualbox)
* Architecture

```
<my-registry>/<my-box-name>/versions/<my-version>/providers/virtualbox/amd64/mybox.box
```
* Each box can have a [box catalog metadata](https://developer.hashicorp.com/vagrant/docs/boxes/box_repository#box-catalog-metadata) file in the form of a `metadata.json` in the root of the box directory:
```
<my-registry>/<my-box-name>/metadata.json
```
* It is this file we serve under the root of our directories by default so that `vagrant box add` will know where to download the right version from

