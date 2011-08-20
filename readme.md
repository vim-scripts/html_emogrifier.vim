Requires Vim 7.3+, a PHP-supported web server and [cURL][1].

For Windows users without cURL, download the binaries from curl.haxx.se and put it in your system's PATH or in the same directory as gvim.exe.

## Usage/Configuration

1. Copy the `emogrifier` directory to your localhost's/website's public directory.
2. Define `g:emogrifier_interface` in your .vimrc.

    Example:

    ```vim
    let g:emogrifier_interface = 'http://localhost/emogrifier/run.php'
    ```
3. Run `:Emogrify` on any HTML page with linked CSS to get the email-friendly version.

## Related plugins:

* __[prefixer.vim][2]__ » Add vendor prefixes to CSS3 properties.
* __html_emogrifier.vim__ » Convert HTML page with linked CSS to HTML email with inline CSS.
* __[cssbaseline.vim][3]__ » Build a CSS baseline (empty CSS blocks) from HTML code.

[Get latest PHP Emogrifier class][4].

[1]: http://curl.haxx.se/download.html#Win32
[2]: https://github.com/kien/prefixer.vim
[3]: https://github.com/kien/cssbaseline.vim
[4]: http://www.pelagodesign.com/sidecar/emogrifier/
