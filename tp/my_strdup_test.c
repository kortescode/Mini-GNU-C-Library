#include <unistd.h>
#include <stdio.h>

int main(int ac, char **av)
{
  int i;
  char *src;
  char *dest;

  src = av[1];
  printf("addsrc = %p\n", src);
  printf("adddest = %p\n\n", dest);
  dest = my_strdup(src);
  printf("addsrc = %p\n", src);
  printf("adddest = %p\n", dest);
  printf("src = %s\n", src);
  i = 0;
  write(1, "dest = ", 7);
  while (dest[i])
    write(1, &dest[i++], 1);
  write(1, "\n", 1);
  return (0);
}
