//
//  Curso.swift
//  t1_construcao_de_software
//
//  Created by Fernando Locatelli Maioli on 02/10/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import Foundation

struct ListaCurso {
    let listaCurso: [Curso]
}

struct Curso: Codable {
    let uf_busca, cidade_busca, universidade_nome, campus_nome, nome, grau, turma,  mensalidade,  bolsa_integral_cotas, bolsa_integral_ampla, bolsa_partial_cotas, bolsa_parcial_ampla, nota_integral_ampla, nota_integral_cotas, nota_parcial_ampla, nota_parcial_cotas: String?
}
