require_relative("../db/sql_runner.rb")
require_relative("./day.rb")

class User

  attr_reader(:id, :title, :description, :day_id)

  def initialize(options)
    @id = options["id"].to_i()
    @title = options["title"]
    @description = options["description"]
    @day_id = options["day_id"]
  end






end
