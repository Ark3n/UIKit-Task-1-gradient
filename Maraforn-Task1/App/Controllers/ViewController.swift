//
//  ViewController.swift
//  Maraforn-Task1
//
//  Created by Arken Sarsenov on 01.02.2024.

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    // MARK: - SetupUI
    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
    private func setupConstraints() {}
}
