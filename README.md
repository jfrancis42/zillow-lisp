# zillow-lisp
A Common Lisp client for pulling data from the public Zillow API.

The Zillow API is documented at the following URL:
https://www.zillow.com/howto/api/APIOverview.htm. You'll need to
reference these pages, as this README file does not attempt to
document the possible values for each parameter nor will it document
the possible return values.

Note that there are very specific requirements imposed on use of the
Zillow API by Zillow. These restrictions are documented on the Zillow
API page referenced above. You'll also need a "zwsid", which is a
Zillow Web Services ID, which can be generated at this URL:
https://www.zillow.com/webservice/Registration.htm. Zillow limits use
of the API to 1000 queries per day, unless other arrangements are
made.

Finally, note that any/all numeric values returned from the API are
returned as strings, and it's up to the end user to convert these
strings to integers or floats as needed.

### GetZestimate API
https://www.zillow.com/howto/api/GetZestimate.htm

````
CL-USER> (zillow:get-zestimate "your-zwsid" :zpid 84074482)
(("zpid" NIL "84074482")
 ("links" NIL
  ("homedetails" NIL
   "http://www.zillow.com/homedetails/1600-Pennsylvania-Ave-NW-Washington-DC-20006/84074482_zpid/")
  ("graphsanddata" NIL
   "http://www.zillow.com/homedetails/1600-Pennsylvania-Ave-NW-Washington-DC-20006/84074482_zpid/#charts-and-data")
  ("mapthishome" NIL "http://www.zillow.com/homes/84074482_zpid/")
  ("comparables" NIL "http://www.zillow.com/homes/comps/84074482_zpid/"))
 ("address" NIL ("street" NIL "1600 Pennsylvania Ave NW")
  ("zipcode" NIL "20006") ("city" NIL "Washington") ("state" NIL "DC")
  ("latitude" NIL "38.89768") ("longitude" NIL "-77.03651"))
 ("zestimate" NIL ("amount" (("currency" "USD")) "397717836")
  ("last-updated" NIL "09/03/2017") ("oneWeekChange" (("deprecated" "true")))
  ("valueChange" (("currency" "USD") ("duration" "30")) "0")
  ("valuationRange" NIL ("low" (("currency" "USD")) "377831946")
   ("high" (("currency" "USD")) "417603726"))
  ("percentile" NIL "100"))
 ("localRealEstate" NIL
  ("region" (("type" "neighborhood") ("id" "273489") ("name" "Downtown"))
   ("zindexValue" NIL "525,800")
   ("links" NIL
    ("overview" NIL
     "http://www.zillow.com/local-info/DC-Washington/Downtown/r_273489/")
    ("forSaleByOwner" NIL "http://www.zillow.com/downtown-washington-dc/fsbo/")
    ("forSale" NIL "http://www.zillow.com/downtown-washington-dc/"))))
 ("regions" NIL ("zipcode-id" NIL "66130") ("city-id" NIL "41568")
  ("county-id" NIL "3289") ("state-id" NIL "12")))
CL-USER>
````

### GetSearchResults API
https://www.zillow.com/howto/api/GetSearchResults.htm

````
CL-USER> (zillow:get-search-results "your-zwsid" :address "1600 Pennsylvania Ave NW" :city-state-zip "Washington DC")
(("results" NIL
  ("result" NIL ("zpid" NIL "84074482")
   ("links" NIL
    ("homedetails" NIL
     "http://www.zillow.com/homedetails/1600-Pennsylvania-Ave-NW-Washington-DC-20006/84074482_zpid/")
    ("graphsanddata" NIL
     "http://www.zillow.com/homedetails/1600-Pennsylvania-Ave-NW-Washington-DC-20006/84074482_zpid/#charts-and-data")
    ("mapthishome" NIL "http://www.zillow.com/homes/84074482_zpid/")
    ("comparables" NIL "http://www.zillow.com/homes/comps/84074482_zpid/"))
   ("address" NIL ("street" NIL "1600 Pennsylvania Ave NW")
    ("zipcode" NIL "20006") ("city" NIL "Washington") ("state" NIL "DC")
    ("latitude" NIL "38.89768") ("longitude" NIL "-77.03651"))
   ("zestimate" NIL ("amount" (("currency" "USD")) "397717836")
    ("last-updated" NIL "09/03/2017") ("oneWeekChange" (("deprecated" "true")))
    ("valueChange" (("currency" "USD") ("duration" "30")) "0")
    ("valuationRange" NIL ("low" (("currency" "USD")) "377831946")
     ("high" (("currency" "USD")) "417603726"))
    ("percentile" NIL "0"))
   ("localRealEstate" NIL
    ("region" (("type" "neighborhood") ("id" "273489") ("name" "Downtown"))
     ("zindexValue" NIL "525,800")
     ("links" NIL
      ("overview" NIL
       "http://www.zillow.com/local-info/DC-Washington/Downtown/r_273489/")
      ("forSaleByOwner" NIL
       "http://www.zillow.com/downtown-washington-dc/fsbo/")
      ("forSale" NIL "http://www.zillow.com/downtown-washington-dc/")))))))
CL-USER>
````

### GetChart API
https://www.zillow.com/howto/api/GetChart.htm

````
CL-USER> (zillow:get-chart "your-zwsid" :zpid 84074482 :unit-type "percent" :width 300 :height 150)
(("url" NIL
  "http://www.zillow.com/app?chartDuration=1year&chartType=partner&height=150&page=webservice%2FGetChart&service=chart&showPercent=true&width=300&zpid=84074482")
 ("graphsanddata" NIL
  "http://www.zillow.com/homedetails/1600-Pennsylvania-Ave-NW-Washington-DC-20006/84074482_zpid/#charts-and-data"))
CL-USER>
````

### GetComps API
https://www.zillow.com/howto/api/GetComps.htm

