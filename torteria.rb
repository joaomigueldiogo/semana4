# Un amigo acaba de abrir un negocio de Tortas y se le están quemando.
# Ayúdale a crear un programa para administrar el tiempo de horneado de los diferentes tipos de tortas.

# El cocinero (user stories):

# Necesita preparar diferentes tipos de tortas.
# Necesita meter las tortas por lotes al horno.
# Y lo más importante saber cuando sacarlas.
# En este ejercicio debes buscar que el diseño de tu código siga el principio de "Single Responsibility" (SRP). 
# Esta vez no sólo en los métodos sino también en las clases.

# SRP es una de las reglas descritas por Uncle Bob (Robert Martin) con el objetivo de que al hacer cambios en tu código 
# modifiques el menor número de partes.

# Esto genera que el costo de mantenimiento sea muy bajo.

# ¿Qué clases crees que sean necesarias?

# ¿Qué atributos deben tener las clases?
# ¿Cuál es el comportamiento necesario para cada una?
# ¿Cómo van a interactuar las clases entre ellas?
# ¿Cómo divides el código para que cada clase y método tenga una única responsabilidad?
# Finalmente debes de tener una idea general de cuáles son los features indispensables para crear el MVP.

# Te recomendamos que empieces creando la funcionalidad para que puedas meter y sacar tortas del horno.

class Hoven
  @@time_conter = 0

  def initialize(lote_tortas)
    @@lote_tortas = lote_tortas
    @@time_conter_torta = 0
  end

  def enter_hoven
    @@lote_tortas << @@time_conter_torta
  end
   

  def time_passed(minutes)
    @minutes = minutes
    @@time_conter += @minutes
    @@time_conter_torta += @minutes
  end
  
  def lote_tortas_status
    @@lote_tortas.each do |torta|
      @cooking_time = torta.cooking_time
      @torta_name = torta.torta_name
      if (@@time_conter_torta - @cooking_time) <= 2  
      puts "#{@torta_name} esta crudo"
      elsif (@@time_conter_torta - @cooking_time) <= 5
      puts "#{@torta_name} esta casi listo"
      elsif (@@time_conter_torta - @cooking_time) == @cooking_time
      puts "#{@torta_name} esta listo"
      elsif (@@time_conter_torta - @cooking_time) > @cooking_time
      puts "#{@torta_name} esta quemado"
      end
    end
  end
end

class Tortas < Hoven
  attr_reader :torta_name, :cooking_time

  def initialize(torta_name, cooking_time)
    @torta_name = torta_name
    @cooking_time = cooking_time
  end

end



torta_jamon = Tortas.new("torta_jamon", 10)
torta_queso = Tortas.new("torta_queso", 10)
torta_atun = Tortas.new("torta_atun", 15)

lote = [torta_jamon, torta_queso, torta_atun]
initiate_hoven = Hoven.new(lote)

initiate_hoven.time_passed(0)


initiate_hoven.time_passed(3)


initiate_hoven.lote_tortas_status

initiate_hoven.time_passed(10)

initiate_hoven.lote_tortas_status


initiate_hoven.time_passed(3)

initiate_hoven.lote_tortas_status


