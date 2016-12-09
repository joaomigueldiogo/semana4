require 'csv'

class Questions
  attr_reader :question, :answer

  def initialize(question, answer)
    @question = question
    @answer = answer
  end

end

class Question

  def question

    @array_questions = []
    csv_maraton_questions = CSV.read("maraton.csv", "r+")
    csv_maraton_questions.each do |row|
      @array_questions << Questions.new(row[0], row[1])
    end
    @array_questions.sample(5) 
  end

end