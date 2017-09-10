
(defun helm-eshell-last-dirs ()
  (mapcar (lambda (x) (cons x x))
          (ring-elements evgeni/eshell-last-dir-ring)))

(defun helm-eshell-last-dirs-actions (actions dir)
  "Return a list of helm ACTIONS available for this directory."
  `((,(format "Switch to Directory - %s" dir) . (lambda (dir)
                                                  (cd dir)
                                                  (eshell-send-input)))
    (,(format "Show directory - %s" dir) . pp)))

(setq helm-source-eshell-last-dirs
      '((name . "Directory history")
        (init . (lambda ()
                  (setq evgeni/eshell-last-dir-ring eshell-last-dir-ring)))
        (candidates-process . helm-eshell-last-dirs)
        (action-transformer . helm-eshell-last-dirs-actions)))

(defun evgeni/helm-eshell-last-dirs ()
  "Bring up the directory history of eshell."
  (interactive)
  (helm :sources '(helm-source-eshell-last-dirs)
        :buffer "*helm-directory-history*"))




(defun eshell/up (&optional level)
  "Change directory from one up to a level of folders."
  (let* ((path-level (or level 1))
         (path-levels-list (cl-loop for i from path-level downto 1 collect "../"))
         (path-string (apply #'concat path-levels-list)))
    (cd path-string)))


(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))



(defun evgeni/buffer-list-same-mode ()
  (delq nil
        (mapcar (lambda (buffer)
                  (if (eq major-mode (buffer-local-value 'major-mode buffer))
                      buffer))
                (buffer-list))))

(defun evgeni/next-buffer-same-mode ()
  (interactive)
  (bury-buffer (current-buffer))
  (switch-to-buffer
   (first (evgeni/buffer-list-same-mode)))
  (message "%s" (evgeni/buffer-list-same-mode)))

(defun evgeni/previous-buffer-same-mode ()
  (interactive)
  (switch-to-buffer 
   (car (last (evgeni/buffer-list-same-mode))))
  (message "%s" (evgeni/buffer-list-same-mode)))


(defun xah-open-in-external-app (&optional file)
  "Open the current file or dired marked files in external app.

The app is chosen from your OS's preference."
  (interactive)
  (let ( doIt
         (myFileList
          (cond
           ((string-equal major-mode "dired-mode") (dired-get-marked-files))
           ((not file) (list (buffer-file-name)))
           (file (list file)))))
    
    (setq doIt (if (<= (length myFileList) 5)
                   t
                 (y-or-n-p "Open more than 5 files? ") ) )
    
    (when doIt
      (cond
       ((string-equal system-type "windows-nt")
        (mapc (lambda (fPath) (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" fPath t t)) ) myFileList))
       ((string-equal system-type "darwin")
        (mapc (lambda (fPath) (shell-command (format "open \"%s\"" fPath)) )  myFileList) )
       ((string-equal system-type "gnu/linux")
        (mapc (lambda (fPath) (let ((process-connection-type nil)) (start-process "" nil "xdg-open" fPath)) ) myFileList) ) ) ) ) )
