//
//  ViewController.swift
//  MarmeladeTest
//
//  Created by Nathan on 27/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
    /*   @IBOutlet weak var popUp: UIView!
     override func viewDidLoad() {
     super.viewDidLoad()
     popUp.layer.cornerRadius = 25
     var test = Network.shared.apollo.fetch(query: QuotesQuery()){ [weak self] result in
     switch result {
     case .failure(let error):
     print("somethingf faild")
     case .success(let quotes):
     print(quotes.data?.quotes[0].quote)
     }
     }
     // Do any additional setup after loading the view.
     }
     */
    // MARK: - UI
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
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 38)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "{Auteur}"
        label.textAlignment = .center
        return label
    }()
    
    lazy var citationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "{Citation}"
        label.textAlignment = .center
        return label
    }()
    
    lazy var emojiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "smiley_sick")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

 // MARK: - Private Methods
private extension ViewController {
    func setup() {
        setupInterface()
        setupConstraints()
    }
    
    func setupInterface() {
        view.layer.addSublayer(backgroundLayerGradiant)
        view.addSubview(authorLabel)
        view.addSubview(citationLabel)
        view.addSubview(emojiImageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // authorLabel
            authorLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            authorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            // citationLabel
            citationLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 13),
            citationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            citationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            // emojiImageName
            emojiImageView.topAnchor.constraint(equalTo: citationLabel.bottomAnchor, constant: 30),
            emojiImageView.heightAnchor.constraint(equalToConstant: 150),
            emojiImageView.widthAnchor.constraint(equalToConstant: 150),
            emojiImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}


