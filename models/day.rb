require_relative("../db/sql_runner.rb")

class Day

  attr_reader(:id, :day)

  def initialize(options)
    @id = options["id"].to_i()
    @day = options["day"]
  end





end
