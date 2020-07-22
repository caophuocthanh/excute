#include <stdio.h>
#include <spawn.h>
#include <signal.h>
#include <stdbool.h>
#include <sys/types.h>
#include <sys/wait.h>

extern char **environ;

int command(char *cmd) {
	pid_t pid;
	char *argv[5] = {"sh", "-c", cmd, "EXIT", NULL};
	int status;
	status = posix_spawnp(&pid, "/bin/sh", NULL, NULL, argv, environ);
	if (status == 0) {
		if (waitpid(pid, &status, WEXITED) != -1) {
			return -1;
		}
	}
	return status;
}

int main(int argc, char *argv[], char *envp[]) {
	command("ls -als");
	return 0;
}
