//
//  SecondViewController.swift
//  fdci-iOS-technical
//
//  Created by John Patrick Echavez on 11/26/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    let firstLabel = FDCITitleLabel(textAlignment: .center, fontSize: 28)
    let secondLabel = FDCITitleLabel(textAlignment: .center, fontSize: 28)
    let thirdLabel = FDCITitleLabel(textAlignment: .center, fontSize: 28)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureFirstLabel()
        configureSecondLabel()
        configureThirdLabel()
    }
    
    
    private func configureFirstLabel() {
        view.addSubview(firstLabel)
        
        firstLabel.text = "Hi \(DataManager.shared.getName())"
        firstLabel.textColor      = .secondaryLabel
        
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            firstLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            firstLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            firstLabel.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    private func configureSecondLabel() {
        view.addSubview(secondLabel)
        
        secondLabel.text = "Hello 2nd Label"
        secondLabel.textColor      = .secondaryLabel
        
        NSLayoutConstraint.activate([
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 20),
            secondLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            secondLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            secondLabel.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    private func configureThirdLabel() {
        view.addSubview(thirdLabel)
        
        thirdLabel.text = "Hello 3rd Label"
        thirdLabel.textColor      = .secondaryLabel
        
        NSLayoutConstraint.activate([
            thirdLabel.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 40),
            thirdLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            thirdLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            thirdLabel.heightAnchor.constraint(equalToConstant: 200),
        ])
    }

    

}
