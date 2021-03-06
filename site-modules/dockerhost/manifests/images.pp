# Class moving image files to dockerHosts
class dockerhost::images {

  # Directory
  file { '/root/images':
    ensure => 'directory',
    mode   => '0664',
  }

  file { '/root/images/kali_base':
    ensure => 'directory',
    mode   => '0664',
  }

  file { '/root/images/kali_base/Dockerfile':
    ensure => 'present',
    mode   => '0664',
    source => 'puppet:///modules/dockerhost/images/kali_base/Dockerfile',
  }

  file { '/root/images/forensics':
    ensure => 'directory',
    mode   => '0664',
  }

  file { '/root/images/forensics/Dockerfile':
    ensure => 'present',
    mode   => '0664',
    source => 'puppet:///modules/dockerhost/images/forensics/Dockerfile',
  }

  file { '/root/images/stego':
    ensure => 'directory',
    mode   => '0664',
  }

  file { '/root/images/stego/Dockerfile':
    ensure => 'present',
    mode   => '0664',
    source => 'puppet:///modules/dockerhost/images/stego/Dockerfile',
  }

  file { '/root/images/pentest':
    ensure => 'directory',
    mode   => '0664',
  }

  file { '/root/images/pentest/Dockerfile':
    ensure => 'present',
    mode   => '0664',
    source => 'puppet:///modules/dockerhost/images/pentest/Dockerfile',
  }
}
