# .emacs.d

Emacs config to use across different machines by storing all the packages in the `/elpa` directory.

![](https://static.kram.xyz/emacs-github-preview.png)

## Installation

Clone this repo and pit it in your `~/` directory (`C:\Users\<USERNAME>\AppData\Roaming\` on windows).

Open the `.emacs.d/init.el` file and modify the `(setq default-directory "C:/web/www")` to match your folder structure, so that a `C-x C-f` opens by default there.

If you want to use to bundled Monaco font, then you will need to install it if you don't already have it.

**Windows or GNU/Linux GUI**

Double click the monaco.ttf file and click on install.

**Gnu/Linux CLI**

Copy the Monaco.ttf file to the `~/.fonts` directory (create if needed) and then run `fc-cache -f -v` to rebuild the font cache.

Open Emacs and run the following:

`M-x all-the-icons-install-fonts`

If on GNU Linux/Mac it should install automatically. On Windows you'll be prompted for a download location, and once downloaded you'll need to go and manually install each font by double clicking on it and then pressing the install button.

Re-open Emacs and all should be running smoothly.

# Important packages

- flycheck
- phpcbf
- anzu
- doom-modeline
- doom-themes
- editorconfig
- neotree
- php-mode
- web-mode

# Theme

Multiple themes are included (doom, material, sanity, monokai), but it is configured to use `doom-snazzy`

# PHP specific

`phpcbf` automatically formats PHP files to be PSR-2 compliant on save.

## Install

[https://github.com/squizlabs/PHP_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer) for info on `phpcbf` and `phpcs`.

Otherwise you can install it like this:

```
wget https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar
mv phpcbf.phar /usr/local/sbin/phpcbf
chmod 764 /usr/local/sbin/phpcbf
```

You will also need to have PHP installed on the machine and have the `php-xml` extension enabled.

***NOTE**: Haven't managed to get this to work on windows yet. You can remove the `(add-hook 'php-mode-hook 'phpcbf-enable-on-save)` from the `init.el` file to stop this functionality.*

# TODO

- [X] Add Snippets
