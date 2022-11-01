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
        label.font = UIFont(name: "Montserrat-Regular", size: 18)
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
    
    let synonymLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "awesome"
        label.font = UIFont(name: "Montserrat-Regular", size: 16)
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
    
    let antonymLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "credible"
        label.font = UIFont(name: "Montserrat-Regular", size: 16)
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
        
    let exampleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This was an amazing movie."
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
        setDefintionTitleLabel()
        setDefinitionStackView()
        
        setSynonymContainer()
        setSynonymLabel()
        setSynonymTitleLabel()
        
        setAntonymContainer()
        setAntonymLabel()
        setAntonymTitleLabel()
        
        setExampleContainer()
        setExampleLabel()
        setExampleTitleLabel()
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
            definitionContainer.heightAnchor.constraint(greaterThanOrEqualToConstant: 180)
        ])
    }
    
    private func setDefinitionStackView() {
        definitionContainer.addSubview(stackViewDefinitionSet)
        
        NSLayoutConstraint.activate([
            stackViewDefinitionSet.topAnchor.constraint(equalTo: definitionContainer.topAnchor, constant: 20),
            stackViewDefinitionSet.leadingAnchor.constraint(equalTo: definitionContainer.leadingAnchor, constant: 20),
            stackViewDefinitionSet.trailingAnchor.constraint(equalTo: definitionContainer.trailingAnchor, constant: -20)
        ])
        
        stackViewDefinitionSet.addArrangedSubview(speechLabel)
        stackViewDefinitionSet.addArrangedSubview(definitionLabel)
    }
    
    private func setDefintionTitleLabel() {
        definitionContainer.addSubview(definitionTitleLabel)

        NSLayoutConstraint.activate([
            definitionTitleLabel.topAnchor.constraint(equalTo: definitionContainer.topAnchor),
            definitionTitleLabel.bottomAnchor.constraint(equalTo: definitionContainer.bottomAnchor, constant: 125),
            definitionTitleLabel.leadingAnchor.constraint(equalTo: definitionContainer.leadingAnchor, constant: 260),
            definitionTitleLabel.trailingAnchor.constraint(equalTo: definitionContainer.trailingAnchor)
        ])
    }
}

// MARK: - Setup Method for Synonym
extension DetailViewController {
    private func setSynonymContainer() {

        view.addSubview(synonymContainer)

        NSLayoutConstraint.activate([
            synonymContainer.topAnchor.constraint(equalTo: definitionContainer.topAnchor, constant: 205),
            synonymContainer.leadingAnchor.constraint(equalTo: definitionContainer.leadingAnchor),
            synonymContainer.trailingAnchor.constraint(equalTo: definitionContainer.trailingAnchor),
            synonymContainer.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setSynonymLabel() {
        synonymContainer.addSubview(synonymLabel)
        
        NSLayoutConstraint.activate([
            synonymLabel.topAnchor.constraint(equalTo: synonymContainer.topAnchor, constant: 20),
            synonymLabel.leadingAnchor.constraint(equalTo: synonymContainer.leadingAnchor, constant: 20),
            synonymLabel.trailingAnchor.constraint(equalTo: synonymContainer.trailingAnchor, constant: -20)
        ])
    }
    
    private func setSynonymTitleLabel() {
        synonymContainer.addSubview(synonymTitleLabel)

        NSLayoutConstraint.activate([
            synonymTitleLabel.topAnchor.constraint(equalTo: synonymContainer.topAnchor),
            synonymTitleLabel.bottomAnchor.constraint(equalTo: synonymContainer.bottomAnchor, constant: 25),
            synonymTitleLabel.leadingAnchor.constraint(equalTo: synonymContainer.leadingAnchor, constant: 260),
            synonymTitleLabel.trailingAnchor.constraint(equalTo: synonymContainer.trailingAnchor)
        ])
    }
}

// MARK: - Setup Method for Antonym
extension DetailViewController {
    private func setAntonymContainer() {

        view.addSubview(antonymContainer)

        NSLayoutConstraint.activate([
            antonymContainer.topAnchor.constraint(equalTo: synonymContainer.topAnchor, constant: 100),
            antonymContainer.leadingAnchor.constraint(equalTo: synonymContainer.leadingAnchor),
            antonymContainer.trailingAnchor.constraint(equalTo: synonymContainer.trailingAnchor),
            antonymContainer.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    private func setAntonymLabel() {
        antonymContainer.addSubview(antonymLabel)

        NSLayoutConstraint.activate([
            antonymLabel.topAnchor.constraint(equalTo: antonymContainer.topAnchor, constant: 20),
            antonymLabel.leadingAnchor.constraint(equalTo: antonymContainer.leadingAnchor, constant: 20),
            antonymLabel.trailingAnchor.constraint(equalTo: antonymContainer.trailingAnchor, constant: -20)
        ])
    }

    private func setAntonymTitleLabel() {
        antonymContainer.addSubview(antonymTitleLabel)

        NSLayoutConstraint.activate([
            antonymTitleLabel.topAnchor.constraint(equalTo: antonymContainer.topAnchor),
            antonymTitleLabel.bottomAnchor.constraint(equalTo: antonymContainer.bottomAnchor, constant: 25),
            antonymTitleLabel.leadingAnchor.constraint(equalTo: antonymContainer.leadingAnchor, constant: 260),
            antonymTitleLabel.trailingAnchor.constraint(equalTo: antonymContainer.trailingAnchor)
        ])
    }
}

// MARK: - Setup Method for Example
extension DetailViewController {
    private func setExampleContainer() {

        view.addSubview(exampleContainer)

        NSLayoutConstraint.activate([
            exampleContainer.topAnchor.constraint(equalTo: antonymContainer.topAnchor, constant: 105),
            exampleContainer.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            exampleContainer.leadingAnchor.constraint(equalTo: antonymContainer.leadingAnchor),
            exampleContainer.trailingAnchor.constraint(equalTo: antonymContainer.trailingAnchor),
            exampleContainer.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setExampleLabel() {
        exampleContainer.addSubview(exampleLabel)

        NSLayoutConstraint.activate([
            exampleLabel.topAnchor.constraint(equalTo: exampleContainer.topAnchor, constant: 20),
            exampleLabel.leadingAnchor.constraint(equalTo: exampleContainer.leadingAnchor, constant: 20),
            exampleLabel.trailingAnchor.constraint(equalTo: exampleContainer.trailingAnchor, constant: -20)
        ])
    }

    private func setExampleTitleLabel() {
        exampleContainer.addSubview(exampleTitleLabel)

        NSLayoutConstraint.activate([
            exampleTitleLabel.topAnchor.constraint(equalTo: exampleContainer.topAnchor),
            exampleTitleLabel.bottomAnchor.constraint(equalTo: exampleContainer.bottomAnchor, constant: 235),
            exampleTitleLabel.leadingAnchor.constraint(equalTo: exampleContainer.leadingAnchor, constant: 260),
            exampleTitleLabel.trailingAnchor.constraint(equalTo: exampleContainer.trailingAnchor)
        ])
    }
}
