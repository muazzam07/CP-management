class CreateAuditoria < ActiveRecord::Migration
  def change
    create_table :auditoria do |t|
      t.string :name
      t.string :seat
      t.string :roll_num
      t.string :course

      t.timestamps null: false
    end
  end
end
