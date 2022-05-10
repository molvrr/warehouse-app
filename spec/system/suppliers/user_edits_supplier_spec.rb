require 'rails_helper'

describe 'Usuário edita um fornecedor' do
  it 'a partir da página de detalhes' do
    supplier = Supplier.create!(trade_name: 'Empresa não tão séria', corporate_name: 'Empresa séria',
                                full_address: 'Av. Séria, 100', city: 'Cidade Séria', state: 'ES',
                                email: 'emailserio@dominioserio.com.br', phone_number: '(00) 0000-0000',
                                registration_number: '00.000.000/0001-00')
    visit suppliers_path
    click_on 'Empresa não tão séria'
    click_on 'Editar'
    expect(page).to have_content 'Editar Fornecedor'
    expect(page).to have_field 'Nome Fantasia', with: 'Empresa não tão séria'
    expect(page).to have_field 'Razão Social', with: 'Empresa séria'
    expect(page).to have_field 'Cidade', with: 'Cidade Séria'
    expect(page).to have_field 'Estado', with: 'ES'
    expect(page).to have_field 'E-mail', with: 'emailserio@dominioserio.com.br'
    expect(page).to have_field 'CNPJ', with: '00.000.000/0001-00'
    expect(page).to have_field 'Endereço', with: 'Av. Séria, 100'
    expect(page).to have_field 'Telefone', with: '(00) 0000-0000'
  end
  it 'com sucesso' do
    supplier = Supplier.create!(trade_name: 'Empresa não tão séria', corporate_name: 'Empresa séria',
                                full_address: 'Av. Séria, 100', city: 'Cidade Séria', state: 'ES',
                                email: 'emailserio@dominioserio.com.br', phone_number: '(00) 0000-0000',
                                registration_number: '00.000.000/0001-00')
    visit suppliers_path
    click_on 'Empresa não tão séria'
    click_on 'Editar'
    fill_in 'Nome Fantasia', with: 'Empresa extremamente séria'
    click_on 'Enviar'
    expect(page).to have_content 'Fornecedor atualizado com sucesso.'
    expect(page).to have_content 'Fornecedor Empresa extremamente séria'
  end
  it 'e mantém os campos obrigatórios' do
    supplier = Supplier.create!(trade_name: 'Empresa não tão séria', corporate_name: 'Empresa séria',
                                full_address: 'Av. Séria, 100', city: 'Cidade Séria', state: 'ES',
                                email: 'emailserio@dominioserio.com.br', phone_number: '(00) 0000-0000',
                                registration_number: '00.000.000/0001-00')
    visit suppliers_path
    click_on 'Empresa não tão séria'
    click_on 'Editar'
    fill_in 'Nome Fantasia', with: ''
    click_on 'Enviar'
    expect(page).to have_content 'Não foi possível atualizar o fornecedor.'
  end
end
