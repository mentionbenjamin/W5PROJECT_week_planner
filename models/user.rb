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

  def save()
    sql = "INSERT INTO users
          (title, description, day_id)
          VALUES ($1, $2, $3)
          RETURNING id"
    values = [@title, @description, @day_id]
    user_data = SqlRunner.run(sql, values)
    @id = user_data.first()["id"].to_i()
  end




end
