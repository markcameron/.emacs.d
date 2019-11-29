# .emacs.d

Emacs config to use across different machines by storing all the packages in the `/epla` directory.

## Installation

Clone this repo and pit it in your `~/` directory (`C:\Users\<USERNAME>\AppData\Roaming\` on windows).

Open the `.emacs.d/init.el` file and modify the `(setq default-directory "C:/web/www")` to match your folder structure, so that a `C-x C-f` opens by default there.

Open Emacs and run the following:

`M-x all-the-icons-install-fonts`

If on GNU Linux/Mac it should install automatically. On Windows you'll be prompted for a download location, and once downloaded you'll need to go and manually install each font by clicking on it and then the install button.

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

`phpcbf` automatically formats PHP files to be PSR-2 compliant on save

# TODO

- [ ] Add Snippets
