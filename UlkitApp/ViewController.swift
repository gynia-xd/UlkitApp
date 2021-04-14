//
//  ViewController.swift
//  UlkitApp
//
//  Created by Пётр  on 01.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Label
        
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        // SEgmented Control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        // Slider
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        mainLabel.text = String(slider.value)
        
        // Date Picker
        //datePicker.locale = Locale.current
        datePicker.locale = Locale (identifier: "ru_RU")
        
    }

    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .blue
        default:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .yellow
            
        }
    }
    
    @IBAction func sliderAction() {
        mainLabel.text = String(slider.value)
        let sliderValue = CGFloat(slider.value)
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(sliderValue)
    }
    
    @IBAction func doneButtonPressed() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(with: "Text field is empty", and: "Please enter your name")
            return
        }
        if let _ = Double(inputText) {
            showAlert(with: "Wrong format", and: "Please enter your name")
        return
        }
        mainLabel.text = textField.text
        textField.text = ""
    }
    
    @IBAction func chooseDate() {
        let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        mainLabel.text = dateFormatter.string(from: datePicker.date)
    }
    
}
 // MARK: - Private Metohds
 
extension ViewController {
    private func showAlert(with title: String, and message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default) { _ in self.textField.text = ""
            
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

