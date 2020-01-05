### install neovim

https://github.com/neovim/neovim/wiki/Installing-Neovim
brew install neovim

### place .vimrc in home directory

### install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

### install plugins 
```
cd ~/.vim/bundle && \
git clone https://github.com/iamcco/markdown-preview.nvim.git && \
git clone https://github.com/vim-airline/vim-airline.git && \
git clone https://github.com/majutsushi/tagbar.git && \
git clone git://github.com/airblade/vim-gitgutter.git && \
git clone https://github.com/Shougo/deoplete.nvim.git && \
git clone git://github.com/flowtype/vim-flow.git && \
git clone https://github.com/SirVer/ultisnips.git && \
git clone https://github.com/tpope/vim-fugitive.git && \
git clone https://github.com/neomake/neomake.git && \
git clone https://github.com/prettier/vim-prettier && \
git clone https://github.com/fatih/vim-go.git && \
git clone https://github.com/scrooloose/nerdtree.git && \
git clone https://github.com/mileszs/ack.vim.git && \
git clone https://github.com/easymotion/vim-easymotion.git && \
```

### source .vimrc (from inside nvim)
`nvim`
`:source ~/.vimrc`
