# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130506173705) do

  create_table "cursos", :force => true do |t|
    t.string   "ficha"
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "estudiantes", :force => true do |t|
    t.string   "nombres"
    t.string   "cedula"
    t.string   "email"
    t.string   "direccion"
    t.date     "fch_ncto"
    t.integer  "curso_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "apellidos"
    t.string   "telefono"
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
  end

  add_index "estudiantes", ["curso_id"], :name => "index_estudiantes_on_curso_id"

  create_table "horarios", :force => true do |t|
    t.date     "dia"
    t.time     "hora"
    t.string   "aula"
    t.integer  "materia_id"
    t.integer  "instructor_id"
    t.integer  "curso_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "horarios", ["curso_id"], :name => "index_horarios_on_curso_id"
  add_index "horarios", ["instructor_id"], :name => "index_horarios_on_instructor_id"
  add_index "horarios", ["materia_id"], :name => "index_horarios_on_materia_id"

  create_table "instructores", :force => true do |t|
    t.string   "nombres"
    t.string   "cedula"
    t.string   "email"
    t.string   "direccion"
    t.string   "telefono"
    t.date     "fch_nacimiento"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "apellidos"
    t.integer  "materia_id"
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
  end

  create_table "materias", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "username",                        :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
