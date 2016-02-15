(load-theme 'solarized-dark t) 

; (defadvice require (around dotemacs activate)
;   (let ((elapsed)
;         (loaded (memq feature features))
;         (start (current-time)))
;     (prog1
;         ad-do-it
;       (unless loaded
;         (with-current-buffer (get-buffer-create "*Require Times*")
;           (when (= 0 (buffer-size))
;             (insert "| feature | timestamp | elapsed |\n")
;             (insert "|---------+-----------+---------|\n"))
;           (goto-char (point-max))
;           (setq elapsed (float-time (time-subtract (current-time) start)))
;           (insert (format "| %s | %s | %f |\n"
;                           feature
;                           (format-time-string "%Y-%m-%d %H:%M:%S.%3N" (current-time))
;                           elapsed)))))))
;
; ; (let ((base (concat user-emacs-directory "elisp/")))
; ;   (add-to-list 'load-path base)
; ;   (dolist (dir (directory-files base t "^[^.]"))
; ;     (when (file-directory-p dir)
; ;       (add-to-list 'load-path dir))))
;
; (defalias 'after 'with-eval-after-load)

(defun require-package (package)
  "Ensures that PACKAGE is installed."
  (unless (or (package-installed-p package)
              (require package nil 'noerror))
					(unless (assoc package package-archive-contents)
							(package-refresh-contents))
					(package-install package)))
