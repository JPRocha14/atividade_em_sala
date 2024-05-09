# language: pt

Funcionalidade: Transferência bancária entre contas

Contexto: Logar o usuário com sucesso
Dado que loguei o usuário cadastrado
E acessei a área de transferência

# Cenário: Transferência para conta válida com saldo suficiente
# # Dado que o saldo da conta de origem é maior que 0
# E preencho as informações de transferência corretamente
# Quando eu confirmar a operação
# Então a mensagem "Transferência realizada com sucesso" será exibida
# E serei redirecionado para o extrato

Cenário: Não deve ser possível transferir um valor para uma conta inválida
# Dado que o saldo da conta seja maior que 0
E preencho os campos de transferência corretamente
E a conta de destino é inválida
Quando eu confirmar a operação
Então a "mensagem de erro" de conta inválida ou inexistente é exibida
E o saldo da conta permanece o mesmo

# Cenário: Deve ser permitido transferir se o saldo da conta for igual ou maior que o valor transferido
# Dado que o saldo da conta seja "R$1000,00"
# E acesso a área de transferência
# E preencho os campos de transferência corretamente
# E a conta de destino é válida
# Quando realizo a transferência de "R$1000,00"
# Então a mensagem de sucesso é exibida
# E o saldo da conta é debitado

# Cenário: Não deve ser permitido transferir se o saldo da conta for menor que o valor da transferência
# Dado que o saldo da conta seja "R$1000,00"
# E acesso a área de transferência
# E preencho os campos de transferência corretamente
# E a conta de destino é válida
# Quando tento realizar a transferência de "R$1000,01"
# Então a mensagem de saldo insuficiente é exibida
# E o saldo da conta permanece o mesmo

# Cenário: Não deve ser possível transferir para uma conta que seu número não seja somente carateres numéricos
# Dado que o saldo da conta seja maior que 0
# E acesso a área de transferência
# Quando preencho o campo Número da conta com caracteres não numéricos
# E preencho os demais campos corretamente
# E tento realizar a transferência
# Então a mensagem de "erro" é exibida
# E o saldo da conta permanece o mesmo

# Cenário: Não deve ser possível transferir para uma conta que seu dígito não seja somente carateres numéricos
# Dado que o saldo da conta seja maior que 0
# E acesso a área de transferência
# Quando preencho o campo Dígito com caracteres não numéricos
# E preencho os demais campos corretamente
# E tento realizar a transferência
# Então a mensagem de "erro" é exibida
# E o saldo da conta permanece o mesmo

# Cenário: Não deve ser permitido transferir com campo de descrição vazio
# Dado que o saldo da conta seja maior que 0
# E acesso a área de transferência
# E preencho os campos de transferência corretamente
# Mas não preencho o campo Descrição
# E a conta de destino é válida
# Quando tento realizar a transferência de valor maior que 0 e menor que o saldo em conta
# Então a ação não é concluída

# Cenário: Não deve ser permitido transferir um valor igual a R$0,00
# Dado que o saldo da conta seja maior que 0
# E acesso a área de transferência
# E preencho os campos de transferência corretamente
# E a conta de destino é válida
# Quando tento realizar a transferência de valor igual a "R$0,00"
# Então a mensagem de "erro" é exibida
# Cenário: Não deve ser permitido transferir um valor menor que R$0,00
# Dado que o saldo da conta seja maior que 0
# E acesso a área de transferência
# E preencho os campos de transferência corretamente
# E a conta de destino é válida
# Quando tento realizar a transferência de valor negativo
# Então a mensagem de "erro" é exibida

# Cenário: Ao realizar a transferência com sucesso, o valor transferido deve ser debitado da conta
# Dado que o saldo da conta seja maior que 0
# E acesso a área de transferência
# E preencho os campos de transferência corretamente
# E a conta de destino é válida
# Quando realizar a transferência de valor maior que 0 e menor que o saldo em conta
# Então a mensagem de sucesso é exibida
# E o saldo da conta é debitado

# Cenário: Ao realizar a transferência com sucesso, o usuário deve ser redirecionado para o extrato
# Dado que o saldo da conta seja maior que 0
# E acesso a área de transferência
# E preencho os campos de transferência corretamente
# E a conta de destino é válida
# Quando realizar a transferência de valor maior que 0 e menor que o saldo em conta
# Então a mensagem de sucesso é exibida
# E sou redirecionado para o extrato
# E o saldo da conta é debitado

# Cenário: Tentativa de transferência para a própria conta
# Dado que o saldo da conta de origem é de R$ 100,00
# E que a conta de origem e a conta de destino são as mesmas
# Quando eu tentar realizar uma transferência de R$ 50,00 para a própria conta
# Então a mensagem de erro "Não é possível transferir para a mesma conta" será exibida
# E o saldo da conta de origem permanecerá o mesmo
# E nenhuma transação será registrada no extrato da conta