class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table   :addresses do |t|
      t.string     :postal,    default: "",null: false
      t.integer    :province_id,           null: false
      t.bigint     :phone,     limit: 11  ,null: false
      t.string     :city,      default: ""
      t.string     :street,    default: ""
      t.string     :building,  default: ""
      t.references :purchase,              null: false,foreign_key: true
      t.timestamps
    end
  end
end