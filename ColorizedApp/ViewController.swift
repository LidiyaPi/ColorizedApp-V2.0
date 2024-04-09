//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Лидия Пятаева on 09.04.2024.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var colorizedView: UIView!
    
    @IBOutlet var redColorValue: UILabel!
    @IBOutlet var greenColorValue: UILabel!
    @IBOutlet var blueColorValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorizedView.layer.cornerRadius = 20
        setupRedLabel()
        setupGreenLabel()
        setupBlueLabel()
    }
    
    private func setupRedLabel() {
        redColorValue.text = redSlider.value.formatted()
        redColorValue.font = UIFont.systemFont(ofSize: 18)
        redColorValue.textAlignment = .center
        redColorValue.numberOfLines = 2
    }
    private func setupGreenLabel() {
        greenColorValue.text = greenSlider.value.formatted()
        greenColorValue.font = UIFont.systemFont(ofSize: 18)
        greenColorValue.textAlignment = .center
        greenColorValue.numberOfLines = 2
    }
    private func setupBlueLabel() {
        blueColorValue.text = blueSlider.value.formatted()
        blueColorValue.font = UIFont.systemFont(ofSize: 18)
        blueColorValue.textAlignment = .center
        blueColorValue.numberOfLines = 2
    }
    @IBAction func redSliderAction() {
        redSlider.minimumTrackTintColor = .systemRed
        redColorValue.text = String(format: "%0.2f",redSlider.value)
        setupView()
    }
    @IBAction func greenSliderAction() {
        greenColorValue.text = String(format: "%0.2f",greenSlider.value)
        setupView()
    }
    @IBAction func blueSliderAction() {
        blueColorValue.text = String(format: "%0.2f",blueSlider.value)
        setupView()
    }
    private func setupView() {
        let color = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 0.5)
        colorizedView.backgroundColor = color
    }
}

