//
//  Curso.swift
//  t1_construcao_de_software
//
//  Created by Fernando Locatelli Maioli on 02/10/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import Foundation

//struct ListaCurso: Codable {
//    let listaCurso: [Curso]
//}
//
//struct Curso: Codable {
//    let uf_busca, cidade_busca, universidade_nome, campus_nome, nome, grau, turma,  mensalidade,  bolsa_integral_cotas, bolsa_integral_ampla, bolsa_partial_cotas, bolsa_parcial_ampla, nota_integral_ampla, nota_integral_cotas, nota_parcial_ampla, nota_parcial_cotas: String?
//}
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let curso = try? newJSONDecoder().decode(Curso.self, from: jsonData)

// MARK: - Curso
struct Curso: Codable {
    let uf_busca: String?
    let cidade_busca, universidade_nome, campus_nome: String?
    let nome: String?
    let grau: String?
    let turno: String?
    let mensalidade: Double?
    let bolsa_integral_cotas, bolsa_integral_ampla, bolsa_partial_cotas, bolsa_parcial_ampla: Int?
    let nota_integral_ampla, nota_integral_cotas, nota_parcial_ampla, nota_parcial_cotas: Double?

}
