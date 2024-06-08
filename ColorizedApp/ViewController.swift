//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Лидия Пятаева on 09.04.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    
    @IBOutlet var colorizedView: UIView!
    
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    
    let startVC = StartViewController()
    weak var delegate: ChangeBakcgroundColorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDelegates()
        setupLabels()
        colorizedView.layer.cornerRadius = 20
        colorizedView.backgroundColor = startVC.view.backgroundColor
    }
    private func setupLabels() {
        redColorLabel.text = string(from: redSlider)
        greenColorLabel.text = string(from: greenSlider)
        blueColorLabel.text = string(from: blueSlider)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redColorLabel.text = string(from: redSlider)
            redTextField.text = string(from: redSlider)
        case greenSlider:
            greenColorLabel.text = string(from: greenSlider)
            greenTextField.text = string(from: greenSlider)
        default:
            blueColorLabel.text = string(from: blueSlider)
            blueColorLabel.text = string(from: blueSlider)
        }
    }
    
    @IBAction func doneButtonPresed(_ sender: Any) {
        guard let color = colorizedView.backgroundColor else { return }
        delegate?.changeColor(color: color )
        dismiss(animated: true)
    }
    
    private func addDelegates() {
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    private func setColor() {
        colorizedView.backgroundColor = UIColor(
            red: redSlider.value.cgFloat(),
            green: greenSlider.value.cgFloat(),
            blue: blueSlider.value.cgFloat(),
            alpha: 1
        )
    }
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case redTextField:
            redSlider.value = Float(redTextField.text!) ?? 0
            redColorLabel.text = redTextField.text
        case greenTextField:
            greenSlider.value = Float(greenTextField.text!) ?? 0
            greenColorLabel.text = redTextField.text
        default:
            blueSlider.value = Float(blueTextField.text!) ?? 0
            blueColorLabel.text = blueTextField.text
        }
    }
}

extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self)
    }
}


