Roles & Profiles Example
========================

Converts `manifests/old_site.pp` to a roles and profiles version in `manifests/site.pp` and the `modules/role` and `modules/profile` modules. Uses these modules and their dependencies:

- puppetlabs/apache
- puppetlabs/mysql
- thias/vsftpd
- hunner/wordpress

Usage
-----

Run `vagrant up` to provision a wordpress instance with the roles & profiles pattern. Visit http://localhost:8080/blog to configure wordpress after vagrant provisioning finishes.
