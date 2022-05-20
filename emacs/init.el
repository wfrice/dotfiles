


;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


(use-package command-log-mode)  ;; Keeps track of commands and explains said command
(use-package all-the-icons      ;; Brings in icons
  :ensure t)

 
;; Use doom-modeline for mode line
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(org-babel-load-file
 (expand-file-name
  "config.org" "emacs"))
