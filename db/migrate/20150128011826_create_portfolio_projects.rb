class CreatePortfolioProjects < ActiveRecord::Migration
  def change
    create_table :portfolio_projects do |t|
      t.string :name, :null => false
    	t.string :detail, :null => false
    	t.string :place, :null => false
    	t.float :area, :null => false
      t.references :client, index: true
      t.references :type, index: true
      t.string :slug, :null => false
      t.timestamps
    end
    add_index :portfolio_projects, :slug, :unique => true
  end
end
