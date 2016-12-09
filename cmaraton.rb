require_relative 'mmaraton.rb'
require_relative 'vmaraton.rb'

class Maincontroller
  attr_accessor :input, :user_input

  def initialize
    @view = View.new
    @model = Question.new
    question(input)
  end

  def menu
    
  end

  def question(input)
    questions = @model.question    
    @contador_correctas = 0
    @contador_incorrectas = 0
    questions.each do |question|
      user_answer = @view.show_question(question)
      @view.show_answer(user_answer, question)
      if user_answer == question.answer
        @contador_correctas += 1
      else
        @contador_incorrectas += 1
      end
    end
     @view.show_count_answer(@contador_correctas, @contador_incorrectas)
  end  

end

Maincontroller.new