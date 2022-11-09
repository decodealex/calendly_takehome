//
//  EventTypesHeaderView.swift
//  takehome
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import UIKit

protocol EventTypesHeaderViewDelegate: AnyObject {
    func didTapLink()
}

class EventTypesHeaderView: UIView {
    
    weak var delegate: EventTypesHeaderViewDelegate?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let linkButton: LinkButton = {
        let button = LinkButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.layer.cornerRadius = imageView.bounds.height / 2
    }
    
    private func configure() {
        backgroundColor = .clear
        
        addSubviews(imageView, stackView)
        stackView.addArrangedSubviews(nameLabel, linkButton)
        
        let padding: CGFloat = 10
        let imageSize: CGFloat = 45
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            imageView.widthAnchor.constraint(equalToConstant: imageSize),
            imageView.heightAnchor.constraint(equalToConstant: imageSize),
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: padding/2 ),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ])
    }
    
    func setupWith(_ account: Account) {
        nameLabel.text = account.name
        linkButton.set(title: account.schedulingUrl.deletingPrefix("https://"))
        
        imageView.tintColor = .systemGray
        imageView.image = UIImage.letterImage(from: account.name)
        linkButton.addTarget(self, action: #selector(handleButtonAction), for: .touchUpInside)
    }
    
    @objc func handleButtonAction() {
        delegate?.didTapLink()
    }
    
}
