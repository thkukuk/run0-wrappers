xsltproc_exe = find_program('xsltproc', required : get_option('man'))
want_man = (get_option('man').enabled() or get_option('man').auto()) and xsltproc_exe.found()
xsltproc_flags = [
        '--nonet',
        '--xinclude',
        '--stringparam', 'version', '@0@'.format(meson.project_version()),
        '--path',
        '@0@:@1@'.format(meson.current_build_dir(), meson.current_source_dir())]

custom_man_xsl = files('custom-man.xsl')

xslt_cmd = [xsltproc_exe, '-o', '@OUTPUT0@'] + xsltproc_flags

mandir1 = get_option('mandir') / 'man1'
mandir5 = get_option('mandir') / 'man5'

if xsltproc_exe.found()
custom_target('run0-pkexec.1',
              input : 'run0-pkexec.1.xml',
              output : 'run0-pkexec.1',
              command : xslt_cmd + [custom_man_xsl, '@INPUT@'],
              install : want_man,
              install_dir : mandir1)
if get_option('pkexec-compat')
  install_data('pkexec.1', install_dir : mandir1)
endif
custom_target('run0-su.1',
              input : 'run0-su.1.xml',
              output : 'run0-su.1',
              command : xslt_cmd + [custom_man_xsl, '@INPUT@'],
              install : want_man,
              install_dir : mandir1)
if get_option('su-compat')
  install_data('su.1', install_dir : mandir1)
endif
custom_target('run0-sudo.1',
              input : 'run0-sudo.1.xml',
              output : 'run0-sudo.1',
              command : xslt_cmd + [custom_man_xsl, '@INPUT@'],
              install : want_man,
              install_dir : mandir1)
custom_target('sudo.conf.5',
              input : 'sudo.conf.5.xml',
              output : 'sudo.conf.5',
              command : xslt_cmd + [custom_man_xsl, '@INPUT@'],
              install : want_man,
              install_dir : mandir5)
if get_option('sudo-compat')
  install_data('sudo.1', install_dir : mandir1)
endif
endif
