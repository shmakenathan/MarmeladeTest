//
//  EndScene.swift
//  MarmeladeTest
//
//  Created by Nathan on 27/05/2022.
//

import Foundation
import UIKit

class EndSceneViewController: UIViewController {
    
    //MARK: -UI
    
    lazy var backgroundLayerGradiant: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor(red: 0.953, green: 0.816, blue: 0.329, alpha: 1).cgColor,
            UIColor(red: 0.953, green: 0.804, blue: 0.329, alpha: 1).cgColor,
            UIColor(red: 0.945, green: 0.761, blue: 0.329, alpha: 1).cgColor,
            UIColor(red: 0.937, green: 0.694, blue: 0.325, alpha: 1).cgColor,
            UIColor(red: 0.929, green: 0.6, blue: 0.325, alpha: 1).cgColor,
            UIColor(red: 0.914, green: 0.478, blue: 0.322, alpha: 1).cgColor,
            UIColor(red: 0.898, green: 0.337, blue: 0.318, alpha: 1).cgColor
        ]
        layer.locations = [0.07, 0.27, 0.43, 0.59, 0.73, 0.87, 1]
        layer.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: -1.33, b: -1.17, c: 1.94, d: -0.65, tx: 0.41, ty: 1.49))
        layer.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        layer.position = view.center
        return layer
    }()
    
    lazy var finLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text =  "Bravo à vous, n'hesitez pas à revenir pour de nouvelles citations 🤩🤩🤩🤩🤩!!!"
        label.textAlignment = .center
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func setup() {
        setupInterface()
        setupConstraints()
    }
    
    func setupInterface() {
        view.layer.addSublayer(backgroundLayerGradiant)
        view.addSubview(finLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            finLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            finLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            finLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            
        ])
    }
    
    
}
