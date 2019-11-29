;; Don't show startup message

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inhibit-startup-message t)

;; No Blinking Cursor
(blink-cursor-mode 0)

;; No Toolbar
(tool-bar-mode 0)

;; No Menu Bar
(menu-bar-mode 0)

;; No Scrollbars
(set-scroll-bar-mode nil)
(defadvice new-frame (after scroll-bar-mode activate)
  (set-scroll-bar-mode nil))

;; No Auto Save
(auto-save-mode 0)

;; Put all ~ files in this folder:
(setq backup-directory-alist '((".*" . "~/emacstrash")))

;; Default Folders [HOME]
;; (setq homepath "C:/web/www/")
;(setq default-directory "/var/www/")
(setq default-directory "C:/web/www")

;; Make window transparent
;(set-frame-parameter (selected-frame) 'alpha '(90 90)) ;(<active> [<inactive>])
;(add-to-list 'default-frame-alist '(alpha 90 90))

;; Remember position in document across opens
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))

;; Scroll window under mouse
(setq mouse-wheel-follow-mouse 't)

;; Show trailing whitespace
(setq-default show-trailing-whitespace t)

;; Removing trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Replace 'yes' by 'y'
(fset 'yes-or-no-p 'y-or-n-p)

; C-x k Kills the buffer without confirmation
(global-set-key (read-kbd-macro "C-x k") (quote kill-this-buffer))

;; Auto-Complete with Ctrl+Tab
(abbrev-mode t)
(global-set-key (quote [C-tab]) (quote dabbrev-expand))

;; C-a C-k removes whole line, not just text [includes carriage return]
(setq kill-whole-line t)

;; Do not use tabs for indent
(setq-default indent-tabs-mode nil)

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; Ask on close emacs
(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))

