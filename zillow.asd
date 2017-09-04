;;;; zillow.asd

(asdf:defsystem #:zillow
  :description "A library for xxx's API."
  :author "Jeff Francis <jeff@gritch.org>"
  :license "MIT, see file LICENSE"
  :depends-on (#:drakma
	       #:cxml
	       #:quri
	       #:parse-number)
  :serial t
  :components ((:file "package")
               (:file "zillow")))

