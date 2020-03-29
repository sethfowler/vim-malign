function! malign#save_position()
  let b:malign_saved_line_no = line('.')
  let b:malign_saved_col_no = virtcol('.')
endfunction

function! malign#malign_this()
  call malign#save_position()
endfunction

function! malign#malign_this_with_prev_line()
  call malign#save_position()

  if mode() == 'v' || mode() == 'V'
    call setpos('.', [0, line("'<"), virtcol("'<"), 0])
  endif

  normal! k
endfunction

function! malign#malign_this_with_next_line()
  call malign#save_position()

  if mode() == 'v' || mode() == 'V'
    call setpos('.', [0, line("'>"), virtcol("'>"), 0])
  endif

  normal! j
endfunction

function! malign#malign_to_here()
  if !exists('b:malign_saved_col_no') || !exists('b:malign_saved_line_no')
    return
  endif

  let coldiff = virtcol('.') - b:malign_saved_col_no
  call setpos('.', [0, b:malign_saved_line_no, b:malign_saved_col_no, 0])

  if coldiff < 0
    exe 'normal! ' . (-1 * coldiff) . 'X'
  elseif coldiff > 0
    exe 'normal! ' . coldiff . 'i '
    normal! l
  endif
endfunction
