//
//  LinkButton.swift
//  takehome
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import UIKit

class LinkButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroudColor: UIColor, title: String) {
        self.init(frame: .zero)
        backgroundColor = backgroudColor
        setTitle(title, for: .normal)
    }
    
    private func configure() {
        setTitleColor(.systemBlue, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        contentHorizontalAlignment = .leading
        
        let imageConfig = UIImage.SymbolConfiguration(scale: .small)
        setImage(UIImage(systemName: "arrow.up.right", withConfiguration: imageConfig), for: .normal)
        layer.cornerRadius = 10
    }
    
    func set(title: String) {
        setTitle(title, for: .normal)
    }
}
