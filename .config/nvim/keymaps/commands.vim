" COMMANDS

	" Allow saving files as sudo
cmap w!! w !sudo tee > /dev/null %
command W w !sudo tee "%" > /dev/null " same as above

	" Open help in vertical split
cnoremap help vertical help
