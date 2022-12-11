class CreateFoodItems < ActiveRecord::Migration[7.0]
  def change
    create_table :food_items do |t|
      t.string :name_se
      t.string :name_en
      t.integer :energy
      t.decimal :carbohydrates, precision: 10, scale: 2
      t.decimal :fat, precision: 10, scale: 2
      t.decimal :protein, precision: 10, scale: 2
      t.decimal :fiber, precision: 10, scale: 2
      t.decimal :water, precision: 10, scale: 2
      t.decimal :monosaccharides, precision: 10, scale: 2
      t.decimal :disaccharides, precision: 10, scale: 2
      t.decimal :sucrose, precision: 10, scale: 2
      t.decimal :sugars, precision: 10, scale: 2
      t.decimal :saturated, precision: 10, scale: 2
      t.decimal :saturated_4_0to10_0, precision: 10, scale: 2
      t.decimal :lauric_acid_c12_0, precision: 10, scale: 2
      t.decimal :myristic_acid_c14_0, precision: 10, scale: 2
      t.decimal :palmitic_acid_c16_0, precision: 10, scale: 2
      t.decimal :stearic_acid_c18_0, precision: 10, scale: 2
      t.decimal :arachidic_acid_c20_0, precision: 10, scale: 2
      t.decimal :monounsaturated, precision: 10, scale: 2
      t.decimal :palmitoleic_acid_c16_1, precision: 10, scale: 2
      t.decimal :oleic_acid_c18_1, precision: 10, scale: 2
      t.decimal :polyunsturated, precision: 10, scale: 2
      t.decimal :linoleic_acid_c18_2, precision: 10, scale: 2
      t.decimal :linolenic_acid_c18_3, precision: 10, scale: 2
      t.decimal :arachidonic_acid_c20_4, precision: 10, scale: 2
      t.decimal :epa_c20_5, precision: 10, scale: 2
      t.decimal :dpa_c22_5, precision: 10, scale: 2
      t.decimal :dha_c22_6, precision: 10, scale: 2
      t.decimal :cholesterol, precision: 10, scale: 2
      t.decimal :retinol, precision: 10, scale: 2
      t.decimal :vitamin_a, precision: 10, scale: 2
      t.decimal :beta_carotene, precision: 10, scale: 2
      t.decimal :vitamin_d, precision: 10, scale: 2
      t.decimal :vitamin_e, precision: 10, scale: 2
      t.decimal :vitamin_k, precision: 10, scale: 2
      t.decimal :thiamine, precision: 10, scale: 2
      t.decimal :riboflavin, precision: 10, scale: 2
      t.decimal :vitamin_c, precision: 10, scale: 2
      t.decimal :niacin, precision: 10, scale: 2
      t.decimal :niacin_equivalents, precision: 10, scale: 2
      t.decimal :vitamin_b6, precision: 10, scale: 2
      t.decimal :vitamin_b12, precision: 10, scale: 2
      t.decimal :folate, precision: 10, scale: 2
      t.decimal :phosphorus, precision: 10, scale: 2
      t.decimal :iodine, precision: 10, scale: 2
      t.decimal :iron, precision: 10, scale: 2
      t.decimal :calcium, precision: 10, scale: 2
      t.decimal :potassium, precision: 10, scale: 2
      t.decimal :copper, precision: 10, scale: 2
      t.decimal :magnesium, precision: 10, scale: 2
      t.decimal :sodium, precision: 10, scale: 2
      t.decimal :sodium_chloride, precision: 10, scale: 2
      t.decimal :selenium, precision: 10, scale: 2
      t.decimal :zink, precision: 10, scale: 2
      t.decimal :starch, precision: 10, scale: 2
      t.integer :waste
      t.timestamps
    end
  end
end
