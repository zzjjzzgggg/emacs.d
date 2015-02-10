(require 'ox-latex)
;; Make sure to include the latex class in you header:
;; #+LaTeX_CLASS: note
(add-to-list 'org-latex-classes
          '("note"
"\\documentclass[11pt,oneside]{article}
 \\usepackage{hyperref}
 \\usepackage{graphicx}
 \\usepackage{geometry}
 \\geometry{a4paper,textwidth=6.5in,textheight=9in,
    marginparsep=7pt, marginparwidth=.6in}
 \\usepackage{fancyhdr}
 \\pagestyle{fancy}
 \\fancyheadoffset{0in}
 \\fancypagestyle{plain}{%
 \\lhead{\\footnotesize Last update: \\textsf{\\today}}\\rhead{J. Zhao}}
            [NO-DEFAULT-PACKAGES]
            [NO-PACKAGES]"
            ("\\section{%s}" . "\\section*{%s}")
            ("\\subsection{%s}" . "\\subsection*{%s}")
            ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
            ("\\paragraph{%s}" . "\\paragraph*{%s}")
            ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


(provide 'setup-org-export-latex)
