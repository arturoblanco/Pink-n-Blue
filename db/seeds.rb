# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#CLEANIN UP MODELS
Category.destroy_all
Subcategory.destroy_all
Product.destroy_all
Article.destroy_all
CategorySubcategory.destroy_all


# CREATING CATEGORIES AND SUBCATEGORIES
categories = [
  {:name => "Category 1"},
  {:name => "Category 2"},
]
subcategories = [
  {:name => "Subcategory 1"},
  {:name => "Subcategory 2"},
]
categories.each_with_index do |category, index|
  new_category = Category.new(category)
  new_subcategory = Subcategory.new(subcategories[index])
  new_category.category_subcategories.new(:subcategory => new_subcategory)
  new_category.save
end


#CREATING PRODUCTS
products = [
  {:name => "Product 1", :description => "Description for product 1", :price_for_sale => 12, :color => "red,green,blue"},
  {:name => "Product 2", :description => "Description for product 2", :price_for_sale => 12, :color => "red,green,blue"}
]                                                                                                               
products.each do |product|
  new_product = Product.new(product)
  Subcategory.all.each  do |subcategory|
    new_product.articles.new(:subcategory => subcategory)
    new_product.save
  end
end


# => Category(id: integer, name: string, created_at: datetime, updated_at: datetime)
# => Subcategory(id: integer, name: string, category_id: integer, created_at: datetime, updated_at: datetime) 
# => Product(id: integer, name: string, description: text, price_for_sale: float, discount: float, color: string, created_at: datetime, updated_at: datetime) 