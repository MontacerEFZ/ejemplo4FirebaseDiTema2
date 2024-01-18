//
//  AutenticarViewController.swift
//  ejemplo4FirebaseDiTema2
//
//  Created by Montacer El Fazazi on 18/01/2024.
//

import UIKit
import FirebaseAuth

class AutenticarViewController: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnRegistrar(_ sender: Any) {
        if let email = txtEmail.text, let password = txtPassword.text{
            Auth.auth().createUser(withEmail: email, password: password){
                (result, error) in
                if let res = result, error == nil{
                    //si ha podido autenticar al usuario pasamos de vista
                    let ventana = self.storyboard?.instantiateViewController(identifier: "INICIO")
                        as! ViewController
                self.navigationController?.pushViewController(ventana, animated: true)
                }else{
                    //si no ha podido autenticar muestro alerta
                    let alert = UIAlertController(title: "ERROR", message: "error inesperado: \(error.debugDescription)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    @IBAction func btnLogin(_ sender: Any) {
        if let email = txtEmail.text, let password = txtPassword.text{
            Auth.auth().signIn(withEmail: email, password: password){
                (result, error) in
                if let res = result, error == nil{
                    //si ha podido autenticar al usuario pasamos de vista
                    let ventana = self.storyboard?.instantiateViewController(identifier: "INICIO")
                        as! ViewController
                self.navigationController?.pushViewController(ventana, animated: true)
                }else{
                    //si no ha podido autenticar muestro alerta
                    let alert = UIAlertController(title: "ERROR", message: "error inesperado: \(error.debugDescription)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        txtEmail.text = ""
        txtPassword.text = ""
    }
    
}
