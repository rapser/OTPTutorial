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
        // Do any additional setup after loading the view, typically from a nib.
        
        txtOTP1.backgroundColor = UIColor.clear
        txtOTP2.backgroundColor = UIColor.clear
        txtOTP3.backgroundColor = UIColor.clear
        txtOTP4.backgroundColor = UIColor.clear
        txtOTP5.backgroundColor = UIColor.clear
        txtOTP6.backgroundColor = UIColor.clear
        
        txtOTP1.layer.borderColor = UIColor.black.cgColor
        txtOTP1.layer.borderWidth = 1.0
        txtOTP1.layer.cornerRadius = 5.0
        
        txtOTP2.layer.borderColor = UIColor.black.cgColor
        txtOTP2.layer.borderWidth = 1.0
        txtOTP2.layer.cornerRadius = 5.0
        
        txtOTP3.layer.borderColor = UIColor.black.cgColor
        txtOTP3.layer.borderWidth = 1.0
        txtOTP3.layer.cornerRadius = 5.0
        
        txtOTP4.layer.borderColor = UIColor.black.cgColor
        txtOTP4.layer.borderWidth = 1.0
        txtOTP4.layer.cornerRadius = 5.0
        
        txtOTP5.layer.borderColor = UIColor.black.cgColor
        txtOTP5.layer.borderWidth = 1.0
        txtOTP5.layer.cornerRadius = 5.0
        
        txtOTP6.layer.borderColor = UIColor.black.cgColor
        txtOTP6.layer.borderWidth = 1.0
        txtOTP6.layer.cornerRadius = 5.0
        
        if #available(iOS 12.0, *) {
            txtOTP1.textContentType = .oneTimeCode
        } else {
            // Fallback on earlier versions
        }
        
//        addBottomBorderTo(textField: txtOTP1)
//        addBottomBorderTo(textField: txtOTP2)
//        addBottomBorderTo(textField: txtOTP3)
//        addBottomBorderTo(textField: txtOTP4)
        
        txtOTP1.delegate = self
        txtOTP2.delegate = self
        txtOTP3.delegate = self
        txtOTP4.delegate = self
        txtOTP5.delegate = self
        txtOTP6.delegate = self
        
        txtOTP1.becomeFirstResponder()
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

