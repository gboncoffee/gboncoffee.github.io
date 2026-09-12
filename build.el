;; -*- lexical-binding: t; -*-
(require 'ox-publish)
(require 'cl-lib)

(cl-labels
    ((read-file-to-string (file)
       (with-temp-buffer
	 (insert-file-contents file)
	 (buffer-string)))
     (sitemap-format-entry-html (entry style project)
       (let ((filename (org-publish-find-title entry project)))
	 (if (= (length filename) 0)
	     (format "*%s*" entry)
	   (format "{{{indexformat(%s, %s)}}}"
		   (format "[[file:%s][%s]]" entry filename)
		   (format-time-string
		    "%d %B\\, %Y /Anno Domini/ - %R"
		    (org-publish-find-date entry project)))))))
  (let ((org-export-html-header (read-file-to-string "header.html")))
    (let ((org-export-global-macros
	   '(("indexformat" . "@@html:<h2>@@$1@@html:</h2><p>@@$2@@html:</p>@@")))

	  (org-export-date-timestamp-format "%d %B, %Y /Anno Domini/ - %R")
	  (org-html-html5-fancy t)
	  (org-html-validation-link nil)
	  (org-html-head-include-scripts nil)
	  (org-html-head-include-default-style nil)
	  (org-html-head (read-file-to-string "head.html"))
	  (org-export-with-author nil)
	  (org-export-with-creator nil)
	  (org-export-with-toc nil)
	  (org-export-with-section-numbers nil)
	  (org-export-with-date t)
	  (org-html-preamble
	   (lambda (info)
	     (format org-export-html-header
		     (or
		      (org-export-get-date info "%d %B, %Y <i>Anno Domini</i> - %R")
		      ""))))
	  (org-html-postamble (read-file-to-string "footer.html"))

	  (org-publish-project-alist
	   (list
	    (list "base"
		  :recursive nil
		  :base-directory "."
		  :publishing-directory "./public/"
		  :publishing-function #'org-html-publish-to-html
		  :time-stamp-file nil)
	    (list "etc"
		  :recursive nil
		  :base-directory "./etc/"
		  :base-extension 'any
		  :publishing-directory "./public/"
		  :publishing-function #'org-publish-attachment
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
		  :auto-sitemap t))))
      (org-publish-all t)
      (message "Build complete!"))))
