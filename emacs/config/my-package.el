(require 'use-package)

(add-to-list 'use-package-keywords ':hook)

(defun use-package-normalize/:hook (name-symbol keyword arg)
  (let ((error-msg (format "%s error!" name-symbol)))
    (unless (listp arg)
      (use-package-error error-msg))
    (dolist (def arg arg)
      (unless (listp def)
        (use-package-error error-msg))
      (let ((hook (nth 0 def))
            (action (nth 1 def)))
        (when (or (not hook)
                  (not action)
                  (> (length def) 2))
          (use-package-error error-msg))))))

(defun use-package-handler/:hook (name keyword args rest state)
  (let ((body (use-package-process-keywords name rest state)))
    (use-package-concat
     (mapcar (lambda (def)
               (let ((hook (nth 0 def))
                     (action (nth 1 def)))
                 `(add-hook (quote ,hook) ,action)))
             args)
     body)))

(provide 'my-package)

;; end
