class CreateTypes < ActiveRecord::Migration
	def change
		create_table :types do |t|
			t.string :name, :null => false
			t.timestamps
		end
		Type.create name: 'Residencial'
		Type.create name: 'Comercial'
		Type.create name: 'Misto'
		Type.create name: 'Educacional'
	end
end
