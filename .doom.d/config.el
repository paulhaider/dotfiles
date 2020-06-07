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
(setq doom-font (font-spec :family "Fira Code" :size 16))

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

(use-package deft
      :after org
      :custom
      (deft-recursive t) ; search subdirectories
      (deft-use-filter-string-for-filename t)
      (deft-default-extension "org")
      (deft-directory "~/org/"))
