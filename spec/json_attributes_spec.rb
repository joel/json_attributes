require 'spec_helper'

describe JsonAttributes do
  it 'has a version number' do
    expect(JsonAttributes::VERSION).not_to be nil
  end

  let(:user) { User.where(name: 'John Doe').first! }

  it "Json attributes have same access than classic ones" do
    %i(name address).each do |attribute|
      expect(user).to be_respond_to(attribute)
      expect(user).to be_respond_to("#{attribute}=")
      expect(user).to be_respond_to("#{attribute}?")
    end
  end

  context 'with data' do
    before do
      user.office = { address: 'no address filled' }
      user.save
    end

    it "Psy should access indifferently to regular and json attributes" do
      # Json attributes can be handled through classic accessor
      expect {
        user.address = '75 Ninth Avenue 2nd and 4th Floors New York, NY 10011.'
      }.to change {
        user.office['address']
      }.from('no address filled').to('75 Ninth Avenue 2nd and 4th Floors New York, NY 10011.') # From Factory to new setted value

      # binding.pry
      expect(user.address?).to be_truthy # Json attribute should have classic AR predicate
      expect(user.address).to eql('75 Ninth Avenue 2nd and 4th Floors New York, NY 10011.') # Classic AR accessor

      expect(user.attributes).to be_has_key('address') # Json one
      expect(user.attributes).to be_has_key('name') # Classic one
      expect(user.attributes).to_not be_has_key('office') # No need office twice

      user.name = 'Jane Doe'
      # Access to a classic attributes transparently in both way
      expect(user.attributes['name']).to eql('Jane Doe')
      expect(user.attributes[:name]).to eql('Jane Doe')
      expect(user.name).to eql('Jane Doe')

      user.address = 'Main Office'
      # Access to Json attributes transparently in both way
      expect(user.attributes['address']).to eql('Main Office')
      expect(user.attributes[:address]).to eql('Main Office')
      expect(user.address).to eql('Main Office')

      # Can be assign transparently json field and classics ones through assign_attributes
      # Old fashion syntax hash
      user.assign_attributes({ 'name' => 'Jane Doe', 'address' => 'Second Office' })
      expect(user.address).to eql('Second Office') # Json field
      expect(user.name).to eql('Jane Doe') # Classic field

      # new syntax hash
      user.name, user.address = nil, nil
      user.assign_attributes({ name: 'Jane Doe', address: 'Second Office' })
      expect(user.address).to eql('Second Office') # Json field
      expect(user.name).to eql('Jane Doe') # Classic field

      # Can be assign transparently json field and classics ones through attributes=
      user.name, user.address = nil, nil
      user.attributes = { name: 'Jane Doe', address: 'Second Office' }
      expect(user.address).to eql('Second Office') # Json field
      expect(user.name).to eql('Jane Doe') # Classic field

      # Search works in the same way
      expect(User.find_by_name('John Doe')).to              eql(user)
      expect(User.find_by_address('no address filled')).to  eql(user)

      expect(User.find_by_name('No existed record')).to       eql(nil)
      expect(User.find_by_address('No existed record')).to eql(nil)
    end
  end

end
