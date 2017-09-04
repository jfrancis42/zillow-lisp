(in-package #:zillow)

(defmacro cdr-assoc (name alist)
  "Replaces '(cdr (assoc name alist))' because it's used a bajillion
times when doing API stuff."
  `(cdr (assoc ,name ,alist :test #'equal)))

(defmacro rest-cdr-assoc (name alist)
  "Replaces '(cdr (assoc name alist))' because it's used a bajillion
times when doing API stuff."
  `(rest (cdr (assoc ,name ,alist :test #'equal))))

(defun fetch-and-decode (base zwsid rest)
  "Fetch the URI given a base URL, your zwsid, and the rest of the
parameters all globbed together as a URL-encoded set of values. If the
call is successful, return an alist of the data from the API. If
there's an error, return an alist whose key is 'error', and the value
is detail about the error."
  (let ((query (cxml:parse
		(first (multiple-value-list
			(drakma:http-request
			 (concatenate 'string
				      base "?zws-id="zwsid rest)
			 :method :get)))
		(cxml-xmls:make-xmls-builder))))
    (if (= 0 (parse-integer (first (rest-cdr-assoc "code" (rest-cdr-assoc "message" query)))))
	(rest-cdr-assoc "response" query)
	(cons "error" (rest-cdr-assoc "message" query)))))
  
(defun get-zestimate (zwsid &key zpid)
  "Given a zwsid and a zpid, fetch a Zestimate from Zillow."
  ;; (zillow::get-zestimate "X1-ZWz1fftypz6hhn_9tzan" :zpid "38443327")
  (fetch-and-decode
   "http://www.zillow.com/webservice/GetZestimate.htm" zwsid
   (format nil "&zpid=~A" zpid)))

(defun get-search-results (zwsid &key address city-state-zip rent-zestimate)
  "Given a zwsid, an address, and a city-state-zip, return search
results from Zillow. If rent-zestimate is t, also return the Rent
Zestimate."
  ;; (zillow::get-search-results "X1-ZWz1fftypz6hhn_9tzan" :address "17611 69th ave se" :city-state-zip "snohomish WA" :rent-zestimate t)
  (fetch-and-decode
   "http://www.zillow.com/webservice/GetSearchResults.htm" zwsid
   (concatenate 'string
		"&address=" (quri:url-encode address :space-to-plus t)
		"&citystatezip=" (quri:url-encode city-state-zip :space-to-plus t)
		(if rent-zestimate "&rent-zestimate=true" ""))))

(defun get-chart (zwsid &key zpid unit-type width height chart-duration)
  "Given a zwsid, zpid, unit-type, and an optional width, height, and
chart-duration, fetch chart data from Zillow."
  ;; (zillow::get-chart "X1-ZWz1fftypz6hhn_9tzan" :zpid 48749425 :unit-type "percent" :width 300 :height 150)
  (fetch-and-decode
   "http://www.zillow.com/webservice/GetChart.htm" zwsid
   (concatenate 'string
		"&zpid=" (format nil "~A" zpid)
		"&unit-type=" unit-type
		(if width (format nil "&width=~A" width) "")
		(if height (format nil "&height=~A" height) "")
		(if chart-duration (format nil "&chartDuration=~A"chart-duration) ""))))

(defun get-comps (zwsid &key zpid count rent-zestimate)
  "Given a zwsid, zpid, and count, return comps from Zillow. Include a
rent-zestimate if :rent-zestimate is t."
  ;; (zillow::get-comps "X1-ZWz1fftypz6hhn_9tzan" :zpid 48749425 :count 5)
  (fetch-and-decode
   "http://www.zillow.com/webservice/GetComps.htm" zwsid
   (concatenate 'string
		"&zpid=" (format nil "~A" zpid)
		"&count=" (format nil "~A" count)
		(if rent-zestimate "&rent-zestimate=true" ""))))
		
(defun get-deep-comps (zwsid &key zpid count rent-zestimate)
  "Given a zwsid, zpid, and count, return deep comps from
Zillow. Include a rent-zestimate if :rent-zestimate is t."
  ;; (zillow::get-deep-comps "X1-ZWz1fftypz6hhn_9tzan" :zpid 48749425 :count 5)
  (fetch-and-decode
   "http://www.zillow.com/webservice/GetDeepComps.htm" zwsid
   (concatenate 'string
		"&zpid=" (format nil "~A" zpid)
		"&count=" (format nil "~A" count)
		(if rent-zestimate "&rent-zestimate=true" ""))))

(defun get-deep-search-results (zwsid &key address city-state-zip rent-zestimate)
  "Given a zwsid, an address, and a city-state-zip, return deep search
results from Zillow. If rent-zestimate is t, also return the Rent
Zestimate."
  ;; (zillow::get-deep-search-results "X1-ZWz1fftypz6hhn_9tzan" :address "17611 69th ave se" :city-state-zip "snohomish WA" :rent-zestimate t)
  (fetch-and-decode
   "http://www.zillow.com/webservice/GetDeepSearchResults.htm" zwsid
   (concatenate 'string
		"&address=" (quri:url-encode address :space-to-plus t)
		"&citystatezip=" (quri:url-encode city-state-zip :space-to-plus t)
		(if rent-zestimate "&rent-zestimate=true" ""))))

(defun get-updated-property-details (zwsid &key zpid)
  "Given a zwsid and zpid, return updated property details from Zillow."
  ;; (zillow::get-updated-property-details "X1-ZWz1fftypz6hhn_9tzan" :zpid 48749425)
  (fetch-and-decode
   "http://www.zillow.com/webservice/GetUpdatedPropertyDetails.htm" zwsid
   (format nil "&zpid=~A" zpid)))

(defun get-region-children (zwsid &key region-id state county city childtype)
  "Given a zwsid, a region-id or a state, and an optional county,
city, and childtype, return region data from Zillow."
  ;; (zillow::get-region-children "X1-ZWz1fftypz6hhn_9tzan" :state "wa" :city "seattle" :childtype "neighborhood")
  (if (and (null region-id) (null state))
      nil
      (fetch-and-decode
       "http://www.zillow.com/webservice/GetRegionChildren.htm" zwsid
       (concatenate 'string
		    (if region-id (format nil "&regionId=~A" region-id) "")
		    (if state (format nil "&state=~A" state) "")
		    (if county (format nil "&county=~A" county) "")
		    (if city (format nil "&city=~A" city) "")
		    (if childtype (format nil "&childtype=~A" childtype) "")
		    (if state (format nil "&state=~A" state) "")
		    (if state (format nil "&state=~A" state) "")))))
