DEVELOPMENT TASKS 
=================

The goal is to reach the production cl-production application source code, transacting middle-ware (simple REST calls gets and posts, really at miniumum current)...

I want this to be finished.  So here’s what needs to happen and I will try to work in a branch model with git and keep an active repo maintained on this until I finish.


craigslist-ads
--------------
http://jobs.spclops.com/craigslist_ads

This works well right now for minimum viability.

## Purpose
* Holds ads pushed into system from `index.rb` on initial crawling.

craigslist-contents
-------------------

## Purpose
* Holds fulltext content of craigslist_ad instance 

## State Flow
* Populated (row is created) on an afterSave() or event trigger after craigslist_ads insertation.

## Enhancement
* Use nokogiri’s html5 parser with the google html5 dom parser which I think I have locally.  The output is beautiful.  Also can be via php.

This needs to support input of:
* post_id [string or int but in model require validation on it being numeric.]
* post_create_date [date]
* post_create_time [time] 

* post_lastchange [datetime]
* post_lastchange_date [date]
* post_lastchange_time [time]

* system_lastcheck [datetime]
* system_lastcheck_date [date]
* system_lastcheck_time [time]
