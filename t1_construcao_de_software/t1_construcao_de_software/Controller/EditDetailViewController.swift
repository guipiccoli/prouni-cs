//
//  EditDetailViewController.swift
//  t1_construcao_de_software
//
//  Created by Guilherme Piccoli on 18/11/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

class EditDetailViewController: UIViewController {

    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var grauTextField: UITextField!
    @IBOutlet weak var universidadeTextField: UITextField!
    @IBOutlet weak var campusTextField: UITextField!
    @IBOutlet weak var cidadeTextField: UITextField!
    @IBOutlet weak var mensalidadeTextField: UITextField!
    @IBOutlet weak var notaIntegralCota: UITextField!
    
    @IBOutlet weak var notaIntegralAmpla: UITextField!
    
    var nameText: String?
    var grauText: String?
    var universityText: String?
    var campusText: String?
    var monthlyPriceText: String?
    var shiftText: String?
    var ufText: String?
    var cityText: String?
    var notaCota: String?
    var notaAmpla: String?
    
    var isCreating: Bool = false
    
    var curso: Curso?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(isCreating)
        
        nomeTextField.text = nameText ?? ""
        grauTextField.text = grauText ?? ""
        universidadeTextField.text = universityText ?? ""
        campusTextField.text = campusText ?? ""
        cidadeTextField.text = cityText ?? ""
        mensalidadeTextField.text = monthlyPriceText ?? ""
        notaIntegralCota.text = notaCota ?? ""
        notaIntegralAmpla.text = notaAmpla ?? ""

        
        nomeTextField.delegate = self
        grauTextField.delegate = self
        universidadeTextField.delegate = self
        campusTextField.delegate = self
        cidadeTextField.delegate = self
        mensalidadeTextField.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Deletar", style: .plain, target: self, action: #selector(deleteCurso))


    }
    
    @objc func deleteCurso() {
        guard let curso = curso else {return}
        DataAccess.deleteCurso(uf_busca: curso.uf_busca ?? "", cidade_busca: curso.cidade_busca ?? "", universidade_nome: curso.universidade_nome ?? "", nome: curso.nome ?? "", campus_nome: curso.campus_nome ?? "", grau: curso.grau ?? "", turno: curso.turno ?? "", mensalidade: "\(curso.mensalidade ?? 0.0)", notaIntegralAmpla: "\(curso.nota_integral_ampla ?? 0)", notaIntegralCotas: "\(curso.nota_integral_cotas ?? 0)", bolsa_integral_ampla: "\(curso.bolsa_integral_ampla ?? 0)", bolsa_integral_cotas: "\(curso.bolsa_integral_cotas ?? 0)", bolsa_parcial_cotas: "\(curso.bolsa_partial_cotas ?? 0)", bolsa_parcial_ampla: "\(curso.bolsa_parcial_ampla ?? 0)", nota_parcial_ampla: "\(curso.nota_parcial_ampla ?? 0)", nota_parcial_cotas: "\(curso.nota_parcial_cotas ?? 0)") { (finished) in
            
            DispatchQueue.main.async {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
    @IBAction func confirmButtonAction(_ sender: UIButton) {
        
        if isCreating {
            DataAccess.addNovoCurso(uf_busca: "RS", cidade_busca: cidadeTextField.text!, universidade_nome: universidadeTextField.text!, nome: nomeTextField.text!, campus_nome: campusTextField.text!, grau: grauTextField.text!, turno: "Noite", mensalidade: mensalidadeTextField.text!, notaIntegralAmpla: notaIntegralAmpla.text!, notaIntegralCotas: notaIntegralCota.text!, bolsa_integral_ampla: "\(curso?.bolsa_integral_ampla ?? 0)", bolsa_integral_cotas: "\(curso?.bolsa_integral_cotas ?? 0)", bolsa_parcial_cotas: "\(curso?.bolsa_partial_cotas ?? 0)", bolsa_parcial_ampla: "\(curso?.bolsa_parcial_ampla ?? 0)", nota_parcial_ampla: "\(curso?.nota_parcial_ampla ?? 0)", nota_parcial_cotas: "\(curso?.nota_parcial_cotas ?? 0)") { (finished) in
                
                if finished {
                    self.isCreating = false
                    DispatchQueue.main.async {
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                }
            }
        }
            
        else {
            guard let curso = curso else {return}
            DataAccess.deleteCurso(uf_busca: curso.uf_busca ?? "", cidade_busca: curso.cidade_busca ?? "", universidade_nome: curso.universidade_nome ?? "", nome: curso.nome ?? "", campus_nome: curso.campus_nome ?? "", grau: curso.grau ?? "", turno: curso.turno ?? "", mensalidade: "\(curso.mensalidade ?? 0)", notaIntegralAmpla: "\(curso.nota_integral_ampla ?? 0)", notaIntegralCotas: "\(curso.nota_integral_cotas ?? 0)", bolsa_integral_ampla: "\(curso.bolsa_integral_ampla ?? 0)", bolsa_integral_cotas: "\(curso.bolsa_integral_cotas ?? 0)", bolsa_parcial_cotas: "\(curso.bolsa_partial_cotas ?? 0)", bolsa_parcial_ampla: "\(curso.bolsa_parcial_ampla ?? 0)", nota_parcial_ampla: "\(curso.nota_parcial_ampla ?? 0)", nota_parcial_cotas: "\(curso.nota_parcial_cotas ?? 0)") { (finished) in
            }
            
            DataAccess.addNovoCurso(uf_busca: "RS", cidade_busca: cidadeTextField.text!, universidade_nome: universidadeTextField.text!, nome: nomeTextField.text!, campus_nome: campusTextField.text!, grau: grauTextField.text!, turno: "Noite", mensalidade: mensalidadeTextField.text!, notaIntegralAmpla: notaIntegralAmpla.text!, notaIntegralCotas: notaIntegralCota.text!, bolsa_integral_ampla: "\(curso.bolsa_integral_ampla ?? 0)", bolsa_integral_cotas: "\(curso.bolsa_integral_cotas ?? 0)", bolsa_parcial_cotas: "\(curso.bolsa_partial_cotas ?? 0)", bolsa_parcial_ampla: "\(curso.bolsa_parcial_ampla ?? 0)", nota_parcial_ampla: "\(curso.nota_parcial_ampla ?? 0)", nota_parcial_cotas: "\(curso.nota_parcial_cotas ?? 0)") { (finished) in
                 
                 if finished {
                     DispatchQueue.main.async {
                         self.navigationController?.popToRootViewController(animated: true)
                     }
                 }
             }
        }
        
    }
}

extension EditDetailViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
}
