//
//  ViewController.swift
//  ejemplo4FirebaseDiTema2
//
//  Created by Montacer El Fazazi on 18/01/2024.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var lbUserId: UILabel!
    @IBOutlet weak var lbEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //para ocultar el back button
        self.navigationItem.hidesBackButton = true
        
        if let user = Auth.auth().currentUser{
            lbEmail.text = user.email
            lbUserId.text = user.uid
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
}

