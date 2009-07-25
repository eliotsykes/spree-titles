= Titles
[http://github.com/eliotsykes/spree-titles]

This extension replaces the general Spree title with accurate titles.

How to install:
1. Install from github or using Spree's extension installation script
2. In the preferences table or in your own site extension, specify a value
   for the :default_title preference for what you want the default
   page title to be.  This will be used on the home page (and maybe the 
   /products listing page).
   
   To specify :default_title in your site extension, add these 3 lines inside
   the activate method:
   
   AppConfiguration.class_eval do
     preference :default_title, :string, :default => 'Your default title here'
   end
   
NOTE:
This extension relies on using the title and default_title methods introduced
in Edge Spree in mid-July 2009.  If you want to take advantage of this extension
ensure you have a version of Spree that contains these methods.  Your application
layout template (application.html.erb) will need to use the following code
between the <title> tags: <%= title %>

Feedback and contributions welcome, Eliot Sykes [http://github.com/eliotsykes]
