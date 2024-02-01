//
//  ViewController.swift
//  Maraforn-Task1
//
//  Created by Arken Sarsenov on 01.02.2024.

import UIKit

final class ViewController: UIViewController {
    // MARK: - Properties
    private let gradientView = GradientView()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    // MARK: - SetupUI
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(gradientView)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.cornerRadius = 8
        gradientView.shadowColor = UIColor.black
        gradientView.shadowOffset = CGSize(width: 5, height: 10)
        gradientView.shadowRadius = 5
        gradientView.shadowOpacity = 0.5
        gradientView.gradientColors = [UIColor.systemBlue, UIColor.systemRed]
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            gradientView.widthAnchor.constraint(equalToConstant: 150),
            gradientView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}