(when window-system
  (global-set-key (kbd "C-x C-c") 'ask-before-closing))

;; Switch between visible buffers using Alt+Right and Alt+Left
(global-set-key [(meta right)] 'other-window)
(global-set-key [(meta left)] '(lambda()
				 (interactive)
				 (other-window -1)
				 ))

;; Overwrite highlighed content on paste or type
(delete-selection-mode 1)

;; Set font face and size
(set-face-attribute 'default nil :font "Monaco-10")

;; Show column number
(column-number-mode 1)

;; Highlight matching {} ()
(show-paren-mode 1)
(setq blink-matching-paren-on-screen t)

;; Add a final newline to files that don't have one without asking.
(setq require-final-newline t)

;; Indent and remove tabs
(defun indent-buffer ()
  (interactive)
  (save-excursion (indent-region (point-min) (point-max) nil))
  (untabify (point-min) (point-max))
  )

;; Custom KBD SHortcuts
(global-set-key "\M-g" 'goto-line)
;(global-set-key "\C-q" 'toggle-comment)
(global-set-key [(home)] 'beginning-of-line)
(global-set-key [(C-home)] 'beginning-of-buffer)
(global-set-key [(end)] 'end-of-line)
(global-set-key [(C-end)] 'end-of-buffer)
(global-set-key "\C-x\w" 'web-mode)

;; Package customizations
(require 'neotree)
(global-set-key (kbd "C-x n") 'neotree-toggle)

(require 'doom-modeline)
(doom-modeline-mode 1)

(global-anzu-mode +1)

;; PHP Code sniffer
(require 'phpcbf)

;; FlyCheck
(require 'flycheck)
(global-flycheck-mode)

;; Editor Config
(require 'editorconfig)
(editorconfig-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (doom-snazzy)))
 '(custom-safe-themes
   (quote
    ("b45843c64479440629575217c718d07de2bee8587f1ad5811dd0f39df14dc804" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "7f74a3b9a1f5e3d31358b48b8f8a1154aab2534fae82c9e918fb389fca776788" "423435c7b0e6c0942f16519fa9e17793da940184a50201a4d932eafe4c94c92d" "0fe9f7a04e7a00ad99ecacc875c8ccb4153204e29d3e57e9669691e6ed8340ce" "fe76f3d5094967034192f6a505085db8db6deb0e135749d9a54dc488d6d3ee2f" "d6f04b6c269500d8a38f3fabadc1caa3c8fdf46e7e63ee15605af75a09d5441e" "5e0b63e0373472b2e1cf1ebcc27058a683166ab544ef701a6e7f2a9f33a23726" "7d56fb712ad356e2dacb43af7ec255c761a590e1182fe0537e1ec824b7897357" "428754d8f3ed6449c1078ed5b4335f4949dc2ad54ed9de43c56ea9b803375c23" "cdb3e7a8864cede434b168c9a060bf853eeb5b3f9f758310d2a2e23be41a24ae" "2878517f049b28342d7a360fd3f4b227086c4be8f8409f32e0f234d129cee925" "0d087b2853473609d9efd2e9fbeac088e89f36718c4a4c89c568dd1b628eae41" "001c2ff8afde9c3e707a2eb3e810a0a36fb2b466e96377ac95968e7f8930a7c5" "e7666261f46e2f4f42fd1f9aa1875bdb81d17cc7a121533cad3e0d724f12faf2" "2d392972cbe692ee4ac61dc79907af65051450caf690a8c4d36eb40c1857ba7d" "2d1fe7c9007a5b76cea4395b0fc664d0c1cfd34bb4f1860300347cdad67fb2f9" "728eda145ad16686d4bbb8e50d540563573592013b10c3e2defc493f390f7d83" "70cc30fd9d27a8d0d3ae82974ac2c409fd2cd5746470e2246778c6bec2d4857c" "332e009a832c4d18d92b3a9440671873187ca5b73c2a42fbd4fc67ecf0379b8c" "70ed3a0f434c63206a23012d9cdfbe6c6d4bb4685ad64154f37f3c15c10f3b90" "c8f959fb1ea32ddfc0f50db85fea2e7d86b72bb4d106803018be1c3566fd6c72" "2a3ffb7775b2fe3643b179f2046493891b0d1153e57ec74bbe69580b951699ca" "f951343d4bbe5a90dba0f058de8317ca58a6822faa65d8463b0e751a07ec887c" "071f5702a5445970105be9456a48423a87b8b9cfa4b1f76d15699b29123fb7d8" "b462d00de785490a0b6861807a360f5c1e05b48a159a99786145de7e3cce3afe" "f2b83b9388b1a57f6286153130ee704243870d40ae9ec931d0a1798a5a916e76" "1728dfd9560bff76a7dc6c3f61e9f4d3e6ef9d017a83a841c117bd9bebe18613" "f589e634c9ff738341823a5a58fc200341b440611aaa8e0189df85b44533692b" "0713580a6845e8075113a70275b3421333cfe7079e48228c52300606fa5ce73b" "f30aded97e67a487d30f38a1ac48eddb49fdb06ac01ebeaff39439997cbdd869" "a2286409934b11f2f3b7d89b1eaebb965fd63bc1e0be1c159c02e396afb893c8" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" default)))
 '(highlight-changes-colors (quote ("#FD5FF0" "#C678DD")))
 '(highlight-tail-colors
   (quote
    (("#1B1D1E" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#1B1D1E" . 100))))
 '(hl-sexp-background-color "#1c1f26")
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (nyan-mode markdown-mode flycheck phpcbf anzu doom-modeline doom-themes material-theme color-theme-sanityinc-tomorrow monokai-theme editorconfig php-mode neotree web-mode)))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#000000")
 '(weechat-color-list
   (quote
    (unspecified "#000000" "#1B1D1E" "#F70057" "#E06C75" "#86C30D" "#FF2500" "#BEB244" "#E5C07B" "#40CAE4" "#61AFEF" "#FB35EA" "#FD5FF0" "#74DBCD" "#56B6C2" "#ABB2BF" "#282C34"))))

; Auto format on save.
(add-hook 'php-mode-hook 'phpcbf-enable-on-save)

;; Web mode associations
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))

(setq-default web-mode-comment-formats
              '(("javascript" . "//")
                ("typescript" . "//")))



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
