require 'rails_helper'

describe 'Usuário visita página de fornecedores' do
  it 'a partir da tela inicial' do
    # Act
    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end
    # Assert
    expect(current_path).to eq suppliers_path
  end

  it 'com sucesso' do
    # Arrange
    Supplier.create!(corporate_name: 'Nome sério', trade_name: 'Nome não tão sério', state: 'SE', city: 'Aracaju',
                     registration_number: '00.000.000/0001-00', email: 'empresaseria@dominioserio.com.br', full_address: 'Av. Séria, 100', phone_number: '(79) 3232-3232')
    Supplier.create!(corporate_name: 'Empresa séria', trade_name: 'Empresa não tão séria', state: 'SP', city: 'São Paulo',
                     registration_number: '05.006.005/0014-05', email: 'empresa@dominioserio.com.br', full_address: 'Av. Faria Lima, 2100', phone_number: '(11) 4002-8922')
    # Act
    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end
    # Assert
    expect(page).to have_content 'Fornecedores'
    expect(page).to have_content 'Nome não tão sério'
    expect(page).to have_content 'Aracaju - SE'
    expect(page).to have_content 'Empresa não tão séria'
    expect(page).to have_content 'São Paulo - SP'
  end

  it 'e não há fornecedores cadastrados' do
    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end
    expect(page).to have_content 'Não existem fornecedores cadastrados.'
  end
end
