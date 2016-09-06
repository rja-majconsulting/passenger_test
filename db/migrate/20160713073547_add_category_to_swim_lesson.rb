class AddCategoryToSwimLesson < ActiveRecord::Migration
  def change
    add_column :swim_lessons, :category, :string
  end
end
