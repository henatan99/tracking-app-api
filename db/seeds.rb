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
                                    { name: "BP", unit: "PSI", icon: "https://image.flaticon.com/icons/png/512/5038/5038288.png" },
                                    { name: "HeartBeat", unit: "beat/min", icon: "https://image.flaticon.com/icons/png/512/4659/4659280.png" },
                                    { name: "Sugar", unit: "mmol/L", icon: "https://image.flaticon.com/icons/png/512/3411/3411326.png" },
                                    { name: "Fat", unit: "%", icon: "https://image.flaticon.com/icons/png/512/1690/1690455.png" },
                                    { name: "Weight", unit: "kg", icon: "https://image.flaticon.com/icons/png/512/1599/1599539.png" },
                                    { name: "Cholestrol", unit: "mmol/L", icon: "https://image.flaticon.com/icons/png/512/2843/2843646.png"}
                                  ])

measureds = Measured.create([
                              { value: 100, user_id: 1, measurement_id: 1 },
                              { value: 30, user_id: 1, measurement_id: 2 },
                              { value: 70, user_id: 1, measurement_id: 3 },
                              { value: 40, user_id: 1, measurement_id: 4 },
                              { value: 120, user_id: 1, measurement_id: 5 },
                              { value: 100, user_id: 2, measurement_id: 1 },
                              { value: 30, user_id: 2, measurement_id: 2 },
                              { value: 70, user_id: 2, measurement_id: 3 },
                              { value: 40, user_id: 2, measurement_id: 4 },
                              { value: 120, user_id: 2, measurement_id: 5 },
                            ])
