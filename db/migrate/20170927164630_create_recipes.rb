class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:tag_id, :integer)
      t.column(:ingredient_id, :integer)
      t.column(:instructions, :string)
      t.column(:rating, :integer)
    end
  end
end
