;; bashow init.el
;; author: bashow
;; Update: 2021/02/06


;; gnu-elpa-keyring-update
;; gpg --homedir ~/.emacs.d/elpa/gnupg --receive-keys 066DAFCB81E42C40
;; M-x package-install RET gnu-elpa-keyring-update RET

;; TLS1.3
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)
;; gnu
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
;; melpa
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; stable melpa
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; org
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;; initialize
(package-initialize)

;; package refresh
;; (package-refresh-contents)

;; add packeage

;; (package-install 'volatile-highlights)
;; (package-install 'rainbow-mode)
;; (package-install 'golden-ratio)

;; (package-install 'use-package)
;; (package-install 'helm)
;; (package-install 'helm-ag)
;; (package-install 'auto-complete)
;; (package-install 'key-combo)
;; (package-install 'key-chord)
;; (package-install 'flycheck)
;; (package-install 'highlight-indentation)

;; (package-install 'enh-ruby-mode)
;; (package-install 'inf-ruby)
;; (package-install 'python)
;; (package-install 'python-mode)
;; (package-install 'elpy)
;; (package-install 'scheme)
;; (package-install 'sly)
;; (package-install 'haskell-mode)
;; (package-install 'js2-mode)
;; (package-install 'go-mode)
;; (package-install 'rust-mode)
;; (package-install 'racer)
;; (package-install 'flycheck-rust)
;; (package-install 'json-mode)
;; (package-install 'markdown-mode)
;; (package-install 'recentf-ext)
;; (package-install 'undo-tree)
;; (package-install 'ruby-electric)
;; (package-install 'ruby-end)
;; (package-install 'slim-mode)
;; (package-install 'yaml-mode)
;; (package-install 'flymake-yaml)


;; Variables

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq make-backup-files nil)
(setq delete-auto-save-files t)
(setq use-dialog-box nil)

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(manoj-dark))
 '(helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
 '(helm-ag-command-option "--all-text")
 '(helm-ag-ignore-buffer-patterns '("\\.txt\\'" "\\.mkd\\'"))
 '(helm-ag-insert-at-point 'symbol)
 '(inferior-lisp-program "sbcl")
 '(package-selected-packages
   '(ctags-update flycheck-haskell flycheck-rust racer zones elpy auto-virtualenvwrapper virtualenvwrapper nadvice python-mode magit yatex helm-ag-r json-rpc ace-jump-mode neotree undo-tree scheme python helm xpm xelb volatile-highlights use-package sly ruby-end ruby-electric recentf-ext rainbow-mode markdown-mode magic-filetype key-combo key-chord json-mode js2-mode inf-ruby helm-ag haskell-mode go-mode geben-helm-projectile flycheck evil-magit enh-ruby-mode display-theme counsel-projectile auto-complete add-hooks))
 '(sql-product 'mysql)
 '(uniquify-buffer-name-style 'post-forward-angle-brackets nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-error ((((class color)) (:background "red"))))
 '(flymake-warning ((((class color)) (:background "yellow")))))

;; init frame
(setq initial-frame-alist
      (append (list
	       '(width . 120)
	       '(height . 180)
	       '(top . 0)
	       '(left . 0)
	       )
	      initial-frame-alist))
(setq default-frame-alist initial-frame-alist)

;; font
;; (set-frame-font "ricty-12")
;; (set-face-font 'default "Ricty Diminished-12")

;; theme
(defvar my/load-themes '(manoj-dark tango spike))
(load-theme (car my/load-themes) t)

;; Coding:
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; White space
(setq-default show-trailing-whitespace t)
;; (global-whitespace-mode 1)

;; Uniquify

;; Show paren
(show-paren-mode t)

;; Column mode
(column-number-mode t)

;; linum mode
(global-display-line-numbers-mode 1)

;; eol
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; no sevefile
(setq make-backup-files nil)
(setq auto-save-default nil)

;; X11 copy

;; volatile-highlights.el
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; Rainbow mode
(require 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'less-mode-hook 'rainbow-mode)
(add-hook 'web-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook 'rainbow-mode)

;; meta
(when (eq system-type 'darwin)
    (setq ns-command-modifier (quote meta)))

;; backward
(global-set-key "\C-h" 'backward-delete-char)

;; key-chord
(use-package key-chord)

;; use-package
(require 'use-package)

;; ctags
(setq ctags-update-command "/usr/local/bin/ctags")

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name)))
)

(defun build-ctags ()
  (interactive)
  (message "building project tags")
  (let ((root (eproject-root)))
    (shell-command (concat "ctags -e -R --extra=+fq --exclude=db --exclude=test --exclude=.git --exclude=public -f " root "TAGS " root)))
  (visit-project-tags)
  (message "tags built successfully"))

(defun visit-project-tags ()
  (interactive)
  (let ((tags-file (concat (eproject-root) "TAGS")))
    (visit-tags-table tags-file)
    (message (concat "Loaded " tags-file))))

;; Helm
(use-package helm :defer t
  :diminish helm-mode
  :init
  (helm-mode t))

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

(define-key global-map (kbd "C-x b")   'helm-for-files)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "M-X")     'helm-smex-major-mode-commands)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(define-key global-map (kbd "C-c i")   'helm-imenu)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(global-set-key (kbd "C-c h o") 'helm-occur)


;; Helm-ag
(require 'helm-ag)
(setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
(setq helm-ag-thing-at-point 'symbol)
(global-set-key (kbd "C-c s") 'helm-ag)

;; ispell
;; Aspell
(setq-default ispell-program-name "aspell")
(eval-after-load "ispell"
 '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))

(global-set-key (kbd "C-M-$") 'ispell-complete-word)

;; Auto-Complete
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)       ;; C-n/C-p
(setq ac-use-fuzzy t)


;; Magit
;; (use-package magit :defer t)
(unless (package-installed-p 'magit)
  (package-refresh-contents) (package-install 'magit))

;; ace jump
(unless (package-installed-p 'ace-jump-mode)
  (package-refresh-contents) (package-install 'ace-jump-mode))

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; neotree
(unless (package-installed-p 'neotree)
  (package-refresh-contents) (package-install 'neotree))

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Recentf
(setq recentf-max-saved-items 2000)
(setq recentf-auto-cleanup 'never)
(setq recentf-exclude '(".recentf"))
(setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))

(recentf-mode 1)
(bind-key "C-c t" 'helm-recentf)

;; Undo Tree
(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-redo)

;; yes or no y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; scroll
(setq scroll-conservatively 2)

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(global-flycheck-mode t)

;; golden retio
(require 'golden-ratio)
(golden-ratio-mode 1)

(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        action c)
    (catch 'end-flag
      (while t
        (setq action
              (read-key-sequence-vector (format "size[%dx%d]"
                                                (window-width)
                                                (window-height))))
        (setq c (aref action 0))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (let ((last-command-char (aref action 0))
                     (command (key-binding action)))
                 (when command
                   (call-interactively command)))
               (message "Quit")
               (throw 'end-flag t)))))))
(global-set-key "\C-c\C-r" 'window-resizer)

;; flycheck

;; rfringe
(require 'fringe)

;; flymake
;; long checks
(defun interrupting-flymake-start-syntax-check (base-function)
  (when (and (boundp 'flymake-syntax-check-process) (process-live-p flymake-syntax-check-process))
    (setq flymake-check-was-interrupted t)
    (flymake-kill-process flymake-syntax-check-process))
  (funcall base-function)
  (let ((proc (car flymake-processes)))
    (set-process-query-on-exit-flag proc nil)
    (set (make-local-variable 'flymake-syntax-check-process) proc)
    (setq flymake-check-was-interrupted t)
    (setq flymake-is-running nil)))
(advice-add 'flymake-start-syntax-check :around #'interrupting-flymake-start-syntax-check)

(require 'flymake)

(defun flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))
(add-hook 'post-command-hook 'flymake-show-help)

(defun my-flymake-show-next-error()
  (interactive)
  (flymake-goto-next-error)
  (flymake-display-err-menu-for-current-line)
  )
(local-set-key "\C-c\C-v" 'my-flymake-show-next-error)

(defvar my-flymake-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\M-p" 'flymake-goto-prev-error)
    (define-key map "\M-n" 'flymake-goto-next-error)
    map)
  "Keymap for my flymake minor mode.")

(defun my-flymake-err-at (pos)
  (let ((overlays (overlays-at pos)))
    (remove nil
            (mapcar (lambda (overlay)
                      (and (overlay-get overlay 'flymake-overlay)
                           (overlay-get overlay 'help-echo)))
                    overlays))))

(defun my-flymake-err-echo ()
  (message "%s" (mapconcat 'identity (my-flymake-err-at (point)) "\n")))

(defadvice flymake-goto-next-error (after display-message activate compile)
  (my-flymake-err-echo))

(defadvice flymake-goto-prev-error (after display-message activate compile)
  (my-flymake-err-echo))

(define-minor-mode my-flymake-minor-mode
  "Simple minor mode which adds some key bindings for moving to the next and previous errors.

Key bindings:

\\{my-flymake-minor-mode-map}"
  nil
  nil
  :keymap my-flymake-minor-mode-map)

;; Enable this keybinding (my-flymake-minor-mode) by default
;; Added by Hartmut 2011-07-05
(add-hook 'haskell-mode-hook 'my-flymake-minor-mode)


(defun next-flymake-error ()
  (interactive)
  (let ((err-buf nil))
    (condition-case err
        (setq err-buf (next-error-find-buffer))
      (error))
    (if err-buf
        (next-error)
      (progn
        (flymake-goto-next-error)
        (let ((err (get-char-property (point) 'help-echo)))
          (when err
            (message err)))))))
(flymake-goto-next-error)
(let ((err (get-char-property (point) 'help-echo)))
  (when err
    (message err)))
 (defun my-flymake-show-help ()
   (when (get-char-property (point) 'flymake-overlay)
     (let ((help (get-char-property (point) 'help-echo)))
       (if help (message "%s" help)))))

 (add-hook 'post-command-hook 'my-flymake-show-help)

(defun my-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))

(add-hook 'post-command-hook 'my-flymake-show-help)

;; buffer file completion ingore
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)


;; elec-pair
(electric-pair-mode 1)

;; which-func
(which-function-mode t)

;; (require 'key-combo)
;; (global-key-combo-mode t)
;; (key-combo-load-default)

(require 'highlight-indentation)

;; epc
;; (require 'epc)

;;; Languages:

;; Ruby
(autoload 'ruby-mode "ruby-mode"
   "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("[Rr]akefile$" . ruby-mode))

(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list nil)

;; inf-ruby
(require 'inf-ruby)
(setq inf-ruby-default-implementation "pry")
(setq inf-ruby-eval-binding "Pry.toplevel_binding")
(add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on)

;; rbenv
;;(require 'rbenv)
;;(global-rbenv-mode)
;;(setq rbenv-installation-dir "~/.rbenv")

;; highlight end
(require 'ruby-end)

;; Python
(require 'python)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
;; eply
(use-package elpy
  :ensure t
  :init
    (elpy-enable))

;; Lisp
(defvar my/emacs-lisp-ac-sources
  '(ac-source-features ac-source-functions ac-source-variables ac-source-symbols))

(defun my/emacs-lisp-mode-hook ()
  (rainbow-mode t)
  (auto-complete-mode 1)
  (setq ac-sources (append ac-sources my/emacs-lisp-ac-sources))
  (set-face-foreground 'font-lock-regexp-grouping-backslash "indian red")
  (set-face-foreground 'font-lock-regexp-grouping-construct "peru")
  (nameless-mode t))

(use-package nameless :defer t
  :config
  (add-to-list 'nameless-global-aliases '("pv" . "projectile-variable")))


(defalias 'inferior-emacs-lisp 'ielm "λ...")

;; `Cask' is NOT emacs-lisp-mode
(add-to-list 'auto-mode-alist '("/Cask\\'" . lisp-mode))

;; Scheme

(use-package scheme :defer t
  :config
  (defun my/scheme-mode-hook ()
    "λ..."
    (paredit-mode t)
    (ac-geiser-setup))
  (custom-set-variables
   '(geiser-active-implementations '(guile racket)))
  (add-hook 'geiser-mode-hook #'my/scheme-mode-hook)
  (add-hook 'scheme-mode-hook #'my/scheme-mode-hook))

;; Common Lisp

(use-package sly :defer t
  :init
  ;; (require 'sly-autoloads)
  (custom-set-variables
   '(inferior-lisp-program "sbcl")))

;; Haskell

(use-package haskell-mode :defer t
  :init
  (add-hook 'haskell-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indent))

;; Scala


;; JavaScript
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook 'flycheck-mode)
(add-hook 'js2-mode-hook
          (lambda ()
             (setq my-js-mode-indent-num 2)
             (setq js2-basic-offset my-js-mode-indent-num)
             (setq js-switch-indent-offset my-js-mode-indent-num)
            ))

;; Go
(require 'go-mode)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq c-basic-offset 4)
            (setq indent-tabs-mode nil)))

;; rust
(require 'rust-mode)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-hook 'rust-mode-hook (lambda ()
                            (racer-mode)
                            (flycheck-rust-setup)))

;; JSON


;; text-mode


;; YAML
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))

(require 'flymake-yaml)
(add-hook 'yaml-mode-hook 'flymake-yaml-load)
(add-hook 'yaml-mode-hook 'highlight-indentation-mode)
(add-hook 'yaml-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'yaml-mode-hook '(lambda() (setq highlight-indentation-offset 2)))


;; Markdown Mode
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;;
;; YaTeX
;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/yatex")
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))
(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
(setq YaTeX-latex-message-code 'utf-8)
(setq YaTeX-use-LaTeX2e t)
(setq YaTeX-use-AMS-LaTeX t)
(setq YaTeX-dvi2-command-ext-alist
      '(("TeXworks\\|texworks\\|texstudio\\|mupdf\\|SumatraPDF\\|Preview\\|Skim\\|TeXShop\\|evince\\|atril\\|xreader\\|okular\\|zathura\\|qpdfview\\|Firefox\\|firefox\\|chrome\\|chromium\\|MicrosoftEdge\\|microsoft-edge\\|Adobe\\|Acrobat\\|AcroRd32\\|acroread\\|pdfopen\\|xdg-open\\|open\\|start" . ".pdf")))
;(setq tex-command "ptex2pdf -u -l -ot '-synctex=1'")
;(setq tex-command "lualatex -synctex=1")
(setq tex-command "latexmk")
(setq bibtex-command "latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/upmendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
(setq makeindex-command "latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/upmendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
(setq dvi2-command "open -a Skim")
(setq tex-pdfview-command "open -a Skim")
(setq dviprint-command-format "open -a \"Adobe Acrobat Reader DC\" `echo %s | gsed -e \"s/\\.[^.]*$/\\.pdf/\"`")

(add-hook 'yatex-mode-hook
          '(lambda ()
             (auto-fill-mode -1)))
;;
;; RefTeX with YaTeX
;;
;; (add-hook 'yatex-mode-hook 'turn-on-reftex)
(add-hook 'yatex-mode-hook
          '(lambda ()
             (reftex-mode 1)
             (define-key reftex-mode-map (concat YaTeX-prefix ">") 'YaTeX-comment-region)
             (define-key reftex-mode-map (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))

;;; ------ Startup definitions for YaTeX ------ ;;;
(setq auto-mode-alist
  (cons (cons "\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(add-to-list 'load-path "/usr/share/emacs/site-lisp/yatex")
(setq YaTeX-help-file "/usr/share/emacs/site-lisp/yatex/help/YATEXHLP.eng")
;;; ------------------------------------------- ;;;
;;
;; yatex message
(setq YaTeX-latex-message-code 'utf-8)

;; viewer
(defvar YaTeX-dvi2-command-ext-alist
  '(("xdvi\\|PictPrinter" . ".dvi")
    ("ghostview¥¥|gv" . ".ps")
    ("acroread¥¥|pdf¥¥|Preview¥¥|TeXShop¥¥|Skim" . ".pdf")))

;; skim
(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-dvi2-command-ext-alist
      '(("TeXworks\\|texworks\\|texstudio\\|mupdf\\|SumatraPDF\\|Preview\\|Skim\\|TeXShop\\|evince\\|atril\\|xreader\\|okular\\|zathura\\|qpdfview\\|Firefox\\|firefox\\|chrome\\|chromium\\|MicrosoftEdge\\|microsoft-edge\\|Adobe\\|Acrobat\\|AcroRd32\\|acroread\\|pdfopen\\|xdg-open\\|open\\|start" . ".pdf")))
(setq dvi2-command "open -a Skim")
(setq tex-pdfview-command "open -a Skim")


;; LaTeX-template
; (setq YaTeX-template-file "~/.LaTeX-template")

(require 'slim-mode)
(put 'dired-find-alternate-file 'disabled nil)
(put 'upcase-region 'disabled nil)

