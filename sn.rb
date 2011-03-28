require 'rubygems'
require 'sinatra'
require 'rforce'

get '/' do
  
  binding = RForce::Binding.new \
     'https://www.salesforce.com/services/Soap/u/20.0'

   binding.login \
     'google@incompanysolutions.com', 'company2011xaOrhVbQrUzK82NTVmMxfTSoU'
  
  
     opportunity = [
                    :type,      'Clientes__c',

                    :name,      'Fulanito Apellido'
                   ]

     binding.create :sObject => opportunity
  
  
haml :index
end


