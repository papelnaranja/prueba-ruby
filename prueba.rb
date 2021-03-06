
file = File.open('estudiantes.csv', 'r')
data_students = file.readlines.map(&:chomp)
file.close

# print products
students_array = data_students.map do |x|
 x.split(',').to_a
end


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


def sacar_promedio(array_of_hashes)
    # esto saca el contenido del metodo
    content = ''
    array_of_hashes.each_index do |x|
        name = array_of_hashes[x][:name]
        array_of_hashes[x][:grades].map {|w| w == ' A' ? 1 : w }
        int_grades =  array_of_hashes[x][:grades].map {|z| z.to_f}
        grades_qua = array_of_hashes[x][:grades].length
        promedio = int_grades.inject(0) {|sum,n| sum + n /grades_qua }.round(2)
        # esto saca el contenido del metodo
        content += "#{name}: #{promedio} \n" 
    end
    # esto saca el contenido del metodo
    return content
end



#print sacar_promedio(all_data_student_hash)

def make_file(array_of_hashes)
    print content = sacar_promedio(array_of_hashes)
    file = File.open('promedio.csv', 'a')
    file.puts content
    file.close
end

def ausentes(array_of_hashes)
    array_of_hashes.each_index do |x|
        name = array_of_hashes[x][:name]
        a = array_of_hashes[x][:grades].count(" A")
        puts "#{name} tiene: #{a} ausencias."
    end   
end

def aprobados(array_of_hashes, nota_aprov)
    puts "Ingresar nota minima de aprovación"
    nota_aprov = gets.chomp.to_i
    nota_aprov = 5 if nota_aprov == nil
    array_of_hashes.each_index do |x|
        #OPTIMIZAR

        name = array_of_hashes[x][:name]
        array_of_hashes[x][:grades].map {|w| w == ' A' ? 1 : w }
        int_grades =  array_of_hashes[x][:grades].map {|z| z.to_f}
        grades_qua = array_of_hashes[x][:grades].length
        promedio = int_grades.inject(0) {|sum,n| sum + n /grades_qua }


        #OPTIMIZAR       
        if nota_aprov <= promedio
           puts "#{name}, fue aprovado :)"
        else
            puts "#{name}, no aprovo :("
        end
    end
end


def program_init()
    puts "Programa notas de estudiantes"
    puts "Ingrese un número del 1 al 4 para seleccionar su acción"
    puts "1. Generar promedio de notas, en un archivo"
    puts "2. Mostrar las inasistencias totales"
    puts "3. Mostrar estudiantes aprovados"
    puts "4. Salir"
end

option = 0
while option != 4
  program_init()
   option = gets.chomp.to_i
    case option
        when 1
          make_file(all_data_student_hash)
        when 2
           ausentes(all_data_student_hash)
        when 3
            aprobados(all_data_student_hash, nil)
        when 4
            puts "Saliendo..."
        else
            puts "Opción invalida!"
    end
end