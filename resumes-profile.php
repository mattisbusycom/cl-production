<?php
/**
 * crawl, crawlcity, city, term
 */

$query = "cakephp";
$cities = ["newyork", "sfbay", "losangeles", "chicago", "austin"];

// --> Crawl
foreach ($cities as $key => $city) {

    // Crawl hasAndBelongsToMany City
    // --> City hasAndBelongsToMany Crawl
    $_base = "http://".$city.".craigslist.org/search/jjj?";
      // Get Terms from CrawlCity (crawls_cities) [id, crawl_id, city_id]
      // -->
      //   CrawlCity hasMany Term
      //   Term      belongsTo CrawlCity

    $terms = array('wordpress', 'magento', 'cakephp');

    foreach ($terms as $term)
    {
        $_pattern = "query=".$term."&zoomToPosting=&srchType=A";

        $url = "".$_base."".$_pattern."";

        echo $url;
        echo "\n";
    }
}
