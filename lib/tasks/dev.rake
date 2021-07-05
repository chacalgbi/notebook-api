require 'faker'

namespace :dev do
  desc "Configura o Ambiente de Desenvolvimento"
  task setup: :environment do
    puts "Resetando Banco de dados"
    %x(rails db:drop db:create db:migrate)

    puts "Cadastrando tipos de Contatos"
      kinds = %w(Amigo Comercial Conhecido)
      kinds.each do |kind|
        Kind.create!(description: kind)
      end
    puts "Tipos de Contatos Cadastrados"

    puts "Cadastrando os Contatos"
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: '1950-01-01', to: '2005-12-25'),
        kind: Kind.all.sample
      )
    end
    puts "Contatos Cadastrados"    

    puts "Cadastrando os Telefones"
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end
    puts "Telefones Cadastrados"    

    puts "Cadastrando os Endereços"
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end
    puts "Endereços Cadastrados"  

  end
end
