//
//  ListViewController.swift
//  t1_construcao_de_software
//
//  Created by Fernando Locatelli Maioli on 02/10/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var listaCursos: [Curso]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        DataAccess.getListaDeCursos(nota: 500, uf_busca: "RS", cidade_busca: "", universidade_nome: "", nome: "", somente_cota: "", somente_integral: "") { (listaCursos) in
                self.listaCursos = listaCursos
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    


    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listaCursos != nil {
            return listaCursos?.count ?? 0
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cursoCell") as! CursoTableViewCell
        
        guard let curso: Curso = listaCursos?[indexPath.row] else {return UITableViewCell()}
        cell.localLabel.text = "\(curso.cidade_busca ?? ""), \(curso.uf_busca ?? "")"
        cell.nomeDaFaculdadeLabel.text = "\(curso.universidade_nome ?? "")"
        cell.nomeDoCursoLabel.text = "\(curso.nome ?? "")"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
//    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//    }
    
    
}
