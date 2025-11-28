project(
  'run0-wrappers',
  'c',
  meson_version : '>= 0.61.0',
  default_options : [
                  'prefix=/usr',
                  'sysconfdir=/etc',
                  'localstatedir=/var',
                  'buildtype=debugoptimized',
  		  'default_library=shared',
		  'b_pie=true',
                  'b_lto=true',
		  'warning_level=2'],
  license : ['BSD-2-Clause'],
  version : '0.1.0',
)

conf = configuration_data()
conf.set_quoted('VERSION', meson.project_version())
conf.set_quoted('PACKAGE', meson.project_name())

cc = meson.get_compiler('c')
pkg = import('pkgconfig')

add_project_arguments(['-D_GNU_SOURCE=1',
		       '-DXTSTRINGDEFINES',
		       '-D_FORTIFY_SOURCE=2',
                       '-D_FILE_OFFSET_BITS=64',
                       '-D_TIME_BITS=64'], language : 'c')

possible_cc_flags = [
		  '-fstack-protector-strong',
		  '-funwind-tables',
		  '-fasynchronous-unwind-tables',
		  '-fstack-clash-protection',
		  '-Werror=return-type',
		  '-Wbad-function-cast',
		  '-Wcast-align',
                  '-Wformat-security',
		  '-Winline',
		  '-Wmissing-declarations',
		  '-Wmissing-prototypes',
		  '-Wnested-externs',
		  '-Wshadow',
		  '-Wstrict-prototypes',
		  '-Wundef',
		  ]
add_project_arguments(cc.get_supported_arguments(possible_cc_flags), language : 'c')

bindir = get_option('bindir')
datadir = get_option('datadir')
profileddir = get_option('sysconfdir') / 'profile.d'
polkitrulesdir = datadir / 'polkit-1/rules.d'

executable('nnpenabled', 'src/nnpenabled.c',
           install : true)

configure_file(
  input: 'src/run0-su.sh.in',
  output: 'run0-su.sh',
  configuration: {
    'PACKAGE': meson.project_name(),
    'VERSION': meson.project_version(),
  },
  install: true,
  install_dir: bindir
)

install_data('profile.d/run0-wrappers.sh', install_dir : profileddir)

configure_file(output: 'config.h', configuration: conf)

# polkit rules
subdir('polkit')

# Unit tests
#subdir('tests')

# Manual pages
#subdir('man')
