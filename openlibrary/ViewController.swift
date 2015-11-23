//
//  ViewController.swift
//  openlibrary
//
//  Created by rocio urtecho on 11/23/15.
//  Copyright © 2015 Carlos Concha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var campoTexto: UITextField!

    @IBOutlet weak var resultado: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buscar(sender: AnyObject) {

        if campoTexto.text == "" {
            let msgeAlerta = UIAlertController(title: "Mensaje", message: "Ingrese un número ISBN", preferredStyle: .Alert)
            msgeAlerta.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(msgeAlerta, animated: true, completion: nil)
        }else{
            sincrono()
            sender.resignFirstResponder()
        }
        
        
    }
    
    func sincrono(){
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + self.campoTexto.text!
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOfURL: url!)
        if datos == nil{
            let msgeAlerta = UIAlertController(title: "Mensaje", message: "Error en la conexión", preferredStyle: .Alert)
            msgeAlerta.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(msgeAlerta, animated: true, completion: nil)
        }else{
            let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
            resultado.text = String(texto)
        }
        
        
    }

    @IBAction func limpiar(sender: AnyObject) {
        campoTexto.text = ""
        resultado.text = ""
    }
}

