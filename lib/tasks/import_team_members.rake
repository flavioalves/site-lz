 # encoding: utf-8
task :import_team_members => :environment do
	# Joao
	team_member = TeamMember.new
	team_member.name = 'João Carlos Bandeira de Mello Laterza'
	team_member.bio = 'Engenheiro civil pela Escola Politécnica da Universidade de São Paulo. Mais de 30 anos de experiência e atuação na área de gerenciamento e planejamento de obras. Fundador da LZ Planejamento em 2007.'
	team_member.linkedin_url = 'https://www.linkedin.com/pub/jo%C3%A3o-carlos-b-m-laterza/62/92b/802'
	# with a regular File object
	File.open("app/assets/images/socios/joca.png", "rb") do |file|
	  team_member.photo = file
	end
	team_member.save!

	# Alessio
	team_member = TeamMember.new
	team_member.name = 'Alessio Gallizio'
	team_member.bio = 'Arquiteto e urbanista pela Universidade de Brasília e mestre pelo Politécnico de Turim (Itália). Na LZ Planejamento desde 2011.'
	team_member.linkedin_url = 'https://www.linkedin.com/pub/alessio-gallizio/61/a76/b38'
	# with a regular File object
	File.open("app/assets/images/socios/alessio.png", "rb") do |file|
	  team_member.photo = file
	end
	team_member.save!

	# Bianca
	team_member = TeamMember.new
	team_member.name = 'Bianca de Almeida Cardoso'
	team_member.bio = 'Arquiteta e urbanista pelo Centro Universitário de Brasília, cursando MBA na Universidade de São Paulo. Na LZ Planejamento desde 2011.'
	team_member.linkedin_url = 'https://www.linkedin.com/in/biancaacardoso'
	# with a regular File object
	File.open("app/assets/images/socios/bianca.png", "rb") do |file|
	  team_member.photo = file
	end
	team_member.save!

	# Pamela
	team_member = TeamMember.new
	team_member.name = 'Pâmela Arrais Hodon'
	team_member.bio = 'Arquiteta e urbanista pelo Centro Universitário de Brasília. Na LZ Planejamento desde 2012.'
	team_member.linkedin_url = 'https://www.linkedin.com/pub/p%C3%A2mela-hodon/48/4b/935'
	# with a regular File object
	File.open("app/assets/images/socios/pamela.png", "rb") do |file|
	  team_member.photo = file
	end
	team_member.save!

	# joao augusto
	team_member = TeamMember.new
	team_member.name = 'João Augusto Pereira Júnior'
	team_member.bio = 'Arquiteto e urbanista pela Universidade de Brasília, mestrando pelo Politécnico de Turim (Itália). Na LZ Planejamento desde 2012.'
	team_member.linkedin_url = 'https://www.linkedin.com/pub/jo%C3%A3o-augusto-pereira-j%C3%BAnior/93/930/b36'
	# with a regular File object
	File.open("app/assets/images/socios/joao.png", "rb") do |file|
	  team_member.photo = file
	end
	team_member.save!

	# Felipe
	team_member = TeamMember.new
	team_member.name = 'Felipe Valadares Faim Carmona'
	team_member.bio = 'Engenheiro civil pela Universidade de Brasília. Na LZ Planejamento entre 2011-2012 retornando em 2014.'
	team_member.linkedin_url = 'https://br.linkedin.com/in/felipevfcarmona'
	# with a regular File object
	File.open("app/assets/images/socios/felipe.png", "rb") do |file|
	  team_member.photo = file
	end
	team_member.save!

	# Lea
	team_member = TeamMember.new
	team_member.name = 'Léa Ferreira Laterza'
	team_member.bio = 'Engenheira agrônoma pela Universidade de Brasília. Pós-graduação em auditoria e controle governamental pelo TCU. Mais de 30 anos de experiência em recursos humanos e auditoria de RH. Na LZ desde 2014.'
	team_member.linkedin_url = 'https://www.linkedin.com/pub/l%C3%A9a-ferreira-laterza/94/833/843'
	# with a regular File object
	File.open("app/assets/images/socios/lea.png", "rb") do |file|
	  team_member.photo = file
	end
	team_member.save!
end