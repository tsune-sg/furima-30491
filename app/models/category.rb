class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'Mens' }, { id: 2, name: 'Ladies' }, { id: 3, name: 'Kids' }
  ]
end