````
CL-USER> (zillow::get-comps "your-zwsid" :zpid 48749425 :count 5)
(("properties" NIL
  ("principal" NIL ("zpid" NIL "48749425")
   ("links" NIL
    ("homedetails" NIL
     "http://www.zillow.com/homedetails/2114-Bigelow-Ave-N-Seattle-WA-98109/48749425_zpid/")
    ("graphsanddata" NIL
     "http://www.zillow.com/homedetails/2114-Bigelow-Ave-N-Seattle-WA-98109/48749425_zpid/#charts-and-data")
    ("mapthishome" NIL "http://www.zillow.com/homes/48749425_zpid/")
    ("comparables" NIL "http://www.zillow.com/homes/comps/48749425_zpid/"))
   ("address" NIL ("street" NIL "2114 Bigelow Ave N") ("zipcode" NIL "98109")
    ("city" NIL "Seattle") ("state" NIL "WA") ("latitude" NIL "47.637933")
    ("longitude" NIL "-122.347938"))
   ("zestimate" NIL ("amount" (("currency" "USD")) "2018610")
    ("last-updated" NIL "09/03/2017") ("oneWeekChange" (("deprecated" "true")))
    ("valueChange" (("currency" "USD") ("duration" "30")) "-34747")
    ("valuationRange" NIL ("low" (("currency" "USD")) "1917680")
     ("high" (("currency" "USD")) "2119540"))
    ("percentile" NIL "98"))
   ("localRealEstate" NIL
    ("region"
     (("type" "neighborhood") ("id" "271856") ("name" "East Queen Anne"))
     ("zindexValue" NIL "821,600")
     ("links" NIL
      ("overview" NIL
       "http://www.zillow.com/local-info/WA-Seattle/East-Queen-Anne/r_271856/")
      ("forSaleByOwner" NIL
       "http://www.zillow.com/east-queen-anne-seattle-wa/fsbo/")
      ("forSale" NIL "http://www.zillow.com/east-queen-anne-seattle-wa/")))))
  ("comparables" NIL
   ("comp" (("score" "5.0")) ("zpid" NIL "48689866")
    ("links" NIL
     ("homedetails" NIL
      "http://www.zillow.com/homedetails/405-Hayes-St-Seattle-WA-98109/48689866_zpid/")
     ("graphsanddata" NIL
      "http://www.zillow.com/homedetails/405-Hayes-St-Seattle-WA-98109/48689866_zpid/#charts-and-data")
     ("mapthishome" NIL "http://www.zillow.com/homes/48689866_zpid/")
     ("comparables" NIL "http://www.zillow.com/homes/comps/48689866_zpid/"))
    ("address" NIL ("street" NIL "405 Hayes St") ("zipcode" NIL "98109")
     ("city" NIL "Seattle") ("state" NIL "WA") ("latitude" NIL "47.633854")
     ("longitude" NIL "-122.349294"))
    ("zestimate" NIL ("amount" (("currency" "USD")) "1748595")
     ("last-updated" NIL "09/03/2017")
     ("oneWeekChange" (("deprecated" "true")))
     ("valueChange" (("currency" "USD") ("duration" "30")) "18507")
     ("valuationRange" NIL ("low" (("currency" "USD")) "1643679")
      ("high" (("currency" "USD")) "1836025"))
     ("percentile" NIL "97"))
    ("localRealEstate" NIL
     ("region"
      (("type" "neighborhood") ("id" "271856") ("name" "East Queen Anne"))
      ("zindexValue" NIL "821,600")
      ("links" NIL
       ("overview" NIL
        "http://www.zillow.com/local-info/WA-Seattle/East-Queen-Anne/r_271856/")
       ("forSaleByOwner" NIL
        "http://www.zillow.com/east-queen-anne-seattle-wa/fsbo/")
       ("forSale" NIL "http://www.zillow.com/east-queen-anne-seattle-wa/")))))
   ("comp" (("score" "11.0")) ("zpid" NIL "48689896")
    ("links" NIL
     ("homedetails" NIL
      "http://www.zillow.com/homedetails/211-Hayes-St-Seattle-WA-98109/48689896_zpid/")
     ("graphsanddata" NIL
      "http://www.zillow.com/homedetails/211-Hayes-St-Seattle-WA-98109/48689896_zpid/#charts-and-data")
     ("mapthishome" NIL "http://www.zillow.com/homes/48689896_zpid/")
     ("comparables" NIL "http://www.zillow.com/homes/comps/48689896_zpid/"))
    ("address" NIL ("street" NIL "211 Hayes St") ("zipcode" NIL "98109")
     ("city" NIL "Seattle") ("state" NIL "WA") ("latitude" NIL "47.633791")
     ("longitude" NIL "-122.352681"))
    ("zestimate" NIL ("amount" (("currency" "USD")) "1192734")
     ("last-updated" NIL "09/03/2017")
     ("oneWeekChange" (("deprecated" "true")))
     ("valueChange" (("currency" "USD") ("duration" "30")) "30509")
     ("valuationRange" NIL ("low" (("currency" "USD")) "1109243")
      ("high" (("currency" "USD")) "1252371"))
     ("percentile" NIL "93"))
    ("localRealEstate" NIL
     ("region"
      (("type" "neighborhood") ("id" "271856") ("name" "East Queen Anne"))
      ("zindexValue" NIL "821,600")
      ("links" NIL
       ("overview" NIL
        "http://www.zillow.com/local-info/WA-Seattle/East-Queen-Anne/r_271856/")
       ("forSaleByOwner" NIL
        "http://www.zillow.com/east-queen-anne-seattle-wa/fsbo/")
       ("forSale" NIL "http://www.zillow.com/east-queen-anne-seattle-wa/")))))
   ("comp" (("score" "10.0")) ("zpid" NIL "48689963")
    ("links" NIL
     ("homedetails" NIL
      "http://www.zillow.com/homedetails/361-Blaine-St-Seattle-WA-98109/48689963_zpid/")
     ("graphsanddata" NIL
      "http://www.zillow.com/homedetails/361-Blaine-St-Seattle-WA-98109/48689963_zpid/#charts-and-data")
     ("mapthishome" NIL "http://www.zillow.com/homes/48689963_zpid/")
     ("comparables" NIL "http://www.zillow.com/homes/comps/48689963_zpid/"))
    ("address" NIL ("street" NIL "361 Blaine St") ("zipcode" NIL "98109")
     ("city" NIL "Seattle") ("state" NIL "WA") ("latitude" NIL "47.634705")
     ("longitude" NIL "-122.350054"))
    ("zestimate" NIL ("amount" (("currency" "USD")) "1270189")
     ("last-updated" NIL "09/03/2017")
     ("oneWeekChange" (("deprecated" "true")))
     ("valueChange" (("currency" "USD") ("duration" "30")) "13220")
     ("valuationRange" NIL ("low" (("currency" "USD")) "1206680")
      ("high" (("currency" "USD")) "1333698"))
     ("percentile" NIL "94"))
    ("localRealEstate" NIL
     ("region"
      (("type" "neighborhood") ("id" "271856") ("name" "East Queen Anne"))
      ("zindexValue" NIL "821,600")
      ("links" NIL
       ("overview" NIL
        "http://www.zillow.com/local-info/WA-Seattle/East-Queen-Anne/r_271856/")
       ("forSaleByOwner" NIL
        "http://www.zillow.com/east-queen-anne-seattle-wa/fsbo/")
       ("forSale" NIL "http://www.zillow.com/east-queen-anne-seattle-wa/")))))
   ("comp" (("score" "9.0")) ("zpid" NIL "48689972")
    ("links" NIL
     ("homedetails" NIL
      "http://www.zillow.com/homedetails/1716-4th-Ave-N-Seattle-WA-98109/48689972_zpid/")
     ("graphsanddata" NIL
      "http://www.zillow.com/homedetails/1716-4th-Ave-N-Seattle-WA-98109/48689972_zpid/#charts-and-data")
     ("mapthishome" NIL "http://www.zillow.com/homes/48689972_zpid/")
     ("comparables" NIL "http://www.zillow.com/homes/comps/48689972_zpid/"))
    ("address" NIL ("street" NIL "1716 4th Ave N") ("zipcode" NIL "98109")
     ("city" NIL "Seattle") ("state" NIL "WA") ("latitude" NIL "47.634567")
     ("longitude" NIL "-122.349194"))
    ("zestimate" NIL ("amount" (("currency" "USD")) "1637681")
     ("last-updated" NIL "09/03/2017")
     ("oneWeekChange" (("deprecated" "true")))
     ("valueChange" (("currency" "USD") ("duration" "30")) "55279")
     ("valuationRange" NIL ("low" (("currency" "USD")) "1441159")
      ("high" (("currency" "USD")) "1735942"))
     ("percentile" NIL "97"))
    ("localRealEstate" NIL
     ("region"
      (("type" "neighborhood") ("id" "271856") ("name" "East Queen Anne"))
      ("zindexValue" NIL "821,600")
      ("links" NIL
       ("overview" NIL
        "http://www.zillow.com/local-info/WA-Seattle/East-Queen-Anne/r_271856/")
       ("forSaleByOwner" NIL
        "http://www.zillow.com/east-queen-anne-seattle-wa/fsbo/")
       ("forSale" NIL "http://www.zillow.com/east-queen-anne-seattle-wa/")))))
   ("comp" (("score" "11.0")) ("zpid" NIL "48690076")
    ("links" NIL
     ("homedetails" NIL
      "http://www.zillow.com/homedetails/309-Newton-St-Seattle-WA-98109/48690076_zpid/")
     ("graphsanddata" NIL
      "http://www.zillow.com/homedetails/309-Newton-St-Seattle-WA-98109/48690076_zpid/#charts-and-data")
     ("mapthishome" NIL "http://www.zillow.com/homes/48690076_zpid/")
     ("comparables" NIL "http://www.zillow.com/homes/comps/48690076_zpid/"))
    ("address" NIL ("street" NIL "309 Newton St") ("zipcode" NIL "98109")
     ("city" NIL "Seattle") ("state" NIL "WA") ("latitude" NIL "47.636324")
     ("longitude" NIL "-122.351433"))
    ("zestimate" NIL ("amount" (("currency" "USD")) "1160492")
     ("last-updated" NIL "09/03/2017")
     ("oneWeekChange" (("deprecated" "true")))
     ("valueChange" (("currency" "USD") ("duration" "30")) "81491")
     ("valuationRange" NIL ("low" (("currency" "USD")) "1044443")
      ("high" (("currency" "USD")) "1218517"))
     ("percentile" NIL "92"))
    ("localRealEstate" NIL
     ("region"
      (("type" "neighborhood") ("id" "271856") ("name" "East Queen Anne"))
      ("zindexValue" NIL "821,600")
      ("links" NIL
       ("overview" NIL
        "http://www.zillow.com/local-info/WA-Seattle/East-Queen-Anne/r_271856/")
       ("forSaleByOwner" NIL
        "http://www.zillow.com/east-queen-anne-seattle-wa/fsbo/")
       ("forSale" NIL
        "http://www.zillow.com/east-queen-anne-seattle-wa/"))))))))
