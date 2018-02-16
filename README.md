# My Vim Configuration

### Installation

1. git clone https://github.com/KshitizGIT/.vim.git
2. Install vim-plug. See https://github.com/junegunn/vim-plug 

    ### Unix

    `curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

    ### Powershell
        `md ~\vimfiles\autoload
        $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        (New-Object Net.WebClient).DownloadFile(
          $uri,
          $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
            "~\.vim\autoload\plug.vim"
          )
        )`
        
3. vi (This will open the vim)
4. In Normal mode, use :PlugInstall to install other plugins.


### Additional Steps

  Create a symbolic link named .vimrc in your user profile directory to .vim/.vimrc. On a Linux or Mac machine this can be done by
  
  * ln -s .vim/.vimrc .vimrc
  
  
  
