;; gnuplot
(require 'gnuplot-mode)
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot-mode" t)
(add-to-list 'auto-mode-alist '("\\.plt\\'" . gnuplot-mode))

(provide 'setup-gnuplot)
