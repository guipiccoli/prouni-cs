//
//  FiltrosViewController.swift
//  t1_construcao_de_software
//
//  Created by Fernando Locatelli Maioli on 30/09/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

class FiltrosViewController: UIViewController {

    var notaUsuario: String? = nil
    @IBOutlet weak var cidadeTextField: UITextField!
    @IBOutlet weak var universidadeTextField: UITextField!
    @IBOutlet weak var cursoTextField: UITextField!
    @IBOutlet weak var ufTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        ufTextField.inputView = picker
        self.hideKeyboardWhenTappedAround()
        scrollView.isScrollEnabled = true
        if #available(iOS 11.0, *) {
            self.scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        guard let keyboardFrame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardRect = keyboardFrame.cgRectValue
        scrollView.contentInset.bottom = view.convert(CGRect(x: keyboardRect.minX, y: keyboardRect.minY, width: keyboardRect.maxX-keyboardRect.minX, height: (keyboardRect.maxY-keyboardRect.minY)+25), from: nil).size.height
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        scrollView.contentInset.bottom = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func filterButtonAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Lista", sender: nil)
    }
}

extension FiltrosViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            ufTextField.text = "pr"
        }
        else if row == 1 {
            ufTextField.text = "sc"
        }
        else {
            ufTextField.text = "rs"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0 {
            return "pr"
        }
        if row == 1 {
            return "sc"
        }
        return "rs"
    }
}
