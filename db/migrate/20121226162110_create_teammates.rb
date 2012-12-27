class CreateTeammates < ActiveRecord::Migration
  def change
    create_table :teammates do |t|
      t.string :fullname
      t.text :bio
      t.string :twitter
      t.string :facebook
      t.string :linkedin

      t.timestamps
    end
  end
end
