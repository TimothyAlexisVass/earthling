module NutritionHelper
  private

  def megajoule_energy
    @megajoule_energy ||= calorie_to_joule(2000 * @gender_multiplier * @activity_level)/1000.0
  end

  def energy
    @energy ||= (2000 * @gender_multiplier * @activity_level).to_i
  end

  def polyunsaturated
    @polyunsaturated ||= [
      :linoleic_acid_c18_2,
      :arachidonic_acid_c20_4,
      :linolenic_acid_c18_3,
      :epa_c20_5,
      :dpa_c22_5,
      :dha_c22_6
    ]
  end

  def total_polyunsaturated
    @total_polyunsaturated ||= set_decimal_precision(@totals.filter{ |item| polyunsaturated.include? item }.sum{ |key, value| value })
  end

  def omega6
    @omega6 ||= [
      :linoleic_acid_c18_2,
      :arachidonic_acid_c20_4
    ]
  end

  def total_omega6
    @total_omega6 ||= set_decimal_precision(@totals.filter{ |item| omega6.include? item }.sum{ |key, value| value })
  end

  def omega3
    @omega3 ||= [
      :linolenic_acid_c18_3,
      :epa_c20_5,
      :dpa_c22_5,
      :dha_c22_6
    ]
  end

  def total_omega3
    @total_omega3 ||= set_decimal_precision(@totals.filter{ |item| omega3.include? item }.sum{ |key, value| value })
  end

  def get_food_list
    list = SelectedFoodItem.where(user_id: @user.id).map{ |selected_food_item|
      {
        selected_food_item: selected_food_item,
        data: (food_item=FoodItem.where(id: selected_food_item.food_item_id).first),
        amount: selected_food_item.amount,
        energy: set_decimal_precision(food_item[:energy]*selected_food_item.amount/100.0)
      }
    }
  end

  def get_top(field, amount)
    FoodItem.order(Arel.sql("#{field} DESC")).first(amount).map{ |item| {name: item.name_en, value: item[field]}}
  end

  def kcal_per_gram(type)
    {
      carbohydrates: 4.06,
      fat: 8.84,
      protein: 4,
      fiber: 2
    }[type]
  end

  def calorie_to_joule(energy)
    (energy * 4.184).round(0).to_i
  end

  def percent(value)
    return 0 if value == 0
    set_decimal_precision(value * 100, 0, 80)
  end

  def set_decimal_precision(value, d2=3, d1=10)
    return 0 if value == 0
    return value.to_i if value.to_i == value.to_f
    value < d2 ? value.round(2) : value < d1 ? value.round(1) : value.round(0).to_i
  end

  def totals
    total_h = { amount: @food_list.sum{ |item| item[:amount] } }
    fields[0...-2].each do |field|
      total_h[field] = @food_list.sum{ |item|
        value = item[:data][field]*item[:amount]/100
      }.to_f
      total_h[field] = set_decimal_precision(total_h[field])
    end
    total_h[:water] = (total_h[:water]/100.0).round(1)
    total_h[:vitamin_a] = set_decimal_precision(total_h[:vitamin_a] + total_h[:beta_carotene]/12)
    total_h
  end

  def fields
    FoodItem.column_names[3...-2].map{ |s| s.to_sym }
  end

  def requirement_calculation(minimum, factor, decimals)
    set_decimal_precision(factor * megajoule_energy <= minimum ? minimum : factor * megajoule_energy)
  end

  def field_names_en
    @field_names_en ||= {
      amount: "Amount",
      energy: "Energy",
      carbohydrates: "Carbohydrates",
      fat: "Fat",
      protein: "Protein",
      fiber: "Fiber",
      water: "Water",
      monosaccharides: "Monosaccharides",
      disaccharides: "Disaccharides",
      sucrose: "Sucrose",
      sugars: "Sugars",
      saturated: "Saturated fatty acids",
      saturated_4_0to10_0: "Fatty acids C4:0 - C10:0",
      lauric_acid_c12_0: "Lauric acid C12:0",
      myristic_acid_c14_0: "Myristic acid C14:0",
      palmitic_acid_c16_0: "Palmitic acid C16:0",
      stearic_acid_c18_0: "Stearic acid C18:0",
      arachidic_acid_c20_0: "Arachidic acid C20:0",
      monounsaturated: "Monounsaturated fatty acids",
      palmitoleic_acid_c16_1: "Palmitoleic acid C16:1",
      oleic_acid_c18_1: "Oleic acid C18:1",
      polyunsturated: "Polyunsaturated fatty acids",
      linoleic_acid_c18_2: "Linoleic acid C18:2",
      linolenic_acid_c18_3: "Linolenic acid C18:3",
      arachidonic_acid_c20_4: "Arachidonic acid C20:4",
      epa_c20_5: "EPA C20:5",
      dpa_c22_5: "DPA C22:5",
      dha_c22_6: "DHA C22:6",
      cholesterol: "Cholesterol",
      retinol: "Retinol",
      vitamin_a: "Vitamin A",
      beta_carotene: "Beta Carotene",
      vitamin_d: "Vitamin D",
      vitamin_e: "Vitamin E",
      vitamin_k: "Vitamin K",
      thiamine: "Thiamine (B1)",
      riboflavin: "Riboflavin (B2)",
      vitamin_c: "Vitamin C",
      niacin: "Niacin (B3)",
      niacin_equivalents: "Niacin (B3) equivalents",
      vitamin_b6: "Pyroxidine (B6)",
      vitamin_b12: "Cobalamin (B12)",
      folate: "Folate (B9)",
      phosphorus: "Phosphorus",
      iodine: "Iodine",
      iron: "Iron",
      calcium: "Calcium",
      potassium: "Potassium",
      copper: "Copper",
      magnesium: "Magnesium",
      sodium: "Sodium",
      sodium_chloride: "Sodium chloride",
      selenium: "Selenium",
      zinc: "Zinc",
      starch: "Starch",
      waste: "Waste",
    }
  end

  def micro_nutrients
    @micro_nutrients ||= [
      :lauric_acid_c12_0,
      :myristic_acid_c14_0,
      :palmitic_acid_c16_0,
      :stearic_acid_c18_0,
      :arachidic_acid_c20_0,
      :palmitoleic_acid_c16_1,
      :oleic_acid_c18_1,
      :linoleic_acid_c18_2,
      :linolenic_acid_c18_3,
      :arachidonic_acid_c20_4,
      :epa_c20_5,
      :dpa_c22_5,
      :dha_c22_6,
      :retinol,
      :vitamin_a,
      :beta_carotene,
      :vitamin_d,
      :vitamin_e,
      :vitamin_k,
      :thiamine,
      :riboflavin,
      :vitamin_c,
      :niacin,
      :niacin_equivalents,
      :vitamin_b6,
      :vitamin_b12,
      :folate,
      :phosphorus,
      :iodine,
      :iron,
      :calcium,
      :potassium,
      :copper,
      :magnesium,
      :sodium,
      :sodium_chloride,
      :selenium,
      :zinc,
    ]
  end

  def units
    @units ||= {
      amount: "g",
      energy: "kcal",
      carbohydrates: "g",
      fat: "g",
      protein: "g",
      fiber: "g",
      water: "dl",
      monosaccharides: "g",
      disaccharides: "g",
      sucrose: "g",
      sugars: "g",
      saturated: "g",
      saturated_4_0to10_0: "g",
      lauric_acid_c12_0: "g",
      myristic_acid_c14_0: "g",
      palmitic_acid_c16_0: "g",
      stearic_acid_c18_0: "g",
      arachidic_acid_c20_0: "g",
      monounsaturated: "g",
      palmitoleic_acid_c16_1: "g",
      oleic_acid_c18_1: "g",
      polyunsturated: "g",
      linoleic_acid_c18_2: "g",
      linolenic_acid_c18_3: "g",
      arachidonic_acid_c20_4: "g",
      epa_c20_5: "g",
      dpa_c22_5: "g",
      dha_c22_6: "g",
      cholesterol: "mg",
      retinol: "µg",
      vitamin_a: "RE (µg)",
      beta_carotene: "RE (µg)",
      vitamin_d: "µg",
      vitamin_e: "mg",
      vitamin_k: "µg",
      thiamine: "mg",
      riboflavin: "mg",
      vitamin_c: "mg",
      niacin: "mg",
      niacin_equivalents: "NE (mg)",
      vitamin_b6: "mg",
      vitamin_b12: "µg",
      folate: "µg",
      phosphorus: "mg",
      iodine: "µg",
      iron: "mg",
      calcium: "mg",
      potassium: "mg",
      copper: "mg",
      magnesium: "mg",
      sodium: "mg",
      sodium_chloride: "g",
      selenium: "µg",
      zinc: "mg",
      starch: "g",
      waste: "%",
    }
  end

  def daily_requirements
    @daily_requirements ||= {
      amount: nil,
      energy: energy,
      carbohydrates: set_decimal_precision(energy * 0.5 / kcal_per_gram(:carbohydrates)),
      fat: set_decimal_precision(energy * 0.305 / kcal_per_gram(:fat)),
      protein: set_decimal_precision(energy * 0.145 / kcal_per_gram(:protein)),
      fiber: set_decimal_precision(energy * 0.05 / kcal_per_gram(:protein)),
      water: set_decimal_precision((34 * @activity_level * @gender_multiplier * @weight)/100.0),
      monosaccharides: nil,
      disaccharides: nil,
      sucrose: nil,
      sugars: nil,
      saturated: nil,
      saturated_4_0to10_0: nil,
      lauric_acid_c12_0: nil,
      myristic_acid_c14_0: nil,
      palmitic_acid_c16_0: nil,
      stearic_acid_c18_0: nil,
      arachidic_acid_c20_0: nil,
      monounsaturated: nil,
      palmitoleic_acid_c16_1: nil,
      oleic_acid_c18_1: nil,
      polyunsturated: nil,
      linoleic_acid_c18_2: nil,
      linolenic_acid_c18_3: (calorie_to_joule(energy)/100/37).round(2), 
      arachidonic_acid_c20_4: nil,
      epa_c20_5: nil,
      dpa_c22_5: nil,
      dha_c22_6: 0.2,
      cholesterol: nil,
      retinol: nil,
      vitamin_a: requirement_calculation(800, 80, 0),
      beta_carotene: nil,
      vitamin_d: requirement_calculation(10, 1.4, 1),
      vitamin_e: requirement_calculation(12, 0.9, 1),
      vitamin_k: requirement_calculation(75, 9, 1),
      thiamine: requirement_calculation(1.1, 0.12, 1),
      riboflavin: requirement_calculation(1.4, 0.14, 1),
      vitamin_c: requirement_calculation(400, 35, 0),
      niacin: nil,
      niacin_equivalents: requirement_calculation(19, 1.6, 1),
      vitamin_b6: requirement_calculation(1.4, 0.13, 1),
      vitamin_b12: requirement_calculation(0.2, 2.5, 1),
      folate: requirement_calculation(300, 45, 1),
      phosphorus: requirement_calculation(700, 80, 1),
      iodine: requirement_calculation(150, 17, 1),
      iron: requirement_calculation(14, 1.6, 1),
      calcium: requirement_calculation(800, 100, 1),
      potassium: requirement_calculation(0, 350, 1),
      copper: requirement_calculation(1, 0.1, 1),
      magnesium: requirement_calculation(375, 32, 1),
      sodium: nil,
      sodium_chloride: nil,
      selenium: requirement_calculation(60, 5.7, 1),
      zinc: requirement_calculation(13, 1.2, 1),
      starch: nil,
      waste: nil,
    }
  end

  def upper_limit
    @upper_limits ||= {
      amount: nil,
      energy: nil,
      carbohydrates: nil,
      fat: nil,
      protein: nil,
      fiber: nil,
      water: nil,
      monosaccharides: nil,
      disaccharides: nil,
      sucrose: nil,
      sugars: nil,
      saturated: (energy / 10 / kcal_per_gram(:fat)).round(1),
      saturated_4_0to10_0: nil,
      lauric_acid_c12_0: nil,
      myristic_acid_c14_0: nil,
      palmitic_acid_c16_0: nil,
      stearic_acid_c18_0: nil,
      arachidic_acid_c20_0: nil,
      monounsaturated: nil,
      palmitoleic_acid_c16_1: nil,
      oleic_acid_c18_1: nil,
      polyunsturated: nil,
      linoleic_acid_c18_2: nil,
      linolenic_acid_c18_3: nil,
      arachidonic_acid_c20_4: nil,
      epa_c20_5: nil,
      dpa_c22_5: nil,
      dha_c22_6: nil,
      cholesterol: nil,
      retinol: nil,
      vitamin_a: (3000 * daily_requirements[:vitamin_a] / 800).round,
      beta_carotene: nil,
      vitamin_d: (100 * daily_requirements[:vitamin_d] / 10).round,
      vitamin_e: (300 * daily_requirements[:vitamin_e] / 12).round,
      vitamin_k: nil,
      thiamine: nil,
      riboflavin: nil,
      vitamin_c: 5000,
      niacin: nil,
      niacin_equivalents: (35 * daily_requirements[:niacin_equivalents] / 19).round,
      vitamin_b6: (100 * daily_requirements[:vitamin_b6] / 1.4).round,
      vitamin_b12: nil,
      folate: (1000 * daily_requirements[:folate] / 300).round,
      phosphorus: (3000 * daily_requirements[:phosphorus] / 700).round,
      iodine: (1100 * daily_requirements[:iodine] / 150).round,
      iron: (60 * daily_requirements[:iron] / 14).round,
      calcium: (2500 * daily_requirements[:calcium] / 800).round,
      potassium: nil,
      copper: (5 * daily_requirements[:vitamin_a]).round,
      magnesium: (3500 * daily_requirements[:calcium] / 375).round,
      sodium: 2400,
      sodium_chloride: 6,
      selenium: (400 * daily_requirements[:calcium] / 60).round,
      zinc: (40 * daily_requirements[:calcium] / 13).round,
      starch: nil,
      waste: nil,
    }
  end
end
