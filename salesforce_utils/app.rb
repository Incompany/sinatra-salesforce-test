require 'rubygems'
require 'sinatra'
require 'rforce'
gem 'rforce'

include RForce

#afd cr

def fetch_candidatos()


		#login
		      binding = RForce::Binding.new \
     'https://www.salesforce.com/services/Soap/u/20.0'

   				binding.login \
     'admin@afd.co.cr', 'company12YADanWugQZ6Elt5EZqLQIyWT'
  
				#fetch de datos al salesforce
				answer = binding.query  \
    :queryString =>
      'select id, name, Empresa_cliente__c, Apellidos__c, Puesto__c, Celular__c, Sector__c, Susbsector__c, Empresa_c__c, Correo_Electronico__c, Telefono__c, Fax__c, Otro_Asesor_Relacionado__c, Detallada__c, Calle__c, Ciudad__c, Estado_o_Provincia__c, Zip_Code__c, Pa_s__c, Numero_de_Empleados__c, Sitio_Web__c, Origen__c from Candidato__c'
      	
      	
      	name = ""
     #llenado del arreglo de hashes que contiene todo el fetch de informacion 	
     #con los mismos keys acá definidos debe extraerse la info del hash array
      	content_array = []
      	for i in 0..((((answer[:queryResponse])[:result])[:records]).length) -1 do
			  	#name = name + String(((((answer[:queryResponse])[:result])[:records])[i])[:Name]) + "\n" 
			  	content_array[i] = {"name" => ((((answer[:queryResponse])[:result])[:records])[i])[:Name],
			  		"Empresa_cliente" => ((((answer[:queryResponse])[:result])[:records])[i])[:Empresa_cliente__c],
			  		"Apellidos" => ((((answer[:queryResponse])[:result])[:records])[i])[:Apellidos__c],
			  		"Puesto" => ((((answer[:queryResponse])[:result])[:records])[i])[:Puesto__c],
			  		"Celular" => ((((answer[:queryResponse])[:result])[:records])[i])[:Celular__c],
			  		"Sector" => ((((answer[:queryResponse])[:result])[:records])[i])[:Sector__c],
			  		"Susbsector" => ((((answer[:queryResponse])[:result])[:records])[i])[:Susbsector__c],
			  		"Empresa_c" => ((((answer[:queryResponse])[:result])[:records])[i])[:Empresa__c],
			  		"Correo_Electronico" => ((((answer[:queryResponse])[:result])[:records])[i])[:Correo_Electronico__c],
			  		"Telefono" => ((((answer[:queryResponse])[:result])[:records])[i])[:Telefono__c],
			  		"Fax" => ((((answer[:queryResponse])[:result])[:records])[i])[:Fax__c],
			  		"Otro_Asesor_Relacionado" => ((((answer[:queryResponse])[:result])[:records])[i])[:Otro_Asesor_Relacionado__c],
			  		"Detallada" => ((((answer[:queryResponse])[:result])[:records])[i])[:Detallada__c],
			  		"Calle" => ((((answer[:queryResponse])[:result])[:records])[i])[:Calle__c],
			  		"Ciudad" => ((((answer[:queryResponse])[:result])[:records])[i])[:Ciudad__c],
			  		"Estado_o_Provincia" => ((((answer[:queryResponse])[:result])[:records])[i])[:Estado_o_Provincia__c],
			  		"Zip_Code" => ((((answer[:queryResponse])[:result])[:records])[i])[:Zip_Code__c],
			  		"Pa_s" => ((((answer[:queryResponse])[:result])[:records])[i])[:Pa_s__c],
			  		"Numero_de_Empleados" => ((((answer[:queryResponse])[:result])[:records])[i])[:Numero_de_Empleados__c],
			  		"Sitio_Web" => ((((answer[:queryResponse])[:result])[:records])[i])[:Sitio_Web__c],
			  		"Origen" => ((((answer[:queryResponse])[:result])[:records])[i])[:Origen__c]}
			  end			  
			  return content_array
			  #return name
      
end


def create_contact()
		      binding = RForce::Binding.new \
     'https://www.salesforce.com/services/Soap/u/20.0'

   				binding.login \
     'admin@afd.co.cr', 'company12YADanWugQZ6Elt5EZqLQIyWT'
     			cliente = [
                    :type,      'Candidato__c',
                    :name,      "#{name}",
                    :Apellidos__c,      "#{lname}",
                    :Correo_Electronico__c,      "#{email}",
                    :Telefono__c,      "#{phone}",
                    :Descripcion__c,      "#{aux}",
                    :Empresa_c__c, "AFD Panamá"
                   ]

     			binding.create :sObject => cliente		      
  
end

def create_cuenta()
		      binding = RForce::Binding.new \
     'https://www.salesforce.com/services/Soap/u/20.0'

   				binding.login \
     'admin@afd.co.cr', 'company12YADanWugQZ6Elt5EZqLQIyWT'
     			cliente = [
                    :type,      'Candidato__c',
                    :name,      "#{name}",
                    :Apellidos__c,      "#{lname}",
                    :Correo_Electronico__c,      "#{email}",
                    :Telefono__c,      "#{phone}",
                    :Descripcion__c,      "#{aux}",
                    :Empresa_c__c, "AFD Panamá"
                   ]

     			binding.create :sObject => cliente		      


end


	
#######################
	
	get '/' do

				hash_array = fetch_candidatos()
			  tamaño = hash_array.length
			  answer_keys = hash_array[0].keys()
			  for i in 0 ..tamaño - 1 do
			  	
			  end
			  #puts tamaño
			  #name = hash_array.inspect
			  #name = ""

			  #puts answer_keys.length
			  #puts name
			  #puts answer.class
			  #puts answer.inspect
			  
			 # puts (((answer[:queryResponse])[:result])[:records])
				

			  #id = answer[:id]
				#name = answer.searchResponse
				
				#obj = binding.describeSObject("Candidato__c")
				#name = :id
				#name.class
				haml :test, :locals => { :name => name }

    end
    
    
	post '/' do
				haml :test
	end
#######################
  
  
  
  get '/form' do

        haml :contact
    end
    
    
		post '/form' do
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
		      
		      #acceso al soap api del salesforce
		      binding = RForce::Binding.new \
     'https://www.salesforce.com/services/Soap/u/20.0'

   				binding.login \
     'admin@afd.co.cr', 'company12YADanWugQZ6Elt5EZqLQIyWT'
   
     			cliente = [
                    :type,      'Candidato__c',
                    :name,      "#{name}",
                    :Apellidos__c,      "#{lname}",
                    :Correo_Electronico__c,      "#{email}",
                    :Telefono__c,      "#{phone}",
                    :Descripcion__c,      "#{aux}",
                    :Empresa_c__c, "AFD Panamá"
                   ]

     			binding.create :sObject => cliente		      
					
					#redireccionamiento, en el haml declaro un javascript que redirecciona
		      haml :red1
		  end
