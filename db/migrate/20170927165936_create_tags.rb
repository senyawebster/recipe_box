class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table(:tags) do |t|
      t.column(:food_type, :string)
    end
  end
end
