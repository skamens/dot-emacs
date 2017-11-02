(require 'grep)
;
; I want to use "projmake" for my compiles
;
(setq compile-command "projmake ")

; Update grep command
(grep-apply-setting 'grep-command "grep -nH ")

; Start the server
(server-start)

; Turn off delete-selection-mode
(delete-selection-mode 0)

;
; my functions
;

(defun snk-revert-buffer ()
  (interactive)
  (revert-buffer t t))

(defun big-font ()
  (interactive)
  (set-face-font (quote default) "-sni-97480i1-medium-ot-normal--24-240-75-75-c-120-iso8859-1"))

(defun small-font ()
  (interactive)
  (set-face-font (quote default) "-misc-fixed-medium-r-normal-*-15-140-*-*-*-*-*-*"))


; Get rid of electric pair mode - I hate that!
(electric-pair-mode -1)


;
; My keyboard mappings
;
(global-set-key "\C-cr" 'snk-revert-buffer)
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-cm" 'manual-entry)
(global-set-key [f2] 'compile)
(global-set-key [f3] 'grep)
(global-set-key [f4] 'next-error)
(global-set-key [f5] 'kmacro-end-and-call-macro)


(defun find-matching-paren (&optional arg)
  "Go to the matching parenthesis character if one is adjacent to point."
  (interactive "^p")
  (cond ((looking-at "\\s(") (forward-sexp arg) (backward-char))
        ((looking-back "\\s)" 1) (backward-sexp arg))
        ;; Now, try to succeed from inside of a bracket
        ((looking-at "\\s)") (forward-char) (backward-sexp arg))
        ((looking-back "\\s(" 1) (backward-char) (forward-sexp arg))))


(global-set-key "\C-c]" 'find-matching-paren)

;; Ask for confirmation before quitting Emacs
(add-hook 'kill-emacs-query-functions
          (lambda () (y-or-n-p "Do you really want to exit Emacs? "))
          'append)


(require 'windmove)
(windmove-default-keybindings 'ctrl)
