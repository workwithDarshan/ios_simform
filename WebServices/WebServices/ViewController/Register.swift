//
//  Login.swift
//  WebServices
//
//  Created by Darshan Dangar on 04/07/23.
//

import UIKit

struct User: Codable {
    let email: String
    let password: String
    
    func getUser() {
        print("Email: \(email), Password: \(password)")
    }
}

class Register: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    // MARK: Variables
    var user = ["email": "password"]
    var coordinator: ButtonCoordinator?
    
    // MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        guard let email = tfEmail.text, let password = tfPassword.text else {
            if tfEmail.text?.isEmpty ?? false && ((tfPassword.text?.isEmpty) ?? false) {
                return
            }
            return
        }
        let user = User(email: email, password: password)
        
        guard let url = URL(string: "https://reqres.in/api/register") else { return }
        WebService.shared.getUrl(url: url, type: .post, parameter: user) { (response: Result<User, Error>) in
            switch response {
            case .success(let registeredUser):
                // Handle successful registration
                print("User registered: \(registeredUser.email)")
            case .failure(let error):
                // Handle error
                print("Error: \(error)")
            }
        }
    }
    
}