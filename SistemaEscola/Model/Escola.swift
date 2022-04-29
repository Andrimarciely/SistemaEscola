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
    
    

}
