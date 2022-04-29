//
//  Escola.swift
//  SistemaEscola
//
//  Created by Aluno01 on 29/04/22.
//  Copyright © 2022 Eldorado. All rights reserved.
//

import Foundation

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
    // Funcionalidade 1 do sistema da escola
    // Cadastrar novos colaboradores
    mutating func adicionaColaborador(novoColaborador: Colaborador){
        
        colaboradores.append(novoColaborador)
        
    }
    
}
