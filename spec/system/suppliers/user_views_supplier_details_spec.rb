require 'rails_helper'

describe 'Usuário acessa página de um fornecedor' do
  it 'e vê informações adicionais' do
    supplier = Supplier.create!(trade_name: 'Empresa não tão séria', corporate_name: 'Empresa séria',
                                full_address: 'Av. Séria, 100', city: 'Cidade Séria', state: 'ES',
                                email: 'emailserio@dominioserio.com.br', phone_number: '(00) 0000-0000',
                                registration_number: '00.000.000/0001-00')
    visit suppliers_path
    click_on 'Empresa não tão séria'
    expect(page).to have_content 'Fornecedor Empresa não tão séria'
    expect(page).to have_content 'Razão Social: Empresa séria'
    expect(page).to have_content 'Endereço: Av. Séria, 100'
    expect(page).to have_content 'Localização: Cidade Séria - ES'
    expect(page).to have_content 'E-mail: emailserio@dominioserio.com.br'
    expect(page).to have_content 'Telefone: (00) 0000-0000'
    expect(page).to have_content 'CNPJ: 00.000.000/0001-00'
  end
  it 'e volta para a tela dos fornecedores' do
    supplier = Supplier.create!(trade_name: 'Empresa não tão séria', corporate_name: 'Empresa séria',
                                full_address: 'Av. Séria, 100', city: 'Cidade Séria', state: 'ES',
                                email: 'emailserio@dominioserio.com.br', phone_number: '(00) 0000-0000',
                                registration_number: '00.000.000/0001-00')
    visit suppliers_path
    click_on 'Empresa não tão séria'
    click_on 'Voltar'
    expect(current_path).to eq suppliers_path
  end
end
