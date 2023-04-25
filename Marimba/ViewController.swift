//
//  ViewController.swift
//  Marimba
//
//  Created by Marco Alonso Rodriguez on 18/03/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?  //Es un opcional
    
    
    @IBOutlet weak var PlayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Esquinas redoeadas
        PlayButton.layer.cornerRadius = 20
        PlayButton.backgroundColor = .brown
    }
    
    //_ argument label
    
    func reproducirNota(_ cualNota: String){
        
        // guard - sirve para desenvoler una variable opcional
        guard let url = Bundle.main.url(forResource: cualNota, withExtension: "wav") else {
            return
        }
        
        ///Tratar de reproducir el contenido de una url
        do {
            //Preparamos al reproductor con el sonido a reproducir
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error al reproducir sonido")
        }
    }

    
    @IBAction func ReproducirNota(_ sender: UIButton) {
//        print("Boton presionado \(sender.titleLabel?.text)")
        reproducirNota((sender.titleLabel?.text)!)
    }
    

}

