;; HTMLIZE for sytanx highlighting START -------------------------------------
;; more in David's blog about publishing with org

;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path.
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

;; HTMLIZE for sytanx highlighting END -------------------------------------

;; Load the publishing system
(require 'ox-publish)

;; Customize the HTML output
(setq org-html-validation-link nil            ; Don't show validation link
      org-html-head-include-scripts nil       ; don't use default scripts
      org-html-head-include-default-style nil ; don't ise default styles
      )

;; HEAD of the site(meta)
(setq org-html-head
      "<link rel=\"stylesheet\"
href=\"https://cdn.simplecss.org/simple.min.css\" />"
)

;; ;; PREAMBLE(nav)
;; (setq org-html-preamble-format
;;       '(("en"
;;       "<nav class='navbar'>
;;	  <!-- LOGO -->
;;	    <!-- NAVIGATION MENU -->
;;	    <ul class='nav-links'>
;;		<!-- USING CHECKBOX HACK -->
;;		<input type='checkbox' id='checkbox_toggle' />
;;		<label for='checkbox_toggle' class='hamburger'>&#9776;</label>
;;		<!-- NAVIGATION MENUS -->
;;		<div class='menu'>
;;		    <li><a href='#'>Problemytes</a></li>
;;		    <li><a href='#'>Tinklas</a></li>
;;		    <li><a href='#'>AD</a></li>
;;		    <li><a href='#'>o365</a></li>
;;		    <li><a href='#'>Programos</a></li>
;;		    <li class='services'>
;;			<a href='#'>Iranga</a>
;;			<!-- DROPDOWN MENU -->
;;			<ul class='dropdown'>
;;			    <li><a href='#'>Spausdintuvai</a></li>
;;			    <li><a href='#'>Kompiuteriai</a></li>
;;			</ul>
;;		    </li>
;;		</div>
;;	    </ul>
;;	 </nav>"
;;	 )))

;; POSTAMBLE(footer)
;; (setq org-html-postamble-format
;; '(("en" "<p class=\"author\">Author: %a</p>
;;    <p class=\"date\">Last modified: %C (created on: %d)</p>
;;    <p class=\"date\">Published: %T</p>
;;    <p id=\"source-link\" class=\"source\"></p>")))

(setq org-publish-project-alist
      '(
	("my-org-site"
	 :base-directory "../org" ;tells Org the folder of files that we want to publish to HTML
	 :publishing-directory "../html" ;configures the output folder for all published files
	 :base-extension "org"
	 :publishing-function org-html-publish-to-html ;tells Org that we want to publish the files as HTML
	 :recursive t			;tells Org to publish .org files under all subdirectories of :base-directory
	 :with-author nil           ; Don't include author name
	 :with-creator t            ; Include Emacs and Org versions in footer
	 :with-toc t                ; Include a table of contents
	 :section-numbers nil       ; Don't include section numbers
	 :time-stamp-file nil    ; Don't include time stamp in file
	 :auto-sitemap t			;creates sitemap, a place with all the links
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
