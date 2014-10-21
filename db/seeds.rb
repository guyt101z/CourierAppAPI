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
User.create(email: "example@gmail.com",password: "12345",role: "Admin",cedula: "1234567",name: "jonh",lastname: "doe",phone: "041295465412");

Rate.create(creator_id:1,constant:12.6,K_value:13.3);
Rate.create(creator_id:1,constant:13,K_value:15.3);
Rate.create(creator_id:1,constant:15.6,K_value:16.3);
Rate.create(creator_id:1,constant:19.6,K_value:10.3);
Rate.create(creator_id:1,constant:22.6,K_value:14.3);

Package.create(sender_id:2,receiver_id:3,sender_agency_id:2,receiver_agency_id:4,status:"received",dispatched_at:Time.now,delivered_at:Time.now,lenght:5.0,width:16.0,height:12.0,weight:8.0,value:78.0);
Package.create(sender_id:1,receiver_id:2,sender_agency_id:3,receiver_agency_id:1,status:"lost",dispatched_at:Time.now,delivered_at:Time.now,lenght:15.0,width:36.0,height:12.0,weight:8.0,value:150.0);
Package.create(sender_id:3,receiver_id:3,sender_agency_id:4,receiver_agency_id:1,status:"transit",dispatched_at:Time.now,delivered_at:Time.now,lenght:25.0,width:26.3,height:1.0,weight:32.0,value:44.0);
Package.create(sender_id:1,receiver_id:1,sender_agency_id:1,receiver_agency_id:2,status:"delivered",dispatched_at:Time.now,delivered_at:Time.now,lenght:3.0,width:9.3,height:17.0,weight:22.0,value:45.0);
Package.create(sender_id:2,receiver_id:4,sender_agency_id:4,receiver_agency_id:2,status:"delivered",dispatched_at:Time.now,delivered_at:Time.now,lenght:8.0,width:11.9,height:9.0,weight:34.0,value:98.0);
Package.create(sender_id:3,receiver_id:1,sender_agency_id:2,receiver_agency_id:3,status:"received",dispatched_at:Time.now,delivered_at:Time.now,lenght:10,width:9.0,height:14.0,weight:18.0,value:300.0);

ApiKey.create(role:"Admin", user_id:1);
ApiKey.create(role:"Operator", user_id:2);
ApiKey.create(role:"Client", user_id:3);