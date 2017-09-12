(spacemacs/set-leader-keys "b SPC" 'rename-buffer)
(spacemacs/set-leader-keys "ie" 'eval-and-replace)
(spacemacs/set-leader-keys "tM" 'minimap-mode)

(global-set-key (kbd "s-o") 'other-window)
(global-set-key (kbd "s-.") 'next-buffer)
(global-set-key (kbd "s-,") 'previous-buffer)
(global-set-key (kbd "s->") 'evgeni/next-buffer-same-mode)
(global-set-key (kbd "s-<") 'evgeni/previous-buffer-same-mode)

(spacemacs/set-leader-keys-for-major-mode 'eshell-mode "d" 'evgeni/helm-eshell-last-dirs)
