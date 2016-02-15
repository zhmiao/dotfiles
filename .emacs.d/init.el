(let (; (gc-cons-threshold most-positive-fixnum)
      (debug-on-error t)
      (file-name-handler-alist nil)
      (config-directory (concat user-emacs-directory "config/")))

(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

; (setq ns-use-native-fullscreen nil)
; (set-frame-parameter nil 'fullscreen 'fullboth)

; (defgroup dotemacs nil
;     "Custom configuration for dotemacs."
;     :group 'local)
;
;   (defcustom dotemacs-cache-directory (concat user-emacs-directory ".cache/")
;     "The storage location for various persistent files."
;     :group 'dotemacs)

(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))
(setq package-enable-at-startup nil)
(package-initialize)

(load (concat config-directory "init-util.el"))

(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
(load custom-file))

(require 'cl)
(cl-loop for file in (directory-files config-directory t)
           when (string-match "\\.el$" file)
           do (load file)))




