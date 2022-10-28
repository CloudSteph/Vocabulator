//
//  HomeCell.swift
//  Vocabulator
//
//  Created by Stephanie Liew on 10/7/22.
//

import Foundation
import UIKit

final class HomeCell: UITableViewCell {
    
    let contentContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 20
        container.backgroundColor = Colors.yellow
        return container
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    let wordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        return label
    }()
    
    let speechLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.font = UIFont(name: "Montserrat-Italic", size: 12)
        return label
    }()
    
    let definitionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Montserrat-Light", size: 12)
        label.numberOfLines = 0
        return label
    }()
    
    static let identifier: String = "HomeCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
        setStackView()
        setDefinitionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with vocab: Vocabulary) {
        self.wordLabel.text = vocab.word
        self.speechLabel.text = vocab.speechType
        self.definitionLabel.text = vocab.definition
    }
}
      
extension HomeCell {
    private func setupView() {
        
        self.addSubview(contentContainer)
        
        NSLayoutConstraint.activate([
            contentContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            contentContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            contentContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    private func setStackView() {
        
        contentContainer.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentContainer.topAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor, constant: -15)
        ])
        
        stackView.addArrangedSubview(wordLabel)
        stackView.addArrangedSubview(speechLabel)
        
//        stackView.backgroundColor = .systemOrange
//        wordLabel.backgroundColor = .systemPink
//        speechLabel.backgroundColor = .systemCyan
    }
    
    private func setDefinitionLabel() {
        
        contentContainer.addSubview(definitionLabel)
        
        NSLayoutConstraint.activate([
            definitionLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 30),
            definitionLabel.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor, constant: 15),
            definitionLabel.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor)
        ])
    }
}

