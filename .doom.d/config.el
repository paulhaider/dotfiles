;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-one t)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; Load the font
(setq doom-font (font-spec :family "Fira Code" :size 15))

;; Doom modeline
(setq doom-modeline-major-mode-icon t)

;; useful tools for getting bibtex entries and pdf files of journal manuscripts
(require 'doi-utils)
(require 'org-ref-arxiv)
(setq bibtex-dialect 'biblatex)

(require 'org)
(setq org-list-allow-alphabetical t)

(require 'projectile)
(setq projectile-enable-caching t)

;; Latex specific configuartion for Org mode
(require 'ox-latex)
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))
(add-to-list 'org-latex-classes
             '("mimosis"
               "\\documentclass{mimosis}"
               ("\\part{%s}" . "\\part*{%s}")
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\subsubsubsection{%s}" . "\\subsubsubsection*{%s}")))
(add-to-list 'org-latex-classes
             '("mimosis_nopart"
               "\\documentclass{mimosis}"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\subsubsubsection{%s}" . "\\subsubsubsection*{%s}")))
(setq org-latex-listings t)
(add-to-list 'org-latex-packages-alist '("" "listingsutf8"))

(setq org_notes (concat (getenv "HOME") "/org/")
      zot_bib (concat (getenv "HOME") "/org/zotLib.bib")
      org-directory org_notes)

(use-package deft
  :after org
  :custom
  (deft-recursive t) ; search subdirectories
  (deft-directory org_notes))

(use-package! org-roam
  :commands (org-roam-insert org-roam-find-file org-roam)
  :init
  (setq org-roam-directory "~/org/")
  ;; (setq org-roam-graph-viewer "/usr/bin/open")
  :config
  (org-roam-mode +1))

(setq
  bibtex-completion-notes-path org_notes
  bibtex-completion-bibliography zot_bib
  bibtex-completion-pdf-field "file"
  bibtex-completion-notes-template-multiple-files
  (concat
   "#+TITLE: ${title}\n"
   "#+ROAM_KEY: cite:${=key=}\n"
   "* TODO Notes\n"
   ":PROPERTIES:\n"
   ":Custom_ID: ${=key=}\n"
   ":NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n"
   ":AUTHOR: ${author-abbrev}\n"
   ":JOURNAL: ${journaltitle}\n"
   ":DATE: ${date}\n"
   ":YEAR: ${year}\n"
   ":DOI: ${doi}\n"
   ":URL: ${url}\n"
   ":END:\n\n"
   )
  )

(use-package org-ref
  :config
  (setq
   org-ref-completion-library 'org-ref-ivy-cite
   org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtex
   org-ref-default-bibliography (list zot_bib)
   org-ref-bibliography-notes "~/org/bibnotes.org"
   org-ref-note-title-format "* TODO %y - %t\n :PROPERTIES:\n  :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n :ROAM_KEY: cite:%k\n  :AUTHOR: %9a\n  :JOURNAL: %j\n  :YEAR: %y\n  :VOLUME: %v\n  :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"
   org-ref-notes-directory org_notes
   org-ref-notes-function 'orb-edit-notes
   ))

(use-package org-roam-bibtex
  :after (org-roam)
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :config
  (setq org-roam-bibtex-preformat-keywords
        '("=key=" "title" "url" "file" "author-or-editor" "keywords"))
  (setq orb-templates
        '(("r" "ref" plain (function org-roam-capture--get-point)
           ""
           :file-name "${slug}"
           :head "#+TITLE: ${=key=}: ${title}\n#+ROAM_KEY: ${ref}

- tags ::
- keywords :: ${keywords}

\n* ${title}\n  :PROPERTIES:\n  :Custom_ID: ${=key=}\n  :URL: ${url}\n  :AUTHOR: ${author-or-editor}\n  :NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n  :NOTER_PAGE: \n  :END:\n\n"

           :unnarrowed t))))
