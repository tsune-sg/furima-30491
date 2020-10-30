class Condition < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '新品,未使用' }, { id: 2, name: '数回使用' }, { id: 3, name: '目立った傷や汚れなし' },
    { id: 4, name: 'やや汚れ、痛み、匂いあり' }, { id: 5, name: '汚れ、痛み、匂いあり' }, { id: 6, name: '全体的に状態が悪い' }
  ]
end
