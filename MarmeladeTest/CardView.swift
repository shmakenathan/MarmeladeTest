//
//  CardView.swift
//  MarmeladeTest
//
//  Created by Nathan on 27/05/2022.
//

import UIKit

final class CardView: UIView {
    
    // MARK: - UI
    lazy var labelPercentage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.421, green: 0.421, blue: 0.421, alpha: 1)
        label.textAlignment = .center
        label.text = "XX % des citations"
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
}

// MARK: - Private Methods
private extension CardView {
    func setup() {
        setupInterface()
        setupConstraints()
    }
    
    func setupInterface() {
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
        
        
        
        
        
        ])
    }
}
