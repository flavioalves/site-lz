class CreatePortfolioProjectTags < ActiveRecord::Migration
	def change
		create_table :portfolio_project_tags do |t|
			t.references :portfolio_project, index: true
			t.references :tag, index: true
			t.timestamps
		end
	end
end
