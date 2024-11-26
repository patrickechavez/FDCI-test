//
//  FirstViewController.swift
//  fdci-iOS-technical
//
//  Created by John Patrick Echavez on 11/26/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    let nameTextField     = FDCITextField(placeholder: "Enter a name")
    let regionTextField   = FDCITextField(placeholder: "Enter a Region")
    let countryTextField  = FDCITextField(placeholder: "Enter a Country")
    
    let callToActionButton  = FDCIButton(backgroundColor: .systemGreen, title: "Submit")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configurenameTextField()
        configureRegionTextField()
        configureCountryTextField()
        configureCallToActionButton()
        
    }
    
    func configurenameTextField() {
        view.addSubview(nameTextField)
        nameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  50),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nameTextField.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    func configureRegionTextField() {
        view.addSubview(regionTextField)
        regionTextField.delegate = self
        
        NSLayoutConstraint.activate([
            regionTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 48),
            regionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  50),
            regionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            regionTextField.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    func configureCountryTextField() {
        view.addSubview(countryTextField)
        countryTextField.delegate = self
        
        NSLayoutConstraint.activate([
            countryTextField.topAnchor.constraint(equalTo: regionTextField.bottomAnchor, constant: 48),
            countryTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  50),
            countryTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            countryTextField.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        //callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


}

extension FirstViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}


