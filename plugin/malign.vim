if exists('g:loaded_malign')
  finish
else
  let g:loaded_malign = 'yes'
endif

if !exists('g:malign_default_mappings')
  let g:malign_default_mappings = 1
endif

command! MAlignThis call malign#malign_this()
command! MAlignThisWithPrevLine call malign#malign_this_with_prev_line()
command! MAlignThisWithNextLine call malign#malign_this_with_next_line()
command! MAlignToHere call malign#malign_to_here()

if g:malign_default_mappings
  nnoremap <silent> MK :MAlignThisWithPrevLine<cr>
  nnoremap <silent> MJ :MAlignThisWithNextLine<cr>
  nnoremap <silent> MM :MAlignToHere<cr>

  vnoremap <silent> MK :MAlignThisWithPrevLine<cr>
  vnoremap <silent> MJ :MAlignThisWithNextLine<cr>
  vnoremap <silent> MM :MAlignToHere<cr>
endif
