class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '' },
    { id: 3, name: '' },
    { id: 4, name: '' },
    { id: 5, name: '' },
    { id: 6, name: '' },
    { id: 7, name: '' },
    { id: 8, name: '' },
    { id: 9, name: '' },
    { id: 10, name: '' }
  ]

  include ActiveHash::Associations
  has_many :products
  end