class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :roll_num
      t.string :course
      t.integer :marks

      t.timestamps null: false
    end
  end
end
