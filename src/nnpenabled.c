// SPDX-License-Identifier: BSD-2-Clause

#include "config.h"

#include <stdio.h>
#include <stdbool.h>
#include <locale.h>
#include <sys/prctl.h>
#include <getopt.h>

static bool
no_new_privs_enabled(void)
{
  /* The no_new_privs flag disables setuid at execve(2) time. */
  return (prctl(PR_GET_NO_NEW_PRIVS, 0, 0, 0, 0) == 1);
}

static void
print_usage(FILE *stream)
{
  fprintf(stream, "Usage: nnpenabled [--help] [--version]\n");
}

static void
print_help(void)
{
  fprintf(stdout, "nnpenabled - indicates whether no_new_privs is enabled or disabled.\n\n");
  print_usage(stdout);

  fputs("  -h, --help          Give this help list\n", stdout);
  fputs("  -v, --version       Print program version\n", stdout);
}

static void
print_error(void)
{
  fprintf (stderr, "Try `nnpenabled --help' for more information.\n");
}

int
main(int argc, char **argv)
{
  setlocale(LC_ALL, "");

  while (1)
    {
      int c;
      int option_index = 0;
      static struct option long_options[] =
        {
          {"help",    no_argument, NULL, 'h' },
          {"version", no_argument, NULL, 'v' },
          {NULL,      0,           NULL, '\0'}
        };

      c = getopt_long (argc, argv, "hv",
                       long_options, &option_index);
      if (c == (-1))
        break;
      switch (c)
        {
        case 'h':
          print_help();
          return 0;
        case 'v':
          printf("nnpenabled (%s) %s\n", PACKAGE, VERSION);
          return 0;
        default:
          print_error();
          return 1;
        }
    }

  argc -= optind;
  argv += optind;

  if (argc > 0)
    {
      fprintf(stderr, "nnpenabled: too many arguments.\n");
      print_error();
      return 22 /* EINVAL */;
    }

  if (no_new_privs_enabled())
    return 0;
  else
    return 1;
}
