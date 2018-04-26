//
//  EmailPassCombo.swift
//  MapHash_1
//
//  Created by Ismael Garcia on 12/23/16.
//  Copyright © 2016 Ismael Garcia. All rights reserved.
//

import Foundation
import UIKit

class EmailPassCombo {
    
    
    var email = "up_isms@yahoo.com"
    let password = "ledman91"
    var emailChar = [Character]()
    init(eMail: String){
        self.email = eMail
    }
    
    func setEmail(_ inputEmail: String){
        email = inputEmail
        emailChar = Array(email.characters)
        
    }
    
    func getEmail()->String{
        return email
    }
    
    
    //var emailChar = Array(email)
    
    var error = false
    var preDomain = true
    var domain = false
    var com = false
    var indexOfAt = 0
    var indexCom = 0
    var storeTodatabasePredomain = ""
    var storeTodatabaseDomain = ""
    var storeCorrectPre = ""
    var storeCorrectPost = ""
    var storeToCom = ""
    var ranger = ""
    var sub = ""
    
    
    func beginCalc(){
        for (u,_) in emailChar.enumerated(){
            
            if(preDomain == true){
                if(emailChar[u] != "@" ){
                    storeTodatabasePredomain.append(emailChar[u])
                }
            }
            if(emailChar[u] == "@"){
                indexOfAt = u
                preDomain = false
                domain = true
            }
            if(emailChar[u] == "."){
                indexCom = u
                com = true
            }
            if(domain == true){
                storeTodatabaseDomain.append(emailChar[u])
            }
            if(com == true){
                storeToCom.append(emailChar[u])
            }
            
        }
        
        
        if(indexOfAt == 0 || indexCom == 0){
            error = true
        }
        
        if(error == false){
            let domainCheckStart = getEmail().index(getEmail().startIndex,offsetBy: (indexOfAt + 1))
            let domainCheckEnd = getEmail().index(getEmail().startIndex,offsetBy: (indexCom))
            
            let range = domainCheckStart..<domainCheckEnd
            print("domain: \(range)")
            ranger = getEmail()[range]
            
            let stringer = getEmail().index(getEmail().startIndex , offsetBy: (indexCom))
            sub = getEmail().substring(from: stringer) //.substringFromIndex(stringer)
        }
        
        if(sub != ".com" || ranger == "" ){
            error = true
        }
        
        if(error == true){
            print("Error,wrong pattern combination")
        }
        
        if(error != true){
            storeCorrectPre = storeTodatabasePredomain
            storeCorrectPost = storeTodatabaseDomain
        }
        
    }
    
    func getPreDomain() -> String{
        return storeCorrectPre
    }
    
    func getDomain() -> String{
        return storeCorrectPost
}

// print(getPreDomain())
// print(getDomain())
}
