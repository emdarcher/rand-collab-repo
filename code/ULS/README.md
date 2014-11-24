#ULS: Useful(or Useless) Little Scripts

##How to run

###Running Perl scripts: (`*.pl`)
To run the Perl scripts (usually filnames ending in `.pl`), in the command line do `perl perl_script_name.pl` to run. Or if you are on a Unix-based system and have Perl installed and accessible in `/usr/bin/perl`, then making the script executable with `chmod +x perl_script_name.pl` and then running it prefixed with  a `./` like so: `./perl_script_name.pl`.

###Running Python scripts: (`*.py`)
Pretty much the same as running a Perl script, except use `python python_script_name.py`, and for making it executable, python should be in `/usr/bin/python` on your Unix-based system.

###Running Shell scripts:
  * __Bash scripts__: (`*.sh`)
    - Same as above scripts, but use `bash` before the script, or have Bash in `/bin/bash` to make executable on a Unix-based system.

##Info for new scripts:
  * If your script is using or manipulating local files, give it it's own directory/folder to live in, along with the other files it is using. This prevents overwriting other scripts or causing other problems.
  * If you script generates any files, make sure Git ignores them by using a `.gitignore` file (within the script's local directory) containing the name of the output files that Git should ignore. This is to avoid having a bunch of individual's files trying to make their way into commits, and then confilting with other's on Github.
