" https://boxes.thomasjensen.com/docs/
" -r removes boxes with the specified configuration the above (notice -r)
" -s WIDTHxHEIGHT  specifies the box size
" -d specifies formats from boxes-config
"    see: https://boxes.thomasjensen.com/box-designs.txt
" -a specifies aligment inside box
"    e.x. hcvc = horizontal center and vertical center

vmap ,xp !boxes -d parchment <CR>
nmap ,xp !!boxes -d parchment <CR>

vmap ,xs !boxes -d stone <CR>
nmap ,xs !!boxes -d stone <CR>

vmap ,xc !boxes -d shell <CR>
nmap ,xc !!boxes -d shell <CR>

imap jj <Esc>
