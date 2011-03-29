require 'rubygems'
require 'sinatra'
require 'rforce'



  get '/' do

        haml :contact
    end
    
    
	post '/' do
		     # name = params[:name]
		      name = params[:name]
		      lname = params[:lname]
		      email= params[:email]
		      phone = params[:phone]
		      aux = params[:aux]
		      
		      
		      
		      puts "nombre:" + "#{name}"
		      puts "apellido:" + "#{lname}"
		      puts "email:" + "#{email}"
		      puts "telefono:" + "#{phone}"
		      puts "aux:" + "#{aux}"
		      
		      
				  binding = RForce::Binding.new \
     'https://www.salesforce.com/services/Soap/u/20.0'

   				binding.login \
     'admin@afd.co.cr', 'company12gzo99WBuTeLiA9cVY2lKUfNl0'
   
     			cliente = [
                    :type,      'Candidato__c',
                    :name,      "#{name}",
                    :Apellidos__c,      "#{lname}",
                    :Correo_Electronico__c,      "#{email}",
                    :Telefono__c,      "#{phone}",
                    :Descripcion__c,      "#{aux}",
                    :Empresa_c__c, "AFD Costa Rica"
                   ]

     			binding.create :sObject => cliente		      

		      haml :exito
		  end

    get '/alt' do

        haml :contact
    end
    
    
		post '/alt' do
		     # name = params[:name]
		      name = params[:name]
		      lname = params[:lname]
		      email= params[:email]
		      phone = params[:phone]
		      aux = params[:aux]
		      
		      
		      
		      puts "nombre:" + "#{name}"
		      puts "apellido:" + "#{lname}"
		      puts "email:" + "#{email}"
		      puts "telefono:" + "#{phone}"
		      puts "aux:" + "#{aux}"
		      
		      
				  binding = RForce::Binding.new \
     'https://www.salesforce.com/services/Soap/u/20.0'

   				binding.login \
     'admin@afd.co.cr', 'company12gzo99WBuTeLiA9cVY2lKUfNl0'
   
     			cliente = [
                    :type,      'Candidato__c',
                    :name,      "#{name}",
                    :Apellidos__c,      "#{lname}",
                    :Correo_Electronico__c,      "#{email}",
                    :Telefono__c,      "#{phone}",
                    :Descripcion__c,      "#{aux}",
                    :Empresa_c__c, "AlternativaCR"
                   ]

     			binding.create :sObject => cliente		      

		      haml :exito
		  end
