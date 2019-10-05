//
//  File.swift
//  t1_construcao_de_software
//
//  Created by Fernando Locatelli Maioli on 02/10/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import Foundation

struct DataAccess {
    
    static func getListaDeCursos(completionHandler completion: @escaping (Curso?) -> Void) {
        var request = URLRequest(url: URL(string: "dontpad.com/requisicao_enem")!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            guard let error = error
                else {
                    let curso = try? JSONDecoder().decode(Curso.self, from: data!)
                    print(curso)
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
