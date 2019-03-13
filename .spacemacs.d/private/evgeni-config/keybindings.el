(spacemacs/set-leader-keys "b SPC" 'rename-buffer)
(spacemacs/set-leader-keys "ie" 'eval-and-replace)
(spacemacs/set-leader-keys "ao C" 'evgeni/open-my-calendar)
(spacemacs/set-leader-keys "ao SPC" 'org-switchb)
(spacemacs/set-leader-keys "ass" 'counsel-switch-to-shell-buffer)

(spacemacs/set-leader-keys "hM" 'helm-descbinds)
(spacemacs/set-leader-keys "hm" 'which-key-show-major-mode)

(global-set-key (kbd "s-.") 'next-buffer)
(global-set-key (kbd "s-,") 'previous-buffer)
(global-set-key (kbd "s->") 'evgeni/next-buffer-same-mode)
(global-set-key (kbd "s-<") 'evgeni/previous-buffer-same-mode)

(spacemacs/set-leader-keys "o o" 'local-set-key)
(spacemacs/set-leader-keys "o O" 'global-set-key)

;;; mode specific bindings
(define-key shell-mode-map (kbd "C-M-r") 'counsel-shell-history)
