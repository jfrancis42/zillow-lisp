;;;; zillow.asd

(asdf:defsystem #:zillow
  :description "A Common Lisp client for pulling data from the public Zillow API."
  :author "Jeff Francis <jeff@gritch.org>"
  :license "MIT, see file LICENSE"
  :depends-on (#:drakma
	       #:cxml
	       #:quri
	       #:parse-number)
  :serial t
  :components ((:file "package")
               (:file "zillow")))

