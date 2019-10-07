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
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        notaTextField.delegate = self

        self.hideKeyboardWhenTappedAround()
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

    @IBAction func navegarButton(_ sender: UIButton) {
        guard let nota = notaTextField.text else { return }
        if !nota.isEmpty {
            self.performSegue(withIdentifier: "Filtros", sender: nota)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as? FiltrosViewController
        guard let nota = sender as? String else { return }
        let notaNumber = Double.init(nota)
        viewController?.notaUsuario = notaNumber
    }
}

//MARK: - Text Field
extension NotaViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (string >= "0" && string <= "9") || string.isEmpty {
            return true
        }
        return false
    }
}

//MARK: - Hide Keyboard
extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

