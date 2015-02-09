(require 'org-octopress)
(setq org-octopress-directory-top       "~/git_project/mynotes/source")
(setq org-octopress-directory-posts     "~/git_project/mynotes/source/_posts")
(setq org-octopress-directory-org-top   "~/git_project/mynotes/source")
(setq org-octopress-directory-org-posts "~/git_project/mynotes/source/blog")
(setq org-octopress-setup-file          "~/.emacs.d/org-sty/setupfile.org")

(defadvice org-html-paragraph (before fsh-org-html-paragraph-advice
                                      (paragraph contents info) activate)
  (let* ((fixed-contents)
         (orig-contents (ad-get-arg 1))
         (reg-han "[[:multibyte:]]"))
    (setq fixed-contents (replace-regexp-in-string
                          (concat "\\(" reg-han "\\) *\n *\\(" reg-han "\\)")
                          "\\1\\2" orig-contents))

    (ad-set-arg 1 fixed-contents)))

(provide 'setup-org-octopress)
