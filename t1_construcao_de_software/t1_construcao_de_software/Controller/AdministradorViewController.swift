//
//  AdministradorViewController.swift
//  t1_construcao_de_software
//
//  Created by Guilherme Piccoli on 18/11/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

class AdministradorViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var listaTodosCursos: [Curso]?


    
    var loading: UIActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Novo", style: .plain, target: self, action: #selector(addNovoCurso))
    }
    
    @objc func addNovoCurso() {
        performSegue(withIdentifier: "editDetailSegue", sender: nil)
    }
}


//MARK: - Table View
extension AdministradorViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listaTodosCursos != nil {
            return listaTodosCursos?.count ?? 0
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cursoCell") as! CursoTableViewCell
        
        guard let curso: Curso = listaTodosCursos?[indexPath.row] else {return UITableViewCell()}
        cell.localLabel.text = "\(curso.cidade_busca ?? ""), \(curso.uf_busca ?? "")"
        cell.nomeDaFaculdadeLabel.text = "\(curso.universidade_nome ?? "")"
        cell.nomeDoCursoLabel.text = "\(curso.nome ?? "")"
        
        cell.cotaNotaLabel.text = "C: \(curso.nota_integral_cotas ?? 0.0)"
        cell.amploNotaLabel.text = "A: \(curso.nota_integral_ampla ?? 0.0)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editDetailSegue", sender: listaTodosCursos?[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as? EditDetailViewController
        guard let curso = sender as? Curso else {
            viewController?.isCreating = true
            return
        }
        
        viewController?.curso = curso
        
        viewController?.nameText = curso.nome
        viewController?.grauText = curso.grau
        viewController?.universityText = curso.universidade_nome
        viewController?.campusText = "\(curso.campus_nome ?? "")"
        viewController?.monthlyPriceText = "\(curso.mensalidade ?? 0)"
        viewController?.shiftText = curso.turno
        viewController?.ufText = curso.uf_busca
        viewController?.cityText = curso.cidade_busca
        viewController?.notaCota = "\(curso.nota_integral_cotas ?? 0.0)"
        viewController?.notaAmpla = "\(curso.nota_parcial_ampla ?? 0.0)"
    }
    
    
}

