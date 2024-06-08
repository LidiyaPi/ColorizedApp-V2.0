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

        let secondVC = segue.destination as? ViewController
//        secondVC?.colorizedView.backgroundColor = view.backgroundColor
        secondVC?.delegate = self
    }
    
}

extension StartViewController: ChangeBakcgroundColorDelegate {
    
    func changeColor(color: UIColor) {
        view.backgroundColor = color
    }
}
