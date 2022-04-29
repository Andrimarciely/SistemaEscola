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
}
