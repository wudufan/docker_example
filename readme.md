# Example to use docker container

## Build and run container

1. cd to `docker/`
1. Run `ddocker_build.sh` to build the image;
2. Change the directories in `docker_run.sh`;
3. Run `docker_run.sh` to start docker image.

## Connect to container using VSCode

Prerequisite: in Market place, install `Remote - SSH` and `Dev Containers`

1. Change the `remoteUser` in `vscode_config/docker_config.json`;
2. Start a container is started;
3. Connect to the server using `Connect to Host...` (from the green remote button at the lower left corner);
4. From the newly connected VSCode, connect to the running container using `Attach to Running Container...` (from the same green remote button);
5. From the VSCode in the container, click the green button again, then select `Open Container Configuration File`;
6. Copy the content in the `vscode_config/docker_config.json` to the opened file.
7. Close the VSCode in container and reconnect, to let it install the plug-ins (including Python, path intellisense, Jupyter, and Code Spell Checker). The installation will take a while.

## Hold multiple long-run sessions using jupyter lab

Note that VSCode can start a jupyter lab from a .py file with proper formatting (segment cells with `#%%`), so it is not necessary to use the Jupyter lab alone for debugging. You can also create a .ipynb file and open the notebook from VSCode. 

Now VSCode has a port forwarding function (the `PORTS` tab to the right of the `TERMINAL` at the bottom of VSCode). You can just start a Jupyter lab using any ssh tool `jupyer lab --no-browser`, and forward the port using the `PORTS` tab via VSCode. It can also directly open the forwarded port in a webpage. But one should not start a jupyerlab in VSCode, otherwise it will be closed after you exit VSCode. 

## Transferability

The code should be designed to have good transferability, for example, it can be run in non-docker environment (e.g. conda), since docker is not always available. To achieve that:

1. Use `docker_example.locations` module to keep track of the base data directories. So that when it changes, you only need to change `locations.py`;
2. Organize all your code in a subfolder to the project folder, so that a `setup` can be easily created if needed.