CL-USER>
````

### GetDeepComps API
https://www.zillow.com/howto/api/GetDeepComps.htm

````
CL-USER> (zillow::get-deep-comps "your-zwsid" :zpid 48749425 :count 5)
(("properties" NIL
  ("principal" NIL ("zpid" NIL "48749425")
   ("links" NIL
    ("homedetails" NIL
     "http://www.zillow.com/homedetails/2114-Bigelow-Ave-N-Seattle-WA-98109/48749425_zpid/")
    ("graphsanddata" NIL
     "http://www.zillow.com/homedetails/2114-Bigelow-Ave-N-Seattle-WA-98109/48749425_zpid/#charts-and-data")
    ("mapthishome" NIL "http://www.zillow.com/homes/48749425_zpid/")
    ("comparables" NIL "http://www.zillow.com/homes/comps/48749425_zpid/"))
   ("address" NIL ("street" NIL "2114 Bigelow Ave N") ("zipcode" NIL "98109")
    ("city" NIL "Seattle") ("state" NIL "WA") ("latitude" NIL "47.637933")
    ("longitude" NIL "-122.347938"))
   ("taxAssessmentYear" NIL "2015") ("taxAssessment" NIL "1271000.0")
   ("yearBuilt" NIL "1924") ("lotSizeSqFt" NIL "4680")
   ("finishedSqFt" NIL "3470") ("bathrooms" NIL "3.0") ("bedrooms" NIL "4")
   ("lastSoldDate" NIL "11/26/2008")
   ("lastSoldPrice" (("currency" "USD")) "995000")
   ("zestimate" NIL ("amount" (("currency" "USD")) "2018610")
    ("last-updated" NIL "09/03/2017") ("oneWeekChange" (("deprecated" "true")))
    ("valueChange" (("currency" "USD") ("duration" "30")) "-34747")
    ("valuationRange" NIL ("low" (("currency" "USD")) "1917680")
     ("high" (("currency" "USD")) "2119540"))
    ("percentile" NIL "98"))
   ("localRealEstate" NIL
    ("region"
     (("type" "neighborhood") ("id" "271856") ("name" "East Queen Anne"))
     ("zindexValue" NIL "821,600")
     ("links" NIL
      ("overview" NIL
       "http://www.zillow.com/local-info/WA-Seattle/East-Queen-Anne/r_271856/")
      ("forSaleByOwner" NIL
       "http://www.zillow.com/east-queen-anne-seattle-wa/fsbo/")
      ("forSale" NIL "http://www.zillow.com/east-queen-anne-seattle-wa/")))))
  ("comparables" NIL
   ("comp" (("score" "5.0")) ("zpid" NIL "48689866")
    ("links" NIL
     ("homedetails" NIL
      "http://www.zillow.com/homedetails/405-Hayes-St-Seattle-WA-98109/48689866_zpid/")
     ("graphsanddata" NIL
      "http://www.zillow.com/homedetails/405-Hayes-St-Seattle-WA-98109/48689866_zpid/#charts-and-data")
     ("mapthishome" NIL "http://www.zillow.com/homes/48689866_zpid/")
     ("comparables" NIL "http://www.zillow.com/homes/comps/48689866_zpid/"))
    ("address" NIL ("street" NIL "405 Hayes St") ("zipcode" NIL "98109")
     ("city" NIL "Seattle") ("state" NIL "WA") ("latitude" NIL "47.633854")
     ("longitude" NIL "-122.349294"))
    ("taxAssessmentYear" NIL "2015") ("taxAssessment" NIL "1313000.0")
    ("yearBuilt" NIL "1924") ("lotSizeSqFt" NIL "3500")
    ("finishedSqFt" NIL "3000") ("bathrooms" NIL "3.0") ("bedrooms" NIL "4")
    ("lastSoldDate" NIL "11/28/2016")
    ("lastSoldPrice" (("currency" "USD")) "1565000")
    ("zestimate" NIL ("amount" (("currency" "USD")) "1748595")
     ("last-updated" NIL "09/03/2017")
     ("oneWeekChange" (("deprecated" "true")))
     ("valueChange" (("currency" "USD") ("duration" "30")) "18507")
     ("valuationRange" NIL ("low" (("currency" "USD")) "1643679")
      ("high" (("currency" "USD")) "1836025"))
     ("percentile" NIL "97"))
    ("localRealEstate" NIL
     ("region"
      (("type" "neighborhood") ("id" "271856") ("name" "East Queen Anne"))
      ("zindexValue" NIL "821,600")
      ("links" NIL
       ("overview" NIL
        "http://www.zillow.com/local-info/WA-Seattle/East-Queen-Anne/r_271856/")
       ("forSaleByOwner" NIL
        "http://www.zillow.com/east-queen-anne-seattle-wa/fsbo/")
       ("forSale" NIL "http://www.zillow.com/east-queen-anne-seattle-wa/")))))
   ("comp" (("score" "11.0")) ("zpid" NIL "48689896")
    ("links" NIL
     ("homedetails" NIL
      "http://www.zillow.com/homedetails/211-Hayes-St-Seattle-WA-98109/48689896_zpid/")
     ("graphsanddata" NIL
      "http://www.zillow.com/homedetails/211-Hayes-St-Seattle-WA-98109/48689896_zpid/#charts-and-data")
     ("mapthishome" NIL "http://www.zillow.com/homes/48689896_zpid/")
     ("comparables" NIL "http://www.zillow.com/homes/comps/48689896_zpid/"))
    ("address" NIL ("street" NIL "211 Hayes St") ("zipcode" NIL "98109")
     ("city" NIL "Seattle") ("state" NIL "WA") ("latitude" NIL "47.633791")
     ("longitude" NIL "-122.352681"))
    ("taxAssessmentYear" NIL "2015") ("taxAssessment" NIL "672000.0")
    ("yearBuilt" NIL "1911") ("lotSizeSqFt" NIL "4000")
    ("finishedSqFt" NIL "2024") ("bathrooms" NIL "2.0") ("bedrooms" NIL "3")
    ("lastSoldDate" NIL "06/29/2017")
    ("lastSoldPrice" (("currency" "USD")) "1175000")
    ("zestimate" NIL ("amount" (("currency" "USD")) "1192734")
     ("last-updated" NIL "09/03/2017")
     ("oneWeekChange" (("deprecated" "true")))
     ("valueChange" (("currency" "USD") ("duration" "30")) "30509")
     ("valuationRange" NIL ("low" (("currency" "USD")) "1109243")
      ("high" (("currency" "USD")) "1252371"))
     ("percentile" NIL "93"))
    ("localRealEstate" NIL
     ("region"
      (("type" "neighborhood") ("id" "271856") ("name" "East Queen Anne"))
      ("zindexValue" NIL "821,600")
      ("links" NIL
       ("overview" NIL
        "http://www.zillow.com/local-info/WA-Seattle/East-Queen-Anne/r_271856/")
       ("forSaleByOwner" NIL
        "http://www.zillow.com/east-queen-anne-seattle-wa/fsbo/")
       ("forSale" NIL "http://www.zillow.com/east-queen-anne-seattle-wa/")))))
   ("comp" (("score" "10.0")) ("zpid" NIL "48689963")
    ("links" NIL
     ("homedetails" NIL
      "http://www.zillow.com/homedetails/361-Blaine-St-Seattle-WA-98109/48689963_zpid/")
     ("graphsanddata" NIL
      "http://www.zillow.com/homedetails/361-Blaine-St-Seattle-WA-98109/48689963_zpid/#charts-and-data")
     ("mapthishome" NIL "http://www.zillow.com/homes/48689963_zpid/")
     ("comparables" NIL "http://www.zillow.com/homes/comps/48689963_zpid/"))
    ("address" NIL ("street" NIL "361 Blaine St") ("zipcode" NIL "98109")
     ("city" NIL "Seattle") ("state" NIL "WA") ("latitude" NIL "47.634705")
     ("longitude" NIL "-122.350054"))
    ("taxAssessmentYear" NIL "2015") ("taxAssessment" NIL "767000.0")
    ("yearBuilt" NIL "1919") ("lotSizeSqFt" NIL "2500")
    ("finishedSqFt" NIL "2580") ("bathrooms" NIL "2.0") ("bedrooms" NIL "4")
    ("lastSoldDate" NIL "03/24/2017")
    ("lastSoldPrice" (("currency" "USD")) "1200000")
    ("zestimate" NIL ("amount" (("currency" "USD")) "1270189")
     ("last-updated" NIL "09/03/2017")
     ("oneWeekChange" (("deprecated" "true")))
     ("valueChange" (("currency" "USD") ("duration" "30")) "13220")
     ("valuationRange" NIL ("low" (("currency" "USD")) "1206680")
      ("high" (("currency" "USD")) "1333698"))
     ("percentile" NIL "94"))
    ("localRealEstate" NIL
     ("region"
      (("type" "neighborhood") ("id" "271856") ("name" "East Queen Anne"))
      ("zindexValue" NIL "821,600")
      ("links" NIL
       ("overview" NIL
        "http://www.zillow.com/local-info/WA-Seattle/East-Queen-Anne/r_271856/")
       ("forSaleByOwner" NIL
        "http://www.zillow.com/east-queen-anne-seattle-wa/fsbo/")
       ("forSale" NIL "http://www.zillow.com/east-queen-anne-seattle-wa/")))))
   ("comp" (("score" "9.0")) ("zpid" NIL "48689972")
    ("links" NIL
     ("homedetails" NIL
      "http://www.zillow.com/homedetails/1716-4th-Ave-N-Seattle-WA-98109/48689972_zpid/")
     ("graphsanddata" NIL
      "http://www.zillow.com/homedetails/1716-4th-Ave-N-Seattle-WA-98109/48689972_zpid/#charts-and-data")
     ("mapthishome" NIL "http://www.zillow.com/homes/48689972_zpid/")
     ("comparables" NIL "http://www.zillow.com/homes/comps/48689972_zpid/"))
    ("address" NIL ("street" NIL "1716 4th Ave N") ("zipcode" NIL "98109")
     ("city" NIL "Seattle") ("state" NIL "WA") ("latitude" NIL "47.634567")
     ("longitude" NIL "-122.349194"))
    ("taxAssessmentYear" NIL "2015") ("taxAssessment" NIL "1171000.0")
    ("yearBuilt" NIL "1928") ("lotSizeSqFt" NIL "5775")
    ("finishedSqFt" NIL "1880") ("bathrooms" NIL "2.0") ("bedrooms" NIL "4")
    ("lastSoldDate" NIL "11/15/2016")
    ("lastSoldPrice" (("currency" "USD")) "1250000")
    ("zestimate" NIL ("amount" (("currency" "USD")) "1637681")
     ("last-updated" NIL "09/03/2017")
     ("oneWeekChange" (("deprecated" "true")))
     ("valueChange" (("currency" "USD") ("duration" "30")) "55279")
     ("valuationRange" NIL ("low" (("currency" "USD")) "1441159")
      ("high" (("currency" "USD")) "1735942"))
     ("percentile" NIL "97"))
    ("localRealEstate" NIL
     ("region"
      (("type" "neighborhood") ("id" "271856") ("name" "East Queen Anne"))
      ("zindexValue" NIL "821,600")
      ("links" NIL
       ("overview" NIL
        "http://www.zillow.com/local-info/WA-Seattle/East-Queen-Anne/r_271856/")
       ("forSaleByOwner" NIL
        "http://www.zillow.com/east-queen-anne-seattle-wa/fsbo/")
       ("forSale" NIL "http://www.zillow.com/east-queen-anne-seattle-wa/")))))
   ("comp" (("score" "11.0")) ("zpid" NIL "48690076")
    ("links" NIL
     ("homedetails" NIL
      "http://www.zillow.com/homedetails/309-Newton-St-Seattle-WA-98109/48690076_zpid/")
     ("graphsanddata" NIL
      "http://www.zillow.com/homedetails/309-Newton-St-Seattle-WA-98109/48690076_zpid/#charts-and-data")
     ("mapthishome" NIL "http://www.zillow.com/homes/48690076_zpid/")
     ("comparables" NIL "http://www.zillow.com/homes/comps/48690076_zpid/"))
    ("address" NIL ("street" NIL "309 Newton St") ("zipcode" NIL "98109")
     ("city" NIL "Seattle") ("state" NIL "WA") ("latitude" NIL "47.636324")
     ("longitude" NIL "-122.351433"))
    ("taxAssessmentYear" NIL "2015") ("taxAssessment" NIL "690000.0")
    ("yearBuilt" NIL "1924") ("lotSizeSqFt" NIL "4356")
    ("finishedSqFt" NIL "2160") ("bathrooms" NIL "1.1") ("bedrooms" NIL "3")
    ("lastSoldDate" NIL "06/22/2017")
    ("lastSoldPrice" (("currency" "USD")) "1200000")
    ("zestimate" NIL ("amount" (("currency" "USD")) "1160492")
     ("last-updated" NIL "09/03/2017")
     ("oneWeekChange" (("deprecated" "true")))
     ("valueChange" (("currency" "USD") ("duration" "30")) "81491")
     ("valuationRange" NIL ("low" (("currency" "USD")) "1044443")
      ("high" (("currency" "USD")) "1218517"))
     ("percentile" NIL "92"))
    ("localRealEstate" NIL
     ("region"
      (("type" "neighborhood") ("id" "271856") ("name" "East Queen Anne"))
      ("zindexValue" NIL "821,600")
      ("links" NIL
       ("overview" NIL
        "http://www.zillow.com/local-info/WA-Seattle/East-Queen-Anne/r_271856/")
       ("forSaleByOwner" NIL
        "http://www.zillow.com/east-queen-anne-seattle-wa/fsbo/")
       ("forSale" NIL
        "http://www.zillow.com/east-queen-anne-seattle-wa/"))))))))
