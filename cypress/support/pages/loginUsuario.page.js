export default class LoginUsuario {
    inputEmail = '.style__ContainerFormLogin-sc-1wbjw6k-0 > :nth-child(1) > .input__default';
    inputPassword = '.style__ContainerFormLogin-sc-1wbjw6k-0 > .login__password > .style__ContainerFieldInput-sc-s3e9ea-0 > .input__default';
    buttonSubmit = '.otUnI';
    buttonTransferencia = '#btn-TRANSFERÊNCIA';
    inputNumeroConta = ':nth-child(1) > .input__default';
    inputDigitoConta = '.account__data > :nth-child(2) > .input__default';
    inputValorTransferencia = '.styles__ContainerFormTransfer-sc-1oow0wh-0 > :nth-child(2) > .input__default';
    inputDescricao = ':nth-child(3) > .input__default';
    buttonTransferir = '.style__ContainerButton-sc-1wsixal-0';
    message = '#modalText';

    typeEmail(email) {
        cy.get(this.inputEmail).type(email);
    }

    typePassword(password) {
        cy.get(this.inputPassword).type(password);
    }

    typeNumeroConta(numConta) {
        cy.get(this.inputNumeroConta).type(numConta);
    }

    typeDigitoConta(digitoConta) {
        cy.get(this.inputDigitoConta).type(digitoConta);
    }

    typeValorTransferencia(valorTransf) {
        cy.get(this.inputValorTransferencia).type(valorTransf);
    }

    typeDescricao(descricao) {
        cy.get(this.inputDescricao).type(descricao);
    }

    clickButtonTransferir() {
        cy.get(this.buttonTransferir).dblclick({ force: true });
    }

    clickButtonSubmit() {
        cy.get(this.buttonSubmit).click({ force: true })
    }

    clickButtonTransferencia() {
        cy.get(this.buttonTransferencia).click({ force: true })
    }
}