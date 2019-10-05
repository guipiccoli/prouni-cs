//
//  FiltrosViewController.swift
//  t1_construcao_de_software
//
//  Created by Fernando Locatelli Maioli on 30/09/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

class FiltrosViewController: UIViewController {

    let notaUsuario: String? = nil
    @IBOutlet weak var cidadeTextField: UITextField!
    @IBOutlet weak var universidadeTextField: UITextField!
    @IBOutlet weak var cursoTextField: UITextField!
    @IBOutlet weak var ufTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let picker = UIPickerView()
        ufTextField.inputView = picker
    }

    @IBAction func filtrarButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "Lista", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func filterButtonAction(_ sender: UIButton) {
        
    }
}
