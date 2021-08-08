# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

# rubocop:disable Metrics/BlockLength
ActiveRecord::Schema.define(version: 20_210_713_235_837) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'goals', force: :cascade do |t|
    t.float 'quantity'
    t.date 'day_one'
    t.date 'day_last'
    t.bigint 'user_id', null: false
    t.bigint 'measurement_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['measurement_id'], name: 'index_goals_on_measurement_id'
    t.index ['user_id'], name: 'index_goals_on_user_id'
  end

  create_table 'measureds', force: :cascade do |t|
    t.float 'value'
    t.bigint 'user_id', null: false
    t.bigint 'measurement_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['measurement_id'], name: 'index_measureds_on_measurement_id'
    t.index ['user_id'], name: 'index_measureds_on_user_id'
  end

  create_table 'measurements', force: :cascade do |t|
    t.string 'name'
    t.string 'unit'
    t.string 'icon'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'goals', 'measurements'
  add_foreign_key 'goals', 'users'
  add_foreign_key 'measureds', 'measurements'
  add_foreign_key 'measureds', 'users'
end

# rubocop:enable Metrics/BlockLength
