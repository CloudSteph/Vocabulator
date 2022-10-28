//
//  DetailViewController.swift
//  Vocabulator
//
//  Created by Stephanie Liew on 10/10/22.
//

import Foundation
import UIKit

final class DetailViewController: UIViewController {
    private(set) var viewModel: VocabVM = .init()
    
    
    let definitionContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 20
        container.backgroundColor = Colors.orange
        return container
    }()
    
    let stackViewDefinitionSet: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 15
        return stackView
    }()
    
    let speechLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Montserrat-SemiBoldItalic", size: 16)
        label.text = "adjective"
        return label
    }()
    
    let definitionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Montserrat-Regular", size: 20)
        label.text = "causing great surprise or wonder; astonishing"
        label.numberOfLines = 0
        return label
    }()
    
    let definitionTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Montserrat-Bold", size: 12)
        label.text = "Definition"
        label.textColor = Colors.white
        return label
    }()
    
    let synonymContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 20
        container.backgroundColor = Colors.purple
        return container
    }()
    
    let stackViewSynonymSet: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 15
        return stackView
    }()
    
    let synonymLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "awesome"
        label.font = UIFont(name: "Montserat-Light", size: 16)
        return label
    }()
    
    let synonymTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Synonym"
        label.font = UIFont(name: "Montserrat-Bold", size: 12)
        label.textColor = Colors.white
        return label
    }()
    
    let antonymContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 20
        container.backgroundColor = Colors.oceanBlue
        return container
    }()
    
    let stackViewAntonymSet: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 15
        return stackView
    }()
    
    let antonymLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "credible"
        label.font = UIFont(name: "Montserrat-Light", size: 16)
        return label
    }()
    
    let antonymTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Antonym"
        label.font = UIFont(name: "Montserrat-Bold", size: 12)
        label.textColor = Colors.white
        return label
    }()
    
    let exampleContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 20
        container.backgroundColor = Colors.green
        return container
    }()
    
    let stackViewExampleSet: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 15
        return stackView
    }()
    
    let exampleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This was an amazing movie."
        label.text = "I got an amazing grade on test."
        label.text = "You made an amazing discovery."
        label.numberOfLines = 0
        label.font = UIFont(name: "Montserrat-Light", size: 16)
        return label
    }()
    
    let exampleTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Example"
        label.font = UIFont(name: "Montserrat-Bold", size: 12)
        label.textColor = Colors.white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setDefinitionContainer()
        setStackViewdDefintionSet()
        
        setSynonymContainer()
        setStackViewSynonymSet()
        
        setAntonymContainer()
        setStackViewAntonymSet()
        
        setExampleContainer()
        setStackViewExampleSet()
    }
    func configure(with vocab: Vocabulary) {
        navigationItem.title = vocab.word
    }
}

// MARK: - Setup Methods for Definition
extension DetailViewController {
    
    private func setDefinitionContainer() {
        view.addSubview(definitionContainer)

        NSLayoutConstraint.activate([
            definitionContainer.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            definitionContainer.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            definitionContainer.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            definitionContainer.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    private func setStackViewdDefintionSet() {
        definitionContainer.addSubview(stackViewDefinitionSet)
        
        NSLayoutConstraint.activate([
            stackViewDefinitionSet.topAnchor.constraint(equalTo: definitionContainer.topAnchor, constant: 20),
            stackViewDefinitionSet.leadingAnchor.constraint(equalTo: definitionContainer.leadingAnchor, constant: 20),
            stackViewDefinitionSet.trailingAnchor.constraint(equalTo: definitionContainer.trailingAnchor, constant: -20),
        ])
        
        stackViewDefinitionSet.addArrangedSubview(speechLabel)
        stackViewDefinitionSet.addArrangedSubview(definitionLabel)
        stackViewDefinitionSet.addArrangedSubview(definitionTitleLabel)
    }
}

// MARK: - Setup Method for Synonym
extension DetailViewController {
    private func setSynonymContainer() {

        view.addSubview(synonymContainer)

        NSLayoutConstraint.activate([
            synonymContainer.topAnchor.constraint(equalTo: definitionContainer.topAnchor, constant: 200),
            synonymContainer.leadingAnchor.constraint(equalTo: definitionContainer.leadingAnchor),
            synonymContainer.trailingAnchor.constraint(equalTo: definitionContainer.trailingAnchor),
            synonymContainer.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setStackViewSynonymSet() {
        
        synonymContainer.addSubview(stackViewSynonymSet)
        
        NSLayoutConstraint.activate([
            stackViewSynonymSet.topAnchor.constraint(equalTo: synonymContainer.topAnchor, constant: 20),
            stackViewSynonymSet.leadingAnchor.constraint(equalTo: synonymContainer.leadingAnchor, constant: 20),
            stackViewSynonymSet.trailingAnchor.constraint(equalTo: synonymContainer.trailingAnchor, constant: -20)
        ])
        
        stackViewSynonymSet.addArrangedSubview(synonymLabel)
        stackViewSynonymSet.addArrangedSubview(synonymTitleLabel)
    }
}

// MARK: - Setup Method for Antonym
extension DetailViewController {
    private func setAntonymContainer() {
        
        view.addSubview(antonymContainer)
        
        NSLayoutConstraint.activate([
            antonymContainer.topAnchor.constraint(equalTo: synonymContainer.topAnchor, constant: 130),
            antonymContainer.leadingAnchor.constraint(equalTo: synonymContainer.leadingAnchor),
            antonymContainer.trailingAnchor.constraint(equalTo: synonymContainer.trailingAnchor),
            antonymContainer.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setStackViewAntonymSet() {
        
        antonymContainer.addSubview(stackViewAntonymSet)
        
        NSLayoutConstraint.activate([
            stackViewAntonymSet.topAnchor.constraint(equalTo: antonymContainer.topAnchor, constant: 20),
            stackViewAntonymSet.leadingAnchor.constraint(equalTo: antonymContainer.leadingAnchor, constant: 20),
            stackViewAntonymSet.trailingAnchor.constraint(equalTo: antonymContainer.trailingAnchor, constant: -20)
        ])
        
        stackViewAntonymSet.addArrangedSubview(antonymLabel)
        stackViewAntonymSet.addArrangedSubview(antonymTitleLabel)
    }
}

// MARK: - Setup Method for Example
extension DetailViewController {
    private func setExampleContainer() {
        
        view.addSubview(exampleContainer)
        
        NSLayoutConstraint.activate([
            exampleContainer.topAnchor.constraint(equalTo: antonymContainer.topAnchor, constant: 130),
            exampleContainer.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            exampleContainer.leadingAnchor.constraint(equalTo: antonymContainer.leadingAnchor),
            exampleContainer.trailingAnchor.constraint(equalTo: antonymContainer.trailingAnchor),
            exampleContainer.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setStackViewExampleSet() {
        
        exampleContainer.addSubview(stackViewExampleSet)
        
        NSLayoutConstraint.activate([
            stackViewExampleSet.topAnchor.constraint(equalTo: exampleContainer.topAnchor, constant: 20),
            stackViewExampleSet.leadingAnchor.constraint(equalTo: exampleContainer.leadingAnchor, constant: 20),
            stackViewExampleSet.trailingAnchor.constraint(equalTo: exampleContainer.trailingAnchor, constant: -20)
        ])
        
        stackViewExampleSet.addArrangedSubview(exampleLabel)
        stackViewExampleSet.addArrangedSubview(exampleTitleLabel)
    }
}
