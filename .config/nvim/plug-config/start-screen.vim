
let g:startify_custom_header = [
				\'																																		',
				\'				                          ██       ██         ██						',
				\'				                         ░██      ░██        ░██						',
				\'				  ██████   ██████  █████ ░██      ░██ ██   ██░██  ██  █████	',
				\'				 ░░░░░░██ ░░██░░█ ██░░░██░██████  ░██░██  ░██░██ ██  ██░░░██',
				\'				  ███████  ░██ ░ ░██  ░░ ░██░░░██ ░██░██  ░██░████  ░███████',
				\'				 ██░░░░██  ░██   ░██   ██░██  ░██ ░██░██  ░██░██░██ ░██░░░░	',
				\'				░░████████░███   ░░█████ ░██  ░██ ███░░██████░██░░██░░██████',
				\'				 ░░░░░░░░ ░░░     ░░░░░  ░░   ░░ ░░░  ░░░░░░ ░░  ░░  ░░░░░░	',
				\'																																		',
				\]
                                      
let g:startify_session_dir = '~/.config/nvim/session'


let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]


let g:startify_fortune_use_unicode = 1

let g:startify_bookmarks = [
            \ { 'a': '~/.config/awesome/rc.lua' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'f': '~/.config/fish/config.fish' },
            \ { 'p': '~/Projects'},
            \ ]

let g:startify_enable_special = 0
