;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Paul Haider"
      user-mail-address "paul.haider@pm.me")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:

;; (setq doom-font (font-spec :family "Fira Code" :size 14 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "Fira Sans" :size 15))

;; (setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 14))
;; (setq doom-unicode-font (font-spec :family "FiraCode Nerd Font Mono" :size 14))
;; (setq doom-variable-pitch-font (font-spec :family "Fira Sans" :size 15))

(setq doom-font (font-spec :family "JetBrains Mono NF" :size 14))
(setq doom-unicode-font (font-spec :family "JetBrains Mono NF" :size 14))
(setq doom-variable-pitch-font (font-spec :family "Fira Sans" :size 15))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
;; (setq doom-theme 'nano-light)
;; (after! doom-themes
;;   (load-theme 'doom-nano-light t))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;

(setq! zot_bib (concat (getenv "HOME") "/Documents/braindump/zotLib.bib")
       org_directory (concat (getenv "HOME") "/Documents/braindump/")
       org-directory org_directory
       ;; org_gtd (concat (getenv "HOME") "/Documents/braindump/")
       org_notes (list org_directory)
       org_journal (concat (getenv "HOME") "/Documents/braindump/journal/") ; for some reason I do not understand agenda view only works when I name the folder daily
       org_areas (directory-files-recursively (file-name-concat org-directory "areas") "\\.org$")
       org-agenda-files (append org_areas (list "inbox.org" "agenda.org" "notes.org" "private.org" "reading.org")))

(setq! org-journal-dir org_journal
       org-journal-file-type 'daily
       org-journal-file-format "%Y%m%d.org"
       org-journal-date-format "%A, %x"
       org-journal-date-prefix "#+title: "
       org-journal-time-prefix "* "
       org-journal-carryover-delete-empty-journal 'ask
       org-journal-enable-agenda-integration nil)  ; show current journal todos in agenda

(setq! citar-bibliography '("~/Documents/braindump/zotLib.bib"))
(setq! citar-notes-paths '("~/Documents/braindump/references/"))

(setq! org-roam-directory org_directory
       org-roam-dailies-directory org_journal
       org-roam-dailies-capture-templates
       '(("d" "default" entry
          "* %?"
          :target (file+head "%<%Y%m%d>.org"
                             "#+title: %<%A, %x>\n"))))

(add-hook! 'org-mode-hook 'org-fragtog-mode)
(add-hook! 'org-mode-hook 'org-appear-mode)
;; enable org-modern-mode
(add-hook! 'org-mode-hook #'org-modern-mode)
(add-hook! 'org-agenda-finalize-hook #'org-modern-agenda)
;; (with-eval-after-load 'org (global-org-modern-mode))

(after! org
  (setq! org-log-done t)
  (plist-put org-format-latex-options :scale 1.0)
  (setq! org-todo-keywords
         '((sequence "TODO(t)" "NEXT(n)" "HOLD(h)" "|" "DONE(d)"))))

;; refile
(setq! org-refile-use-outline-path 'file)
(setq! org-outline-path-complete-in-steps nil)
;; (setq! org-refile-targets '((org-agenda-files :maxlevel . 3)))
(setq! org-refile-targets '((org-agenda-files :regexp . "\\(?:\\(?:Note\\|Task\\)s\\)")))

;; TODO
(defun log-todo-next-creation-date (&rest ignore)
  "Log NEXT creation time in the property drawer under the key 'ACTIVATED'"
  (when (and (string= (org-get-todo-state) "NEXT")
             (not (org-entry-get nil "ACTIVATED")))
    (org-entry-put nil "ACTIVATED" (format-time-string "[%Y-%m-%d]"))))
(add-hook 'org-after-todo-state-change-hook #'log-todo-next-creation-date)

;; configure org-capture with custom templates based on https://www.labri.fr/perso/nrougier/GTD/index.html
(after! org-capture
  (setq! +org-capture-todo-file "inbox.org")
  (setq! org-capture-templates
         `(("i" "Inbox" entry (file +org-capture-todo-file)
            ,(concat "* TODO %?\n"
                     "Entered on %U"))
           ("m" "Meeting" entry  (file+headline "agenda.org" "Future")
            ,(concat "* %? :meeting:\n"
                     "<%<%Y-%m-%d %a %H:00>>"))
           ;; ("@" "Inbox [mu4e]" entry (file "inbox.org")
           ;;  ,(concat "* TODO Reply to \"%a\" %?\n"
           ;;           "Entered on %U"))
           ("n" "Note" entry  (file "notes.org")
            ,(concat "* Note (%a)\n"
                     "Entered on %U\n" "\n" "%?")))))

;; Agenda
(setq! org-agenda-custom-commands
      '(("g" "Get Things Done (GTD)"
         ((agenda ""
                  ((org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'deadline))
                   (org-deadline-warning-days 0)))
          (todo "NEXT"
                ((org-agenda-skip-function
                  '(org-agenda-skip-entry-if 'deadline))
                 (org-agenda-prefix-format "  %i %-12:c [%e] ")
                 (org-agenda-overriding-header "\nTasks\n")))
          (agenda nil
                  ((org-agenda-entry-types '(:deadline))
                   (org-agenda-format-date "")
                   (org-deadline-warning-days 7)
                   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'notregexp "\\* NEXT"))
                   (org-agenda-overriding-header "\nDeadlines")))
          (tags-todo "inbox"
                     ((org-agenda-prefix-format "  %?-12t% s")
                      (org-agenda-overriding-header "\nInbox\n")))
          (tags "CLOSED>=\"<today>\""
                ((org-agenda-overriding-header "\nCompleted today\n")))))))

;; Use full window for org-capture
(add-hook! 'org-capture-mode-hook 'delete-other-windows)

;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;

;; (setq org-gtd-update-ack "3.0.0")
;; (use-package! org-gtd
;;   :after org
;;   :config
;;   (setq org-gtd-directory org_gtd)
;;   (setq org-edna-use-inheritance t)
;;   (org-edna-mode)
;;   (map! :leader
;;         (:prefix ("d" . "org-gtd")
;;          :desc "Capture"        "c"  #'org-gtd-capture
;;          :desc "Engage"         "e"  #'org-gtd-engage
;;          :desc "Process inbox"  "p"  #'org-gtd-process-inbox
;;          :desc "Show all next"  "n"  #'org-gtd-show-all-next
;;          :desc "Stuck projects" "s"  #'org-gtd-review-stuck-projects))
;;   (map! :map org-gtd-clarify-map
;;         :desc "Organize this item" "C-c c" #'org-gtd-organize))

;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (("C-TAB" . 'copilot-accept-completion-by-word)
         ("C-<tab>" . 'copilot-accept-completion-by-word)
         :map copilot-completion-map
         ("<tab>" . 'copilot-accept-completion)
         ("TAB" . 'copilot-accept-completion)))

;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
