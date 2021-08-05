
Product.seed(
  :id,
  { id: 1,  user_id: 5,  name: 'Model1' },
  { id: 2,  user_id: 6,  name: 'Model3' },
  { id: 3,  user_id: 7,  name: 'Model5' },
  { id: 4,  user_id: 8,  name: 'Model7' },
  { id: 5,  user_id: 9,  name: 'ModelA' },
  { id: 6,  user_id: 10, name: 'ModelB' },
  { id: 7,  user_id: 11, name: 'ModelC' },
  { id: 8,  user_id: 12, name: 'ModelX' },
  { id: 9,  user_id: 13, name: 'ModelY' },
  { id: 10, user_id: 14, name: 'ModelZ' }
)

UserProduct.seed(
  :id,
  { id: 1,  user_id: 5,  product_id: 1  },
  { id: 2,  user_id: 6,  product_id: 2  },
  { id: 3,  user_id: 7,  product_id: 3  },
  { id: 4,  user_id: 8,  product_id: 4  },
  { id: 5,  user_id: 9,  product_id: 5  },
  { id: 6,  user_id: 10, product_id: 6  },
  { id: 7,  user_id: 11, product_id: 7  },
  { id: 8,  user_id: 12, product_id: 8  },
  { id: 9,  user_id: 13, product_id: 9  },
  { id: 10, user_id: 14, product_id: 10 }
)

Customer.seed(
  :id,
  { id: 1,  user_id: 5,  number: '123-456', name: 'TSMC' },
  { id: 2,  user_id: 6,  number: '234-567', name: 'サムスン' },
  { id: 3,  user_id: 7,  number: '345-600', name: 'エヌビディア' },
  { id: 4,  user_id: 8,  number: '345-700', name: 'インテル' },
  { id: 5,  user_id: 9,  number: '345-800', name: 'ブロードコム' },
  { id: 6,  user_id: 10, number: '345-900', name: 'クアルコム' },
  { id: 7,  user_id: 11, number: '456-100', name: 'ソニー' },
  { id: 8,  user_id: 12, number: '456-100', name: 'ルネサスエレクトロニクス' },
  { id: 9,  user_id: 13, number: '456-100', name: 'キオクシアホールディングス' },
  { id: 10, user_id: 14, number: '456-100', name: 'マイクロンテクノロジー' }
)

