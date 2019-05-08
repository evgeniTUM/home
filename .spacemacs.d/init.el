;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/private")
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     windows-scripts
     clojure
     yaml
     ivy
     ibuffer
     colors
     nlinum
     auto-completion
     better-defaults
     (shell
      :variables
      shell-default-shell 'shell
      shell-default-position 'bottom)
     imenu-list
     (org
      :config
      (setq org-startup-indented t))

     bibtex
     graphviz
     plantuml
     markdown
     html
     csv
     sql

     (common-lisp
      :config
      (setq slime-contribs '(slime-fancy)))
     clojure
     emacs-lisp
     (c-c++
      :variables
      c-c++-enable-clang-support t
      c-c++-enable-rtags-support t)
     cscope
     javascript
     react
     python
     shell-scripts
     typescript
     lua
     extra-langs

     semantic
     dash
     spell-checking
     syntax-checking
     git
     github
     (version-control
      :variables
      version-control-diff-tool 'diff-hl
      version-control-global-margin t)

     restclient
     pdf-tools
     systemd
     search-engine
     spotify
     ranger

     xkcd

     ;; custom
     evgeni-config
     evgeni-research
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(org-pdfview
                                      cyberpunk-theme
                                      monokai-theme
                                      helm-descbinds)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(vi-tilde-fringe)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'emacs-lisp-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai
                         cyberpunk
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (spacemacs/toggle-mode-line-battery)
  )


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote eww-browse-url))
 '(calendar-week-start-day 1)
 '(custom-file "~/.spacemacs.d/init.el")
 '(dired-listing-switches "-al --group-directories-first")
 '(evil-move-cursor-back nil)
 '(evil-want-Y-yank-to-eol nil)
 '(excorporate-configuration "evgeni.pavlidis@unibw.de")
 '(global-prettify-symbols-mode t)
 '(indicate-buffer-boundaries (quote left))
 '(neo-show-hidden-files nil t)
 '(neo-show-updir-line t t)
 '(neo-theme (quote icons))
 '(neo-vc-integration (quote (face)) t)
 '(org-agenda-files (quote ("~/Nextcloud/org")))
 '(org-agenda-include-diary t)
 '(org-agenda-todo-ignore-deadlines (quote all))
 '(org-agenda-todo-ignore-scheduled (quote all))
 '(org-archive-location "./archive/%s_archive::")
 '(org-capture-templates
   (quote
    (("p" "Protocol" entry
      (file+headline "~/Nextcloud/org/notes.org" "Inbox")
      "* %^{Title}
Source: %u, %c
 #+BEGIN_QUOTE
%i
#+END_QUOTE


%?")
     ("L" "Protocol Link" entry
      (file+headline "~/Nextcloud/org/notes.org" "Inbox")
      "* %? [[%:link][%:description]] 
Captured On: %U")
     ("t" "Todo" entry
      (file+headline "~/Nextcloud/org/notes.org" "Tasks")
      "* TODO %?
%i
%a"))))
 '(org-catch-invisible-edits (quote smart))
 '(org-directory "~/Dropbox/org/")
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-crypt org-docview org-eww org-gnus org-id org-info org-irc org-mhe org-protocol org-rmail org-w3m)))
 '(org-noter-default-notes-file-names
   (quote
    ("~/Nextcloud/org/notes.org" "~/Nextcloud/org/research.org")))
 '(org-ref-bibliography-notes "~/Nextcloud/org/bibliography-notes.org")
 '(org-ref-default-bibliography (quote ("~/Nextcloud/Documents/library.bib")))
 '(org-ref-get-pdf-filename-function (quote org-ref-get-mendeley-filename))
 '(org-ref-pdf-directory "~/Nextcloud/Documents/Mendeley/")
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 2))))
 '(org-startup-indented t)
 '(org-todo-keywords
   (quote
    ((sequence "TODO" "IN_PROGRESS" "|" "DONE")
     (sequence "MEETING" "|" "PAST"))))
 '(package-selected-packages
   (quote
    (rtags irony org-noter gscholar-bibtex transient lv monky ntlm xcscope powershell nadvice url-http-ntlm soap-client fsm makey discover-my-major excorporate calfw-cal calfw calfw-org w3 org-pdfview w3m ahg monokai-theme-theme disaster company-c-headers cmake-mode clang-format treepy graphql org-mind-map exwm-x ivy-youtube wgrep flyspell-correct-ivy counsel-projectile counsel-dash counsel org-mime csv-mode ghub sesman smex clojure-snippets clj-refactor inflections edn paredit peg cider-eval-sexp-fu cider seq queue clojure-mode yaml-mode elpy emr speed-type helm-dired-recent-dirs helm-dired-history dired+ dired-subtree dired-hacks-utils dired-du xelb exwm sublimity epc xpm helm-youtube zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme nlinum-relative nlinum dirtree magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache ht wisi snakemake-mode helm-spotify-plus spotify helm-spotify multi engine-mode wolfram-mode web-mode thrift tagedit stan-mode sql-indent slim-mode scss-mode scad-mode sass-mode qml-mode pug-mode plantuml-mode org-ref pdf-tools key-chord tablist matlab-mode less-css-mode julia-mode helm-css-scss helm-bibtex parsebib haml-mode graphviz-dot-mode emmet-mode company-web web-completion-data biblio biblio-core arduino-mode xkcd selectric-mode swiper all-the-icons-ivy powerline slime spinner org-category-capture alert log4e gntp org-plus-contrib macrostep skewer-mode simple-httpd json-snatcher json-reformat multiple-cursors js2-mode hydra parent-mode projectile request gitignore-mode fringe-helper git-gutter+ git-gutter flyspell-correct flycheck pkg-info epl flx magit magit-popup git-commit with-editor smartparens iedit anzu evil goto-chg undo-tree highlight diminish dash-functional tern restclient know-your-http-well pos-tip company bind-map bind-key yasnippet packed anaconda-mode pythonic f dash s memoize font-lock+ helm avy helm-core async auto-complete popup system-packages ivy-hydra ivy ace-jump-mode traad spaceline-all-the-icons all-the-icons-dired tide typescript-mode company-quickhelp mmm-mode markdown-toc markdown-mode lua-mode gh-md yascroll el-get zeal-at-point yapfify xterm-color ws-butler winum which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org systemd stickyfunc-enhance srefactor spaceline smeargle slime-company shell-pop restclient-helm restart-emacs ranger rainbow-mode rainbow-identifiers rainbow-delimiters pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file ob-restclient ob-http neotree mwim multi-term move-text minimap magit-gitflow lorem-ipsum livid-mode live-py-mode linum-relative link-hint json-mode js2-refactor js-doc insert-shebang info+ indent-guide imenu-list ibuffer-projectile hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-tramp helm-themes helm-swoop helm-pydoc helm-projectile helm-proc helm-orgcard helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-dash helm-company helm-chrome helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido fish-mode fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav dumb-jump diff-hl define-word cython-mode company-tern company-statistics company-shell company-restclient company-anaconda common-lisp-snippets column-enforce-mode color-identifiers-mode coffee-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile all-the-icons aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(password-cache-expiry 3600)
 '(plantuml-jar-path "~/configuration/libs/plantuml.jar")
 '(python-shell-interpreter "ipython3" t)
 '(reftex-default-bibliography (quote ("~/Nextcloud/Documents/library.bib")))
 '(tab-width 4)
 '(visual-line-fringe-indicators (quote (nil right-curly-arrow)))
 '(yas-snippet-dirs
   (quote
    ("~/.spacemacs.d/snippets" "~/.emacs.d/private/snippets/" yas-installed-snippets-dir "~/.emacs.d/layers/+completion/auto-completion/local/snippets" "~/.emacs.d/elpa/common-lisp-snippets-20170522.2147/snippets"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C")))))
