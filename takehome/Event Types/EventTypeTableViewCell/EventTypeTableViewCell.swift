//
//  EventTypeTableViewCell.swift
//  takehome
//
//

import UIKit

class EventTypeTableViewCell2: UITableViewCell {
    
    private let shadowContainer: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.shadowRadius = 4.0
        view.layer.shadowOpacity = 0.3
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: -3)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private let containerView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.systemGray4.cgColor
        return view
    }()
    
    private let colorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let eventInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .tertiaryLabel
        label.font = .systemFont(ofSize: 13, weight: .bold)
        
        return label
    }()
    
    private let eventNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    private let eventsStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()

    private let eventLinkButton: UIButton = {
       let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("View booking page", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        button.contentHorizontalAlignment = .leading
        
        let imageConfig = UIImage.SymbolConfiguration(scale: .small)
        button.setImage(UIImage(systemName: "arrow.up.right", withConfiguration: imageConfig), for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String? = defaultReusableIdentifier) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        addSubview(shadowContainer)
        shadowContainer.addSubview(containerView)
        containerView.pinEdgesToParent()
        containerView.addSubviews(colorView, eventsStackView, eventLinkButton)
        eventsStackView.addArrangedSubviews(eventInfoLabel, eventNameLabel)
        
        let horizontalPadding: CGFloat = 15.0
        let containerPadding: CGFloat = 15.0
        NSLayoutConstraint.activate([
            shadowContainer.topAnchor.constraint(equalTo: topAnchor, constant: containerPadding),
            shadowContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: containerPadding),
            shadowContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -containerPadding),
            shadowContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
         
            colorView.topAnchor.constraint(equalTo: containerView.topAnchor),
            colorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            colorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            colorView.heightAnchor.constraint(equalToConstant: 10),
            
            eventsStackView.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 20),
            eventsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: horizontalPadding),
            eventsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -horizontalPadding),
            
            eventLinkButton.topAnchor.constraint(equalTo: eventsStackView.bottomAnchor, constant: 40),
            eventLinkButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: horizontalPadding),
            eventLinkButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -horizontalPadding),
            eventLinkButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
    }
    
    func setupWith(_ event: EventType) {
        colorView.backgroundColor = event.color.color ?? .clear
        eventInfoLabel.text = String(event.duration) + " • " + event.kind.title
        eventNameLabel.text = event.name
    }

}

extension EventTypeTableViewCell2: ReusableView { }
