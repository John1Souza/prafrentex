-- Usuários (clientes)
CREATE TABLE usuario (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  cpf VARCHAR(11) UNIQUE NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  senha_hash VARCHAR(255) NOT NULL,
  data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Contas bancárias
CREATE TABLE conta (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  saldo DECIMAL(15, 2) DEFAULT 0.00,
  tipo ENUM('corrente', 'poupanca') NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

-- Transações (histórico)
CREATE TABLE transacao (
  id INT PRIMARY KEY AUTO_INCREMENT,
  conta_origem_id INT,
  conta_destino_id INT NOT NULL,
  valor DECIMAL(15, 2) NOT NULL,
  tipo ENUM('transferencia', 'deposito', 'saque', 'pix'),
  data DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (conta_origem_id) REFERENCES conta(id),
  FOREIGN KEY (conta_destino_id) REFERENCES conta(id)
);