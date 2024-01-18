//
//  ViewController.swift
//  ejemplo4FirebaseDiTema2
//
//  Created by Montacer El Fazazi on 18/01/2024.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {

    @IBOutlet weak var txtTelefono: UITextField!
    @IBOutlet weak var txtDireccion: UITextField!
    @IBOutlet weak var lbUserId: UILabel!
    @IBOutlet weak var lbEmail: UILabel!
    
    var db: Firestore!
    var id: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //para ocultar el back button
        self.navigationItem.hidesBackButton = true
        
        if let user = Auth.auth().currentUser{
            lbEmail.text = user.email
            lbUserId.text = user.uid
            db = Firestore.firestore()
            id = user.uid
        }
    }


    @IBAction func btnLogout(_ sender: Any) {
        do{
            try  Auth.auth().signOut()
            self.navigationController?.popViewController(animated: true)
        }catch{
            //si da el error el logout:
            
        }
    }
    
    
    @IBAction func btnGuardar(_ sender: Any) {
        db.collection("users").document(id).setData(
            [
                "direccion":txtDireccion.text!,
                "telefono": txtTelefono.text!
            ]
        )
    }
    
    
    @IBAction func btnRecuperar(_ sender: Any) {
        db.collection("users").document(id).getDocument{
            (documentSnapshot, error) in
            
            if let document = documentSnapshot, error == nil{
                if let direccion = document.get("direccion") as? String{
                    self.txtDireccion.text = direccion
                }
                if let telefono = document.get("telefono") as? String{
                    self.txtTelefono.text = telefono
                }
            }else{
                let alert = UIAlertController(title: "ERROR", message: "error inesperado: \(error.debugDescription)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    @IBAction func btnEliminar(_ sender: Any) {
        db.collection("users").document(id).delete();
    }
    
    
}

