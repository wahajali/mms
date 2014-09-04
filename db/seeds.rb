# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
MedicineType.create(medicine_type: 'Original Brand Locally Manufactured & Purchasable Locally')
MedicineType.create(medicine_type: 'Original Brand Foreign Manufactured & Purchasable Locally')
MedicineType.create(medicine_type: 'Original Brand Foreign Manufactured & Importable')
MedicineType.create(medicine_type: 'Equivalent Brand Locally Manufactured & Purchasable Locally')
MedicineType.create(medicine_type: 'Equivalent Brand Foreign Manufactured & Purchasable Locally')
MedicineType.create(medicine_type: 'Equivalent Brand Foreign Manufactured & Importable')
