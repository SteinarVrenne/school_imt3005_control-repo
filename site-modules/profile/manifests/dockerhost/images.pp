# Class moving image files to dockerHosts
class profile::dockerhost::images {

  # Directory
  file { '/root/dockerImages':
    ensure => 'directory',
    mode   => '0664',
  }

  file { '/root/dockerImages/forensics/Dockerfile':
    ensure => 'present',
    mode   => '0664',
    source => 'puppet:///scripts/kali/images/forensics/Dockerfile',
  }

  file { '/root/dockerImages/stego/Dockerfile':
    ensure => 'present',
    mode   => '0664',
    source => 'puppet:///scripts/kali/images/stego/Dockerfile',
  }

  file { '/root/dockerImages/pentest/Dockerfile':
    ensure => 'present',
    mode   => '0664',
    source => 'puppet:///scripts/kali/images/pentest/Dockerfile',
  }
}
