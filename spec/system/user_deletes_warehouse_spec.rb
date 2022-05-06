require 'rails_helper'

describe 'Usuário remove um galpão' do
  it 'com sucesso' do
    # Arrange
    w = Warehouse.create!(name: 'Curitiba', code: 'CWB', area: 1000, cep: '46000-000',
                          city: 'Curitiba', address: 'Em Curitiba', description: 'Um galpão em Curitiba.')

    # Act
    visit root_path
    click_on 'Curitiba'
    click_on 'Remover'

    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão removido com sucesso'
    expect(page).not_to have_content 'Curitiba'
    expect(page).not_to have_content 'CWB'
  end
  it 'e não apaga outros galpões' do
    # Arrange
    first_warehouse = Warehouse.create!(name: 'Curitiba', code: 'CWB', area: 1000, cep: '46000-000',
                                        city: 'Curitiba', address: 'Em Curitiba', description: 'Um galpão em Curitiba.')
    second_warehouse = Warehouse.create!(name: 'Belo Horizonte', code: 'BHZ', area: 1000, cep: '46000-000',
                                         city: 'Belo Horizonte', address: 'Av de Jesus', description: 'Um galpão em Belo Horizonte.')

    # Act
    visit root_path
    click_on 'Curitiba'
    click_on 'Remover'

    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão removido com sucesso'
    expect(page).not_to have_content 'Curitiba'
    expect(page).not_to have_content 'CWB'
    expect(page).to have_content 'Belo Horizonte'
    expect(page).to have_content 'BHZ'
  end
end
