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
    
    var colorOfView: UIColor?
    let startVC = StartViewController()
    weak var delegate: ChangeBakcgroundColorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDelegates()
        setupLabels()
        setupGesture()
        colorizedView.layer.cornerRadius = 20
        colorizedView.backgroundColor = colorOfView
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setupLabels() {
        redColorLabel.text = string(from: redSlider)
        greenColorLabel.text = string(from: greenSlider)
        blueColorLabel.text = string(from: blueSlider)
    }
    
    private func displayErrorAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
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
            blueTextField.text = string(from: blueSlider)
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

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }

        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        return updatedText.count <= 3
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text,
              let value = Float(text),
              (0...1).contains(value)
        else {
            displayErrorAlert(message: "Некорретный формат данных")
            textField.text?.removeAll()
            return
        }
        switch textField {
        case redTextField:
            redSlider.value = value
            redColorLabel.text = text
        case greenTextField:
            greenSlider.value = value
            greenColorLabel.text = text
        default:
            blueSlider.value = value
            blueColorLabel.text = text
        }
        setColor()
    }
}

extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self)
    }
}
