" ============================================================
" Plugin:        html_emogrifier.vim
" Description:   HTML + linked CSS -> HTML + inline styles
" Maintainer:    Kien Nguyen <info@designtomarkup.com>
" License:       MIT
" Repository:    https://github.com/kien/html_emogrifier.vim
" ============================================================

let s:sav_cpo = &cpo
set cpo&vim

" .vimrc options
if !exists('g:emogrifier_interface')
	let g:emogrifier_interface = 'http://localhost/emogrifier/run.php'
endif

if !exists('g:emogrifier_curl')
	let g:emogrifier_curl = ''
endif

func! s:replacebuf(data)
	let sav_z = @z
	let @z = a:data
	norm! ggVG"zp
	let @z = sav_z
endfunc

func! emogrifier#init()
	if !executable('curl')
		echohl Error
		echo 'This plugin requires cURL.'
		echohl None
		retu
	endif
	for line in range(1, line('$'))
		if match(getline(line), '<link[^>]\+rel=[^>]stylesheet[^>]\+>') >= 0
			let href = matchstr(getline(line), '<link[^>]\+href=[''"]\zs[^''"]\+\ze[''"][^>]\+>')
			break
		endif
	endfor
	if &ssl || !exists('+shellslash')
		let separator = '/'
	else
		let separator = '\'
	endif
	let stylesheet = expand('%:p:h').separator.href
	let htmlfile = expand('%:p')
	let outfile = expand('%:p:r').'-email.'.expand('%:e')
	let data = system('curl '.g:emogrifier_curl.' -sSd "css='.stylesheet.'&html='.htmlfile.'" '.g:emogrifier_interface)
	cal writefile(split(data, '\n', 1), outfile)
	if filereadable(outfile)
		let outtail = expand('%:t:r').'-email.'.expand('%:e')
		windo
					\ if outtail =~? bufname('%')
					\ | cal s:replacebuf(data)
					\ | let found = 1
					\ | endif
		if !exists('found')
			exe 'sil! to vne '.outfile
			cal s:replacebuf(data)
		endif
	else
		cal writefile(split(data, '\n', 1), outfile)
		if filereadable(outfile)
			exe 'sil! to vne '.outfile
		endif
	endif
endfunc

let &cpo = s:sav_cpo
unlet s:sav_cpo

" vim:nofen:noet:ts=2:sw=2:sts=2
