require 'faker'

namespace :dev do
  desc "Configura o Ambiente de Desenvolvimento"
  task setup: :environment do

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

  end
end
