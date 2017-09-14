
(setq default-major-mode 'org-mode)

(put 'upcase-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
