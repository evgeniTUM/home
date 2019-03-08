
(setq default-major-mode 'org-mode)

(put 'upcase-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

(menu-bar-mode 1)

(defun my/dired-init ()
  (all-the-icons-dired-mode)
  (dired-hide-details-mode))
(add-hook 'dired-mode-hook 'my/dired-init)
