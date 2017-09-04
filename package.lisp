;;;; package.lisp

(defpackage #:zillow
  (:use #:cl)
  (:export :get-zestimate
	   :get-search-results
	   :get-chart
	   :get-comps
	   :get-deep-comps
	   :get-deep-search-results
	   :get-updated-property-details
	   :get-region-children))
