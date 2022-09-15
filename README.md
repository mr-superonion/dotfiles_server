# USEFUL SCRIPTS ON SERVER

The first thing to do is to add the ./bin/ into your PATH environment
variables:
```shell
export PATH="_CURRENT_DIR_/bin/":$PATH
```
Then please read the scripts and make sure that they will not ruin  your
computer.

## Job submission
[This script](./bin/myqsub) submit job to the Slurm system

## Run jupyterlab on server and open from local browser
[This script](./bin/qsubJupyter) run jupyterlab on server
You can runs jupyterlab on computing nodes by running the following command on
server:
```shell
myqsub qsubJupyter
```
If you insist to run jupyterlab on the login nodes (before that is killed by
the system monitor on the server), you can run
```shell
qsubJupyter
```
Then open a terminal in your local computer and run [this
script](./bin/remoteNotebook) to connect to the notebook.
