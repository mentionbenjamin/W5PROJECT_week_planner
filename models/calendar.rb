require_relative("../db/sql_runner.rb")

class Calendar

  attr_reader(:id, :note_id, :day_id)

  def initialize(options)
    @id = options["id"].to_i()
    @note_id = options["note_id"].to_i()
    @day_id = options["day_id"].to_i()
  end


end
