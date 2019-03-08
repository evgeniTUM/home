(defconst evgeni-research-packages
  '(org-noter
    gscholar-bibtex
    ))

(defun evgeni-research/init-org-noter ()
  (use-package org-noter :defer t))

(defun evgeni-research/init-gscholar-bibtex ()
  (use-package gscholar-bibtex :defer t))
