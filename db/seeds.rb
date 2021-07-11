# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
                      {
                        username: "henatan"
                      },

                      {
                        username: "selam"
                      },

                      {
                        username: "zabaleta"
                      }
                    ])

measurements = Measurement.create([
  {name: "BP", unit: "PSI"},
  {name: "HeartBeat", unit: "beat/min"},
  {name: "Sugar", unit: "mmol/L"},
  {name: "Fat", unit: "%"},
  {name: "Weight", unit: "kg"}
])
