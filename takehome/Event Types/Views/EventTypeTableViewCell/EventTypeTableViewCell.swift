//
//  EventTypeTableViewCell.swift
//  takehome
//
//

import UIKit

protocol EventTypeTableViewCellDelegate: AnyObject {
    func didTapBookingPageButton(_ sender: EventTypeTableViewCell)
}

class EventTypeTableViewCell: UITableViewCell {
    
    weak var delegate: EventTypeTableViewCellDelegate?
    
    private let shadowContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.shadowRadius = 3.0
        view.layer.shadowOpacity = 0.3
        view.layer.shadowColor = UIColor.systemGray.cgColor
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
        stackView.isUserInteractionEnabled = true
        
        return stackView
    }()
    
    private let eventLinkButton: LinkButton = {
        let button = LinkButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String? = defaultReusableIdentifier) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        isUserInteractionEnabled = true
        eventLinkButton.addTarget(self, action: #selector(handleButtonAction), for: .touchUpInside)
        backgroundColor = .clear
    }
    
    private func layoutViews() {
        contentView.addSubview(shadowContainer)
        
        shadowContainer.addSubview(containerView)
        containerView.pinEdgesToParent()
        containerView.addSubviews(colorView, eventsStackView, eventLinkButton)
        eventsStackView.addArrangedSubviews(eventInfoLabel, eventNameLabel)
        
        let horizontalPadding: CGFloat = 15.0
        let containerPadding: CGFloat = 15.0
        NSLayoutConstraint.activate([
            shadowContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: containerPadding),
            shadowContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: containerPadding),
            shadowContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -containerPadding),
            shadowContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
         
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
        colorView.backgroundColor = event.active ? event.color.color ?? .clear : .systemGray
        eventInfoLabel.text = String(event.duration) + " • " + event.kind.title
        eventNameLabel.text = event.name
        eventLinkButton.set(title: "View booking page", link: "")
        
    }
    
    @objc func handleButtonAction() {
        delegate?.didTapBookingPageButton(self)
        
    }
}

extension EventTypeTableViewCell: ReusableView { }
