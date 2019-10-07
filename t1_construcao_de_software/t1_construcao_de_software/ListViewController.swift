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
        performSegue(withIdentifier: "detailSegue", sender: listaCursos?[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as? DetailViewController
        guard let curso = sender as? Curso else {return}
        viewController?.nameLabelText = curso.nome
        viewController?.scoreLabelText = curso.grau
        viewController?.universityLabelText = curso.universidade_nome
        viewController?.campusLabelText = curso.campus_nome
        viewController?.monthlyPriceLabelText = "R$\(curso.mensalidade ?? 0)"
        viewController?.shiftLabelText = curso.turno
        viewController?.ufLabelText = curso.uf_busca
        viewController?.cityLabelText = curso.cidade_busca
    }
    
    
}
