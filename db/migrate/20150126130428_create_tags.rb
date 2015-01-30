class CreateTags < ActiveRecord::Migration
	def change
		create_table :tags do |t|
			t.string :name, :null => false
			t.string :class_name, :null => false
			
			t.timestamps
		end
		Tag.create name: 'Planejamento', class_name: 'planejamento'
		Tag.create name: 'Canteiro', class_name: 'canteiro'
		Tag.create name: 'Acompanhamento', class_name: 'acompanhamento'
	end
end
