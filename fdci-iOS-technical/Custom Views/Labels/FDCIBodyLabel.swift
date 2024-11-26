//
//  FDCIBodyLabel.swift
//  fdci-iOS-technical
//
//  Created by John Patrick Echavez on 11/26/24.
//

import UIKit

class FDCIBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textColor: UIColor, isHidden: Bool) {
        super.init(frame: .zero)
        self.textColor = textColor
        self.isHidden = isHidden
        configure()
    }
    
    private func configure() {
        font                                = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory   = true
        adjustsFontSizeToFitWidth           = true
        minimumScaleFactor                  = 0.75
        lineBreakMode                       = .byWordWrapping
        textAlignment                       = .left
        translatesAutoresizingMaskIntoConstraints = false
    }
}
