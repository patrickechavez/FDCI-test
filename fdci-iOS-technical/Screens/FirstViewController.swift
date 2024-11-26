//
//  FirstViewController.swift
//  fdci-iOS-technical
//
//  Created by John Patrick Echavez on 11/26/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    let namelabel         = FDCIBodyLabel(textColor: .secondaryLabel, isHidden: false)
    let nameTextField     = FDCITextField(placeholder: "")
    let nameErrorLabel   = FDCIBodyLabel(textColor: UIColor.red, isHidden: true)
    
    let regionTextField   = FDCITextField(placeholder: "Enter a Region")
    let countryTextField  = FDCITextField(placeholder: "Enter a Country")
    
    let stackView = UIStackView()
    let submitButton  = FDCIButton(backgroundColor: .systemGreen, title: "Submit")
    let clearButton  = FDCIButton(backgroundColor: .systemRed, title: "Clear")
    
    var isNameEntered: Bool { return !nameTextField.text!.isEmpty }
    
    let regions = [
        "North America",
        "South America",
        "Europe",
        "Asia",
        "Africa",
        "Australia"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureNameLabel()
        configurenameTextField()
        configureRegionPickerView()
        configureCountryTextField()
        
        configureSubmitButton()
        configureClearButton()
        configureStackView()
        
        //getCountries()
    }
    
    @objc func pushSecondViewController() {
        
        guard nameTextField.text?.containsOnlyAlphabets == true else {
            
            print("cannot contain alpha numeric characters")
            return
        }
        
        nameTextField.resignFirstResponder()
        
        DataManager.shared.setName(name: nameTextField.text!)
        
        let secondViewController      = SecondViewController()
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc func clearTextFields() {
        
        nameTextField.text = ""
        countryTextField.text = ""
        regionTextField.text = ""
    }
    
    func configureNameLabel() {
        view.addSubview(namelabel)
        
        namelabel.text = "Name"
        
        NSLayoutConstraint.activate([
            namelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48),
            namelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  50),
            namelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            namelabel.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    func configurenameTextField() {
        view.addSubview(nameTextField)
        nameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: namelabel.bottomAnchor, constant: 0),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  50),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nameTextField.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    
    func configureRegionPickerView() {
        view.addSubview(regionTextField)
        regionTextField.translatesAutoresizingMaskIntoConstraints = false
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
    
    func configureSubmitButton() {
        view.addSubview(submitButton)
        submitButton.addTarget(self, action: #selector(pushSecondViewController), for: .touchUpInside)
    }
    
    func configureClearButton() {
        view.addSubview(clearButton)
        clearButton.addTarget(self, action: #selector(clearTextFields), for: .touchUpInside)
    }
    
    func configureStackView() {
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        stackView.addArrangedSubview(submitButton)
        stackView.addArrangedSubview(clearButton)

        
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    func getCountries() {
        
        NetworkManager.shared.getCountries() { [weak self] result  in
            guard let self  = self else { return }
            //self.dissmissLoadingView()
            switch result {
               
            case .success(let countries):
                print(countries)
                //self.updateUI(with: followers)
            case .failure(let error):
                print(error)
                break
                //self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "Ok")
            }
            
        }
        
    }
}

extension FirstViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}

extension FirstViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return regions.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return regions[row]
    }
    
}



