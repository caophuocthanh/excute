#include <stdio.h>
#include <spawn.h>
#include <signal.h>

extern char **environ;

bool command(char *cmd) {
	pid_t pid;
	char *argv[5] = {"sh", "-c", cmd, "EXIT", NULL};
	int status;
	status = posix_spawnp(&pid, "/bin/sh", NULL, NULL, argv, environ);
	if (status == 0) {
		if (waitpid(pid, &status, WEXITED) != -1) {
			return true;
		}
	}
	return false;
}

int main(int argc, char *argv[], char *envp[]) {
	command("ls -als");
	return 0;
}
