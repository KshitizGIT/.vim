# My Vim/Neovim Configuration

## Installation

1. git clone [https://github.com/KshitizGIT/.vim.git](https://github.com/KshitizGIT/.vim.git)
2. Install vim-plug. See [https://github.com/junegunn/vim-plug](https://github.com/junegunn/vim-plug)

   **For Unix**:

   - vim

    ```bash
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

   - nvim
    ```bash
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

   **For Windows**:
   - vim
    ```powershell
    md ~\vimfiles\autoload
    $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    (New-Object Net.WebClient).DownloadFile( $uri,
    $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\vimfiles\autoload\plug.vim"))
    ```

   - nvim
    ```powershell
    md ~\AppData\Local\nvim\autoload
    $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    (New-Object Net.WebClient).DownloadFile( $uri,
    $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\AppData\Local\nvim\autoload\plug.vim"))
    ```

3. Symbolic links. `ln -s .vim/.vimrc .vimrc && ln -s .vim/.vimrc ~/.config/nvim/init.vim`
4. Open vim or neovim.
5. In Normal mode, use :PlugInstall to install other plugins.
