
(setq inhibit-startup-message t)

(menu-bar-mode -1)	; Disables the menu bar

(load-theme 'wombat)


;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))


;; initialize use-package on non-Linux platform
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package command-log-mode)  ;; Keeps track of commands and explains said command
(use-package diminish)          ;; Allows the hiding of minor-modes
(use-package all-the-icons      ;; Brings in icons
  :ensure t)

;; Use Ivy for completions
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("c-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))


;; Use Counsel for file switching
(use-package counsel 
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Dont begin searches with ^

;; Use doom-modeline for mode line
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(org-babel-load-file
 (expand-file-name
  "config.org" "."))
