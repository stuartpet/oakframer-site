class CreateSiteVisits < ActiveRecord::Migration[7.2]
  def change
    create_table :site_visits do |t|
      t.string :referrer
      t.string :user_agent
      t.string :ip_hash

      t.timestamps
    end
  end
end
