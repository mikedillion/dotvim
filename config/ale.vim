let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'css': ['prettier'],
\   'javascript': ['eslint'],
\   'json': ['fixjson'],
\   'sh': ['shfmt'],
\   'python': ['autopep8', 'yapf'],
\   'yaml': ['prettier'],
\   'sql': ['sqlint'],
\}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'json': ['jq'],
\   'python': ['flake8', 'pylint'],
\   'sh': ['shellcheck'],
\   'sql': ['sqlint'],
\ }

let g:ale_javascript_eslint_executable = 'eslint'
let g:ale_javascript_eslint_use_global = 0

let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_highlights = 1
let g:ale_set_signs = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

nmap <leader>a <Plug>(ale_fix)
