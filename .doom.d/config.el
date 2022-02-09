;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Personal Information
(setq user-full-name "Paul Haider"
      user-mail-address "paul.haider@pm.me")

;; Load the theme
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the font
(setq doom-font (font-spec :name "FuraCode Nerd Font" :size 15)
      doom-unicode-font (font-spec :name "Noto Sans Mono" :size 15)
      math-font (font-spec :family "Noto Sans Mono" :size 15))
;; (setq doom-font (font-spec :family "TT2020 Style E" :size 20))
;; (setq doom-font (font-spec :family "Iosevka" :size 15))


;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-one t)

;; map arrow keys for window navigation
(map! :map evil-window-map
      :desc "Window up" "<up>" #'evil-window-up
      :desc "Window down" "<down>" #'evil-window-down
      :desc "Window left" "<left>" #'evil-window-left
      :desc "Window right" "<right>" #'evil-window-right
      :desc "Window up" "S-<up>" #'+evil/window-move-up
      :desc "Window down" "S-<down>" #'+evil/window-move-down
      :desc "Window left" "S-<left>" #'+evil/window-move-left
      :desc "Window right" "S-<right>" #'+evil/window-move-right
      "C-k" nil
      "C-j" nil
      "C-h" nil
      "C-l" nil
      "C-S-k" nil
      "C-S-j" nil
      "C-S-h" nil
      "C-S-l" nil)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; Doom modeline
(setq doom-modeline-major-mode-icon t)
;;
;; ;; Latex specific configuartion for Org mode
;; (require 'ox-latex)
;; (setq org-latex-pdf-process (list "latexmk -f -pdf %f"))
;; (unless (boundp 'org-latex-classes)
;;   (setq org-latex-classes nil))
;; (add-to-list 'org-latex-classes
;;              '("mimosis"
;;                "\\documentclass{mimosis}"
;;                ("\\part{%s}" . "\\part*{%s}")
;;                ("\\chapter{%s}" . "\\chapter*{%s}")
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                ("\\subsubsubsection{%s}" . "\\subsubsubsection*{%s}")))
;; (add-to-list 'org-latex-classes
;;              '("mimosis_nopart"
;;                "\\documentclass{mimosis}"
;;                ("\\chapter{%s}" . "\\chapter*{%s}")
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                ("\\subsubsubsection{%s}" . "\\subsubsubsection*{%s}")))
;; (setq org-latex-listings t)
;; (add-to-list 'org-latex-packages-alist '("" "listingsutf8"))

;; Variables
(setq zot_bib (concat (getenv "HOME") "/braindump/zotLib.bib")
      org_directory (concat (getenv "HOME") "/braindump/")
      org_notes (list org_directory)
      org_journal (concat (getenv "HOME") "/braindump/journal/") ; for some reason I do not understand agenda view only works when I name the folder daily
      org-directory org_directory
      org-agenda-files (list org_directory org_journal))

(setq! citar-bibliography '("~/braindump/zotLib.bib"))
(setq! citar-notes-paths '("~/braindump/notes/"))
(setq! citar-symbols
      `((file ,(all-the-icons-faicon "file-o" :face 'all-the-icons-green :v-adjust -0.1) . " ")
        (note ,(all-the-icons-material "speaker_notes" :face 'all-the-icons-blue :v-adjust -0.3) . " ")
        (link ,(all-the-icons-octicon "link" :face 'all-the-icons-orange :v-adjust 0.01) . " ")))
(setq! citar-symbol-separator "  ")

;; change org journal to use .org ending and perfixes as for roam dailies
(setq org-journal-dir org_journal
      org-journal-file-type 'daily
      org-journal-file-format "%Y%m%d.org"
      org-journal-date-format "%A, %x"
      org-journal-date-prefix "#+title: "
      org-journal-time-prefix "* "
      org-journal-carryover-delete-empty-journal 'ask
      org-journal-enable-agenda-integration nil)  ; show current journal todos in agenda

(setq org-roam-directory org_directory
      org-roam-dailies-directory org_journal
      org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?"
         :target (file+head "%<%Y%m%d>.org"
                            "#+title: %<%A, %x>\n"))))

(use-package org-roam-bibtex
  :after org-roam
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :config

  (setq orb-preformat-keywords
        '("citekey" "title" "url" "author-or-editor" "keywords" "file")
        orb-process-file-keyword t
        orb-file-field-extensions '("pdf"))

  (setq org-roam-capture-templates
        '(("d" "default" plain "%?"
           :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n")
           :unnarrowed t)
          ("r" "bibliography reference" plain
           (file "/home/paul/Templates/noter_template.org")
           :target
           (file+head "notes/${citekey}.org" "#+title: ${title}\n")))))
