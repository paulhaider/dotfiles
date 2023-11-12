;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;; When using org-roam via the `+roam` flag
(unpin! org-roam)
(package! org-roam-ui)

;; modern style for org buffers
(package! org-modern :recipe (:host github :repo "minad/org-modern"))

;; When using org-roam via the `+roam` flag
(unpin! org-roam)

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)
