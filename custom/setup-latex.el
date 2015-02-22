;; AUCTex setup
(setq TeX-auto-save nil)
(setq Tex-auto-local nil)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;; setup files ending in ".tex" to open in LaTeX-mode
(add-to-list 'auto-mode-alist '("\\.tex\\'" . LaTeX-mode))

;; turn on auto-fill and flyspell modes
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)
(add-hook 'LaTeX-mode-hook 'turn-off-smartparens-mode)

;; turn off company and semantic modes
;; (add-hook 'LaTeX-mode-hook
          ;; (lambda () (company-mode -1) (semantic-mode -1)))

;; auto fill a sentence, binded to key M-j
(defun fill-sentence ()
  (interactive)
  (save-excursion
    (or (eq (point) (point-max)) (forward-char))
    (forward-sentence -1)
    (indent-relative t)
    (let ((beg (point))
          (ix (string-match "LaTeX" mode-name)))
      (forward-sentence)
      (if (and ix (equal "LaTeX" (substring mode-name ix)))
          (LaTeX-fill-region-as-paragraph beg (point))
        (fill-region-as-paragraph beg (point))))))
(global-set-key (kbd "M-j") 'fill-sentence)

(provide 'setup-latex)
