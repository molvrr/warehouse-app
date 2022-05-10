require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'false quando o campo trade_name está vazio' do
        supplier = Supplier.new(trade_name: '', corporate_name: 'Empresa séria', full_address: 'Av. Séria',
                                city: 'Cidade séria', state: 'ES', email: 'empresaseria@dominioserio.com.br',
                                phone_number: '(00) 0000-0000', registration_number: '00.000.000/0001-00')
        expect(supplier).not_to be_valid
      end

      it 'false quando o campo corporate_name está vazio' do
        supplier = Supplier.new(trade_name: 'Empresa não tão séria', corporate_name: '', full_address: 'Av. Séria',
                                city: 'Cidade séria', state: 'ES',
                                email: 'empresaseria@dominioserio.com.br', phone_number: '(00) 0000-0000',
                                registration_number: '00.000.000/0001-00')
        expect(supplier).not_to be_valid
      end

      it 'false quando o campo registration_number está vazio' do
        supplier = Supplier.new(trade_name: 'Empresa não tão séria', corporate_name: 'Empresa séria',
                                full_address: 'Av. Séria', city: 'Cidade séria', state: 'ES',
                                email: 'empresaseria@dominioserio.com.br', phone_number: '(00) 0000-0000',
                                registration_number: '')
        expect(supplier).not_to be_valid
      end
      it 'false quando o campo full_address está vazio' do
        supplier = Supplier.new(trade_name: 'Empresa não tão séria', corporate_name: 'Empresa séria',
                                full_address: '', city: 'Cidade séria', state: 'ES',
                                email: 'empresaseria@dominioserio.com.br', phone_number: '(00) 0000-0000',
                                registration_number: '00.000.000/0001-00')
        expect(supplier).not_to be_valid
      end
      it 'false quando o campo city está vazio' do
        supplier = Supplier.new(trade_name: 'Empresa não tão séria', corporate_name: 'Empresa séria',
                                full_address: 'Av. Séria', city: '', state: 'ES',
                                email: 'empresaseria@dominioserio.com.br', phone_number: '(00) 0000-0000',
                                registration_number: '00.000.000/0001-00')
        expect(supplier).not_to be_valid
      end
      it 'false quando o campo state está vazio' do
        supplier = Supplier.new(trade_name: 'Empresa não tão séria', corporate_name: 'Empresa séria',
                                full_address: 'Av. Séria', city: 'Cidade Séria', state: '',
                                email: 'empresaseria@dominioserio.com.br', phone_number: '(00) 0000-0000',
                                registration_number: '00.000.000/0001-00')
        expect(supplier).not_to be_valid
      end
      it 'false quando o campo email está vazio' do
        supplier = Supplier.new(trade_name: 'Empresa não tão séria', corporate_name: 'Empresa séria',
                                full_address: 'Av. Séria', city: 'Cidade Séria', state: 'ES',
                                email: '', phone_number: '(00) 0000-0000',
                                registration_number: '00.000.000/0001-00')
        expect(supplier).not_to be_valid
      end
      it 'false quando o campo phone_number está vazio' do
        supplier = Supplier.new(trade_name: 'Empresa não tão séria', corporate_name: 'Empresa séria',
                                full_address: 'Av. Séria', city: 'Cidade Séria', state: 'ES',
                                email: 'empresaseria@dominioserio.com.br', phone_number: '',
                                registration_number: '00.000.000/0001-00')
        expect(supplier).not_to be_valid
      end
    end
    context 'uniqueness' do
      it 'false quando o valor do campo registration_number já está em uso' do
        first_supplier = Supplier.create(trade_name: 'Empresa não tão séria', corporate_name: 'Empresa séria',
                                         full_address: 'Av. Séria', city: 'Cidade séria', state: 'ES',
                                         email: 'empresaseria@dominioserio.com.br', phone_number: '(00) 0000-0000',
                                         registration_number: '')
        second_supplier = Supplier.create(trade_name: 'Empresa cópia', corporate_name: 'Empresa cópia',
                                          full_address: 'Av. Cópia', city: 'Cidade cópia', state: 'ES',
                                          email: 'empresacópia@dominioserio.com.br', phone_number: '(00) 0000-0000',
                                          registration_number: '')

        expect(second_supplier).not_to be_valid
      end
    end
    context 'format' do
      it 'false quando o CNPJ não segue o padrão XX.XXX.XXX/XXXX-XX' do
        supplier = Supplier.create(trade_name: 'Empresa não tão séria', corporate_name: 'Empresa séria',
                                   full_address: 'Av. Séria', city: 'Cidade séria', state: 'ES',
                                   email: 'empresaseria@dominioserio.com.br', phone_number: '(00) 0000-0000',
                                   registration_number: '00000000000')
        expect(supplier).not_to be_valid
      end
    end
  end
end
