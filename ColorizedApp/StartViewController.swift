//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by Лидия Пятаева on 04.06.2024.
//

import UIKit

protocol ChangeBakcgroundColorDelegate: AnyObject {

    func changeColor(color: UIColor)
}

class StartViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? ViewController else {return}
        secondVC.colorOfView = view.backgroundColor
        secondVC.delegate = self
    }
    
}

extension StartViewController: ChangeBakcgroundColorDelegate {
    
    func changeColor(color: UIColor) {
        view.backgroundColor = color
    }
}
