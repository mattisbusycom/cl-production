cl-production
=============

# USAGE

command line usage
------------------

## stage 1 
----------
ruby craigslist_ads.rb [query] [site] [iterator]

## stage 2
----------
craigslist_ads.rb

---
Model: CraigslistAd::beforeSave()

Model: CraigslistAd::afterSave() 
----

## stage 3
----------
craigslist_contents.rb

---
Model: CraigslistContent::beforeSave() 

Model:: CraigslistContent::afterSave() ---> pass off to new thread at *stage 4*

## stage 4 @refine @todo
craigslist_annotations.rb

---
Model: ClassiferAnnotation::beforeSave() --> created blank with a uuid and id of craigslist_contents row in database.  get content and pass to java socket process or CLI on tmpfs partition in sock file on scratch disk or ssd to read into java annotator program and load the classifiers for the content either one, two, three, four, five in same script; or conduct 1 thread with 4 sub processes or get a real job broker (sun grid engine/scheduler, open source?). @refine @todo

Model: ClassifierAnnotation::afterSave()
---

iterator
--------
page number of search result scrape for all results returned on single search query execution.

this value is initially collected on the first execution of a ‘search bucket’ and then this script 2) threads off X COUNT of remote threaded processes for each page to index into craigslist_ads table.

concurrency can be achived and however we may need to relay through a cluster of rotating cloud server haproxy ip’s and hosts to hit through delegated (to get http) into tor socks proxy interface to not be looked at as a problem.   @refine @todo

## query
OPERATION
    Query should (must if more than 1 word) be contained inside of single or double quotes.

NOTE: 
    Query should (or must; script does not currently encode into URL syntax) be URL string compatible (with htmlentities?).  In PHP, you do this on the string with urlencode(‘string’);

## sites
OPERATION
    site is the associated craigslist subdomain on the FQDN (craigslist.org).

EXAMPLES THAT WORK FOR SURE
    newyork
    sfbay
    chicago
    austin


