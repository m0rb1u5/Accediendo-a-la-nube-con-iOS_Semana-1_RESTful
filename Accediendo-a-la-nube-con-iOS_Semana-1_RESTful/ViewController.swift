//
//  ViewController.swift
//  Accediendo-a-la-nube-con-iOS_Semana-1_RESTful
//
//  Created by Juan Carlos Carbajal Ipenza on 5/10/16.
//  Copyright © 2016 Juan Carlos Carbajal Ipenza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        asincrono()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func sincrono() {
        let urls = "http://dia.ccm.itesm.mx"
        let url: NSURL? = NSURL(string: urls)
        let datos: NSData? = NSData(contentsOf: url! as URL)
        let texto: NSString? = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
        print(texto!)
    }
    func asincrono() {
        let urls = "http://dia.ccm.itesm.mx"
        let url: NSURL? = NSURL(string: urls)
        let sesion: URLSession = URLSession.shared
        let bloque = { (datos: Data?, resp: URLResponse?, error: Error?) -> Void in
            let texto: NSString? = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
            print(texto!)
        }
        
        let dt: URLSessionDataTask = sesion.dataTask(with: url! as URL, completionHandler: bloque)
        dt.resume()
        print("antes o después?")
    }
}

