require 'sinatra'
require 'rubygems'
require 'rforce'

get '/' do
  
  binding = RForce::Binding.new \
     'https://www.salesforce.com/services/Soap/u/20.0'

   binding.login \
     'google@incompanysolutions.com', 'company2011'
  
  
     opportunity = [
                    :type,      'Clientes__c',

                    :name,      'Fakey McFakerson'
                   ]

     binding.create :sObject => opportunity
  
  
haml :index
end