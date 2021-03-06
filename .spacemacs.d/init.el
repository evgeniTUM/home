;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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
     yaml
     ivy
     ibuffer
     colors
     nlinum
     (auto-completion
      :variables
      auto-completion-tab-key-behavior nil
      auto-completion-return-key-behavior nil)
     better-defaults
     (shell
      :variables
      shell-default-shell 'shell
      shell-default-position 'bottom)
     (org
      :variables
      org-want-todo-bindings t
      :config
      (setq org-startup-indented t))
     (common-lisp
      :config
      (setq slime-contribs '(slime-fancy)))
     clojure
     emacs-lisp
     (c-c++
      :variables
      c-c++-adopt-subprojects t
      c-c++-backend 'lsp-ccls
      c-c++-lsp-executable (file-truename "~/configuration/bin/ccls")
      c-c++-lsp-sem-highlight-rainbow t
      )
     cscope
     javascript
     react
     python
     shell-script-mode
     typescript
     lua

     latex
     bibtex
     graphviz
     plantuml
     markdown
     html
     csv
     sql

     semantic
     dash
     spell-checking
     syntax-checking
     git
     (version-control
      :variables
      version-control-diff-tool 'diff-hl
      version-control-global-margin t)

     restclient
     pdf
     systemd
     search-engine
     spotify
     treemacs
     ranger
     pass
     imenu-list

     xkcd

     ;; custom
     evgeni-config
     evgeni-research
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(org-pdfview
                                      cyberpunk-theme
                                      monokai-theme
                                      helm-descbinds)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'emacs-lisp-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         monokai
                         cyberpunk)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
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

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
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

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
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

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(calendar-week-start-day 1)
 '(compilation-message-face (quote default))
 '(custom-file "~/.spacemacs.d/init.el")
 '(diary-file "~/Nextcloud/diary")
 '(dired-listing-switches "-al --group-directories-first")
 '(evil-move-cursor-back nil)
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#383838")
 '(global-prettify-symbols-mode t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(indicate-buffer-boundaries (quote left))
 '(ispell-dictionary "german8")
 '(ls-lisp-dirs-first t)
 '(magit-diff-refine-hunk (quote all))
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(neo-show-hidden-files nil t)
 '(neo-show-updir-line t t)
 '(neo-theme (quote icons))
 '(neo-vc-integration (quote (face)) t)
 '(org-agenda-clockreport-parameter-plist (quote (:link t :maxlevel 4)))
 '(org-agenda-custom-commands
   (quote
    (("x" "Everything...Eevrything"
      ((agenda ""
               ((org-agenda-span
                 (quote day))))
       (tags-todo "Artefact<>\"Task\"+TODO=\"IN_PROGRESS\""
                  ((org-agenda-overriding-header "Open Tasks")
                   (org-agenda-sorting-strategy
                    (quote
                     (category-keep)))
                   (org-agenda-sorting-strategy
                    (quote
                     (priority-down)))))
       (tags-todo "Artefact=\"Task\"|Artefact=\"Story\"+TODO=\"OPEN\"|TODO=\"READY\"|TODO=\"IN_REVIEW\""
                  ((org-agenda-overriding-header "Sprint Board")
                   (org-tags-match-list-sublevels
                    (quote indented))))
       (tags "Weiter_so|Massnahme|Aktion"
             ((org-agenda-overriding-header "Plakat")
              (org-agenda-prefix-format "  %T: "))))
      nil nil)
     ("r" "Sprint review"
      ((tags "TODO=\"CLOSED\"&CLOSED>=\"<-1m>\""
             ((org-agenda-overriding-header "Stories finished this sprint"))))
      nil nil))))
 '(org-agenda-files "~/Nextcloud/org/agenda.files")
 '(org-agenda-include-diary t)
 '(org-agenda-skip-scheduled-if-deadline-is-shown t)
 '(org-agenda-skip-timestamp-if-deadline-is-shown t)
 '(org-agenda-todo-ignore-deadlines (quote all))
 '(org-agenda-todo-ignore-scheduled (quote all))
 '(org-agenda-todo-ignore-timestamp (quote all))
 '(org-agenda-todo-ignore-with-date t)
 '(org-agenda-window-setup (quote current-window))
 '(org-archive-location "./archive/%s_archive::")
 '(org-babel-load-languages
   (quote
    ((http . t)
     (restclient . t)
     (python . t)
     (shell . t)
     (clojure . t)
     (emacs-lisp . t)
     (plantuml . t))))
 '(org-babel-python-command "python3")
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
%a")
     ("n" "Note" entry
      (file+headline "~/Nextcloud/org/notes.org" "Notes")
      "* %?
            %i
            %a")
     ("j" "Journal entry" entry
      (file+olp+datetree "~/Nextcloud/org/journal.org")
      "* %(format-time-string \"%H:%M\") %?")
     ("J" "Journal record" entry
      (file+olp+datetree "~/Nextcloud/org/journal.org")
      "* %?" :time-prompt t)
     ("s" "Subtask (create a subtask for currently clocked in task and start working on it)" entry
      (clock)
      "* IN_PROGRESS %?
:PROPERTIES:
:Artefact: Task
:END:" :clock-in t :clock-keep t)
     ("o" "Other task (start working on task saved in journal)" entry
      (file+olp+datetree "~/Nextcloud/org/journal.org")
      "* IN_PROGRESS %? %^g" :clock-in t :clock-keep t)
     ("r" "Record other task (clock in and jump to task)" entry
      (file+olp+datetree "~/Nextcloud/org/journal.org")
      "* IN_PROGRESS %? %^g" :jump-to-captured t :clock-in t :clock-keep t))))
 '(org-catch-invisible-edits (quote smart))
 '(org-clock-auto-clock-resolution t)
 '(org-clock-clocked-in-display (quote both))
 '(org-clock-clocktable-default-properties (quote (:maxlevel 4)))
 '(org-clock-history-length 10)
 '(org-clock-idle-time 30)
 '(org-clock-in-resume t)
 '(org-clock-mode-line-total (quote current))
 '(org-clock-out-remove-zero-time-clocks nil)
 '(org-clock-persist t)
 '(org-clock-report-include-clocking-task t)
 '(org-clock-rounding-minutes 5)
 '(org-clock-x11idle-program-name "xprintidle")
 '(org-clocktable-defaults
   (quote
    (:maxlevel 4 :lang "en" :scope file :block nil :wstart 1 :mstart 1 :tstart nil :tend nil :step nil :stepskip0 nil :fileskip0 nil :tags nil :match nil :emphasize nil :link nil :narrow 40! :indent t :formula nil :timestamp nil :level nil :tcolumns nil :formatter nil)))
 '(org-confirm-babel-evaluate nil)
 '(org-directory "~/Nextcloud/org")
 '(org-download-image-html-width 500)
 '(org-download-image-org-width 500)
 '(org-download-method (quote attach))
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(org-log-into-drawer t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-crypt org-docview org-eww org-gnus org-habit org-id org-info org-irc org-mhe org-protocol org-rmail org-w3m)))
 '(org-noter-auto-save-last-location t)
 '(org-noter-default-notes-file-names
   (quote
    ("~/Nextcloud/org/notes.org" "~/Nextcloud/org/research.org")))
 '(org-outline-path-complete-in-steps nil)
 '(org-plantuml-jar-path "~/configuration/libs/plantuml.jar")
 '(org-preview-latex-image-directory "gen/")
 '(org-ref-bibliography-notes "~/Nextcloud/org/bibliography-notes.org")
 '(org-ref-default-bibliography (quote ("~/Nextcloud/Documents/library.bib")))
 '(org-ref-get-pdf-filename-function (quote org-ref-get-mendeley-filename))
 '(org-ref-pdf-directory "~/Nextcloud/Documents/Mendeley/")
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 9))))
 '(org-refile-use-cache nil)
 '(org-refile-use-outline-path (quote file))
 '(org-show-notification-handler "notify-send")
 '(org-startup-indented t)
 '(org-tag-persistent-alist
   (quote
    ((:startgroup)
     ("Konto")
     (:grouptags)
     ("Administration" . 97)
     ("Organisation" . 111)
     ("Forschung" . 102)
     ("Pflege" . 112)
     ("Support" . 115)
     ("Lehre" . 108)
     ("Entwicklung" . 101)
     (:endgroup))))
 '(org-todo-keyword-faces
   (quote
    (("OPEN" . org-habit-overdue-face)
     ("IN_PROGRESS" . org-warning)
     ("IN_REVIEW" . org-habit-clear-face)
     ("READY" . org-habit-alert-future-face))))
 '(org-todo-keywords
   (quote
    ((sequence "TODO" "IN_PROGRESS" "|" "DONE")
     (sequence "MEETING" "|" "PAST"))))
 '(package-selected-packages
   (quote
    (ob-sml sml-mode lxc-tramp lxc origami lsp-ui lsp-treemacs lsp-python-ms python helm-lsp cquery company-lsp ccls lsp-mode company-reftex company-auctex auctex-latexmk auctex ox-pandoc dired-narrow dired-filter nodejs-repl org-bookmark-heading counsel-org-clock org-clock-convenience cpp-auto-include ivy-pass password-store org-cliplink devdocs org-kanban calfw-ical 2048-game org-journal yasnippet-snippets writeroom-mode visual-fill-column treemacs-projectile treemacs-evil treemacs pfuture symon symbol-overlay string-inflection rjsx-mode prettier-js pippel pipenv password-generator overseer org-brain nameless magit-svn json-navigator hierarchy ivy-yasnippet ivy-xref ivy-rtags ivy-purpose window-purpose importmagic ctable concurrent deferred impatient-mode google-c-style gitignore-templates flycheck-rtags flycheck-package package-lint flycheck-bashate evil-textobj-line evil-org evil-lion evil-goggles evil-cleverparens editorconfig doom-modeline shrink-path counsel-spotify counsel-css company-rtags company-lua centered-cursor-mode browse-at-remote blacken dotenv-mode dash-docs parseedn parseclj a rtags irony org-noter gscholar-bibtex transient lv monky ntlm xcscope powershell nadvice url-http-ntlm soap-client fsm makey discover-my-major excorporate calfw-cal calfw calfw-org w3 org-pdfview w3m ahg monokai-theme-theme disaster company-c-headers cmake-mode clang-format treepy graphql org-mind-map exwm-x ivy-youtube wgrep flyspell-correct-ivy counsel-projectile counsel-dash counsel org-mime csv-mode ghub sesman smex clojure-snippets clj-refactor inflections edn paredit peg cider-eval-sexp-fu cider seq queue clojure-mode yaml-mode elpy emr speed-type helm-dired-recent-dirs helm-dired-history dired+ dired-subtree dired-hacks-utils dired-du xelb exwm sublimity epc xpm helm-youtube zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme nlinum-relative nlinum dirtree magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache ht wisi snakemake-mode helm-spotify-plus spotify helm-spotify multi engine-mode wolfram-mode web-mode thrift tagedit stan-mode sql-indent slim-mode scss-mode scad-mode sass-mode qml-mode pug-mode plantuml-mode org-ref pdf-tools key-chord tablist matlab-mode less-css-mode julia-mode helm-css-scss helm-bibtex parsebib haml-mode graphviz-dot-mode emmet-mode company-web web-completion-data biblio biblio-core arduino-mode xkcd selectric-mode swiper all-the-icons-ivy powerline slime spinner org-category-capture alert log4e gntp org-plus-contrib macrostep skewer-mode simple-httpd json-snatcher json-reformat multiple-cursors js2-mode hydra parent-mode projectile request gitignore-mode fringe-helper git-gutter+ git-gutter flyspell-correct flycheck pkg-info epl flx magit magit-popup git-commit with-editor smartparens iedit anzu evil goto-chg undo-tree highlight diminish dash-functional tern restclient know-your-http-well pos-tip company bind-map bind-key yasnippet packed anaconda-mode pythonic f dash s memoize font-lock+ helm avy helm-core async auto-complete popup system-packages ivy-hydra ivy ace-jump-mode traad spaceline-all-the-icons all-the-icons-dired tide typescript-mode company-quickhelp mmm-mode markdown-toc markdown-mode lua-mode gh-md yascroll el-get zeal-at-point yapfify xterm-color ws-butler winum which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org systemd stickyfunc-enhance srefactor spaceline smeargle slime-company shell-pop restclient-helm restart-emacs ranger rainbow-mode rainbow-identifiers rainbow-delimiters pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file ob-restclient ob-http neotree mwim multi-term move-text minimap magit-gitflow lorem-ipsum livid-mode live-py-mode linum-relative link-hint json-mode js2-refactor js-doc insert-shebang info+ indent-guide imenu-list ibuffer-projectile hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-tramp helm-themes helm-swoop helm-pydoc helm-projectile helm-proc helm-orgcard helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-dash helm-company helm-chrome helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido fish-mode fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav dumb-jump diff-hl define-word cython-mode company-tern company-statistics company-shell company-restclient company-anaconda common-lisp-snippets column-enforce-mode color-identifiers-mode coffee-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile all-the-icons aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(password-cache-expiry 3600)
 '(plantuml-jar-path "~/configuration/libs/plantuml.jar")
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(purpose-mode t)
 '(python-shell-interpreter "ipython3")
 '(reftex-default-bibliography (quote ("~/Nextcloud/Documents/library.bib")))
 '(tab-width 4)
 '(timeclock-mode-line-display t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(visual-line-fringe-indicators (quote (nil right-curly-arrow)))
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
 '(winner-mode t)
 '(yas-snippet-dirs
   (quote
    ("/home/evgeni/.spacemacs.d/snippets" "/home/evgeni/.emacs.d/private/snippets/" "/home/evgeni/.emacs.d/layers/+completion/auto-completion/local/snippets" "/home/evgeni/.emacs.d/elpa/develop/clojure-snippets-20180314.1308/snippets" "/home/evgeni/.emacs.d/elpa/develop/common-lisp-snippets-20180226.1523/snippets" yasnippet-snippets-dir))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C")))))
