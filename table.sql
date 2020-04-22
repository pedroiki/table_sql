

-- criando uma tabela
CREATE TABLE products (
  id int,                         -- identificador do produto
  name  varchar(255),             -- propriedades da tabela, 225 tamanho to text, varchar = texto
  price double,                   -- double porque e um numero flutuante
  creation_date datetime          -- data de criacao do produto
)


CREATE TABLE categories (
  id int,
  name varchar(255),
  flag enum ('private', 'public')        -- dizer se a categoria e publica ou nao, enum=2 valores possiveis
)

CREATE TABLE categories_products (              -- relacao dos 2
  product_id int,                               -- int = inteiro
  category_id int,
  CONSTRAINT product_category_pk PRIMARY KEY (product_id, category_id),
  CONSTRAINT FK_product
      FOREIGN KEY (product_id) REFERENCES products (product_id),
  CONSTRAINT FK_category
      FOREIGN KEY (category_id) REFERENCES categories (category_id)
)

SELECT *                     -- select all
FROM product as p, category as c, product_category as pc       -- dando nome as tabelas
WHERE pc.product_id = p.id             -- =     p.id = propriedade do produto,identificador
      AND pc.category_id = c.id        -- identificador da categoria do produto
      WHERE c.flag = 'public'
      HAVING COUNT(*) > 5              -- quantidade de registros encontrados
