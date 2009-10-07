class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :type
      t.string    :email
      t.string    :crypted_password
      t.string    :password_salt
      t.string    :state
      t.references :account
      t.string    :persistence_token,   :null => false                
      t.string    :single_access_token, :null => false               
      t.string    :perishable_token,    :null => false              
      t.integer   :login_count,         :null => false, :default => 0
      t.integer   :failed_login_count,  :null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip

      t.timestamps
    end

    add_index :users, :email
    add_index :users, [:account_id, :state]
  end

  def self.down
    drop_table :users
  end
end