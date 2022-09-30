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

However, one can use the jupyter lab as an easy interface to hold multiple long-life session for training, so that they will not be killed even if you are disconnected from the ssh session. The jupyter lab can be accessed via port forwarding, which is already set up in `docker/docker_run.sh`. For example if we want to use port 8112:

1. Connect to the remote server from local computer with port forwarding. For example in WSL, one should use
```
ssh username@server.address -L 8112:locahost:8112
```
For putty, please refer to relevant document for port forwarding.

2. Make sure the container is up and running.
3. Inside the container, start Jupyter lab `jupyter lab --port=8112 --ip=0.0.0.0 --no-browser`.
4. From any explorer on your local computer, go to `locahost:8112` to visit the jupyter lab.

## Transferability

The code should be designed to have good transferability, for example, it can be run in non-docker environment (e.g. conda), since docker is not always available. To achieve that:

1. Use `docker_example.locations` module to keep track of the base data directories. So that when it changes, you only need to change `locations.py`;
2. Organize all your code in a subfolder to the project folder, so that a `setup` can be easily created if needed.