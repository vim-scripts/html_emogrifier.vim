" ============================================================
" Plugin:        html_emogrifier.vim
" Description:   HTML + linked CSS -> HTML + inline styles
" Maintainer:    Kien Nguyen <info@designtomarkup.com>
" License:       MIT
" Repository:    https://github.com/kien/html_emogrifier.vim
" ============================================================

if exists('g:loaded_emogrifier') && g:loaded_emogrifier
  finish
endif
let g:loaded_emogrifier = 1

com! Emogrify cal emogrifier#init()

ca emogrify Emogrify
