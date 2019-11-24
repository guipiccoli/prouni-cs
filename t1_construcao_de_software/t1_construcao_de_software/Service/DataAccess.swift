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
        let url = URL(string: "https://t2construcaodesoftwareapirela.herokuapp.com/listarCursos")!
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
    
    static func addNovoCurso(uf_busca:String, cidade_busca:String, universidade_nome: String, nome: String, campus_nome: String, grau: String, turno: String, mensalidade: String, notaIntegralAmpla: String, notaIntegralCotas: String, bolsa_integral_ampla: String, bolsa_integral_cotas: String, bolsa_parcial_cotas: String, bolsa_parcial_ampla: String, nota_parcial_ampla: String, nota_parcial_cotas: String, completionHandler completion: @escaping (Bool) -> Void) {
        

        let json: [String: String] = [
            "uf_busca": uf_busca,
            "cidade_busca": cidade_busca,
            "universidade_nome": universidade_nome,
            "campus_nome": campus_nome,
            "nome": nome,
            "grau": grau,
            "turno": turno,
            "mensalidade": mensalidade,
            "bolsa_integral_cotas": bolsa_integral_cotas,
            "bolsa_integral_ampla": bolsa_integral_ampla,
            "bolsa_parcial_cotas": bolsa_parcial_cotas,
            "bolsa_parcial_ampla": bolsa_parcial_ampla,
            "nota_integral_ampla": notaIntegralAmpla,
            "nota_integral_cotas": notaIntegralCotas,
            "nota_parcial_ampla": nota_parcial_ampla,
            "nota_parcial_cotas": nota_parcial_cotas
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
    
        print(json)
        let request = NSMutableURLRequest(url: NSURL(string: "https://t2construcaodesoftwareapirela.herokuapp.com/curso")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.httpBody = (jsonData as! Data)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField:"Content-Type")


        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error)
          } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
            completion(true)
          }
        })

        dataTask.resume()
    }
    
    static func deleteCurso(uf_busca:String, cidade_busca:String, universidade_nome: String, nome: String, campus_nome: String, grau: String, turno: String, mensalidade: String, notaIntegralAmpla: String, notaIntegralCotas: String, bolsa_integral_ampla: String, bolsa_integral_cotas: String, bolsa_parcial_cotas: String, bolsa_parcial_ampla: String, nota_parcial_ampla: String, nota_parcial_cotas: String, completionHandler completion: @escaping (Bool) -> Void) {
           

           let json: [String: String] = [
               "uf_busca": uf_busca,
               "cidade_busca": cidade_busca,
               "universidade_nome": universidade_nome,
               "campus_nome": campus_nome,
               "nome": nome,
               "grau": grau,
               "turno": turno,
               "mensalidade": mensalidade,
               "bolsa_integral_cotas": "5",
               "bolsa_integral_ampla": "5",
               "bolsa_parcial_cotas": "5",
               "bolsa_parcial_ampla": "5",
               "nota_integral_ampla": notaIntegralAmpla,
               "nota_integral_cotas": notaIntegralCotas,
               "nota_parcial_ampla": "0.0",
               "nota_parcial_cotas": "0.0"
           ]
           
           let jsonData = try? JSONSerialization.data(withJSONObject: json)
       
           print(json)
           let request = NSMutableURLRequest(url: NSURL(string: "https://t2construcaodesoftwareapirela.herokuapp.com/curso")! as URL,
                                                   cachePolicy: .useProtocolCachePolicy,
                                               timeoutInterval: 10.0)
           request.httpMethod = "DELETE"
           request.httpBody = (jsonData as! Data)
           request.setValue("application/json; charset=utf-8", forHTTPHeaderField:"Content-Type")


           let session = URLSession.shared
           let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
             if (error != nil) {
               print(error)
             } else {
               let httpResponse = response as? HTTPURLResponse
               print(httpResponse)
               completion(true)
             }
           })

           dataTask.resume()
       }
    
    
    
    static func getListarTodosCursos(completionHandler completion: @escaping ([Curso]?) -> Void) {
        
        
        // create get request
        let url = URL(string: "https://t2construcaodesoftwareapirela.herokuapp.com/")!
        let request = URLRequest(url: url)
        
        //create session
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
