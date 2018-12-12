file = File.open('estudiantes.csv', 'r')
data_students = file.readlines.map(&:chomp)
file.close

# print products

students_array = data_students.map do |x|
 x.split(',').to_a
end
#print students_array

# Esta método solo hace un hash, 
# Su uso es dentro de la función que crea el array
def do_hash(array)
    student_hash = {}
    student_hash[:name] = array.shift
    student_hash[:grades] = array
    return student_hash
end 


def create_epic_array_of_hashes(students_array)
    epic_array = []
    students_array.each do |student_info|
        epic_array.push(do_hash(student_info))
    end
    return epic_array
end
all_data_student_hash = create_epic_array_of_hashes(students_array)


 
all_data_student_hash.each_index do |x|
    all_data_student_hash[x][:grades].map {|w| w == ' A' ? 1 : w }
   print all_data_student_hash[x][:grades].map {|z| z.to_i}
end



# sacar el promedio
# def average_grade(grades_array)
#     grades_array = grades_array.each_index do |x|
#         grades_array[x][:grades].map {|w| w == ' A' ? 1 : w }
#     end
# end




#average_grade(all_data_student_hash)



def program_init()
    puts "Programa notas de estudiantes"
    puts "Ingrese un número del 1 al 4 para seleccionar su acción"
    puts "1. Generar promedio de notas, en un archivo"
    puts "2. Mostrar las inasistencias totales"
    puts "3. Mostrar estudiantes aprovados"
    puts "4. Salir"
end





# option = 0
# while option != 4
#     option = gets.chomp.to_i
#     case option
#         when 1
#         when 2
#         when 3
#         else
#             puts "Opción invalida!"
#     end
# end


