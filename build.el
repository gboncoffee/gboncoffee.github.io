(require 'ox-publish)

(defun read-file-to-string (file)
  (with-temp-buffer
    (insert-file-contents file)
    (buffer-string)))

(setq org-export-global-macros
      '(("indexformat" . "@@html:<h2>@@$1@@html:</h2><p>@@$2@@html:</p>@@")))

(defun sitemap-format-entry-html (entry style project)
  (let ((filename (org-publish-find-title entry project)))
    (if (= (length filename) 0)
        (format "*%s*" entry)
      (format "{{{indexformat(%s, %s)}}}"
	      (format "[[file:%s][%s]]" entry filename)
	      (format-time-string "%d %B\\, %Y /Anno Domini/ - %R"
				  (org-publish-find-date entry project))))))

(setq org-export-date-timestamp-format "%d %B, %Y /Anno Domini/ - %R")
(setq org-html-html5-fancy t)
(setq org-html-validation-link nil)
(setq org-html-head-include-scripts nil)
(setq org-html-head-include-default-style nil)
(setq org-html-head (read-file-to-string "head.html"))
(setq org-export-with-author nil)
(setq org-export-with-creator nil)
(setq org-export-with-toc nil)
(setq org-export-with-section-numbers nil)
(setq org-export-with-date t)
(setq org-export-html-header (read-file-to-string "header.html"))
(setq org-html-preamble
      (lambda (info)
	(format org-export-html-header
		(or
		 (org-export-get-date info "%d %B, %Y <i>Anno Domini</i> - %R")
		 ""))))
(setq org-html-postamble (read-file-to-string "footer.html"))

(setq org-publish-project-alist
      (list
       (list "base"
	     :recursive nil
	     :base-directory "."
	     :publishing-directory "./public/"
	     :publishing-function #'org-html-publish-to-html
	     :time-stamp-file nil)
       (list "static"
	     :recursive t
	     :base-directory "./static/"
	     :publishing-directory "./public/static/"
	     :publishing-function #'org-publish-attachment
	     :base-extension ".*")
       (list "literature"
	     :recursive nil
	     :base-directory "./literature"
	     :publishing-directory "./public/literature/"
	     :publishing-function #'org-html-publish-to-html
	     :time-stamp-file nil
	     :sitemap-sort-files 'anti-chronologically
	     :sitemap-filename "index.html"
             :sitemap-title "Literature"
	     :sitemap-format-entry #'sitemap-format-entry-html
             :auto-sitemap t)
       (list "likey"
	     :recursive nil
	     :base-directory "./literature/likey"
	     :publishing-directory "./public/literature/likey/"
	     :publishing-function #'org-html-publish-to-html
	     :time-stamp-file nil
	     :sitemap-sort-files 'anti-chronologically
	     :sitemap-filename "index.html"
	     :sitemap-title "Likey"
	     :sitemap-format-entry #'sitemap-format-entry-html
	     :auto-sitemap t)
       (list "posts"
	     :recursive nil
	     :base-directory "./posts"
	     :publishing-directory "./public/posts/"
	     :publishing-function #'org-html-publish-to-html
	     :time-stamp-file nil
	     :sitemap-sort-files 'anti-chronologically
	     :sitemap-filename "index.html"
             :sitemap-title "Posts"
	     :sitemap-format-entry #'sitemap-format-entry-html
             :auto-sitemap t)))

(org-publish-all t)

(message "Build complete!")
