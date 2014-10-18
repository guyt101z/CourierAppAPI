# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Agency.create(name:'LuisUPS',phone:'02121111111',address:'poste1');
Agency.create(name:'CarlosMRW',phone:'02122222222',address:'poste2');
Agency.create(name:'LorenaUPS',phone:'02123333333',address:'poste3');
Agency.create(name:'MiguelFEDEX',phone:'02124444444',address:'poste4');

User.create(email: "dead_or_luis@hotmail.com",password: "12345",role: "Admin",cedula: "18033084",name: "luis",lastname: "campos",phone: "04120107979");
User.create(email: "correo1@hotmail.com",password: "12345",role: "Operator",cedula: "18154154",name: "marvin",lastname: "bernal",phone: "04121111111");
User.create(email: "correo2@hotmail.com",password: "12345",role: "Client",cedula: "18124458",name: "carlos",lastname: "carrillo",phone: "04122222222");
User.create(email: "correo3@gmail.com",password: "12345",role: "Client",cedula: "18551234",name: "Lorena",lastname: "perea",phone: "04121541515");
User.create(email: "correo4@gmail.com",password: "12345",role: "Operator",cedula: "16565647",name: "Enrique",lastname: "aponte",phone: "04123333333");
