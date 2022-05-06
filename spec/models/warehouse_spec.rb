require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'false quando o campo name está vazio' do
        # Arrange
        warehouse = Warehouse.new(name: '', code: 'RIO', address: 'Endereço',
                                  cep: '25000-000', city: 'Rio', area: 1000,
                                  description: 'Descrição')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end
      it 'false quando o campo code está vazio' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: '', address: 'Endereço',
                                  cep: '25000-000', city: 'Rio', area: 1000,
                                  description: 'Descrição')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end
      it 'false quando o campo address está vazio' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: '',
                                  cep: '25000-000', city: 'Rio', area: 1000,
                                  description: 'Descrição')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end
      it 'false quando o campo cep está vazio' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Endereço',
                                  cep: '', city: 'Rio', area: 1000,
                                  description: 'Descrição')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end
      it 'false quando o campo city está vazio' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Endereço',
                                  cep: '25000-000', city: '', area: 1000,
                                  description: 'Descrição')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end
      it 'false quando o campo area está vazio' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Endereço',
                                  cep: '25000-000', city: 'Rio de Janeiro', area: nil,
                                  description: 'Descrição')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end
    end
    context 'uniqueness' do
      it 'false quando o valor do campo code já está em uso' do
        # Arrange
        first_warehouse = Warehouse.create(name: 'Rio', code: 'RIO', address: 'Endereço',
                                           cep: '25000-000', city: 'Rio', area: 1000,
                                           description: 'Descrição')
        second_warehouse = Warehouse.create(name: 'Niterói', code: 'RIO', address: 'Endereço',
                                            cep: '25000-000', city: 'Niterói', area: 1000,
                                            description: 'Outra descrição')
        # Act
        expect(second_warehouse.valid?).to be false
      end
      it 'false quando o valor do campo name já está em uso' do
        # Arrange
        first_warehouse = Warehouse.create(name: 'Rio', code: 'RIO', address: 'Endereço',
                                           cep: '25000-000', city: 'Rio', area: 1000,
                                           description: 'Descrição')
        second_warehouse = Warehouse.create(name: 'Rio', code: 'AJU', address: 'Endereço',
                                            cep: '25000-000', city: 'Aracaju', area: 1000,
                                            description: 'Outra descrição')
        # Act
        expect(second_warehouse.valid?).to be false
      end
    end
    context 'format' do
      it 'false quando o CEP não segue o padrão 00000-000' do
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Endereço',
                                  cep: '25000-00', city: 'Rio', area: 1000,
                                  description: 'Descrição')
        expect(warehouse.valid?).to be false
      end
    end
  end
end
