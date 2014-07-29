cl-production
=============

# USAGE

command line usage
------------------

ruby index.rb ‘[query]’ site

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


