# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ParentsLog.destroy_all
Student.destroy_all
Course.destroy_all
Parent.destroy_all
UserType.destroy_all


Course.create([
	{ id: '1',year_course: "1 basico", section: "A" },
	{ id: '2',year_course: "1 basico", section: "B" },
	{ id: '3',year_course: "2 basico", section: "A" },
	{ id: '4',year_course: "2 basico", section: "B" },
	{ id: '5',year_course: "3 basico", section: "A" },
	{ id: '6',year_course: "3 basico", section: "B" },
	{ id: '7',year_course: "4 basico", section: "A" },
	{ id: '8',year_course: "4 basico", section: "B" },
	
	{ id: '9',  year_course: "3 medio", section: "A" },
	{ id: '10', year_course: "3 medio", section: "B" },
	{ id: '11', year_course: "3 medio", section: "C" },
	{ id: '12', year_course: "4 medio", section: "A" },
	{ id: '13', year_course: "4 medio", section: "B" },
	{ id: '14', year_course: "4 medio", section: "C" } ])

p "Cursos: Se ha añadido #{Course.count} cursos a la base de datos"

Parent.create([
	{id: 1 , username: "admin1", password: "adminadmin", name:"Claudia Zuñiga" ,email: "claudia_bradford@gmail.cl",	phone_number: 985145193},
	{id: 2 , username: "admin2", password: "admin1234", name: "Paula Mondaca",email: "paula_Bradford@gmail.cl",phone_number: 975653431},
	{id: 3 , username: "PapaAna", password: "claveclave", name: "Sergio Ortega",email: "ana_02@gmail.com",phone_number: 982741923},
	{id: 4 , username: "MamaClaudio", password: "claudito", name: "Giselle Perez",email:"clau_genial@hotmail.com" ,phone_number: 974239566},
	{id: 5 , username: "MamaElias", password: "buenasnotas", name:"Ruben Rosales",email: "monica@gmail.com",phone_number: 937864332},
	{id: 6 , username: "AbueloCarlitos", password: "rtyrty", name: "Carlos Rueda",email: "carlos_autos@gmail.com",phone_number: 917462553},
	{id: 7 , username: "MamaMichelle", password: "qweqwe", name: "Michelle Segura",email: "michi@gmail.com",phone_number: 986425675},
	{id: 8 , username: "TioEmilio", password: "asdfasdf", name: "Emilio Ponce",email: "Emilio_tepillamos@trampa.cl",phone_number: 954325423}
])

p "Padres: Se ha añadido #{Parent.count} padres a la base de datos"

Student.create([
	{id: 1 , name: "Lucas Espinoza", course_id: 2},
	{id: 2 , name: "Sofia Riquelme", course_id: 4},
	{id: 3 , name: "Roberto Carcamo", course_id: 6},
	{id: 4 , name: "Cristian Gonzalez", course_id: 7},
	{id: 5 , name: "Javier Catalan", course_id: 8},
	{id: 6 , name: "Judith Oyarzun", course_id: 3},
	{id: 7 , name: "Ana Maria Toro", course_id: 1},
	{id: 8 , name: "Felipe Ojeda", course_id: 5},
	{id: 9 , name: "Helen Fierro", course_id: 14},
	{id: 10 , name: "Priscila Guzman", course_id: 13}
])

p "Estudiantes: Se ha añadido #{Student.count} estudiantes a la base de datos"

UserType.create([
	{id: 1 , tipo: "admin"},
	{id: 2 , tipo: "parent"}
])

p "TipoUsuario: Se ha añadido #{UserType.count} tipos de usuario a la base de datos"

ParentsLog.create([
	{id: 1, detail: "Inicia sesion", parent_id: 3},
	{id: 2, detail: "crea noticia", parent_id: 1},
	{id: 3, detail: "crea evento", parent_id: 6}
])

p "RegistroPadre: Se ha añadido #{ParentsLog.count} registros a la base de datos"

