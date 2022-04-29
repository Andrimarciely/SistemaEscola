//
//  Escola.swift
//  SistemaEscola
//
//  Adaptado by Andrimarciely on 29/04/22.
//  Copyright © 2022 Eldorado. All rights reserved.
//


import Foundation

// Converter Int em Bool
extension Int {
    
    var valorBooleano: Bool {return self != 0 }
    
}


struct Escola {

    var colaboradores: [Colaborador]
    
    // Funcionalidade 3 do sistema da escola
    // Listar gastos mensais com todos os colaboradores
    func gastosMensais() -> Double {
         
         var gastos : Double = 0
         
         gastos = colaboradores.map{ $0.salario }.reduce(0, +)
         
         return gastos
     }
    
      // Funcionalidade 4 do sistema da escola
      // Listar gastos mensais por cargo
      func listaGasto(porCargo cargo: Cargo) -> String{
          
          var gastos : Double = 0
          var listaDoCargo : [Colaborador]
          
          listaDoCargo = colaboradores.filter{ $0.cargo == cargo }
          gastos = listaDoCargo.map{ $0.salario }.reduce(0, +)
          
          return "Os gastos com o cargo \(cargo.rawValue) são de R$\(gastos)."
          
      }
    
    // Funcionalidade 5 do sistema da escola
    // Listar quantas pessoas existem por cargo
    func listaQuantidadeDeColaborador(porCargo cargo: Cargo) -> String{
        
        var quantidade = 0
        
        quantidade = colaboradores.filter{ $0.cargo == cargo }.count
        
        return "Existe(m) \(quantidade) colaborador(es) do cargo \(cargo.rawValue)."
    }
    
    // Funcionalidade 6 do sistema da escola
    // Listar os nomes de todos os colaboradores em ordem alfabética
    func listaColaboradoresEmOrdemAlfabetica() -> [String] {
         
         let nomes: [String] = self.colaboradores.map{$0.nome}.sorted()
         
         return nomes
         
    }
    
    // Funcionalidade 1 do sistema da escola sem as regras
    // Cadastrar novos colaboradores
    mutating func adicionaColaborador(novoColaborador: Colaborador){
        
        colaboradores.append(novoColaborador)
        
    }
    
    // Funcionalidade 1 do sistema da escola com as regras da escola
    // Cadastrar novos colaboradores
    //Inicio
    
    func temDiretor() -> Bool{
         
         return colaboradores.filter{ $0.cargo == .diretor }.count.valorBooleano
     }
     
     func salarioDiretor() -> Double {
         
         var diretor : [Colaborador]
         
         diretor = colaboradores.filter{ $0.cargo == .diretor }
         
         return diretor.map{ $0.salario }.reduce(0, +)
     }
    
     func coordenadorSuficiente() -> Bool {
         var maximaQuantidadeCoordenador : Int = 0
         var quantidadeCoordenador : Int = 0
         
         maximaQuantidadeCoordenador = colaboradores.filter{ $0.cargo == .professor }.count
         quantidadeCoordenador = colaboradores.filter{ $0.cargo == .coordenador }.count
         
         return quantidadeCoordenador == maximaQuantidadeCoordenador
     }
     
     func DadoValido(novoColaborador: Colaborador) -> String {
         
         var dadoInvalido : DadoInvalido = .tudoOK
         var gastoDiretor: Double = 0
         
         if temDiretor(){
             gastoDiretor = salarioDiretor()
             
             if  novoColaborador.cargo == .diretor {
                 dadoInvalido = .quantidadeDiretor
             }
              else if novoColaborador.salario >= gastoDiretor{
                         dadoInvalido = .salarioDiretor
                 }
             }
         
      if  novoColaborador.cargo == .coordenador && coordenadorSuficiente() {
             dadoInvalido = .quantidadeCoordenador
         }
         
         return dadoInvalido.notificacaoInvalidez()
     }
     
     
     mutating func adicionaColaboradorComValidacao(novoColaborador: Colaborador) -> String{
         var mensagem: String
         mensagem = DadoValido(novoColaborador: novoColaborador)
         if mensagem == "" {
             colaboradores.append(novoColaborador)
         }else {
             print(mensagem)
         }
        
        return mensagem
     }
    
   
}
