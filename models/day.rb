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
  #
  # def self.all()
  #   sql = "SELECT * FROM days"
  #   days = SqlRunner.run(sql)
  #   result = days.map{|day| Day.new(day)}
  #   return result
  # end
  #
  # def self.delete_all()
  #   sql = "DELETE FROM days"
  #   SqlRunner.run(sql)
  # end



end
