//
//  ViewController.swift
//  Vocabulator
//
//  Created by Stephanie Liew on 10/3/22.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private var viewModel: VocabVM = .init()
    
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
//        label.text =
        label.font = UIFont(name: "Rubik-SemiBold", size: 30)
        return label
    }()
    
    let speechTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "noun"
        label.font = UIFont(name: "Rubik-Italic", size: 14)
        return label
    }()
    
    let definitionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "the process or activity of writing computer programs"
        label.textAlignment = .natural
        label.font = UIFont(name: "Rubik-Light", size: 16)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let refreshButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 40, weight: .regular, scale: .medium)
        button.setImage(UIImage(systemName: "arrow.clockwise.circle", withConfiguration: largeConfig), for: .normal)
        button.addTarget(self, action: #selector(refreshButtonTapped), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setTitleLabel()
        setVocabContainer()
        setStackLabels()
        setDefinitionLabel()
        setRefreshButton()
    }
}

// MARK: - Setup Methods
extension HomeViewController {
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
            definitionLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 40),
            definitionLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            definitionLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
    }
}

// MARK: - Setup Button
extension HomeViewController {
    private func setRefreshButton() {
        
        vocabContainer.addSubview(refreshButton)
        
        NSLayoutConstraint.activate([
            refreshButton.topAnchor.constraint(equalTo: speechTypeLabel.topAnchor, constant: 120),
            refreshButton.leadingAnchor.constraint(equalTo: speechTypeLabel.leadingAnchor),
            refreshButton.trailingAnchor.constraint(equalTo: speechTypeLabel.trailingAnchor)
        ])
    }
    
    @objc func refreshButtonTapped() {
        guard let unwrapRandomVocab = viewModel.randomVocab() else {
            return
        }
        
        vocabLabel.text = unwrapRandomVocab.word
        speechTypeLabel.text = unwrapRandomVocab.speechType
        definitionLabel.text = unwrapRandomVocab.definition
    }
}
