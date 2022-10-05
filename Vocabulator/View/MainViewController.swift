//
//  ViewController.swift
//  Vocabulator
//
//  Created by Stephanie Liew on 10/3/22.
//

import UIKit

final class MainViewController: UIViewController {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vocabulator"
        label.font = UIFont(name: "Rubik-Bold", size: 35)
        label.textAlignment = .left
        return label
    }()
    
    let vocabContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = Colors.blue
        container.layer.cornerRadius = 20
        return container
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let vocabLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Coding"
        label.font = UIFont(name: "Rubik-SemiBold", size: 25)
        return label
    }()
    
    let speechTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "noun"
        label.font = UIFont(name: "Rubik-Italic", size: 14)
        return label
    }()
    
    let definitionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "the process or activity of writing computer programs"
        label.textAlignment = .natural
        label.font = UIFont(name: "Rubik-Light", size: 16)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setTitleLabel()
        setVocabContainer()
        setStackLabels()
        setDefinitionLabel()
    }
}

// MARK: - Setup Methods
extension MainViewController {
    private func setTitleLabel() {
        
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func setVocabContainer() {
        
        view.addSubview(vocabContainer)
        
        NSLayoutConstraint.activate([
            vocabContainer.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 60),
            vocabContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            vocabContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            vocabContainer.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setStackLabels() {
        
        vocabContainer.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 75),
            stackView.leadingAnchor.constraint(equalTo: vocabContainer.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: vocabContainer.trailingAnchor, constant: -15),
        ])
        
        stackView.addArrangedSubview(vocabLabel)
        stackView.addArrangedSubview(speechTypeLabel)
    }
    
    private func setDefinitionLabel() {
        
        vocabContainer.addSubview(definitionLabel)
        
        NSLayoutConstraint.activate([
            definitionLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 35),
            definitionLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            definitionLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
    }
}

