//
//  ViewController.swift
//  OTPTutorial
//
//  Created by Aman Aggarwal on 26/03/18.
//  Copyright © 2018 Aman Aggarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtOTP4: UITextField!
    @IBOutlet weak var txtOTP3: UITextField!
    @IBOutlet weak var txtOTP2: UITextField!
    @IBOutlet weak var txtOTP1: UITextField!
    @IBOutlet weak var txtOTP5: UITextField!
    @IBOutlet weak var txtOTP6: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
            
        addBottomBorderTo2(textField: txtOTP1)
        addBottomBorderTo2(textField: txtOTP2)
        addBottomBorderTo2(textField: txtOTP3)
        addBottomBorderTo2(textField: txtOTP4)
        addBottomBorderTo2(textField: txtOTP5)
        addBottomBorderTo2(textField: txtOTP6)

        txtOTP1.becomeFirstResponder()
    }
    
    func addBottomBorderTo2(textField:UITextField) {

        textField.backgroundColor = UIColor.clear
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5.0
        textField.delegate = self
        
        if #available(iOS 12.0, *) {
            textField.textContentType = .oneTimeCode
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    func addBottomBorderTo(textField:UITextField) {
        let layer = CALayer()
        layer.backgroundColor = UIColor.gray.cgColor
        layer.frame = CGRect(x: 0.0, y: textField.frame.size.height - 2.0, width: textField.frame.size.width, height: 2.0)
        textField.layer.addSublayer(layer)
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.count)! < 1 ) && (string.count > 0) {
            if textField == txtOTP1 {
                txtOTP2.becomeFirstResponder()
            }
            
            if textField == txtOTP2 {
                txtOTP3.becomeFirstResponder()
            }
            
            if textField == txtOTP3 {
                txtOTP4.becomeFirstResponder()
            }
            
            if textField == txtOTP4 {
                txtOTP5.becomeFirstResponder()
            }

            if textField == txtOTP5 {
                txtOTP6.becomeFirstResponder()
            }
            
            if textField == txtOTP6 {
                txtOTP6.resignFirstResponder()
            }
            
            textField.text = string
            return false
        } else if ((textField.text?.count)! >= 1) && (string.count == 0) {
            if textField == txtOTP2 {
                txtOTP1.becomeFirstResponder()
            }
            if textField == txtOTP3 {
                txtOTP2.becomeFirstResponder()
            }
            if textField == txtOTP4 {
                txtOTP3.becomeFirstResponder()
            }
            
            if textField == txtOTP5 {
                txtOTP4.becomeFirstResponder()
            }
            
            if textField == txtOTP6 {
                txtOTP5.becomeFirstResponder()
            }
            
            if textField == txtOTP1 {
                txtOTP1.becomeFirstResponder()
            }
            
            
            
            textField.text = ""
            return false
        } else if (textField.text?.count)! >= 1 {
            textField.text = string
            return false
        }
        
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

