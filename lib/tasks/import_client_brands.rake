 # encoding: utf-8
task :import_client_brands => :environment do
	client_directory_path = 'app/assets/images/clientes'
	Dir.foreach(client_directory_path) do |file_name|
		next if file_name == '.' or file_name == '..'
		client = Client.new
		client.name = file_name.split('.')[0]
		client.url = "http://colocarurlcliente.com.br"		
		File.open("#{client_directory_path}/#{file_name}", "rb") do |file|
		  client.brand = file
		end
		client.save!
	end
end