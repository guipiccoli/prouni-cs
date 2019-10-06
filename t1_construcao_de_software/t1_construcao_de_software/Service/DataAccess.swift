//
//  File.swift
//  t1_construcao_de_software
//
//  Created by Fernando Locatelli Maioli on 02/10/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import Foundation

struct DataAccess {
    
    static func getListaDeCursos(nota: Double, uf_busca:String, cidade_busca:String, universidade_nome: String, nome: String, somente_cota: String, somente_integral: String, completionHandler completion: @escaping ([Curso]?) -> Void) {
        
        let json: [String: String] = [
            "nota": "\(nota)",
            "uf_busca": uf_busca,
            "cidade_busca": cidade_busca,
            "universidade_nome": universidade_nome,
            "nome": nome,
            "somente_cota": somente_cota,
            "somente_integral": somente_integral
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "https://t1construcaodesoftware.herokuapp.com/listarCursos")!
        var request = URLRequest(url: url)
        request.setValue(" application/json; charset=utf-8", forHTTPHeaderField:"Content-Type")
        request.httpMethod = "POST"
        
        // insert json data to the request
        request.httpBody = jsonData
        
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            guard let error = error
                else {
                    let curso = try? JSONDecoder().decode([Curso].self, from: data!)
                    completion(curso)
                    return
            }
            print(error.localizedDescription)
            completion(nil)
            return
        })
        dataTask.resume()
    }    
}
