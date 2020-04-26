class MarketingController < ApplicationController
  def home
    @page_title       = 'Home'
    @page_description = 'roadze.io landing page'
    @page_keywords    = 'Roadze, Site, Homepage, Loadboard, Canada loadboard, Logistics, Trucking'
  end

  def features
    @page_title       = 'Features'
    @page_description = 'roadze.io features page'
    @page_keywords    = 'Roadze, Site, Features, Loadboard, Canada loadboard, Logistics, Trucking'
  end

  def contact
    @page_title       = 'Contact us'
    @page_description = 'roadze.io contact us page'
    @page_keywords    = 'Roadze, Site, Contact us, Loadboard, Canada loadboard, Logistics, Trucking'
  end

  def pricing
    @page_title       = 'Pricing'
    @page_description = 'roadze.io product pricing page'
    @page_keywords    = 'Roadze, Site, Pricing, Loadboard, Canada loadboard, Logistics, Trucking'
  end
end