CL-USER>
````

### GetDeepSearch-Results API
https://www.zillow.com/howto/api/GetDeepSearchResults.htm

````
CL-USER> (zillow:get-deep-search-results "your-zwsid" :address "1600 Pennsylvania Ave NW" :city-state-zip "Washington DC")
(("results" NIL
  ("result" NIL ("zpid" NIL "84074482")
   ("links" NIL
    ("homedetails" NIL
     "http://www.zillow.com/homedetails/1600-Pennsylvania-Ave-NW-Washington-DC-20006/84074482_zpid/")
    ("graphsanddata" NIL
     "http://www.zillow.com/homedetails/1600-Pennsylvania-Ave-NW-Washington-DC-20006/84074482_zpid/#charts-and-data")
    ("mapthishome" NIL "http://www.zillow.com/homes/84074482_zpid/")
    ("comparables" NIL "http://www.zillow.com/homes/comps/84074482_zpid/"))
   ("address" NIL ("street" NIL "1600 Pennsylvania Ave NW")
    ("zipcode" NIL "20006") ("city" NIL "Washington") ("state" NIL "DC")
    ("latitude" NIL "38.89768") ("longitude" NIL "-77.03651"))
   ("FIPScounty" NIL "11001") ("useCode" NIL "SingleFamily")
   ("yearBuilt" NIL "1800") ("lotSizeSqFt" NIL "784080")
   ("finishedSqFt" NIL "55000") ("bathrooms" NIL "35.0") ("bedrooms" NIL "16")
   ("zestimate" NIL ("amount" (("currency" "USD")) "397717836")
    ("last-updated" NIL "09/03/2017") ("oneWeekChange" (("deprecated" "true")))
    ("valueChange" (("currency" "USD") ("duration" "30")) "0")
    ("valuationRange" NIL ("low" (("currency" "USD")) "377831946")
     ("high" (("currency" "USD")) "417603726"))
    ("percentile" NIL "0"))
   ("localRealEstate" NIL
    ("region" (("type" "neighborhood") ("id" "273489") ("name" "Downtown"))
     ("zindexValue" NIL "525,800")
     ("links" NIL
      ("overview" NIL
       "http://www.zillow.com/local-info/DC-Washington/Downtown/r_273489/")
      ("forSaleByOwner" NIL
       "http://www.zillow.com/downtown-washington-dc/fsbo/")
      ("forSale" NIL "http://www.zillow.com/downtown-washington-dc/")))))))
