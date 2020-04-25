class Marketing
  def self.matches?(request)
    request.subdomain.blank? || request.subdomain == 'www'
  end
end

Rails.application.routes.draw do
  # roadze.io || www.roadze.io
  constraints(Marketing) do
    root 'marketing#home'
    get 'features', to: 'marketing#features'
    get 'contact', to: 'marketing#contact'
    get 'pricing', to: 'marketing#pricing'
  end
end
