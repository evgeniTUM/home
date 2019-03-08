(defconst evgeni-config-packages
  '(all-the-icons
    all-the-icons-dired
    all-the-icons-ivy
    helm-orgcard
    (pretty-eshell :location local)
    dired-du
    calfw
    calfw-cal
    calfw-org
    excorporate
    alert
    ))

(defmacro default-init-for (package)
  (let* ((package-name (symbol-name package))
         (defsymbol (intern (concat "myConfig/init-" package-name))))
    `(defun ,defsymbol ()
       (use-package ,package-name :defer t))))

(defun myConfig/init-helm-orgcard ()
  (use-package helm-orgcard :defer t))

(defun myConfig/init-helm-proc ()
  (use-package helm-proc :defer t))

(defun myConfig/init-helm-chrome ()
  (use-package helm-proc :defer t))

(defun evgeni-config/init-all-the-icons ()
  (use-package all-the-icons :defer t))

(defun evgeni-config/init-all-the-icons-dired ()
  (use-package all-the-icons-dired :defer t))

(defun evgeni-config/init-all-the-icons-ivy ()
  (use-package all-the-icons-ivy :ensure t
    :config (all-the-icons-ivy-setup)))

(defun evgeni-config/init-dired-du ()
  (use-package dired-du :defer t))

(defun evgeni-config/init-calfw ()
  (use-package calfw))

(defun evgeni-config/init-calfw-cal ()
  (use-package calfw-cal))

(defun evgeni-config/init-calfw-org ()
  (use-package calfw-org))

(defun evgeni-config/init-alert ()
  (use-package alert))

(defun evgeni-config/init-excorporate ()
  (use-package excorporate))

(defun evgeni-config/init-pretty-eshell ()
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