CL-USER>
````

### GetUpdatedPropertyDetails API
https://www.zillow.com/howto/api/GetUpdatedPropertyDetails.htm

````
CL-USER> (zillow::get-updated-property-details "your-zwsid" :zpid 48749425)
(("zpid" NIL "48749425")
 ("pageViewCount" NIL ("currentMonth" NIL "13") ("total" NIL "25350"))
 ("address" NIL ("street" NIL "2114 Bigelow Ave N") ("zipcode" NIL "98109")
  ("city" NIL "Seattle") ("state" NIL "WA") ("latitude" NIL "47.637933")
  ("longitude" NIL "-122.347938"))
 ("links" NIL
  ("homeDetails" NIL
   "http://www.zillow.com/homedetails/2114-Bigelow-Ave-N-Seattle-WA-98109/48749425_zpid/")
  ("photoGallery" NIL
   "http://www.zillow.com/homedetails/2114-Bigelow-Ave-N-Seattle-WA-98109/48749425_zpid/#image=lightbox%3Dtrue")
  ("homeInfo" NIL
   "http://www.zillow.com/homedetails/2114-Bigelow-Ave-N-Seattle-WA-98109/48749425_zpid/"))
 ("images" NIL ("count" NIL "1")
  ("image" NIL
   ("url" NIL
    "https://photos.zillowstatic.com/p_d/ISxb3qa8s1cwx01000000000.jpg")))
 ("editedFacts" NIL ("useCode" NIL "SingleFamily") ("bedrooms" NIL "4")
  ("bathrooms" NIL "3.0") ("finishedSqFt" NIL "3470")
  ("lotSizeSqFt" NIL "4680") ("yearBuilt" NIL "1924")
  ("yearUpdated" NIL "2003") ("numFloors" NIL "2") ("basement" NIL "Finished")
  ("roof" NIL "Composition") ("view" NIL "Water, City, Mountain")
  ("parkingType" NIL "Off-street") ("heatingSources" NIL "Gas")
  ("heatingSystem" NIL "Forced air")
  ("rooms" NIL
   "Laundry room, Walk-in closet, Master bath, Office, Dining room, Family room, Breakfast nook"))
 ("neighborhood" NIL "Queen Anne") ("schoolDistrict" NIL "Seattle")
 ("elementarySchool" NIL "John Hay") ("middleSchool" NIL "McClure"))
CL-USER>
````

### GetRegionChildren API
https://www.zillow.com/howto/api/GetRegionChildren.htm

