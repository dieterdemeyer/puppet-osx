# Internal: Restart finder when necessary.
class osx::finder {
  exec { 'killall Finder':
    refreshonly => true
  }

  exec { 'Remove All .DS_Store Files':
    command     => 'find / -xdev -name .DS_Store -delete',
    user        => root,
    refreshonly => true,
  }
}
