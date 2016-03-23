class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :code
      t.string :instructor
      t.time :stime
      t.time :etime
      t.string :days
      t.string :venue

      t.timestamps null: false
    end
  end
end
