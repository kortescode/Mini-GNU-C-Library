# Mini GNU C Library [![Build Status](https://travis-ci.org/kortescode/Mini-GNU-C-Library.svg?branch=master)](https://travis-ci.org/kortescode/Mini-GNU-C-Library)

Mini GNU C Library is an Assembly library which contains the following functions:
- [memcpy(3)](https://linux.die.net/man/3/memcpy)
- [memmove(3)](https://linux.die.net/man/3/memmove)
- [memset(3)](https://linux.die.net/man/3/memset)
- [rindex(3)](https://linux.die.net/man/3/rindex)
- [strcasecmp(3)](https://linux.die.net/man/3/strcasecmp)
- [strchr(3)](https://linux.die.net/man/3/strchr)
- [strcmp(3)](https://linux.die.net/man/3/strcmp)
- [strcspn(3)](https://linux.die.net/man/3/strcspn)
- [strlen(3)](https://linux.die.net/man/3/strlen)
- [strncmp(3)](https://linux.die.net/man/3/strncmp)
- [strpbrk(3)](https://linux.die.net/man/3/strpbrk)
- [strstr(3)](https://linux.die.net/man/3/strstr)

## Requirements

Building the library requires the following tools:
- NASM command (see [www.nasm.us](https://nasm.us/))
```bash
sudo apt-get install nasm
```
## Compilation

To build the library, use:

```bash
make all
```

## License

Distributed under the [Apache License, Version 2.0](http://www.apache.org/licenses/). See [`LICENSE`](LICENSE) for more information.
