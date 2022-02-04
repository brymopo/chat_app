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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "students", id: :serial, force: :cascade do |t|
    t.integer "g"
    t.text "firstname"
    t.text "lastname"
    t.text "middlename"
    t.text "address"
    t.text "bio"
    t.date "dob"
    t.integer "id1"
    t.integer "id2"
    t.integer "id3"
    t.integer "id4"
    t.integer "id5"
    t.integer "id6"
    t.integer "id7"
    t.integer "id8"
    t.integer "id9"
  end

end
