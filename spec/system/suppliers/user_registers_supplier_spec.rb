require 'rails_helper'

describe 'Usuário cadastra um fornecedor' do
  it 'a partir da tela inicial' do
    # Arrange
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar Fornecedor'
    # Assert
    expect(page).to have_field 'Nome Fantasia'
    expect(page).to have_field 'Razão Social'
    expect(page).to have_field 'CNPJ'
    expect(page).to have_field 'E-mail'
    expect(page).to have_field 'Telefone'
    expect(page).to have_field 'Endereço'
    expect(page).to have_field 'Cidade'
    expect(page).to have_field 'Estado'
  end

  it 'com sucesso' do
    # Arrange
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar Fornecedor'
    fill_in 'Nome Fantasia', with: 'Nome não tão sério'
    fill_in 'Razão Social', with: 'Nome sério'
    fill_in 'CNPJ', with: '00.000.000/0001-00'
    fill_in 'E-mail', with: 'empresaseria@dominioserio.com.br'
    fill_in 'Telefone', with: '(11) 4002-8922'
    fill_in 'Endereço', with: 'Av. dos Magos, 1000'
    fill_in 'Cidade', with: 'São Paulo'
    fill_in 'Estado', with: 'SP'
    click_on 'Enviar'
    # Assert
    expect(current_path).to eq suppliers_path
    expect(page).to have_content 'Fornecedor cadastrado com sucesso.'
    expect(page).to have_content 'Nome não tão sério'
    expect(page).to have_content 'São Paulo - SP'
  end

  it 'com dados incompletos' do
    visit suppliers_path
    click_on 'Cadastrar Fornecedor'
    fill_in 'Nome Fantasia', with: ''
    fill_in 'Razão Social', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'E-mail', with: ''
    fill_in 'Telefone', with: ''
    fill_in 'Endereço', with: ''
    fill_in 'Cidade', with: ''
    fill_in 'Estado', with: ''
    click_on 'Enviar'
    # Assert
    expect(current_path).to eq suppliers_path
    expect(page).to have_content 'Fornecedor não cadastrado.'
    expect(page).to have_content 'Nome Fantasia não pode ficar em branco'
    expect(page).to have_content 'Razão Social não pode ficar em branco'
    expect(page).to have_content 'CNPJ não pode ficar em branco'
    expect(page).to have_content 'E-mail não pode ficar em branco'
    expect(page).to have_content 'Telefone não pode ficar em branco'
    expect(page).to have_content 'Endereço não pode ficar em branco'
    expect(page).to have_content 'Cidade não pode ficar em branco'
    expect(page).to have_content 'Estado não pode ficar em branco'
  end
end
