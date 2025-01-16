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

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ansible
     auto-completion
     (colors :variables
             colors-colorize-identifiers 'all)
     confluence
     c-c++
     (dash :variables
           helm-dash-docset-newpath "/home/spijet/.local/share/Zeal/Zeal/docsets")
     docker
     emacs-lisp
     helm
     html
     git
     go
     (javascript :variables
                 node-add-modules-path t
                 javascript-backend 'lsp
                 js2-basic-offset 2
                 js-indent-level 2)
		 ;; jabber
     latex
     lsp
     markdown
     ;; neotree
     nginx
     org
     perl5
     php
     python
     react
     (ruby :variables
           ruby-version-manager 'rbenv)
     ;; ruby-on-rails
     semantic
     sql
     systemd
     syntax-checking
     treemacs
     version-control
     yaml
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '()

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(exec-path-from-shell)

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

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default spacemacs-27.1.pdmp)
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

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

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

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

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7)
                                (agenda . 4)
                                (todos . 4))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(gruvbox-dark-medium
                         twilight
                         gruvbox-light-medium
                         leuven
                         lush
                         zenburn
                         monokai)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator box :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Iosevka"
                               :size 16
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
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

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
   dotspacemacs-enable-paste-transient-state nil

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
   dotspacemacs-loading-progress-bar nil

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

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 100

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
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
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
   dotspacemacs-frame-title-format "%t: %a"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil))

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
  ;; (spacemacs|do-after-display-system-init
  ;;  (spacemacs-modeline/init-spaceline)
  ;;  )
  (setq exec-path-from-shell-check-startup-files nil)
  (setq tern-command '("node" "/home/spijet/.local/node/bin/tern"))
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
  (require 'helm-bookmark)
  (add-to-list 'auto-mode-alist '("\\.ebuild\\'" . shell-script-mode))
  (add-to-list 'auto-mode-alist '("PKGBUILD"     . shell-script-mode))
	(setq
   evil-want-Y-yank-to-eol t
   indent-tabs-mode nil
   dtrt-indent-verbosity 10
   tab-width 2
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2
   web-mode-enable-control-block-indentation t
   web-mode-markup-indent-offset 2
   )
  (setq org-agenda-files '("~/work/tasks"
                           "~/Documents/agenda"
                           ))
  (push "~/.dotfiles/spacemacs.d/" load-path)

  ;; Load Mu4e and Jabber.el configs:
  ;; (Jabber account list is hidden away!!)
  ;; (require 'mu4e-config nil t)
  ;; (require 'jabber-config nil t)

  ;; Load font tricks (like ligatures):
  ;; (require 'font-tricks nil t)

  ;; Setup the browser
  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "xdg-open")
  )

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(org-html-head
   "      <style type=\"text/css\">
       /*<![CDATA[*/
       /*! normalize.css v4.1.1 | MIT License | github.com/necolas/normalize.css */html{font-family:sans-serif;line-height:1.15;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%}body{margin:0}article,aside,details,figcaption,figure,footer,header,main,menu,nav,section,summary{display:block}audio,canvas,progress,video{display:inline-block}audio:not([controls]){display:none;height:0}progress{vertical-align:baseline}[hidden],template{display:none}a{background-color:transparent;-webkit-text-decoration-skip:objects}a:active,a:hover{outline-width:0}abbr[title]{border-bottom:none;text-decoration:underline;text-decoration:underline dotted}b,strong{font-weight:inherit;font-weight:bolder}dfn{font-style:italic}h1{font-size:2em;margin:.67em 0}mark{background-color:#ff0;color:#000}small{font-size:80%}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline}sub{bottom:-.25em}sup{top:-.5em}img{border-style:none}svg:not(:root){overflow:hidden}code,kbd,pre,samp{font-family:monospace,monospace;font-size:1em}figure{margin:1em 40px}hr{box-sizing:content-box;height:0;overflow:visible}button,input,optgroup,select,textarea{font:inherit;margin:0}optgroup{font-weight:700}button,input{overflow:visible}button,select{text-transform:none}[type=reset],[type=submit],button,html [type=button]{-webkit-appearance:button}[type=button]::-moz-focus-inner,[type=reset]::-moz-focus-inner,[type=submit]::-moz-focus-inner,button::-moz-focus-inner{border-style:none;padding:0}[type=button]:-moz-focusring,[type=reset]:-moz-focusring,[type=submit]:-moz-focusring,button:-moz-focusring{outline:1px dotted ButtonText}fieldset{border:1px solid silver;margin:0 2px;padding:.35em .625em .75em}legend{box-sizing:border-box;color:inherit;display:table;max-width:100%;padding:0;white-space:normal}textarea{overflow:auto}[type=checkbox],[type=radio]{box-sizing:border-box;padding:0}[type=number]::-webkit-inner-spin-button,[type=number]::-webkit-outer-spin-button{height:auto}[type=search]{-webkit-appearance:textfield;outline-offset:-2px}[type=search]::-webkit-search-cancel-button,[type=search]::-webkit-search-decoration{-webkit-appearance:none}::-webkit-input-placeholder{color:inherit;opacity:.54}::-webkit-file-upload-button{-webkit-appearance:button;font:inherit}body{color:#000;background-color:#fff}.org-alert-high{color:#ff8c00;font-weight:700}.org-alert-low{color:#00008b}.org-alert-moderate{color:gold;font-weight:700}.org-alert-saved-fringe{background-color:#f2f2f2}.org-alert-trivial{color:Dark purple}.org-alert-urgent{color:red;font-weight:700}.org-anzu-match-1{color:#000;background-color:#7fffd4}.org-anzu-match-2{color:#000;background-color:#00ff7f}.org-anzu-match-3{color:#000;background-color:#ff0}.org-anzu-mode-line,.org-anzu-mode-line-no-match{color:#008b00;font-weight:700}.org-anzu-replace-highlight{color:#b0e2ff;background-color:#cd00cd}.org-anzu-replace-to{color:red}.org-bbdb-field-name{color:sienna}.org-bbdb-name{color:#00f}.org-bbdb-organization{color:#b22222}.org-beacon-fallback-background{background-color:#000}.org-biblio-results-header{color:#483d8b;font-size:150%;font-weight:700}.org-bold{font-weight:700}.org-bold-italic{font-weight:700;font-style:italic}.org-bookmark-menu-bookmark{font-weight:700}.org-bookmark-menu-heading{color:#228b22}.org-buffer-menu-buffer{font-weight:700}.org-builtin{color:#483d8b}.org-button{color:#3a5fcd;text-decoration:underline}.org-c-annotation{color:#008b8b}.org-cal-china-x-general-holiday{background-color:#228b22}.org-cal-china-x-important-holiday{background-color:#8b0000}.org-calendar-iso-week{color:pink;font-weight:700}.org-calendar-iso-week-header{color:#0ff}.org-calendar-month-header{color:#00f}.org-calendar-today{text-decoration:underline}.org-calendar-weekday-header{color:#008b8b}.org-calendar-weekend-header{color:#b22222}.org-comint-highlight-input{font-weight:700}.org-comint-highlight-prompt{color:#0000cd}.org-comment,.org-comment-delimiter{color:#b22222}.org-compilation-column-number{color:#8b2252}.org-compilation-error{color:red;font-weight:700}.org-compilation-info{color:#228b22;font-weight:700}.org-compilation-line-number{color:#a020f0}.org-compilation-mode-line-exit{color:#228b22;font-weight:700}.org-compilation-mode-line-fail{color:red;font-weight:700}.org-compilation-mode-line-run,.org-compilation-warning{color:#ff8c00;font-weight:700}.org-completions-annotations{font-style:italic}.org-completions-first-difference{font-weight:700}.org-constant{color:#008b8b}.org-cursor{background-color:#eead0e}.org-custom-button{color:#000;background-color:#d3d3d3}.org-custom-button-mouse{color:#000;background-color:#e5e5e5}.org-custom-button-pressed{color:#000;background-color:#d3d3d3}.org-custom-button-pressed-unraised{color:#8b008b;text-decoration:underline}.org-custom-button-unraised{text-decoration:underline}.org-custom-changed{color:#fff;background-color:#00f}.org-custom-comment{background-color:#d9d9d9}.org-custom-comment-tag{color:#00008b}.org-custom-face-tag{color:#00f;font-weight:700}.org-custom-group-subtitle{font-weight:700}.org-custom-group-tag{color:#00f;font-size:120%;font-weight:700}.org-custom-group-tag-1{color:red;font-size:120%;font-weight:700}.org-custom-invalid{color:#ff0;background-color:red}.org-custom-link{color:#3a5fcd;text-decoration:underline}.org-custom-modified{color:#fff;background-color:#00f}.org-custom-rogue{color:pink;background-color:#000}.org-custom-saved{text-decoration:underline}.org-custom-set{color:#00f;background-color:#fff}.org-custom-state{color:#006400}.org-custom-themed{color:#fff;background-color:#00f}.org-custom-variable-button{font-weight:700;text-decoration:underline}.org-custom-variable-tag{color:#00f;font-weight:700}.org-custom-visibility{color:#3a5fcd;font-size:80%;text-decoration:underline}.org-diary{color:red}.org-diary-anniversary{color:#a020f0}.org-diary-time{color:sienna}.org-dired-async-failures{color:red}.org-dired-async-message{color:#ff0}.org-dired-async-mode-message{color:gold}.org-dired-directory{color:#00f}.org-dired-flagged{color:red;font-weight:700}.org-dired-header{color:#228b22}.org-dired-ignored{color:#7f7f7f}.org-dired-mark{color:#008b8b}.org-dired-marked{color:#ff8c00;font-weight:700}.org-dired-perm-write{color:#b22222}.org-dired-symlink{color:#a020f0}.org-dired-warning{color:red;font-weight:700}.org-doc{color:#8b2252}.org-eldoc-highlight-function-argument{font-weight:700}.org-epa-field-body{font-style:italic}.org-epa-field-name,.org-epa-mark{font-weight:700}.org-epa-mark{color:red}.org-epa-string{color:#00008b}.org-epa-validity-disabled{font-style:italic}.org-epa-validity-high{font-weight:700}.org-epa-validity-low,.org-epa-validity-medium{font-style:italic}.org-error{color:red;font-weight:700}.org-escape-glyph{color:brown}.org-evil-ex-commands{font-style:italic;text-decoration:underline}.org-evil-ex-info{color:red;font-style:italic}.org-evil-ex-lazy-highlight{background-color:#afeeee}.org-evil-ex-search{color:#b0e2ff;background-color:#cd00cd}.org-evil-ex-substitute-matches{background-color:#afeeee}.org-evil-ex-substitute-replacement{color:red;text-decoration:underline}.org-ffap{background-color:#b4eeb4}.org-file-name-shadow{color:#7f7f7f}.org-flycheck-error{text-decoration:underline}.org-flycheck-error-list-checker-name{color:#00f}.org-flycheck-error-list-column-number{color:#008b8b}.org-flycheck-error-list-error{color:red;font-weight:700}.org-flycheck-error-list-filename{color:sienna}.org-flycheck-error-list-highlight{background-color:#b4eeb4}.org-flycheck-error-list-id,.org-flycheck-error-list-id-with-explainer{color:#228b22}.org-flycheck-error-list-info{color:#228b22;font-weight:700}.org-flycheck-error-list-line-number{color:#008b8b}.org-flycheck-error-list-warning{color:#ff8c00;font-weight:700}.org-flycheck-fringe-error{color:red;font-weight:700}.org-flycheck-fringe-info{color:#228b22;font-weight:700}.org-flycheck-fringe-warning{color:#ff8c00;font-weight:700}.org-flycheck-info,.org-flycheck-warning,.org-flyspell-duplicate,.org-flyspell-incorrect{text-decoration:underline}.org-fringe{background-color:#f2f2f2}.org-function-name{color:#00f}.org-glyphless-char{font-size:60%}.org-golden-ratio-scroll-highlight-line{color:#fff;background-color:#53868b;font-weight:700}.org-header-line{color:#333;background-color:#e5e5e5}.org-helm-action{text-decoration:underline}.org-helm-bookmark-addressbook{color:tomato}.org-helm-bookmark-directory{color:#8b0000;background-color:#d3d3d3}.org-helm-bookmark-file{color:#00b2ee}.org-helm-bookmark-file-not-found{color:#6c7b8b}.org-helm-bookmark-gnus{color:#f0f}.org-helm-bookmark-info{color:#0f0}.org-helm-bookmark-man{color:#8b5a00}.org-helm-bookmark-w3m{color:#ff0}.org-helm-buffer-archive{color:gold}.org-helm-buffer-directory{color:#8b0000;background-color:#d3d3d3}.org-helm-buffer-file{color:#483d8b}.org-helm-buffer-modified{color:#b22222}.org-helm-buffer-not-saved{color:#ee6363}.org-helm-buffer-process{color:#cd6839}.org-helm-buffer-saved-out{color:red;background-color:#000}.org-helm-buffer-size{color:#708090}.org-helm-candidate-number,.org-helm-candidate-number-suspended{color:#000;background-color:#faffb5}.org-helm-delete-async-message{color:#ff0}.org-helm-etags-file{color:#8b814c;text-decoration:underline}.org-helm-ff-denied{color:red;background-color:#000}.org-helm-ff-directory{color:#8b0000;background-color:#d3d3d3}.org-helm-ff-dirs{color:#00f}.org-helm-ff-dotted-directory{color:#000;background-color:#696969}.org-helm-ff-dotted-symlink-directory{color:#ff8c00;background-color:#696969}.org-helm-ff-executable{color:#0f0}.org-helm-ff-file{color:#483d8b}.org-helm-ff-invalid-symlink{color:#000;background-color:red}.org-helm-ff-pipe{color:#ff0;background-color:#000}.org-helm-ff-prefix{color:#000;background-color:#ff0}.org-helm-ff-socket{color:#ff1493}.org-helm-ff-suid{color:#fff;background-color:red}.org-helm-ff-symlink{color:#b22222}.org-helm-ff-truename{color:#8b2252}.org-helm-grep-cmd-line{color:#228b22}.org-helm-grep-file{color:#8a2be2;text-decoration:underline}.org-helm-grep-finish{color:#0f0}.org-helm-grep-lineno{color:#ff7f00}.org-helm-grep-match{color:#b00000}.org-helm-header{color:#333;background-color:#e5e5e5}.org-helm-header-line-left-margin{color:#000;background-color:#ff0}.org-helm-helper{color:#333;background-color:#e5e5e5}.org-helm-history-deleted{color:#000;background-color:red}.org-helm-history-remote{color:#ff6a6a}.org-helm-lisp-completion-info{color:red}.org-helm-lisp-show-completion{background-color:#2f4f4f}.org-helm-locate-finish{color:#0f0}.org-helm-m-x-key{color:orange;text-decoration:underline}.org-helm-match{color:#b00000}.org-helm-match-item{color:#b0e2ff;background-color:#cd00cd}.org-helm-minibuffer-prompt{color:#0000cd}.org-helm-moccur-buffer{color:#00ced1;text-decoration:underline}.org-helm-non-file-buffer{font-style:italic}.org-helm-prefarg{color:red}.org-helm-resume-need-update{background-color:red}.org-helm-selection{background-color:#097209}.org-helm-selection-line{background-color:#b4eeb4}.org-helm-separator{color:#ffbfb5}.org-helm-source-header{color:#000;background-color:#abd7f0;font-size:130%;font-weight:700}.org-helm-visible-mark{background-color:#d1f5ea}.org-help-argument-name{font-style:italic}.org-highlight{background-color:#b4eeb4}.org-highlight-indent-guides-character{color:#e6e6e6}.org-highlight-indent-guides-even{background-color:#e6e6e6}.org-highlight-indent-guides-odd{background-color:#f3f3f3}.org-highlight-indent-guides-stack-character{color:#ccc}.org-highlight-indent-guides-stack-even{background-color:#ccc}.org-highlight-indent-guides-stack-odd{background-color:#d9d9d9}.org-highlight-indent-guides-top-character{color:#b3b3b3}.org-highlight-indent-guides-top-even{background-color:#b3b3b3}.org-highlight-indent-guides-top-odd{background-color:silver}.org-highlight-numbers-number{color:#008b8b}.org-hl-line{background-color:#b4eeb4}.org-holiday{background-color:pink}.org-hydra-face-amaranth{color:#e52b50;font-weight:700}.org-hydra-face-blue{color:#00f;font-weight:700}.org-hydra-face-pink{color:#ff6eb4;font-weight:700}.org-hydra-face-red{color:red;font-weight:700}.org-hydra-face-teal{color:#367588;font-weight:700}.org-ido-first-match{font-weight:700}.org-ido-incomplete-regexp{color:red;font-weight:700}.org-ido-indicator{color:#ff0;background-color:red}.org-ido-only-match{color:#228b22}.org-ido-subdir{color:red}.org-ido-virtual{color:#483d8b}.org-info-header-node{color:brown;font-weight:700;font-style:italic}.org-info-header-xref{color:#3a5fcd;text-decoration:underline}.org-info-index-match{background-color:#ff0}.org-info-menu-header{font-weight:700}.org-info-menu-star{color:red}.org-info-node{color:brown;font-weight:700;font-style:italic}.org-info-title-1{font-size:172%;font-weight:700}.org-info-title-2{font-size:144%;font-weight:700}.org-info-title-3{font-size:120%;font-weight:700}.org-info-title-4{font-weight:700}.org-info-xref{color:#3a5fcd;text-decoration:underline}.org-isearch{color:#b0e2ff;background-color:#cd00cd}.org-isearch-fail{background-color:#ffc1c1}.org-italic{font-style:italic}.org-keyword{color:#a020f0}.org-lazy-highlight{background-color:#afeeee}.org-link{color:#3a5fcd;text-decoration:underline}.org-link-visited{color:#8b008b;text-decoration:underline}.org-lv-separator{background-color:#ccc}.org-match{background-color:#ff0}.org-mcXcursor-bar{background-color:#000}.org-mcXregion{background-color:gtk_selection_bg_color}.org-me-dired-dim-0{color:#b3b3b3}.org-me-dired-dim-1{color:#7f7f7f}.org-me-dired-executable{color:#0f0}.org-message-cited-text{color:red}.org-message-header-cc{color:#191970}.org-message-header-name{color:#6495ed}.org-message-header-newsgroups{color:#00008b;font-weight:700;font-style:italic}.org-message-header-other{color:#4682b4}.org-message-header-subject{color:navy;font-weight:700}.org-message-header-to{color:#191970;font-weight:700}.org-message-header-xheader{color:#00f}.org-message-mml{color:#228b22}.org-message-separator{color:brown}.org-minibuffer-prompt{color:#0000cd}.org-mm-command-output{color:#cd0000}.org-mode-line{color:#000;background-color:#bfbfbf}.org-mode-line-buffer-id,.org-mode-line-buffer-id-inactive,.org-mode-line-emphasis{font-weight:700}.org-mode-line-inactive{color:#333;background-color:#e5e5e5}.org-mu4e-attach-number{color:sienna;font-weight:700}.org-mu4e-cited-1{color:#483d8b;font-style:italic}.org-mu4e-cited-2{color:#5cacee;font-style:italic}.org-mu4e-cited-3{color:sienna;font-style:italic}.org-mu4e-cited-4{color:#a020f0;font-style:italic}.org-mu4e-cited-5,.org-mu4e-cited-6{color:#b22222;font-style:italic}.org-mu4e-cited-7{color:#228b22;font-style:italic}.org-mu4e-compose-header,.org-mu4e-compose-separator{color:brown;font-style:italic}.org-mu4e-contact{color:sienna}.org-mu4e-context{color:#006400;font-weight:700}.org-mu4e-draft{color:#8b2252}.org-mu4e-flagged{color:#008b8b;font-weight:700}.org-mu4e-footer{color:#b22222}.org-mu4e-forwarded{color:#483d8b}.org-mu4e-header{color:#000;background-color:#fff}.org-mu4e-header-highlight{background-color:#000;font-weight:700;text-decoration:underline}.org-mu4e-header-key{color:#6495ed;font-weight:700}.org-mu4e-header-marks{color:#483d8b}.org-mu4e-header-title,.org-mu4e-header-value{color:#228b22}.org-mu4e-highlight{background-color:#b4eeb4}.org-mu4e-link{color:#3a5fcd;text-decoration:underline}.org-mu4e-modeline{color:#8b4500;font-weight:700}.org-mu4e-moved{color:#b22222;font-style:italic}.org-mu4e-ok{color:#b22222;font-weight:700}.org-mu4e-region-code{background-color:#2f4f4f}.org-mu4e-replied,.org-mu4e-special-header-value{color:#483d8b}.org-mu4e-system{color:#b22222;font-style:italic}.org-mu4e-title{color:#228b22;font-weight:700}.org-mu4e-trashed{color:#b22222;text-decoration:line-through}.org-mu4e-unread{color:#a020f0;font-weight:700}.org-mu4e-url-number{color:#008b8b;font-weight:700}.org-mu4e-view-body{color:#000;background-color:#fff}.org-mu4e-warning{color:red;font-weight:700}.org-next-error{background-color:gtk_selection_bg_color}.org-nobreak-space{color:brown;text-decoration:underline}.org-org-agenda-calendar-event,.org-org-agenda-calendar-sexp{color:#000;background-color:#fff}.org-org-agenda-clocking{background-color:#ff0}.org-org-agenda-column-dateline{background-color:#e5e5e5}.org-org-agenda-current-time{color:#b8860b}.org-org-agenda-date{color:#00f}.org-org-agenda-date-today{color:#00f;font-weight:700;font-style:italic}.org-org-agenda-date-weekend{color:#00f;font-weight:700}.org-org-agenda-diary{color:#000;background-color:#fff}.org-org-agenda-dimmed-todo{color:#7f7f7f}.org-org-agenda-done{color:#228b22}.org-org-agenda-filter-category,.org-org-agenda-filter-effort,.org-org-agenda-filter-regexp,.org-org-agenda-filter-tags{color:#000;background-color:#bfbfbf}.org-org-agenda-restriction-lock{background-color:#eee}.org-org-agenda-structure{color:#00f}.org-org-archived{color:#7f7f7f}.org-org-block{color:#7f7f7f}.org-org-block-begin-line,.org-org-block-end-line{color:#b22222}.org-org-checkbox{font-weight:700}.org-org-checkbox-statistics-done{color:#228b22;font-weight:700}.org-org-checkbox-statistics-todo{color:red;font-weight:700}.org-org-clock-overlay{color:#000;background-color:#d3d3d3}.org-org-code{color:#7f7f7f}.org-org-column,.org-org-column-title{background-color:#e5e5e5}.org-org-column-title{font-weight:700;text-decoration:underline}.org-org-date{color:#bfaf87;text-decoration:underline}.org-org-date-selected{color:red}.org-org-default{color:#000;background-color:#fff}.org-org-document-info{color:#191970}.org-org-document-info-keyword{color:#7f7f7f}.org-org-document-title{color:#191970;font-weight:700}.org-org-done{color:#228b22;font-weight:700}.org-org-drawer{color:#00f}.org-org-ellipsis{color:#b8860b;text-decoration:underline}.org-org-footnote{color:#96b4cd;text-decoration:underline}.org-org-formula{color:#b22222}.org-org-habit-alert{background-color:#f5f946}.org-org-habit-alert-future{background-color:#fafca9}.org-org-habit-clear{background-color:#8270f9}.org-org-habit-clear-future{background-color:#d6e4fc}.org-org-habit-overdue{background-color:#f9372d}.org-org-habit-overdue-future{background-color:#fc9590}.org-org-habit-ready{background-color:#4df946}.org-org-habit-ready-future{background-color:#acfca9}.org-org-headline-done{color:#bc8f8f}.org-org-hide{color:#fff}.org-org-latex-and-related{color:#8b4513}.org-org-level-1{color:#edd1c5}.org-org-level-2{color:#ebebb7}.org-org-level-3{color:#cce8cc}.org-org-level-4{color:#c9deec}.org-org-level-5{color:#dce3e8}.org-org-level-6{color:#dde6dd}.org-org-level-7{color:#e8e8ce}.org-org-level-8{color:#e8dedb}.org-org-link{color:#c5d2dc;text-decoration:underline}.org-org-list-dt{font-weight:700}.org-org-macro{color:#8b4513}.org-org-meta-line{color:#b22222}.org-org-mode-line-clock{color:#000;background-color:#bfbfbf}.org-org-mode-line-clock-overrun{color:#000;background-color:red}.org-org-priority{color:#a020f0}.org-org-quote{color:#7f7f7f}.org-org-ref-acronym{color:#ee7600;text-decoration:underline}.org-org-ref-cite{color:#c3d5c3;text-decoration:underline}.org-org-ref-glossary{color:#8968cd;text-decoration:underline}.org-org-ref-label{color:#8b008b;text-decoration:underline}.org-org-ref-ref{color:#e1cc96;text-decoration:underline}.org-org-scheduled{color:#006400}.org-org-scheduled-previously{color:#b22222}.org-org-scheduled-today{color:#006400}.org-org-sexp-date{color:#a020f0}.org-org-special-keyword{color:#88949f}.org-org-table{color:#00f}.org-org-tag,.org-org-tag-group{font-weight:700}.org-org-target{text-decoration:underline}.org-org-time-grid{color:#b8860b}.org-org-todo{color:red;font-weight:700}.org-org-upcoming-deadline{color:#b22222}.org-org-verbatim,.org-org-verse{color:#7f7f7f}.org-org-warning{color:red;font-weight:700}.org-outline-1{color:#00f}.org-outline-2{color:sienna}.org-outline-3{color:#a020f0}.org-outline-4{color:#b22222}.org-outline-5{color:#228b22}.org-outline-6{color:#008b8b}.org-outline-7{color:#483d8b}.org-outline-8{color:#8b2252}.org-package-description{color:#000;background-color:#fff}.org-package-name{color:#3a5fcd;text-decoration:underline}.org-package-status-avail-obso{color:#b22222}.org-package-status-available{color:#000;background-color:#fff}.org-package-status-built-in{color:#483d8b}.org-package-status-dependency{color:#b22222}.org-package-status-disabled{color:red;font-weight:700}.org-package-status-external{color:#483d8b}.org-package-status-held{color:#008b8b}.org-package-status-incompat,.org-package-status-installed{color:#b22222}.org-package-status-unsigned{color:red;font-weight:700}.org-pdf-isearch-batch{background-color:#ff0}.org-pdf-isearch-lazy{background-color:#afeeee}.org-pdf-isearch-match{color:#b0e2ff;background-color:#cd00cd}.org-pdf-occur-document{color:#8b2252}.org-pdf-occur-page{color:#228b22}.org-pdf-view-rectangle{background-color:#b4eeb4}.org-pdf-view-region{background-color:gtk_selection_bg_color}.org-powerline-active0{color:#000;background-color:#bfbfbf}.org-powerline-active1{color:#fff;background-color:#2b2b2b}.org-powerline-active2{color:#fff;background-color:#666}.org-powerline-inactive0{color:#333;background-color:#e5e5e5}.org-powerline-inactive1{color:#333;background-color:#1c1c1c}.org-powerline-inactive2{color:#333;background-color:#333}.org-preprocessor{color:#483d8b}.org-query-replace{color:#b0e2ff;background-color:#cd00cd}.org-rainbow-delimiters-depth-1{color:#ffdead}.org-rainbow-delimiters-depth-2{color:#00bfff}.org-rainbow-delimiters-depth-3{color:#ffdead}.org-rainbow-delimiters-depth-4{color:#00bfff}.org-rainbow-delimiters-depth-5{color:#ffdead}.org-rainbow-delimiters-depth-6{color:#00bfff}.org-rainbow-delimiters-depth-7{color:#ffdead}.org-rainbow-delimiters-depth-8{color:#00bfff}.org-rainbow-delimiters-depth-9{color:#ffdead}.org-rainbow-delimiters-unmatched{color:#88090b}.org-reb-match-0{background-color:#add8e6}.org-reb-match-1{background-color:#7fffd4}.org-reb-match-2{background-color:#00ff7f}.org-reb-match-3{background-color:#ff0}.org-rectangle-preview{background-color:gtk_selection_bg_color}.org-regexp-grouping-backslash,.org-regexp-grouping-construct{font-weight:700}.org-region{background-color:gtk_selection_bg_color}.org-secondary-selection{background-color:#ff0}.org-semantic-highlight-edits,.org-semantic-highlight-func-current-tag{background-color:#e5e5e5}.org-semantic-unmatched-syntax{text-decoration:underline}.org-sgml-namespace{color:#483d8b}.org-sh-escaped-newline{color:#8b2252}.org-sh-heredoc{color:#ee0}.org-sh-quoted-exec{color:#f0f}.org-shadow{color:#7f7f7f}.org-show-paren-match{background-color:#40e0d0}.org-show-paren-mismatch{color:#fff;background-color:#a020f0}.org-sp-pair-overlay,.org-sp-show-pair-enclosing{background-color:#b4eeb4}.org-sp-show-pair-match{background-color:#40e0d0}.org-sp-show-pair-mismatch{color:#fff;background-color:#a020f0}.org-sp-wrap-overlay{background-color:#b4eeb4}.org-sp-wrap-overlay-closing-pair{color:red;background-color:#b4eeb4}.org-sp-wrap-overlay-opening-pair{color:#0f0;background-color:#b4eeb4}.org-sp-wrap-tag-overlay{background-color:#b4eeb4}.org-spaceline-flycheck-error{color:#fc5c94;background-color:#333}.org-spaceline-flycheck-info{color:#8de6f7;background-color:#333}.org-spaceline-flycheck-warning{color:#f3ea98;background-color:#333}.org-spaceline-python-venv{color:#fbf}.org-speedbar-button{color:#008b00}.org-speedbar-directory{color:#00008b}.org-speedbar-file{color:#008b8b}.org-speedbar-highlight{background-color:#0f0}.org-speedbar-selected{color:red;text-decoration:underline}.org-speedbar-separator{color:#fff;background-color:#00f;text-decoration:overline}.org-speedbar-tag{color:brown}.org-string{color:#8b2252}.org-success{color:#228b22;font-weight:700}.org-table-cell{color:#e5e5e5;background-color:#00f}.org-tex-math{color:#8b2252}.org-tool-bar{color:#000;background-color:#bfbfbf}.org-tooltip{color:#000;background-color:#ffffe0}.org-trailing-whitespace{background-color:red}.org-tty-menu-disabled{color:#d3d3d3;background-color:#00f}.org-tty-menu-enabled{color:#ff0;background-color:#00f;font-weight:700}.org-tty-menu-selected{background-color:red}.org-type{color:#228b22}.org-underline{text-decoration:underline}.org-undo-tree-visualizer-active-branch{color:#000;font-weight:700}.org-undo-tree-visualizer-current{color:red}.org-undo-tree-visualizer-default{color:#bebebe}.org-undo-tree-visualizer-register{color:#ff0}.org-undo-tree-visualizer-unmodified{color:#0ff}.org-variable-name{color:sienna}.org-vhlXdefault{background-color:#ff0}.org-warning{color:#ff8c00;font-weight:700}.org-warning-1{color:red;font-weight:700}.org-wgrep{color:#fff;background-color:#228b22}.org-wgrep-delete{color:pink;background-color:#228b22}.org-wgrep-done{color:#00f}.org-wgrep-file{color:#fff;background-color:#228b22}.org-wgrep-reject{color:red;font-weight:700}.org-which-key-command-description{color:#00f}.org-which-key-docstring{color:#b22222}.org-which-key-group-description{color:#a020f0}.org-which-key-highlighted-command{color:#00f;text-decoration:underline}.org-which-key-key{color:#008b8b}.org-which-key-local-map-description{color:#00f}.org-which-key-note,.org-which-key-separator{color:#b22222}.org-which-key-special-key{color:#008b8b;font-weight:700}.org-whitespace-big-indent{color:#b22222;background-color:red}.org-whitespace-empty{color:#b22222;background-color:#ff0}.org-whitespace-hspace{color:#d3d3d3;background-color:#cdc9a5}.org-whitespace-indentation{color:#b22222;background-color:#ff0}.org-whitespace-line{color:violet;background-color:#333}.org-whitespace-newline{color:#d3d3d3}.org-whitespace-space{color:#d3d3d3;background-color:#ffffe0}.org-whitespace-space-after-tab{color:#b22222;background-color:#ff0}.org-whitespace-space-before-tab{color:#b22222;background-color:#ff8c00}.org-whitespace-tab{color:#d3d3d3;background-color:beige}.org-whitespace-trailing{color:#ff0;background-color:red;font-weight:700}.org-widget-button{font-weight:700}.org-widget-button-pressed{color:red}.org-widget-documentation{color:#006400}.org-widget-field{background-color:#d9d9d9}.org-widget-inactive{color:#7f7f7f}.org-widget-single-line-field{background-color:#d9d9d9}.org-window-divider{color:#999}.org-window-divider-first-pixel{color:#ccc}.org-window-divider-last-pixel{color:#666}a{color:inherit;background-color:inherit;font:inherit;text-decoration:inherit}a:hover{text-decoration:underline}body{width:95%;margin:2% auto;font-size:14px;line-height:1.4em;font-family:Georgia,serif;color:#333}@media screen and (min-width:600px){body{font-size:18px}}@media screen and (min-width:910px){body{width:900px}}::selection{background:#d6edff}p{margin:1em auto}dl,ol,ul{margin:0 auto}.title{text-align:center;margin:.8em auto;color:#000}.subtitle{text-align:center;font-size:1.1em;line-height:1.4;font-weight:700;margin:1em auto}.abstract{margin:auto;width:80%;font-style:italic}.abstract p:last-of-type:before{content:\"    \";white-space:pre}.status{font-size:90%;margin:2em auto}[class^=section-number-]{margin-right:.5em}[id^=orgheadline]{clear:both}#footnotes{font-size:90%}.footpara{display:inline;margin:.2em auto}.footdef{margin-bottom:1em}.footdef sup{padding-right:.5em}a{color:#527d9a;text-decoration:none}a:hover{color:#035;border-bottom:1px dotted}figure{padding:0;margin:1em auto;text-align:center}img{max-width:100%;vertical-align:middle}.MathJax_Display{margin:0!important;width:90%!important}h1,h2,h3,h4,h5,h6{color:#a5573e;line-height:1em;font-family:Helvetica,sans-serif}h1,h2,h3{line-height:1.4em}h4,h5,h6{font-size:1em}@media screen and (min-width:600px){h1{font-size:2em}h2{font-size:1.5em}h3{font-size:1.3em}h1,h2,h3{line-height:1.4em}h4,h5,h6{font-size:1.1em}}dt{font-weight:700}table{margin:1em auto;border-top:2px solid;border-bottom:2px solid;border-collapse:collapse}thead{border-bottom:2px solid}table td+td,table th+th{border-left:1px solid grey}table tr{border-top:1px solid #d3d3d3}td,th{padding:.3em .6em;vertical-align:middle}caption.t-above{caption-side:top}caption.t-bottom{caption-side:bottom}caption{margin-bottom:.3em}figcaption{margin-top:.3em}th.org-center,th.org-left,th.org-right{text-align:center}td.org-right{text-align:right}td.org-left{text-align:left}td.org-center{text-align:center}blockquote{margin:1em 2em;padding-left:1em;border-left:3px solid #ccc}kbd{background-color:#f7f7f7;font-size:80%;margin:0 .1em;padding:.1em .6em}.todo{background-color:red;color:#fff;padding:.1em .3em;border-radius:3px;background-clip:padding-box;font-size:80%;font-family:Lucida Console,monospace;line-height:1}.done{background-color:green;color:#fff;padding:.1em .3em;border-radius:3px;background-clip:padding-box;font-size:80%;font-family:Lucida Console,monospace;line-height:1}.priority{color:orange;font-family:Lucida Console,monospace}#table-of-contents li{clear:both}.tag{font-family:Lucida Console,monospace;font-size:.7em;font-weight:400}.tag span{padding:.3em;float:right;margin-right:.5em;border:1px solid #bbb;border-radius:3px;background-clip:padding-box;color:#333;background-color:#eee;line-height:1}.timestamp{color:#bebebe;font-size:90%}.timestamp-kwd{color:#5f9ea0}.org-right{margin-left:auto;margin-right:0;text-align:right}.org-left{margin-left:0;margin-right:auto;text-align:left}.org-center{margin-left:auto;margin-right:auto;text-align:center}.underline{text-decoration:underline}#postamble p,#preamble p{font-size:90%;margin:.2em}p.verse{margin-left:3%}:not(pre)>code{padding:2px 5px;margin:auto 1px;border:1px solid #ddd;border-radius:3px;background-clip:padding-box;color:#333;font-size:80%}.org-src-container{border:1px solid #ccc;box-shadow:3px 3px 3px #eee;font-family:Lucida Console,monospace;font-size:80%;margin:1em auto;padding:.1em .5em;position:relative}.org-src-container>pre{overflow:auto}.org-src-container>pre:before{display:block;position:absolute;background-color:#b3b3b3;top:0;right:0;padding:0 .5em;border-bottom-left-radius:8px;border:0;color:#fff;font-size:80%}.org-src-container>pre.src-sh:before{content:\"sh\"}.org-src-container>pre.src-bash:before{content:\"bash\"}.org-src-container>pre.src-emacs-lisp:before{content:\"Emacs Lisp\"}.org-src-container>pre.src-R:before{content:\"R\"}.org-src-container>pre.src-cpp:before{content:\"C++\"}.org-src-container>pre.src-c:before{content:\"C\"}.org-src-container>pre.src-html:before{content:\"HTML\"}.org-src-container>pre.src-javascript:before,.org-src-container>pre.src-js:before{content:\"Javascript\"}// More languages 0% http://orgmode.org/worg/org-contrib/babel/languages.html .org-src-container>pre.src-abc:before{content:\"ABC\"}.org-src-container>pre.src-asymptote:before{content:\"Asymptote\"}.org-src-container>pre.src-awk:before{content:\"Awk\"}.org-src-container>pre.src-C:before{content:\"C\"}.org-src-container>pre.src-calc:before{content:\"Calc\"}.org-src-container>pre.src-clojure:before{content:\"Clojure\"}.org-src-container>pre.src-comint:before{content:\"comint\"}.org-src-container>pre.src-css:before{content:\"CSS\"}.org-src-container>pre.src-D:before{content:\"D\"}.org-src-container>pre.src-ditaa:before{content:\"Ditaa\"}.org-src-container>pre.src-dot:before{content:\"Dot\"}.org-src-container>pre.src-ebnf:before{content:\"ebnf\"}.org-src-container>pre.src-forth:before{content:\"Forth\"}.org-src-container>pre.src-F90:before{content:\"Fortran\"}.org-src-container>pre.src-gnuplot:before{content:\"Gnuplot\"}.org-src-container>pre.src-haskell:before{content:\"Haskell\"}.org-src-container>pre.src-io:before{content:\"Io\"}.org-src-container>pre.src-java:before{content:\"Java\"}.org-src-container>pre.src-latex:before{content:\"LaTeX\"}.org-src-container>pre.src-ledger:before{content:\"Ledger\"}.org-src-container>pre.src-ly:before{content:\"Lilypond\"}.org-src-container>pre.src-lisp:before{content:\"Lisp\"}.org-src-container>pre.src-makefile:before{content:\"Make\"}.org-src-container>pre.src-matlab:before{content:\"Matlab\"}.org-src-container>pre.src-max:before{content:\"Maxima\"}.org-src-container>pre.src-mscgen:before{content:\"Mscgen\"}.org-src-container>pre.src-Caml:before{content:\"Objective\"}.org-src-container>pre.src-octave:before{content:\"Octave\"}.org-src-container>pre.src-org:before{content:\"Org\"}.org-src-container>pre.src-perl:before{content:\"Perl\"}.org-src-container>pre.src-picolisp:before{content:\"Picolisp\"}.org-src-container>pre.src-plantuml:before{content:\"PlantUML\"}.org-src-container>pre.src-python:before{content:\"Python\"}.org-src-container>pre.src-ruby:before{content:\"Ruby\"}.org-src-container>pre.src-sass:before{content:\"Sass\"}.org-src-container>pre.src-scala:before{content:\"Scala\"}.org-src-container>pre.src-scheme:before{content:\"Scheme\"}.org-src-container>pre.src-screen:before{content:\"Screen\"}.org-src-container>pre.src-sed:before{content:\"Sed\"}.org-src-container>pre.src-shell:before{content:\"shell\"}.org-src-container>pre.src-shen:before{content:\"Shen\"}.org-src-container>pre.src-sql:before{content:\"SQL\"}.org-src-container>pre.src-sqlite:before{content:\"SQLite\"}.org-src-container>pre.src-stan:before{content:\"Stan\"}.org-src-container>pre.src-vala:before{content:\"Vala\"}.org-src-container>pre.src-axiom:before{content:\"Axiom\"}.org-src-container>pre.src-browser:before{content:\"HTML\"}.org-src-container>pre.src-cypher:before{content:\"Neo4j\"}.org-src-container>pre.src-elixir:before{content:\"Elixir\"}.org-src-container>pre.src-request:before{content:\"http\"}.org-src-container>pre.src-ipython:before{content:\"iPython\"}.org-src-container>pre.src-kotlin:before{content:\"Kotlin\"}.org-src-container>pre.src-Flavored Erlang lfe:before{content:\"Lisp\"}.org-src-container>pre.src-mongo:before{content:\"MongoDB\"}.org-src-container>pre.src-prolog:before{content:\"Prolog\"}.org-src-container>pre.src-rec:before{content:\"rec\"}.org-src-container>pre.src-ML sml:before{content:\"Standard\"}.org-src-container>pre.src-Translate translate:before{content:\"Google\"}.org-src-container>pre.src-typescript:before{content:\"Typescript\"}.org-src-container>pre.src-rust:before{content:\"Rust\"}.inlinetask{background:#ffc;border:2px solid grey;margin:10px;padding:10px}#org-div-home-and-up{font-size:70%;text-align:right;white-space:nowrap}.linenr{font-size:90%}.code-highlighted{background-color:#ff0}#bibliography{font-size:90%}#bibliography table{width:100%}.creator{display:block}@media screen and (min-width:600px){.creator{display:inline;float:right}}
       /*]]>*/
      </style>
")
 '(package-selected-packages
   (quote
    (systemd helm-gtags godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc ggtags flycheck-golangci-lint counsel-gtags counsel swiper ivy company-go go-mode sqlup-mode sql-indent treemacs pfuture phpunit phpcbf php-auto-yasnippets drupal-mode company-php ac-php-core xcscope treemacs-projectile treemacs-evil evil-mc zenburn-theme zeal-at-point yasnippet-snippets yapfify yaml-mode ws-butler writeroom-mode winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package twilight-theme toc-org tagedit symon symbol-overlay string-inflection stickyfunc-enhance srefactor spaceline-all-the-icons smeargle slim-mode seeing-is-believing scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe rjsx-mode restart-emacs rbenv rake rainbow-mode rainbow-identifiers rainbow-delimiters pytest pyenv-mode py-isort pug-mode prettier-js popwin pippel pipenv pip-requirements php-extras persp-mode password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-cliplink org-bullets org-brain open-junk-file nodejs-repl nginx-mode neotree nameless move-text monokai-theme mmm-mode minitest markdown-toc magit-svn magit-gitflow macrostep lush-theme lsp-ui lsp-treemacs lsp-python-ms lorem-ipsum livid-mode live-py-mode link-hint json-navigator js2-refactor js-doc jinja2-mode indent-guide importmagic impatient-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-mode-manager helm-make helm-lsp helm-gitignore helm-git-grep helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag gruvbox-theme google-translate google-c-style golden-ratio gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md fuzzy font-lock+ flycheck-rtags flycheck-pos-tip flycheck-package flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu emmet-mode elisp-slime-nav editorconfig dumb-jump dotenv-mode doom-modeline dockerfile-mode docker disaster diminish diff-hl devdocs define-word cython-mode cquery cpp-auto-include counsel-projectile confluence company-web company-tern company-statistics company-rtags company-plsense company-lsp company-c-headers company-ansible company-anaconda column-enforce-mode color-identifiers-mode clean-aindent-mode clang-format chruby centered-cursor-mode ccls bundler browse-at-remote blacken auto-yasnippet auto-highlight-symbol auto-compile ansible-doc ansible aggressive-indent add-node-modules-path ace-link ace-jump-helm-line ac-ispell)))
 '(safe-local-variable-values
   (quote
    ((encoding . utf-8)
     (javascript-backend . lsp)
     (go-backend . lsp)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
