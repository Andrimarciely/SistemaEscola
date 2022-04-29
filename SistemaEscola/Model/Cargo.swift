//
//  Cargo.swift
//  SistemaEscola
//
//  Adaptado by Andrimarciely on 29/04/22.
//  Copyright © 2022 Eldorado. All rights reserved.
//

import Foundation

// Sugiro que utilizem esse Enum pois eu já deixei preparado para os botões, mas sintam-se à vontade para alterar para uma estrutura melhor caso sintam essa necessidade.


enum Cargo: String, CaseIterable {
    case monitor = "Monitor"
    case professor = "Professor"
    case coordenador = "Coordenador"
    case diretor = "Diretor"
    case assistente = "Assistente"
}
