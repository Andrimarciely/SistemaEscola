//
//  ViewController.swift
//  SistemaEscola
//
//  Created by Renan Trévia on 2/11/22.
//  Copyright © 2022 Eldorado. All rights reserved.
//  Edited by Andrimarciely May 1st

import UIKit

extension String {
    var doubleValue: Double {
        return Double(self) ?? 0
    }
}

let algunsColaboradores: [Colaborador] = [
    Colaborador(nome: "Beatriz Viana", matricula: "1", salario: 1000, cargo: .assistente),
    Colaborador(nome: "Luiz Miguel Rezende", matricula: "2", salario: 1200, cargo: .monitor),
    Colaborador(nome: "Isaac Gonçalves", matricula: "5", salario: 1600, cargo: .professor)]

var escola = Escola(colaboradores: algunsColaboradores)

class ViewController: UIViewController {
    
    @IBOutlet weak var outputMessage: UILabel!
    
    @IBOutlet weak var matriculaTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var salarioTextField: UITextField!
    
    @IBOutlet weak var monitorButton: UIButton!
    @IBOutlet weak var professorButton: UIButton!
    @IBOutlet weak var coordenadorButton: UIButton!
    @IBOutlet weak var diretorButton: UIButton!
    @IBOutlet weak var assistenteButton: UIButton!
    
    @IBOutlet weak var removeMatriculaTextField: UITextField!
    
    var cargoSelecionado: Cargo = .monitor
    
    @IBAction func selecionaMonitor(_ sender: UIButton) {
        cargoSelecionado = .monitor
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaProfessor(_ sender: UIButton) {
        cargoSelecionado = .professor
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaCoordenador(_ sender: UIButton) {
        cargoSelecionado = .coordenador
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaDiretor(_ sender: UIButton) {
        cargoSelecionado = .diretor
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaAssistente(_ sender: UIButton) {
        cargoSelecionado = .assistente
        selecionaBotao(botao: sender)
    }
    
    @IBAction func cadastrarColaborador(_ sender: UIButton) {
        // TODO: Inserir Feature 1 Aqui!
        let novoColaborador: Colaborador = Colaborador(nome: nomeTextField.text ?? "", matricula: matriculaTextField.text ?? "", salario: salarioTextField.text?.doubleValue ?? 0 , cargo: cargoSelecionado)
        
        let mensagem = escola.self.adicionaColaboradorComValidacao(novoColaborador: novoColaborador)
        
        if mensagem == ""{
            outputMessage.text = ""
            let nomes = escola.listaColaboradoresEmOrdemAlfabetica()
            let nomesJuntos = nomes.joined(separator: ", ")
            outputMessage.text = nomesJuntos
        }
        else {
            outputMessage.text = mensagem
        }
        // Importante deixar essa função como última porque ela reseta o sistema por estado inicial.
        resetaCadastraColaborador()
    }
    
    @IBAction func removerColaborador(_ sender: UIButton) {
        // TODO: Inserir Feature 2 Aqui!
        let matricula = matriculaTextField.text
        
        escola.colaboradores.removeAll{$0.matricula == matricula}
        
        // Importante deixar essa função como última porque ela reseta o sistema por estado inicial.
        resetaRemoveColaborador()
    }
    
    @IBAction func listarGastosMensaisComTodosColaboradores(_ sender: UIButton) {
        // TODO: Inserir Feature 3 Aqui!

        outputMessage.text = "Total de Gastos Mensais na escola é de R$\(escola.self.gastosMensais())"
    }
    
    @IBAction func listarGastosMensaisPorCargo(_ sender: UIButton) {
        // TODO: Inserir Feature 4 Aqui!

        outputMessage.text = ""
        for cargo in Cargo.allCases{
            outputMessage.text! += "\(escola.listaGasto(porCargo: cargo))\n"
        }
    }
    
    @IBAction func listarQuantasPessoasExistemPorCargo(_ sender: UIButton) {
        // TODO: Inserir Feature 5 Aqui!
        outputMessage.text = ""
        for cargo in Cargo.allCases{
            outputMessage.text! += "\(escola.listaQuantidadeDeColaborador(porCargo: cargo))\n"
        }
        
    }
    
    @IBAction func listarNomesColaboradoresOrdemAlfabetica(_ sender: UIButton) {
        // TODO: Inserir Feature 6 Aqui!

        
        // No exemplo do .playgrounds, a gente tem uma função que retorna um Array de String ([String]).
        // Basta fazer como no exemplo abaixo:
        let nomes = escola.listaColaboradoresEmOrdemAlfabetica()
        let nomesJuntos = nomes.joined(separator: ", ")
        outputMessage.text = nomesJuntos
        // Dei colherinha de chá aqui hein 🥄☕️ Obrigada. [=.
    }
    
}

