require_relative("../db/sql_runner.rb")

class Day

  attr_reader(:id, :day)

  def initialize(options)
    @id = options["id"].to_i()
    @day = options["day"]
  end

  def save()
    sql = "INSERT INTO days
          (day)
          VALUES ($1)
          RETURNING id"
    values = [@day]
    day_data = SqlRunner.run(sql, values)
    @id = day_data.first()["id"].to_i()
  end



end
