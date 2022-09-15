# USEFUL SCRIPTS ON SERVER

First thing to do is to add the ./bin/ into your PATH environment variables.
```shell
export PATH="_CURRENT_DIR_/bin/":$PATH
```

## Job submission
[This script](./bin/myqsub) submit job to the Slurm system

## Run jupyterlab on server and open from local browser
[This script](./bin/qsubJupyter) run jupyter lab on server
You can run jupyter lab on computing nodes by running the following command on
server
```shell
myqsub qsubJupyter
```

Then open a terminal in your local computer and run [this
script](./bin/remoteNotebook) to connect to the notebook.
