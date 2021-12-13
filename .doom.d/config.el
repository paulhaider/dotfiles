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

(map! :leader
      (:prefix-map ("m" . "+<localleader>")
       (:prefix-map ("m" . "+org_roam")
        :desc "Insert org-ref citation" "c" #'org-ref-insert-cite-link)))

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; Doom modeline
(setq doom-modeline-major-mode-icon t)

;; ;; useful tools for getting bibtex entries and pdf files of journal manuscripts
;; (require 'doi-utils)
;; (require 'org-ref-arxiv)
;; (setq bibtex-dialect 'biblatex)
;;
;; (require 'org)
;; (setq org-list-allow-alphabetical t)
;;
;; (require 'projectile)
;; (setq projectile-enable-caching t)

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
(setq zot_bib (concat (getenv "HOME") "/org/zotLib.bib")
      org_directory (concat (getenv "HOME") "/org/")
      org_notes (list org_directory)
      org_journal (concat (getenv "HOME") "/org/journal/") ; for some reason I do not understand agenda view only works when I name the folder daily
      org-directory org_directory
      org-agenda-files (list org_directory org_journal))

;; bibtex completion (replacing some older org-ref variables)
(setq bibtex-completion-bibliography zot_bib
      bibtex-completion-pdf-field "file"  ; in order to find pdfs in Zotero bibliography
      bibtex-completion-notes-path (concat (getenv "HOME") "/org/notes/")  ; not sure what that's needed for atm
      bibtex-completion-notes-template-multiple-files "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n"

      bibtex-completion-additional-search-fields '(keywords)
      bibtex-completion-display-formats
      '((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
        (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
        (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
        (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
        (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}"))
      bibtex-completion-pdf-open-function
      (lambda (fpath)
        (call-process "open" nil 0 nil fpath)))

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
  (require 'org-ref)

  ;; link click on ref to ivy
  (setq org-ref-insert-link-function 'org-ref-insert-link-hydra/body
        org-ref-insert-cite-function 'org-ref-cite-insert-ivy
        org-ref-insert-label-function 'org-ref-insert-label-link
        org-ref-insert-ref-function 'org-ref-insert-ref-link
        org-ref-cite-onclick-function (lambda (_) (org-ref-citation-hydra/body)))

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
           (file+head "references/${citekey}.org" "#+title: ${title}\n")))))
