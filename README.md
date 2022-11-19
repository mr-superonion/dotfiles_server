# USEFUL SCRIPTS ON SERVER

## Job submission
[This script](./.xbin/xsub) submit job to the Slurm system

## Run jupyterlab on server and open from local browser
[This script](./.xbin/qsubJupyter) run jupyterlab on server
You can runs jupyterlab on computing nodes by running the following command on
server:
```shell
xsub qsubJupyter
```
If you prefer (not recommended) to run jupyterlab on the login nodes, you can
run
```shell
qsubJupyter
```
Then open a terminal in your local computer and run [this
script](./.xbin/remoteNotebook) to connect to the notebook.

## vim dotfiles

I use vim-plug to manage plugins.
```shell
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
Please find the vim setup [here](./.config/nvim). Remember to install pynvim
and nodejs (to support coc). Also, you can install them using conda/mamba in
your python environment.

```shell
pip3 install --user pynvim
pip3 install --user nodejs
```

## zsh dotfiles
The configuration files for zsh can be found [here](./.config/zsh).
