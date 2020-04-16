//
//  EmployeeUserInfoVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 14/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit
import RealmSwift

class DirCreateUserVC: UIViewController {

    var userName = ""
    var user: Results<User>!
    
    @IBOutlet weak var titleEmployee: UITextField!
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var middleName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var dateOfBirth: UITextField!
    
    @IBOutlet weak var telephone: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var address: UITextField!
    
    @IBOutlet weak var postcode: UITextField!
    
    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var startDate: UITextField!
    
    @IBOutlet weak var endDate: UITextField!
    
    
    func configure(with user: User){
        titleEmployee.text = user.titleM
        firstName.text = user.firstName
        middleName.text = user.middleName
        lastName.text = user.lastName
        email.text = user.email
        dateOfBirth.text = user.dateOfBirth
        telephone.text = user.telephone
        password.text = user.password
        address.text = user.address
        postcode.text = user.postcode
        city.text = user.city
        startDate.text = user.startDate
        endDate.text = user.endDate
        
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
    
       // print(Realm.Configuration.defaultConfiguration.fileURL!)
        let realm = RealmService.shared.realm
             user = realm.objects(User.self)
                    
    }
    
    
    @IBAction func createUserButton(_ sender: UIButton) {
        
     let newUser = User(titleM: titleEmployee.text!, firstName: firstName.text!, middleName: middleName.text!, lastName: lastName.text!, email: email.text!, dateOfBirth: dateOfBirth.text!, telephone: telephone.text!, password: password.text!, address: address.text!, postcode:   postcode.text!, startDate: startDate.text!, endDate: endDate.text!)
        RealmService.shared.create(newUser)
        
        self.userName = firstName.text!
        
        performSegue(withIdentifier: "goToConfirmationUser", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! ConfirmationUserCreatedVC
        vc.finalUserName = self.userName
    }

}
