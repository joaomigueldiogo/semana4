class View 

  def initialize
    puts "Bienvenido a Maratón. Te daremos una pregunta y deberás adivinar la respuesta correcta."
    puts "Listo?"
    puts "Arranca el juego!"
    puts "----------------------------------"
  end

  def show_question(question)
    puts question.question
    gets.chomp 
  end

  def show_answer(user_answer, question_obj)
    puts "Intento: #{user_answer}"
    if user_answer == question_obj.answer
      puts "Correcto!"
    else
      puts "Incorrecto!" 
    end
  end

  def show_count_answer(correctas_count, incorrectas_count)
    puts "Acabaste:"
    puts "Tuviste #{correctas_count} Correctas y #{incorrectas_count} Incorrectas."

  end

end