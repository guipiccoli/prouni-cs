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
    let listaCursos: ListaCurso? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self


    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if listaCursos != nil {
//            return listaCursos?.listaCurso.count ?? 0
//        }
//        else {
//            return 0
//        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cursoCell") as! CursoTableViewCell
        
        cell.localLabel.text = "Porto Alegre, RS"
        cell.nomeDaFaculdadeLabel.text = "PUCRS"
        cell.nomeDoCursoLabel.text = "Engenharia de Software"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: listaCursos?.listaCurso[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as? DetailViewController
        let curso = sender as? Curso
        viewController?.nameLabel.text = curso?.nome
        viewController?.scoreLabel.text = curso?.grau
        viewController?.universityLabel.text = curso?.universidade_nome
        viewController?.campusLabel.text = curso?.campus_nome
        viewController?.monthlyPriceLabel.text = curso?.mensalidade
        viewController?.shiftLabel.text = curso?.turma
        viewController?.ufLabel.text = curso?.uf_busca
        viewController?.cityLabel.text = curso?.cidade_busca
    }
    
    
}
