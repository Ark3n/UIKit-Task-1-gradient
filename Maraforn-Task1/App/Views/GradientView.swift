//
//  GradientView.swift
//  Maraforn-Task1
//
//  Created by Arken Sarsenov on 01.02.2024.
//

import UIKit

final class GradientView: UIView {
    // MARK: - Properties
    var shadowView = UIView()
    var mainView = UIView()
    var gradientLayer = CAGradientLayer()
    
    var shadowOpacity : Float = 0.0 {
        didSet {
           shadowView.layer.shadowOpacity = shadowOpacity
        }
    }
        
    var shadowRadius : CGFloat = 0.0 {
        didSet {
            shadowView.layer.shadowRadius = shadowRadius
        }
    }
        
    var shadowColor : UIColor? {
        didSet {
            shadowView.layer.shadowColor = shadowColor?.cgColor
        }
    }
        
    var shadowOffset : CGSize = .zero {
        didSet {
            shadowView.layer.shadowOffset = shadowOffset
        }
    }
        
    var cornerRadius : CGFloat = 0.0 {
        didSet {
            mainView.layer.cornerRadius = cornerRadius
            shadowView.layer.cornerRadius = cornerRadius
        }
    }
        
    var gradientColors : [UIColor] = [UIColor.white] {
        didSet {
            var cgColors : [CGColor] = []
            for color in gradientColors {
                cgColors.append(color.cgColor)
            }
            gradientLayer.colors = cgColors
        }
    }
    
    // MARK: - View Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        gradientLayer.frame = mainView.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.locations = [0, 1]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupUI
    private func setupUI() {
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.backgroundColor = .white
        addSubview(shadowView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.backgroundColor = .white
        addSubview(mainView)
        mainView.clipsToBounds = true
        mainView.layer.insertSublayer(gradientLayer, at: 0)
        self.sendSubviewToBack(mainView)
        self.sendSubviewToBack(shadowView)
        self.backgroundColor = .clear
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: topAnchor),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor),
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
    }
}

