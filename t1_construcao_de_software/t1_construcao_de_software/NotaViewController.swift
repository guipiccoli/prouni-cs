//
//  ViewController.swift
//  t1_construcao_de_software
//
//  Created by Fernando Locatelli Maioli on 30/09/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

class NotaViewController: UIViewController {

    @IBOutlet weak var notaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func navegarButton(_ sender: UIButton) {
        guard let nota = notaTextField.text else { return }
        self.performSegue(withIdentifier: "Filtros", sender: nota)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
    }
    

    
}

