//
//  DetailViewController.swift
//  t1_construcao_de_software
//
//  Created by Fernando Locatelli Maioli on 02/10/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var campusLabel: UILabel!
    @IBOutlet weak var monthlyPriceLabel: UILabel!
    @IBOutlet weak var shiftLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var notaIntegralCotaLabel: UILabel!
    @IBOutlet weak var notaIntegralAmplaLabel: UILabel!
    
    var nameLabelText: String!
    var scoreLabelText: String!
    var universityLabelText: String!
    var campusLabelText: String!
    var monthlyPriceLabelText: String!
    var shiftLabelText: String!
    var ufLabelText: String!
    var cityLabelText: String!
    var notaIntegralCotaText: String!
    var notaIntegralAmplaText: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = nameLabelText
        scoreLabel.text = scoreLabelText
        universityLabel.text = universityLabelText
        campusLabel.text = campusLabelText
        monthlyPriceLabel.text = monthlyPriceLabelText
        shiftLabel.text = shiftLabelText
        cityLabel.text = "\(cityLabelText ?? ""), \(ufLabelText ?? "")"
        notaIntegralCotaLabel.text = notaIntegralCotaText
        notaIntegralAmplaLabel.text = notaIntegralAmplaText

    }
}
