#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dlfcn.h>

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <codec> <message>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    const char *codec = argv[1];
    char *message = argv[2];

    char lib_name[20];
    snprintf(lib_name, sizeof(lib_name), "lib%s.so", codec);

    void *library = dlopen(lib_name, RTLD_LAZY);
    if (!library) {
        fprintf(stderr, "Error loading library: %s\n", dlerror());
        exit(EXIT_FAILURE);
    }

    char function_name[20];
    snprintf(function_name, sizeof(function_name), "decode_%s", codec);

    void (*process)(char *) = dlsym(library, function_name);
    if (!process) {
        fprintf(stderr, "Error loading function: %s\n", dlerror());
        dlclose(library);
        exit(EXIT_FAILURE);
    }

    process(message);

    printf("%s\n", message);

    dlclose(library);

    return 0;
}
