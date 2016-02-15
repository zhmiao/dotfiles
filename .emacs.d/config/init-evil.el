; (defgroup dotemacs-evil nil
;   "Configuration options for evil-mode."
;   :group 'dotemacs
;   :prefix 'dotemacs-evil)
;
; (defcustom dotemacs-evil/emacs-insert-mode
;   nil
;   "If non-nil, insert mode will act as Emacs state."
;   :type 'boolean
;   :group 'dotemacs-evil)

(require-package 'key-chord)
(require 'key-chord)
(require-package 'evil)
(require 'evil)
(require-package 'evil-leader)
(key-chord-mode 1)
(global-evil-leader-mode 1)
(evil-mode 1)

(evil-leader/set-leader "<SPC>")
(define-key evil-normal-state-map "," 'evil-repeat)
(define-key evil-normal-state-map (kbd "H") (kbd "10h"))
(define-key evil-normal-state-map (kbd "L") (kbd "10l"))
(define-key evil-normal-state-map (kbd "j") (kbd "gj"))
(define-key evil-normal-state-map (kbd "k") (kbd "gk"))
(define-key evil-normal-state-map (kbd "J") (kbd "6gj"))
(define-key evil-normal-state-map (kbd "K") (kbd "6gk"))
(evil-leader/set-key "w" (kbd ":w"))
(evil-leader/set-key "q" (kbd ":bd!"))
(evil-leader/set-key "n" (kbd ":noh"))
; (evil-leader/set-key [tab] (kbd ":_#"))
(evil-leader/set-key "s" 'evil-search-forward)

(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)
