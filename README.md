# vimshell-inline-history.vim

This plugin provides inline history completion feature to VimShell.

## Features

![](http://gifzo.net/UKIIEtj887.gif)

- Complete histories by `C-p` and `C-n`.
- Complete histories which start with current input.
- Cycle completion.

## Install

I recommend using [neobundle](https://github.com/shougo/neobundle.vim) to install this plugin.

```vim
NeoBundleLazy 'supermomonga/vimshell-inline-history.vim', { 'depends' : [ 'Shougo/vimshell.vim' ] }

if neobundle#tap('vimshell-inline-history.vim')
  call neobundle#config({
        \   'autoload' : {
        \     'filetypes' : [ 'vimshell' ]
        \   }
        \ })

	function! neobundle#hooks.on_post_source(bundle)
		"Example of remapping keys for plugin
		imap <buffer> <C-j>  <Plug>(vimshell_inline_history#next)
		imap <buffer> <C-k>  <Plug>(vimshell_inline_history#prev)
	endfunction

	"Example of unmapping default keys
	let g:vimshell_inline_history#default_mappings = 0

	call neobundle#untap()
endif
```

## Usage

Hit `C-n` or `C-p` to complete history.
