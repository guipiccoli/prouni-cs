//
//  CursoTableViewCell.swift
//  t1_construcao_de_software
//
// Modelo de célula para a lista de cursos
//
//  Created by Fernando Locatelli Maioli on 02/10/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

class CursoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nomeDoCursoLabel: UILabel!
    @IBOutlet weak var nomeDaFaculdadeLabel: UILabel!
    @IBOutlet weak var localLabel: UILabel!
    @IBOutlet weak var cotaNotaLabel: UILabel!
    @IBOutlet weak var amploNotaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
