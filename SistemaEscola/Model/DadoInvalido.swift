//
//  DadoInvalido.swift
//  SistemaEscola
//
//  Created by Andrimarciely on 29/04/22.
//  Copyright © 2022 Eldorado. All rights reserved.
//

import Foundation

// Enum utilizado para mensagens de inserção de dado inválido
enum DadoInvalido: String {
    
    case quantidadeDiretor
    case salarioDiretor
    case quantidadeCoordenador
    case tudoOK
    
    func notificacaoInvalidez() -> String {
        
        switch self {
        case .quantidadeDiretor:
            return "Essa escola já possui um diretor. Por favor, adicione colaborador com outro cargo. "
        case .salarioDiretor:
            return "Salário está acima do teto salarial permitido. Por favor, revise valores"
        case .quantidadeCoordenador:
            return "Essa escola já tem coordenadores suficientes para o corpo docente.  Por favor, adicione colaborador com outro cargo."
        default:
            return ""
        }
        
    }
    
}
