(defconst myConfig-packages
  '(all-the-icons
    all-the-icons-dired
    helm-orgcard
    helm-proc
    helm-chrome
    minimap
    helm-tramp
    (pretty-eshell :location local)
    dired-du
    dired-subtree
    ))

(defmacro default-init-for (package)
  (let* ((package-name (symbol-name package))
         (defsymbol (intern (concat "myConfig/init-" package-name))))
    `(defun ,defsymbol ()
       (use-package ,package-name :defer t))))

(defun myConfig/init-helm-orgcard ()
  (use-package helm-orgcard :defer t))

(defun myConfig/init-minimap ()
  (use-package minimap :defer t))

(defun myConfig/init-helm-proc ()
  (use-package helm-proc :defer t))

(defun myConfig/init-helm-chrome ()
  (use-package helm-proc :defer t))

(defun myConfig/init-all-the-icons ()
  (use-package all-the-icons :defer t))

(defun myConfig/init-all-the-icons-dired ()
  (use-package all-the-icons-dired :defer t))

(defun myConfig/init-helm-tramp ()
  (use-package helm-tramp :defer t))

(defun myConfig/init-dired-du ()
  (use-package dired-du :defer t))

(defun myConfig/init-dired-subtree ()
  (use-package dired-subtree :defer t))

(defun myConfig/init-pretty-eshell ()
  (use-package pretty-eshell
    :config
    (progn
      (require 'magit)

      (esh-section esh-dir
                   "\xf07c"  ; 
                   (abbreviate-file-name (eshell/pwd))
                   '(:foreground "gold" :bold ultra-bold :underline t))
      (esh-section esh-git
                   ""
                   (magit-get-current-branch)
                   '(:foreground "pink"))
      (esh-section esh-python
                   "\xe928"  ; 
                   pyvenv-virtual-env-name)
      (esh-section esh-clock
                   "\xf017"  ; 
                   (format-time-string "%H:%M" (current-time))
                   '(:foreground "forest green"))
      (esh-section esh-num
                   "\xf0c9"  ; 
                   (number-to-string esh-prompt-num)
                   '(:foreground "brown"))
      (setq eshell-funcs (list esh-dir esh-git esh-python esh-clock esh-num))
      (setq eshell-prompt-regexp "^└─> "))))
;;; packages.el ends here
