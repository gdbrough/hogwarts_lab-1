require_relative("../db/sql_runner")

class Student

  attr_reader :id, :first_name, :last_name, :house, :age

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age']

  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, house, age) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @last_name, @house, @age]
    student_data = SqlRunner.run(sql,values)
    @id = student_data.first()['id'].to_i

  end

end
