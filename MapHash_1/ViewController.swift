//
//  ViewController.swift
//  MapHash_1
//
//  Created by Ismael Garcia on 12/23/16.
//  Copyright © 2016 Ismael Garcia. All rights reserved.
//
import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var mEmailText: UITextField!
    @IBOutlet weak var mPasswordText: UITextField!
    
    @IBOutlet weak var mBack: UIButton!
    @IBOutlet weak var mLoginButton: UIButton!
    @IBOutlet weak var mSignupButton: UIButton!
    
    let firebaseStoreUrl = "gs://maphash-1a3d8.appspot.com"
    override func viewDidLoad() {
        super.viewDidLoad()
        //let storage = FIRStorage.storage().reference(withPath: firebaseStoreUrl)
        //   print("Storage:   \(storage)")
        // Do any additional setup after loading the view, typically from a nib.
        
        //mEmailText.attributedText = NSMutableAttributedString(string :"klk", attributes: myAttribute )
        
        mEmailText.text = "Enter E-mail"
        mPasswordText.text = "Enter PassWord"
        print("view function")
        mLoginButton.backgroundColor? =  UIColor(red: 255, green: 255 , blue:255, alpha:1)
        
        //let storageref = storage.reference(forURL: firebaseStoreUrl)
        //print(storageref)
        //storageref.child("ios").child("example")
        initKeyDissmiss()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Deleted")
        mPasswordText = nil
        mLoginButton  = nil
        mSignupButton = nil
        
    }
    
    
    func dissmiss(){
        view.endEditing(true)
    }
    
    func initKeyDissmiss(){
        let tapScreen: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(ViewController.dissmiss))
        view.addGestureRecognizer(tapScreen)
    }
    
    
    @IBAction func mLogin(_ sender: AnyObject) {
        
        if let storyboard = storyboard?.instantiateViewController(withIdentifier: "HashViewer") {
            
            present(storyboard,animated: true,completion: nil)
            
        }
        
        
        
        //storyboard?.instantiateViewController(withIdentifier: <#T##String#>)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


