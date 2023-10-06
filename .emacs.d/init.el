;; UIs
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable he toolbar
(tooltip-mode -1)           ; Disable tooltips
(menu-bar-mode -1)          ; Disable the menu
(set-fringe-mode 10)        ; Give breathing rooms

(setq visible-bell t)       ; Visible bell instead of alarm

;; Themes
(use-package doom-themes
  :config (load-theme 'doom-tokyo-night t))

;; Modeline
(use-package doom-modeline
  :init
  (setq doom-modeline-position-line-format '("L%l"))
  (setq doom-modeline-modal t)
  (setq doom-modeline-bar-width 4)
  (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package all-the-icons
  :if (display-graphic-p))

;; Neotree
(use-package neotree)
(setq neo-window-fixed-size nil)


;; Line numbers
(global-display-line-numbers-mode t)

;; Disbale line numbers for these modes
(dolist (mode '(org-mode-hook
		neotree-mode-hook
		term-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Rainbow delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


;; Packages
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("elpa"   . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

;; Whichkey 
(use-package which-key
  :diminish
  :config
  (which-key-mode 1)
  (setq which-key-idle-delay 0.3))


;; Log commands
(use-package command-log-mode)

;; Ivy family
(use-package ivy
  :diminish
  :config (ivy-mode 1))

(use-package ivy-prescient
  :after counsel
  :config
  (ivy-prescient-mode 1))

(use-package ivy-rich
  :hook (counsel-mode . ivy-rich-mode)
  :config (ivy-rich-mode 1))

(use-package counsel
  :config (counsel-mode 1)
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)))

(use-package swiper
  :bind ("C-s" . swiper-isearch))

;; General - key bindings
(use-package general)

;; Evil!!
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  ; disable evil mode for dired and term mode
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'neotree-mode 'emacs)
  (evil-set-initial-state 'term-mode 'emacs))

(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

;; Org!
(use-package org
  :hook (org-mode . visual-line-mode)
  :config
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-agenda-start-with-log-mode t)
  (setq org-agenda-files
	'("/Users/joonhyeok.ahn/Library/Mobile Documents/iCloud~com~logseq~logseq/Documents/Vault/Tasks.org"
	  "/Users/joonhyeok.ahn/Library/Mobile Documents/iCloud~com~logseq~logseq/Documents/Vault/Habits.org"))
  (setq org-todo-keywords
	'((sequence "Todo(t)" "Active(a)" "|" "Completed(c)")))

  ; Archive tasks
  (setq org-refile-targets
    '(("archive.org" :maxlevel . 1)))

  ;; Save Org buffers after refiling!
  (advice-add 'org-refile :after 'org-save-all-org-buffers)

  (setq org-capture-templates
    `(("t" "Tasks / Projects")
      ("tt" "Task" entry (file+olp "/Users/joonhyeok.ahn/Library/Mobile Documents/iCloud~com~logseq~logseq/Documents/Vault/Tasks.org" "Inbox")
           "* Todo %?\n  %U\n  %a\n  %i" :empty-lines 1)

      ("j" "Journal Entries")
      ("jj" "Journal" entry
           (file+olp+datetree "/Users/joonhyeok.ahn/Library/Mobile Documents/iCloud~com~logseq~logseq/Documents/Vault/Journal.org")
           "\n* %<%I:%M %p> - Journal :journal:\n\n%?\n\n"
           :Clock-in :clock-resume
           :empty-lines 1)))

  ;; Habits
  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60)

  ;; Tags
  (setq org-tag-alist '(("@work" . ?w)
			("@home" . ?h)
			("@performance" . ?p)
			("@pkms" . ?m)
			("@writing" . ?w)
			("@reading" . ?r)
			("@youtube" . ?y)))
  (setq org-ellipsis " ▾"
        org-hide-emphasis-markers t))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . org-mode-visual-fill))

;; Org-roam!
(use-package org-roam
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-capture-templates
    '(("d" "default" plaing
       ""
       :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: %(prompt-for-note-type)")
       :unnarrowed t)))
  (org-roam-directory "/Users/joonhyeok.ahn/Library/Mobile Documents/iCloud~com~logseq~logseq/Documents/Vault/roams")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))

(use-package org-roam-ui
    :after org-roam
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))


(add-to-list 'display-buffer-alist
             '("\\*org-roam\\*"
               (display-buffer-in-direction)
               (direction . right)
               (window-width . 0.33)
               (window-height . fit-window-to-buffer)))

(defun prompt-for-note-type ()
  (let ((choice (completing-read "Select note type: " '("Fleeting note" "Reference note" "Literature note" "Permanent note"))))
    (cond
      ((equal choice "Fleeting note") ":fleeting")
      ((equal choice "Reference note") ":reference")
      ((equal choice "Literature note") ":literature")
      ((equal choice "Permanent note") ":permanent")
      (t (error "Invalid note type")))))

(use-package dired
  :config 
  (setq dired-kill-when-opening-new-dired-buffer t)
  (setq insert-directory-program "gls" dired-use-ls-dired t)
  (setq dired-listing-switches "-al --group-directories-first"))


(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))
(custom-set-variables

 (use-package ace-window
   :init
   (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
   :bind
   ("M-o" . ace-window))
 
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "3de5c795291a145452aeb961b1151e63ef1cb9565e3cdbd10521582b5fd02e9a" default))
 '(package-selected-packages
   '(org-roam-ui all-the-icons-dired dired-single org-roam visual-fill-column org-bullets hydra evil general all-the-icons doom-themes command-log-mode counsel ivy-rich which-key rainbow-delimiters swiper use-package ivy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
