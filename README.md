# USEFUL Dotfiles

You can add the [.local/xbin](.local/xbin) directory to your $PATH [environment 
variable](https://wiki.archlinux.org/title/environment_variables) 
and copy / link the folders under [.config](.config) to your $HOME/.config/ directory 
to install the scripts. 

## Job submission
Use [this script](./.local/xbin/xsub) to submit job to the PBS or Slurm system.
The script determines the job submission system automatically.

## Run jupyterlab on server and open from local browser
With [this script](./.local/xbin/run_jupyter), you can run JupyterLab on the server. 
To start JupyterLab on computing nodes, use the following command on the server:
```shell
xsub run_jupyter
```
If you'd prefer to run JupyterLab on the login nodes (which isn't recommended), 
simply use:
```shell
run_jupyter
```
Once JupyterLab is running on the server, open a terminal on your local computer 
and run [this script](./.local/xbin/remoteNotebook) to connect to the notebook.

## vim dotfiles

I use vim-plug to manage plugins.
```shell
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
Check out the complete Vim setup at [here](./.config/nvim). Also, ensure pynvim 
and nodejs are installed for compatibility with coc.

```shell
pip3 install --user pynvim
pip3 install --user nodejs
```
You can also install them using conda or mamba within your Python environment.

## zsh dotfiles
The configuration files for zsh can be found [here](./.config/zsh).

## tmux dotfiles
