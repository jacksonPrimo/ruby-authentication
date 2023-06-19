class CreateUserModel < ActiveRecord::Migration[7.0]
  def change
    create_table :user_models do |t|
      t.string :email
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
