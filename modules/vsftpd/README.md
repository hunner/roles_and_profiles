# puppet-vsftpd

## Overview

This module enables and configures a vsftpd FTP server instance.

* `vsftpd` : Enable and configure the vsftpd FTP server

## Examples

With all of the module's default settings :

    include vsftpd

Tweaking a few settings :

    class { 'vsftpd':
      anonymous_enable  => 'NO',
      write_enable      => 'YES',
      ftpd_banner       => 'Marmotte FTP Server',
      chroot_local_user => 'YES',
    }

