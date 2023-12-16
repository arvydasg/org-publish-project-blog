;; ;; HTMLIZE for sytanx highlighting START -------------------------------------
;; ;; more in David's blog about publishing with org

;; ;; Set the package installation directory so that packages aren't stored in the
;; ;; ~/.emacs.d/elpa path.
;; (require 'package)
;; (setq package-user-dir (expand-file-name "./.packages"))
;; (setq package-archives '(("melpa" . "https://melpa.org/packages/")
;;			 ("elpa" . "https://elpa.gnu.org/packages/")))

;; ;; Initialize the package system
;; (package-initialize)
;; (unless package-archive-contents
;;   (package-refresh-contents))

;; ;; Install dependencies
;; (package-install 'htmlize)

;; ;; HTMLIZE for sytanx highlighting END -------------------------------------

;; Load the publishing system
(require 'ox-publish)


;; %t stands for the title.
;; %s stands for the subtitle.
;; %a stands for the author's name.
;; %e stands for the author's email.
;; %d stands for the date.
;; %c will be replaced by org-html-creator-string.
;; %v will be replaced by org-html-validation-link.
;; %T will be replaced by the export time.
;; %C will be replaced by the last modification time.

(setq org-publish-project-alist
      '(
	("my-org-site"
	 :base-directory "../org"
	 :base-extension "org"
	 :publishing-directory "../html"
	 :recursive t
	 ;; :exclude
	 ;; :include
	 :publishing-function org-html-publish-to-html
	 ;; :preparation-function
	 ;; :completion-function
	 ;; -----------------------------------------------------------------------------------
	 ;; the DETAILS: options set within the individual .org file can
	 ;; override all of the settings below:
	 ;; you can specify majority the options that you see below in each
	 ;; individual file. Find out syntax for it in =C-h v
	 ;; org-publish-project-alist= and choose the configuration you want to
	 ;; see the syntax for.
	 :author "Arvydas G."
	 ;; :creator
	 :email "arvydas.gaspa@gmail.com"
	 ;; :exclude-tags "noexport"
	 :headline-levels 3
	 :language "en"
	 :preserve-breaks nil
	 :section-numbers t
	 ;; :select-tags
	 :time-stamp-file t
	 ;; :with-archived-trees
	 :with-author t
	 :with-creator t
	 :with-date t			;date from the filename?
	 ;; :with-drawers
	 :with-email t
	 :with-emphasize t
	 :with-entities t
	 :with-fixed-width t
	 :with-footnotes t
	 :with-inlinetasks t
	 :with-latex t
	 :with-planning t
	 :with-priority t
	 :with-properties t
	 ;; :with-smart-quotes
	 :with-special-strings t
	 :with-statistics-cookies' t
	 :with-sub-superscript nil
	 :with-toc t
	 :with-tables t
	 :with-tags t
	 :with-tasks t
	 :with-timestamps t
	 :with-title t
	 :with-todo-keywords t
	 ;; kita dalis
	 :auto-sitemap t
	 :sitemap-filename "sitemap.org"
	 :sitemap-title "all the pages"
	 :sitemap-style tree
	 ;; :sitemap-format-entry
	 ;; :sitemap-function
	 ;; :sitemap-sort-folders
	 :sitemap-sort-files anti-chronologically
	 ;; :sitemap-ignore-case
	 ;; :makeindex
	 ;; :body-only t
	 ;; -----------------------------------------------------------------------------------
	 ;; ox-html.el.gz

	 :html-doctype "html5"
	 :html-container "div"
	 :html-content-class "content"
	 :description "welcome to my site"
	 :keywords "emacs antanas geles"
	 :html-html5-fancy t
	 ;; :html-link-use-abs-url
	 :html-link-home "sitemap.html"
	 ;; :html-link-up
	 ;; :html-mathjax
	 ;; :html-equation-reference-format
	 ;; :html-postamble nil
	 ;; :html-postamble auto		;with-author/email/creator/date
	 :html-postamble t               ;from :html-postamble-format
	 ;; :html-postamble "<p class=\"author\">Author: %a</p>
	 ;; <p class=\"date\">Last modified: %C (created on: %d)</p>
	 ;; <p class=\"date\">Published: %T</p>
	 ;; <p id=\"source-link\" class=\"source\"></p>"
	 :html-preamble t                 ;insert a default one, which in none
	 :html-preamble  "<div id=\"created\">Page creation date(kodel 3
	 skirtingos datos???): %C</div>"
	 ;; :html-head
	 :html-head "<link rel=\"stylesheet\" href=\"../static/style.css\" type=\"text/css\"/>"
	 ;; :html-head-extra
	 ;; :subtitle "this is a subtitle"
	 :html-head-include-default-style nil
	 :html-head-include-scripts nil
	 :html-allow-name-attribute-in-anchors nil
	 :html-divs ((preamble "div" "preamble")
			     (content "div" "content")
			     (postamble "div" "postamble"))
	 ;; :html-checkbox-type
	 :html-extension "html"
	 :html-footnote-format "<sup>%s</sup>"
	 :html-footnote-separator "<sup>, </sup>"
	 :html-footnotes-section "<div id=\"footnotes\">\n<h2 class=\"footnotes\">%s: </h2>\n<div id=\"text-footnotes\">\n%s\n</div>\n</div>"
	 ;; :html-format-drawer-function
	 ;; :html-format-headline-function
	 ;; :html-format-inlinetask-function
	 :html-home/up-format "<div id=\"org-div-home-and-up\">\n <a accesskey=\"h\" href=\"%s\"> UP </a>\n |\n <a accesskey=\"H\" href=\"%s\"> HOME </a>\n</div>"
	 :html-indent nil
	 ;; :html-infojs-options
	 ;; :html-infojs-template
	 ;; :html-inline-image-rules
	 :html-link-org-files-as-html t
	 ;; :html-mathjax-options
	 ;; :html-mathjax-template
	 :html-metadata-timestamp-format "%Y-%m-%d %a %H:%M"
	 ;; :html-postamble-format
	 ;; :html-preamble-format
	 ;; :html-prefer-user-labels nil
	 :html-self-link-headlines t
	 :html-table-align-individual-fields t
	 ;; :html-table-caption-above t
	 :html-table-data-tags ("<td%s>" . "</td>")
	 :html-table-header-tags ("<th scope=\"%s\"%s>" . "</th>")
	 :html-table-use-header-tags-for-first-column nil
	 :html-tag-class-prefix "gaid"
	 :html-text-markup-alist ((bold . "<b>%s</b>")
						  (code . "<code>%s</code>")
						  (italic . "<i>%s</i>")
						  (strike-through . "<del>%s</del>")
						  (underline . "<span class=\"underline\">%s</span>")
						  (verbatim .  "<code>%s</code>"))
	 :html-todo-kwd-class-prefix ""
	 :html-toplevel-hlevel 2
	 ;; :html-use-infojs
	 :html-validation-link nil
	 ;; :html-validation-link "<a href=\"https://validator.w3.org/check?uri=referer\">Validate</a>"
	 :html-viewport  ((width "device-width")
				    (initial-scale "1")
				    (minimum-scale "")
				    (maximum-scale "")
				    (user-scalable ""))
	 :html-inline-images t
	 :html-table-attributes (:border "2" :cellspacing "0" :cellpadding "6" :rules "groups" :frame "hsides")
	 :html-table-row-open-tag "<tr>"
	 :html-table-row-close-tag "</tr>"
	 :html-xml-declaration (("html" . "<?xml version=\"1.0\" encoding=\"%s\"?>")
					       ("php" . "<?php echo \"<?xml version=\\\"1.0\\\" encoding=\\\"%s\\\" ?>\"; ?>"))
	 :html-wrap-src-lines nil
	 :html-klipsify-src t
	 ;; :html-klipse-css
	 ;; :html-klipse-js
	 ;; :html-klipse-selection-script
	 ;; :infojs-opt
	 ;; :creator
	 :with-latex t
	 ;; :latex-header
	 )

	("build-site.el" :components ("my-org-site"))))

;; publish all the projects
;; (org-publish-all t)
;; publish only specific project
(org-publish "my-org-site" t)		;The t parameter tells it to regenerate
					;all files regardless of when they were
					;last generated)so no need to add the
					;force prefix with C-c C-e C-f

(message "Build complete!")
