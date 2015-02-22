
(setq python-indent-offset 4)

;; turn off company and semantic modes due to confilicts
(add-hook 'python-mode-hook
          (lambda () (company-mode -1) (semantic-mode -1)))

(require 'jedi)
;; (autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
;; (setq jedi:setup-keys t)
(setq jedi:server-args
      '("--sys-path" "/home/jzzhao/git_project/python_packages"))

(provide 'setup-python)
