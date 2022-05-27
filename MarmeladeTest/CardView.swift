//
//  CardView.swift
//  MarmeladeTest
//
//  Created by Nathan on 27/05/2022.
//

import UIKit
protocol CardViewDelegate: AnyObject {
    func nextQuote()
}
final class CardView: UIView {
    
    // MARK: - UI
    lazy var percentageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.421, green: 0.421, blue: 0.421, alpha: 1)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.text = "XX % des citations"
        return label
    }()
    
    lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.421, green: 0.421, blue: 0.421, alpha: 1)
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20)
        label.text = "Votre progression"
        return label
    }()
    
    lazy var progressSliderView: UISlider = {
        let view = UISlider()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isEnabled = false
        view.tintColor = .orange
        return view
    }()
    
    lazy var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .cyan
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [progressSliderView,starImageView])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fill
        view.spacing = 3
        return view
    }()
    
    lazy var citationsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.421, green: 0.421, blue: 0.421, alpha: 1)
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 13)
        label.text = "XX citations"
        return label
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Citation suivante".uppercased(), for: .normal)
        button.backgroundColor = UIColor(red: 0.827, green: 0.102, blue: 0.431, alpha: 1)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(nextCitation), for: .touchUpInside)
        return button
    }()
    
    weak var delegate : CardViewDelegate?
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateValue(nbrQuote : Int, percentage : Float) {
        citationsLabel.text = "\(nbrQuote) citations"
        percentageLabel.text = "\(Int(percentage)) % des citations"
        progressSliderView.setValue(percentage/100, animated: true)
        if percentage == 100 {
            nextButton.setTitle("Finir".uppercased(), for: .normal)
        }
    }
  
    
}

// MARK: - Private Methods
private extension CardView {
    func setup() {
        setupInterface()
        setupConstraints()
    }
    
    func setupInterface() {
        backgroundColor = .white
        addSubview(percentageLabel)
        addSubview(progressLabel)
        addSubview(stackView)
        addSubview(citationsLabel)
        addSubview(nextButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            //percentageLabel
            percentageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            percentageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            percentageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            //progressLabel
            progressLabel.topAnchor.constraint(equalTo: percentageLabel.bottomAnchor, constant: 30),
            progressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            progressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            //stackView
            stackView.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 55),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            //progressView
            //progressSliderView.heightAnchor.constraint(equalToConstant: 4),
            
            //starImageView
            starImageView.heightAnchor.constraint(equalToConstant: 20),
            starImageView.widthAnchor.constraint(equalToConstant: 20),
            
            //citationsLabel
            citationsLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 11),
            citationsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            citationsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            //nextButton
            nextButton.topAnchor.constraint(equalTo: citationsLabel.bottomAnchor, constant: 60),
            nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func nextCitation() {
        delegate?.nextQuote()
    }
    

}