````
CL-USER> (zillow::get-region-children "your-zwsid" :state "wa" :city "seattle" :childtype "neighborhood")
(("region" NIL ("id" NIL "16037") ("latitude" NIL "47.614848")
  ("longitude" NIL "-122.33607"))
 ("subregiontype" NIL "neighborhood")
 ("list" NIL ("count" NIL "105")
  ("region" NIL ("id" NIL "250206") ("name" NIL "Capitol Hill")
   ("zindex" (("currency" "USD")) "415600")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Capitol-Hill/r_250206/")
   ("latitude" NIL "47.62622") ("longitude" NIL "-122.315979"))
  ("region" NIL ("id" NIL "272001") ("name" NIL "University District")
   ("zindex" (("currency" "USD")) "514200")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/University-District/r_272001/")
   ("latitude" NIL "47.660897") ("longitude" NIL "-122.305045"))
  ("region" NIL ("id" NIL "271990") ("name" NIL "Magnolia")
   ("zindex" (("currency" "USD")) "662000")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Magnolia/r_271990/")
   ("latitude" NIL "47.650943") ("longitude" NIL "-122.409136"))
  ("region" NIL ("id" NIL "250788") ("name" NIL "Greenwood")
   ("zindex" (("currency" "USD")) "421400")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Greenwood/r_250788/")
   ("latitude" NIL "47.694203") ("longitude" NIL "-122.355281"))
  ("region" NIL ("id" NIL "252248") ("name" NIL "Wallingford")
   ("zindex" (("currency" "USD")) "608500")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Wallingford/r_252248/")
   ("latitude" NIL "47.658763") ("longitude" NIL "-122.334464"))
  ("region" NIL ("id" NIL "250050") ("name" NIL "Beacon Hill")
   ("zindex" (("currency" "USD")) "361900")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Beacon-Hill/r_250050/")
   ("latitude" NIL "47.556114") ("longitude" NIL "-122.302828"))
  ("region" NIL ("id" NIL "250692") ("name" NIL "Fremont")
   ("zindex" (("currency" "USD")) "505400")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Fremont/r_250692/")
   ("latitude" NIL "47.656187") ("longitude" NIL "-122.352184"))
  ("region" NIL ("id" NIL "344019") ("name" NIL "Admiral")
   ("zindex" (("currency" "USD")) "530100")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Admiral/r_344019/")
   ("latitude" NIL "47.581725") ("longitude" NIL "-122.387362"))
  ("region" NIL ("id" NIL "251709") ("name" NIL "Ravenna")
   ("zindex" (("currency" "USD")) "573300")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Ravenna/r_251709/")
   ("latitude" NIL "47.675777") ("longitude" NIL "-122.301115"))
  ("region" NIL ("id" NIL "271869") ("name" NIL "First Hill")
   ("zindex" (("currency" "USD")) "296000")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/First-Hill/r_271869/")
   ("latitude" NIL "47.60819") ("longitude" NIL "-122.323829"))
  ("region" NIL ("id" NIL "271932") ("name" NIL "North Beacon Hill")
   ("zindex" (("currency" "USD")) "400900")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/North-Beacon-Hill/r_271932/")
   ("latitude" NIL "47.578054") ("longitude" NIL "-122.308873"))
  ("region" NIL ("id" NIL "271942") ("name" NIL "North Queen Anne")
   ("zindex" (("currency" "USD")) "658000")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/North-Queen-Anne/r_271942/")
   ("latitude" NIL "47.649291") ("longitude" NIL "-122.36301"))
  ("region" NIL ("id" NIL "344000") ("name" NIL "Maple Leaf")
   ("zindex" (("currency" "USD")) "468500")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Maple-Leaf/r_344000/")
   ("latitude" NIL "47.695035") ("longitude" NIL "-122.316628"))
  ("region" NIL ("id" NIL "271961") ("name" NIL "Phinney Ridge")
   ("zindex" (("currency" "USD")) "586600")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Phinney-Ridge/r_271961/")
   ("latitude" NIL "47.672704") ("longitude" NIL "-122.355277"))
  ("region" NIL ("id" NIL "271808") ("name" NIL "Belltown")
   ("zindex" (("currency" "USD")) "376700")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Belltown/r_271808/")
   ("latitude" NIL "47.614592") ("longitude" NIL "-122.348464"))
  ("region" NIL ("id" NIL "250780") ("name" NIL "Green Lake")
   ("zindex" (("currency" "USD")) "573500")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Green-Lake/r_250780/")
   ("latitude" NIL "47.679959") ("longitude" NIL "-122.333709"))
  ("region" NIL ("id" NIL "271814") ("name" NIL "Bitter Lake")
   ("zindex" (("currency" "USD")) "363500")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Bitter-Lake/r_271814/")
   ("latitude" NIL "47.719625") ("longitude" NIL "-122.35012"))
  ("region" NIL ("id" NIL "271921") ("name" NIL "Minor")
   ("zindex" (("currency" "USD")) "450500")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Minor/r_271921/")
   ("latitude" NIL "47.609068") ("longitude" NIL "-122.309629"))
  ("region" NIL ("id" NIL "271819") ("name" NIL "Broadview")
   ("zindex" (("currency" "USD")) "518100")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Broadview/r_271819/")
   ("latitude" NIL "47.719649") ("longitude" NIL "-122.368414"))
  ("region" NIL ("id" NIL "250017") ("name" NIL "Ballard")
   ("zindex" (("currency" "USD")) "397200")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Ballard/r_250017/")
   ("latitude" NIL "47.668328") ("longitude" NIL "-122.387233"))
  ("region" NIL ("id" NIL "250801") ("name" NIL "Haller Lake")
   ("zindex" (("currency" "USD")) "368700")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Haller-Lake/r_250801/")
   ("latitude" NIL "47.719604") ("longitude" NIL "-122.334753"))
  ("region" NIL ("id" NIL "343999") ("name" NIL "North College Park")
   ("zindex" (("currency" "USD")) "388200")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/North-College-Park/r_343999/")
   ("latitude" NIL "47.699483") ("longitude" NIL "-122.336865"))
  ("region" NIL ("id" NIL "250146") ("name" NIL "Brighton")
   ("zindex" (("currency" "USD")) "324700")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Brighton/r_250146/")
   ("latitude" NIL "47.538786") ("longitude" NIL "-122.275961"))
  ("region" NIL ("id" NIL "344001") ("name" NIL "Wedgwood")
   ("zindex" (("currency" "USD")) "523700")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Wedgwood/r_344001/")
   ("latitude" NIL "47.690136") ("longitude" NIL "-122.293779"))
  ("region" NIL ("id" NIL "251170") ("name" NIL "Loyal Heights")
   ("zindex" (("currency" "USD")) "522500")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Loyal-Heights/r_251170/")
   ("latitude" NIL "47.683235") ("longitude" NIL "-122.384852"))
  ("region" NIL ("id" NIL "271839") ("name" NIL "Columbia City")
   ("zindex" (("currency" "USD")) "379000")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Columbia-City/r_271839/")
   ("latitude" NIL "47.5648") ("longitude" NIL "-122.286003"))
  ("region" NIL ("id" NIL "344008") ("name" NIL "West Woodland")
   ("zindex" (("currency" "USD")) "485800")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/West-Woodland/r_344008/")
   ("latitude" NIL "47.666069") ("longitude" NIL "-122.368621"))
  ("region" NIL ("id" NIL "271957") ("name" NIL "Olympic Hills")
   ("zindex" (("currency" "USD")) "365200")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Olympic-Hills/r_271957/")
   ("latitude" NIL "47.726604") ("longitude" NIL "-122.302454"))
  ("region" NIL ("id" NIL "271856") ("name" NIL "East Queen Anne")
   ("zindex" (("currency" "USD")) "667300")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/East-Queen-Anne/r_271856/")
   ("latitude" NIL "47.637701") ("longitude" NIL "-122.350191"))
  ("region" NIL ("id" NIL "271849") ("name" NIL "Downtown")
   ("zindex" (("currency" "USD")) "563000")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Downtown/r_271849/")
   ("latitude" NIL "47.607346") ("longitude" NIL "-122.335089"))
  ("region" NIL ("id" NIL "344033") ("name" NIL "High Point")
   ("zindex" (("currency" "USD")) "322800")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/High-Point/r_344033/")
   ("latitude" NIL "47.543744") ("longitude" NIL "-122.368502"))
  ("region" NIL ("id" NIL "343997") ("name" NIL "Alki")
   ("zindex" (("currency" "USD")) "568600")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Alki/r_343997/")
   ("latitude" NIL "47.576466") ("longitude" NIL "-122.398842"))
  ("region" NIL ("id" NIL "344029") ("name" NIL "Highland Park")
   ("zindex" (("currency" "USD")) "287200")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Highland-Park/r_344029/")
   ("latitude" NIL "47.527126") ("longitude" NIL "-122.341404"))
  ("region" NIL ("id" NIL "344022") ("name" NIL "Gatewood")
   ("zindex" (("currency" "USD")) "446800")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Gatewood/r_344022/")
   ("latitude" NIL "47.537448") ("longitude" NIL "-122.387363"))
  ("region" NIL ("id" NIL "251704") ("name" NIL "Rainier Beach")
   ("zindex" (("currency" "USD")) "296000")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Rainier-Beach/r_251704/")
   ("latitude" NIL "47.511649") ("longitude" NIL "-122.257974"))
  ("region" NIL ("id" NIL "272018") ("name" NIL "West Queen Anne")
   ("zindex" (("currency" "USD")) "703100")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/West-Queen-Anne/r_272018/")
   ("latitude" NIL "47.633342") ("longitude" NIL "-122.366405"))
  ("region" NIL ("id" NIL "344031") ("name" NIL "South Delridge")
   ("zindex" (("currency" "USD")) "268000")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/South-Delridge/r_344031/")
   ("latitude" NIL "47.52674") ("longitude" NIL "-122.361155"))
  ("region" NIL ("id" NIL "252056") ("name" NIL "Sunset Hill")
   ("zindex" (("currency" "USD")) "612800")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Sunset-Hill/r_252056/")
   ("latitude" NIL "47.678316") ("longitude" NIL "-122.402016"))
  ("region" NIL ("id" NIL "344020") ("name" NIL "Junction")
   ("zindex" (("currency" "USD")) "458300")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Junction/r_344020/")
   ("latitude" NIL "47.564801") ("longitude" NIL "-122.38521"))
  ("region" NIL ("id" NIL "343993") ("name" NIL "Pinehurst")
   ("zindex" (("currency" "USD")) "365100")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Pinehurst/r_343993/")
   ("latitude" NIL "47.723129") ("longitude" NIL "-122.320343"))
  ("region" NIL ("id" NIL "271913") ("name" NIL "Matthews Beach")
   ("zindex" (("currency" "USD")) "556700")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Matthews-Beach/r_271913/")
   ("latitude" NIL "47.703815") ("longitude" NIL "-122.279031"))
  ("region" NIL ("id" NIL "271906") ("name" NIL "Lower Queen Anne")
   ("zindex" (("currency" "USD")) "449200")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Lower-Queen-Anne/r_271906/")
   ("latitude" NIL "47.628861") ("longitude" NIL "-122.354041"))
  ("region" NIL ("id" NIL "250478") ("name" NIL "Dunlap")
   ("zindex" (("currency" "USD")) "277100")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Dunlap/r_250478/")
   ("latitude" NIL "47.525357") ("longitude" NIL "-122.270274"))
  ("region" NIL ("id" NIL "344021") ("name" NIL "Fairmount Park")
   ("zindex" (("currency" "USD")) "424900")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Fairmount-Park/r_344021/")
   ("latitude" NIL "47.555062") ("longitude" NIL "-122.379868"))
  ("region" NIL ("id" NIL "344024") ("name" NIL "Arbor Heights")
   ("zindex" (("currency" "USD")) "385500")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Arbor-Heights/r_344024/")
   ("latitude" NIL "47.506979") ("longitude" NIL "-122.381278"))
  ("region" NIL ("id" NIL "344003") ("name" NIL "Bryant")
   ("zindex" (("currency" "USD")) "569300")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Bryant/r_344003/")
   ("latitude" NIL "47.672037") ("longitude" NIL "-122.286168"))
  ("region" NIL ("id" NIL "272005") ("name" NIL "Victory Heights")
   ("zindex" (("currency" "USD")) "422200")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Victory-Heights/r_272005/")
   ("latitude" NIL "47.709842") ("longitude" NIL "-122.303948"))
  ("region" NIL ("id" NIL "271831") ("name" NIL "Cedar Park")
   ("zindex" (("currency" "USD")) "432200")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Cedar-Park/r_271831/")
   ("latitude" NIL "47.724628") ("longitude" NIL "-122.287479"))
  ("region" NIL ("id" NIL "252336") ("name" NIL "Whittier Heights")
   ("zindex" (("currency" "USD")) "524800")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Whittier-Heights/r_252336/")
   ("latitude" NIL "47.683314") ("longitude" NIL "-122.371424"))
  ("region" NIL ("id" NIL "250150") ("name" NIL "Broadway")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Broadway/r_250150/")
   ("latitude" NIL "47.62622") ("longitude" NIL "-122.321452"))
  ("region" NIL ("id" NIL "344002") ("name" NIL "Roosevelt")
   ("zindex" (("currency" "USD")) "532800")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Roosevelt/r_344002/")
   ("latitude" NIL "47.680657") ("longitude" NIL "-122.313832"))
  ("region" NIL ("id" NIL "343994") ("name" NIL "South Beacon Hill")
   ("zindex" (("currency" "USD")) "319100")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/South-Beacon-Hill/r_343994/")
   ("latitude" NIL "47.524379") ("longitude" NIL "-122.289554"))
  ("region" NIL ("id" NIL "251100") ("name" NIL "Laurelhurst")
   ("zindex" (("currency" "USD")) "1070400")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Laurelhurst/r_251100/")
   ("latitude" NIL "47.658207") ("longitude" NIL "-122.278598"))
  ("region" NIL ("id" NIL "344030") ("name" NIL "Roxhill")
   ("zindex" (("currency" "USD")) "324300")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Roxhill/r_344030/")
   ("latitude" NIL "47.527392") ("longitude" NIL "-122.370661"))
  ("region" NIL ("id" NIL "344023") ("name" NIL "Fauntleroy")
   ("zindex" (("currency" "USD")) "535900")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Fauntleroy/r_344023/")
   ("latitude" NIL "47.522217") ("longitude" NIL "-122.389197"))
  ("region" NIL ("id" NIL "271857") ("name" NIL "Eastlake")
   ("zindex" (("currency" "USD")) "428400")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Eastlake/r_271857/")
   ("latitude" NIL "47.643806") ("longitude" NIL "-122.326777"))
  ("region" NIL ("id" NIL "251971") ("name" NIL "South Park")
   ("zindex" (("currency" "USD")) "253300")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/South-Park/r_251971/")
   ("latitude" NIL "47.52986") ("longitude" NIL "-122.321972"))
  ("region" NIL ("id" NIL "250939") ("name" NIL "Interbay")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Interbay/r_250939/")
   ("latitude" NIL "47.64247") ("longitude" NIL "-122.379722"))
  ("region" NIL ("id" NIL "344010") ("name" NIL "Uptown")
   ("zindex" (("currency" "USD")) "314200")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Uptown/r_344010/")
   ("latitude" NIL "47.622282") ("longitude" NIL "-122.354226"))
  ("region" NIL ("id" NIL "250889") ("name" NIL "Holly Park")
   ("zindex" (("currency" "USD")) "305500")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Holly-Park/r_250889/")
   ("latitude" NIL "47.53795") ("longitude" NIL "-122.288786"))
  ("region" NIL ("id" NIL "343996") ("name" NIL "View Ridge")
   ("zindex" (("currency" "USD")) "656000")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/View-Ridge/r_343996/")
   ("latitude" NIL "47.683937") ("longitude" NIL "-122.27431"))
  ("region" NIL ("id" NIL "251187") ("name" NIL "Madrona")
   ("zindex" (("currency" "USD")) "695800")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Madrona/r_251187/")
   ("latitude" NIL "47.61269") ("longitude" NIL "-122.288998"))
  ("region" NIL ("id" NIL "344027") ("name" NIL "Rainier View")
   ("zindex" (("currency" "USD")) "243200")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Rainier-View/r_344027/")
   ("latitude" NIL "47.500983") ("longitude" NIL "-122.256076"))
  ("region" NIL ("id" NIL "56654") ("name" NIL "Seaview")
   ("zindex" (("currency" "USD")) "470700")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Seaview/r_56654/")
   ("latitude" NIL "47.550757") ("longitude" NIL "-122.395767"))
  ("region" NIL ("id" NIL "272022") ("name" NIL "Westlake")
   ("zindex" (("currency" "USD")) "406900")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Westlake/r_272022/")
   ("latitude" NIL "47.636611") ("longitude" NIL "-122.342938"))
  ("region" NIL ("id" NIL "344032") ("name" NIL "North Delridge")
   ("zindex" (("currency" "USD")) "325500")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/North-Delridge/r_344032/")
   ("latitude" NIL "47.562584") ("longitude" NIL "-122.363922"))
  ("region" NIL ("id" NIL "344012") ("name" NIL "Madison Valley")
   ("zindex" (("currency" "USD")) "571800")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Madison-Valley/r_344012/")
   ("latitude" NIL "47.626805") ("longitude" NIL "-122.294018"))
  ("region" NIL ("id" NIL "271901") ("name" NIL "Leschi")
   ("zindex" (("currency" "USD")) "624600")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Leschi/r_271901/")
   ("latitude" NIL "47.599748") ("longitude" NIL "-122.290462"))
  ("region" NIL ("id" NIL "344025") ("name" NIL "Hillman City")
   ("zindex" (("currency" "USD")) "344500")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Hillman-City/r_344025/")
   ("latitude" NIL "47.549944") ("longitude" NIL "-122.281019"))
  ("region" NIL ("id" NIL "271915") ("name" NIL "Meadowbrook")
   ("zindex" (("currency" "USD")) "439700")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Meadowbrook/r_271915/")
   ("latitude" NIL "47.7065") ("longitude" NIL "-122.298032"))
  ("region" NIL ("id" NIL "344034") ("name" NIL "Riverview")
   ("zindex" (("currency" "USD")) "325300")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Riverview/r_344034/")
   ("latitude" NIL "47.546367") ("longitude" NIL "-122.35274"))
  ("region" NIL ("id" NIL "344015") ("name" NIL "Judkins Park")
   ("zindex" (("currency" "USD")) "388900")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Judkins-Park/r_344015/")
   ("latitude" NIL "47.596023") ("longitude" NIL "-122.301549"))
  ("region" NIL ("id" NIL "343998") ("name" NIL "Northgate")
   ("zindex" (("currency" "USD")) "234300")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Northgate/r_343998/")
   ("latitude" NIL "47.707712") ("longitude" NIL "-122.321105"))
  ("region" NIL ("id" NIL "271923") ("name" NIL "Montlake")
   ("zindex" (("currency" "USD")) "829800")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Montlake/r_271923/")
   ("latitude" NIL "47.64087") ("longitude" NIL "-122.308456"))
  ("region" NIL ("id" NIL "271893") ("name" NIL "International District")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/International-District/r_271893/")
   ("latitude" NIL "47.596945") ("longitude" NIL "-122.324714"))
  ("region" NIL ("id" NIL "343995") ("name" NIL "Denny Triangle")
   ("zindex" (("currency" "USD")) "474400")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Denny-Triangle/r_343995/")
   ("latitude" NIL "47.615618") ("longitude" NIL "-122.337897"))
  ("region" NIL ("id" NIL "271900") ("name" NIL "Lawton Park")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Lawton-Park/r_271900/")
   ("latitude" NIL "47.659379") ("longitude" NIL "-122.409136"))
  ("region" NIL ("id" NIL "344028") ("name" NIL "Mt. Baker")
   ("zindex" (("currency" "USD")) "665200")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Mt.-Baker/r_344028/")
   ("latitude" NIL "47.581626") ("longitude" NIL "-122.289299"))
  ("region" NIL ("id" NIL "250383") ("name" NIL "Crown Hill")
   ("zindex" (("currency" "USD")) "422100")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Crown-Hill/r_250383/")
   ("latitude" NIL "47.696053") ("longitude" NIL "-122.371382"))
  ("region" NIL ("id" NIL "251076") ("name" NIL "Lakewood")
   ("zindex" (("currency" "USD")) "493700")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Lakewood/r_251076/")
   ("latitude" NIL "47.559577") ("longitude" NIL "-122.266503"))
  ("region" NIL ("id" NIL "344009") ("name" NIL "North Beach")
   ("zindex" (("currency" "USD")) "635800")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/North-Beach/r_344009/")
   ("latitude" NIL "47.696701") ("longitude" NIL "-122.397188"))
  ("region" NIL ("id" NIL "271987") ("name" NIL "South Lake Union")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/South-Lake-Union/r_271987/")
   ("latitude" NIL "47.62908") ("longitude" NIL "-122.33685"))
  ("region" NIL ("id" NIL "271892") ("name" NIL "Industrial District")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Industrial-District/r_271892/")
   ("latitude" NIL "47.566395") ("longitude" NIL "-122.347363"))
  ("region" NIL ("id" NIL "344026") ("name" NIL "Genesee")
   ("zindex" (("currency" "USD")) "473000")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Genesee/r_344026/")
   ("latitude" NIL "47.568959") ("longitude" NIL "-122.282714"))
  ("region" NIL ("id" NIL "344014") ("name" NIL "Mann")
   ("zindex" (("currency" "USD")) "468300")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Mann/r_344014/")
   ("latitude" NIL "47.610285") ("longitude" NIL "-122.299434"))
  ("region" NIL ("id" NIL "271977") ("name" NIL "Seward Park")
   ("zindex" (("currency" "USD")) "590400")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Seward-Park/r_271977/")
   ("latitude" NIL "47.547011") ("longitude" NIL "-122.259808"))
  ("region" NIL ("id" NIL "344005") ("name" NIL "Olympic Manor")
   ("zindex" (("currency" "USD")) "667800")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Olympic-Manor/r_344005/")
   ("latitude" NIL "47.696054") ("longitude" NIL "-122.382179"))
  ("region" NIL ("id" NIL "271815") ("name" NIL "Briarcliff")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Briarcliff/r_271815/")
   ("latitude" NIL "47.642578") ("longitude" NIL "-122.408081"))
  ("region" NIL ("id" NIL "251186") ("name" NIL "Madison Park")
   ("zindex" (("currency" "USD")) "988600")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Madison-Park/r_251186/")
   ("latitude" NIL "47.632468") ("longitude" NIL "-122.284761"))
  ("region" NIL ("id" NIL "250714") ("name" NIL "Georgetown")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Georgetown/r_250714/")
   ("latitude" NIL "47.540345") ("longitude" NIL "-122.316845"))
  ("region" NIL ("id" NIL "271964") ("name" NIL "Portage Bay")
   ("zindex" (("currency" "USD")) "778300")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Portage-Bay/r_271964/")
   ("latitude" NIL "47.647441") ("longitude" NIL "-122.318551"))
  ("region" NIL ("id" NIL "250149") ("name" NIL "Broadmoor")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Broadmoor/r_250149/")
   ("latitude" NIL "47.637395") ("longitude" NIL "-122.290642"))
  ("region" NIL ("id" NIL "344004") ("name" NIL "Hawthorne Hills")
   ("zindex" (("currency" "USD")) "704300")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Hawthorne-Hills/r_344004/")
   ("latitude" NIL "47.671893") ("longitude" NIL "-122.271548"))
  ("region" NIL ("id" NIL "344006") ("name" NIL "Blue Ridge")
   ("zindex" (("currency" "USD")) "644100")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Blue-Ridge/r_344006/")
   ("latitude" NIL "47.704509") ("longitude" NIL "-122.372944"))
  ("region" NIL ("id" NIL "344018") ("name" NIL "Waterfront")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Waterfront/r_344018/")
   ("latitude" NIL "47.605507") ("longitude" NIL "-122.34804"))
  ("region" NIL ("id" NIL "252396") ("name" NIL "Yesler Terrace")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Yesler-Terrace/r_252396/")
   ("latitude" NIL "47.602124") ("longitude" NIL "-122.320733"))
  ("region" NIL ("id" NIL "344017") ("name" NIL "Little Saigon")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Little-Saigon/r_344017/")
   ("latitude" NIL "47.595204") ("longitude" NIL "-122.314853"))
  ("region" NIL ("id" NIL "272026") ("name" NIL "Windermere")
   ("zindex" (("currency" "USD")) "967300")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Windermere/r_272026/")
   ("latitude" NIL "47.670199") ("longitude" NIL "-122.262975"))
  ("region" NIL ("id" NIL "271804") ("name" NIL "Atlantic")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Atlantic/r_271804/")
   ("latitude" NIL "47.583337") ("longitude" NIL "-122.301715"))
  ("region" NIL ("id" NIL "344007") ("name" NIL "Woodland")
   ("url" NIL "http://www.zillow.com/local-info/WA-Seattle/Woodland/r_344007/")
   ("latitude" NIL "47.670466") ("longitude" NIL "-122.347197"))
  ("region" NIL ("id" NIL "344016") ("name" NIL "Jackson Place")
   ("zindex" (("currency" "USD")) "375800")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Jackson-Place/r_344016/")
   ("latitude" NIL "47.594793") ("longitude" NIL "-122.3102"))
  ("region" NIL ("id" NIL "271975") ("name" NIL "Sand Point")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Sand-Point/r_271975/")
   ("latitude" NIL "47.681855") ("longitude" NIL "-122.25644"))
  ("region" NIL ("id" NIL "344011") ("name" NIL "Denny - Blaine")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Denny----Blaine/r_344011/")
   ("latitude" NIL "47.617122") ("longitude" NIL "-122.284957"))
  ("region" NIL ("id" NIL "271963") ("name" NIL "Pioneer Square")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Pioneer-Square/r_271963/")
   ("latitude" NIL "47.597829") ("longitude" NIL "-122.332927"))
  ("region" NIL ("id" NIL "271886") ("name" NIL "Harbor Island")
   ("url" NIL
    "http://www.zillow.com/local-info/WA-Seattle/Harbor-Island/r_271886/")
   ("latitude" NIL "47.579899") ("longitude" NIL "-122.352042"))))
CL-USER>
````

If you make an invalid request, if the Zillow server is having problems, or if there's no valid data found, an alist with the key 'error' is returned. Returned errors are documented on each API call's respective documentation page (linked above):

````
CL-USER> (zillow::get-comps "your-zwsid" :zpid 84074482 :count 5)
("error" ("text" NIL "Error: no comps for the specified property were found")
 ("code" NIL "504"))
CL-USER>
````
