//
//  ViewController.swift
//  Vocabulator
//
//  Created by Stephanie Liew on 10/3/22.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private var viewModel: VocabVM = .init()
    
    let blueVocabContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = Colors.lightBlue
        container.layer.cornerRadius = 25
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
    
    let vocabLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "algorithm"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 30)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    let speechTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "noun"
        label.font = UIFont(name: "Montserrat-Italic", size: 14)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    let definitionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "a process or set of rules to be followed in calculations or other problem-solving operations, especially by a computer"
        label.textAlignment = .natural
        label.font = UIFont(name: "Montserrat-Light", size: 16)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var refreshButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .medium)
        button.setImage(UIImage(systemName: "arrow.clockwise.circle", withConfiguration: largeConfig), for: .normal)
        button.addTarget(self, action: #selector(refreshButtonTapped), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HomeCell.self, forCellReuseIdentifier: "HomeCell")
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = Colors.white
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        setBlueVocabContainer()
        setStackLabels()
        setDefinitionLabel()
        setRefreshButton()
        setTableView()
    }
}

// MARK: - Setup Methods
extension HomeViewController {
    
    private func setNavigationBar() {
        title = "Vocabulator 📖"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: "Montserrat-Bold", size: 35)!]
        navigationController?.navigationBar.layoutMargins.left = 2
        navigationController?.navigationItem.hidesBackButton = true
        navigationItem.backButtonTitle = "Back"
    }
    
    private func setBlueVocabContainer() {
        view.addSubview(blueVocabContainer)
        
        NSLayoutConstraint.activate([
            blueVocabContainer.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            blueVocabContainer.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            blueVocabContainer.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            blueVocabContainer.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setStackLabels() {
        blueVocabContainer.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: blueVocabContainer.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: blueVocabContainer.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: blueVocabContainer.trailingAnchor, constant: -20),
        ])
        
        stackView.addArrangedSubview(vocabLabel)
        stackView.addArrangedSubview(speechTypeLabel)
    }
    
    private func setDefinitionLabel() {
        blueVocabContainer.addSubview(definitionLabel)
        
        NSLayoutConstraint.activate([
            definitionLabel.topAnchor.constraint(equalTo: blueVocabContainer.topAnchor, constant: 60),
            definitionLabel.leadingAnchor.constraint(equalTo: blueVocabContainer.leadingAnchor, constant: 15),
            definitionLabel.trailingAnchor.constraint(equalTo: blueVocabContainer.trailingAnchor),
        ])
    }
}

// MARK: - Setup Button
extension HomeViewController {
    private func setRefreshButton() {
        
        blueVocabContainer.addSubview(refreshButton)
        
        NSLayoutConstraint.activate([
            refreshButton.topAnchor.constraint(equalTo: blueVocabContainer.topAnchor, constant: 145),
            refreshButton.bottomAnchor.constraint(equalTo: blueVocabContainer.bottomAnchor),
            refreshButton.leadingAnchor.constraint(equalTo: blueVocabContainer.leadingAnchor, constant: 290),
            refreshButton.trailingAnchor.constraint(equalTo: blueVocabContainer.trailingAnchor)
        ])
    }
    
    @objc func refreshButtonTapped(sender: UIButton) {
        guard let unwrapRandomVocab = viewModel.randomVocab() else {
            return
        }
        
        vocabLabel.text = unwrapRandomVocab.word
        speechTypeLabel.text = unwrapRandomVocab.speechType
        definitionLabel.text = unwrapRandomVocab.definition
    }
}

// MARK: - Setup TableView
extension HomeViewController {
    private func setTableView() {
     
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: blueVocabContainer.topAnchor, constant: 220),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row Selected: \(indexPath.row)")
        let detailVC = DetailViewController()
        detailVC.configure(with: viewModel.term(at: indexPath))
        detailVC.speechLabel.text = viewModel.term(at: indexPath).speechType
        detailVC.definitionLabel.text = viewModel.term(at: indexPath).definition
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell else {
            return .init()
        }
        
        cell.configure(with: viewModel.term(at: indexPath))
        cell.backgroundColor = .clear
        return cell
    }
}
