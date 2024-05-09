import { Given, When, Then, Before } from 'cypress-cucumber-preprocessor/steps';
import LoginUsuario from '../pages/loginUsuario.page';

const paginaLogin = new LoginUsuario();

Before(function () {
    cy.visit('https://bugbank.netlify.app', {
        onBeforeLoad(win) {
            win.localStorage.setItem('joao@jp.com', '{"name":"Joao Pedro","email":"joao@jp.com","password":"*","accountNumber":"177-0","balance":543.66666666667,"logged":false}');
            win.localStorage.setItem('joao@jb.com', '{"name":"Joao Pedro","email":"joao@jb.com","password":"*","accountNumber":"984-5","balance":543.66666666667,"logged":false}');
        },
    })
});

Given('que loguei o usuário cadastrado', function () {
    paginaLogin.typeEmail('joao@jp.com');
    paginaLogin.typePassword('*');
    paginaLogin.clickButtonSubmit();
});

// Given('que o saldo da conta de origem é maior que 0', function(){

// });

Given('preencho as informações de transferência corretamente', function () {
    paginaLogin.typeNumeroConta('984');
    paginaLogin.typeDigitoConta('5');
    paginaLogin.typeValorTransferencia('1');
    paginaLogin.typeDescricao('Conta de água');
});

When('acessei a área de transferência', function () {
    paginaLogin.clickButtonTransferencia();
});

When('eu confirmar a operação', function () {
    paginaLogin.clickButtonTransferir();
});

When('preencho os campos de transferência corretamente', function () {
    paginaLogin.typeDigitoConta('5');
    paginaLogin.typeValorTransferencia('1');
    paginaLogin.typeDescricao('Conta de água');
});

When('a conta de destino é inválida', function () {
    paginaLogin.typeNumeroConta('985');
});

Then('a mensagem "Transferência realizada com sucesso" será exibida', function () {
    cy.get(paginaLogin.message).invoke('text').should('equal', 'Transferencia realizada com sucesso');
});

Then('a "mensagem de erro" de conta inválida ou inexistente é exibida', function () {
    cy.get(paginaLogin.message).invoke('text').should('equal', 'Conta inválida ou inexistente');
});

Then('serei redirecionado para o extrato', function () { });

Then('o saldo da conta permanece o mesmo', function () { });