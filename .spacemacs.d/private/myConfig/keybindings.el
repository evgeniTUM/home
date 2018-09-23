(spacemacs/set-leader-keys "b SPC" 'rename-buffer)
(spacemacs/set-leader-keys "ie" 'eval-and-replace)

(global-set-key (kbd "s-.") 'next-buffer)
(global-set-key (kbd "s-,") 'previous-buffer)
(global-set-key (kbd "s->") 'evgeni/next-buffer-same-mode)
(global-set-key (kbd "s-<") 'evgeni/previous-buffer-same-mode)

(spacemacs/set-leader-keys "o o" 'local-set-key)
(spacemacs/set-leader-keys "o O" 'global-set-key)

