class CreateRefundedDrugs < ActiveRecord::Migration
  def change
    create_table :refunded_drugs do |t|
      t.string :active_substance
      t.string :drug_name
      t.string :package_content
      t.integer :ean_code
      t.date :effective_date
      t.integer :in_force_for
      t.text :limited_group
      t.float :official_selling_price
      t.float :gross_selling_price
      t.float :retail_price
      t.float :financing_limit
      t.text :indications_range
      t.text :other_indications
      t.integer :repayment_level
      t.float :payment_amount

      t.timestamps
    end
  end
end
