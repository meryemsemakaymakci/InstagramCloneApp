//
//  ViewController.swift
//  InstagramCloneAppFirebase
//
//  Created by Sema Kaymakçı on 30.09.2024.
//

import UIKit
import Firebase
import FirebaseAuth
import SplineRuntime
import SwiftUI

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        struct ContentView: View {
            var body: some View {
                // fetching from cloud
                let url = URL(string: "https://build.spline.design/HSnGEvuvUqvvyYCNgDsd/scene.splineswift")!

                // fetching from local
                // let url = Bundle.main.url(forResource: "scene", withExtension: "splineswift")!

                SplineView(sceneFileURL: url).ignoresSafeArea(.all)
            }
        }
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
               
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
                
        }
        
        else {
            makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
        }

        
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
               
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }

            }
        } else {
            makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
        }

        
        
    }
    
    func makeAlert (titleInput:String, messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

