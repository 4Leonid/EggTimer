//
//  ViewController.swift
//  EggTimer
//
//  Created by Леонид Турко on 08.04.2023.
//

import UIKit
import SwiftUI
import SnapKit

class EggViewController: UIViewController {
  
  //  MARK: - Private Properties
  private var counter = 0
  
  private let eggTime = [
    "Soft" : 10,
    "Medium" : 420,
    "Hard" : 720
  ]
  
  private lazy var verticalStack: UIStackView = {
    let element = UIStackView()
    element.axis = .vertical
    element.distribution = .fillEqually
    element.spacing = 40
    return element
  }()
  
  private lazy var labelView: UIView = {
    let element = UIView()
    return element
  }()
  
  private lazy var questionLabel: UILabel = {
    let element = UILabel()
    element.text = "How do you like your eggs?"
    element.numberOfLines = 0
    element.textAlignment = .center
    element.font = UIFont.systemFont(ofSize: 30)
    element.adjustsFontSizeToFitWidth = true
    return element
  }()
  
  private lazy var timeLabel: UILabel = {
    let element = UILabel()
    element.text = ""
    element.numberOfLines = 0
    element.textAlignment = .center
    element.font = UIFont.boldSystemFont(ofSize: 50)
    element.adjustsFontSizeToFitWidth = true
    return element
  }()
  
  private lazy var eggsStackView: UIStackView = {
    let element = UIStackView()
    element.axis = .horizontal
    element.distribution = .fillEqually
    element.spacing = 8
    return element
  }()
  
  //  MARK: - SoftView
  private lazy var softView: UIView = {
    let element = UIView()
    return element
  }()
  
  private lazy var softButton: UIButton = {
    let element = UIButton(type: .system)
    element.setTitle("Soft", for: .normal)
    element.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
    element.tintColor = .white
    element.addTarget(self, action: #selector(eggPressed), for: .touchUpInside)
    return element
  }()
  
  private lazy var softImage: UIImageView = {
    let element = UIImageView()
    element.image = UIImage(named: "soft_egg")
    element.contentMode = .scaleAspectFit
    return element
  }()
  
  //  MARK: - MediumView
  private lazy var mediumView: UIView = {
    let element = UIView()
    return element
  }()
  
  private lazy var mediumButton: UIButton = {
    let element = UIButton(type: .system)
    element.setTitle("Medium", for: .normal)
    element.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
    element.tintColor = .white
    element.addTarget(self, action: #selector(eggPressed), for: .touchUpInside)
    return element
  }()
  
  private lazy var mediumImage: UIImageView = {
    let element = UIImageView()
    element.image = UIImage(named: "medium_egg")
    element.contentMode = .scaleAspectFit
    return element
  }()
  
  //  MARK: - HardView
  private lazy var hardView: UIView = {
    let element = UIView()
    return element
  }()
  
  private lazy var hardButton: UIButton = {
    let element = UIButton(type: .system)
    element.setTitle("Hard", for: .normal)
    element.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
    element.tintColor = .white
    element.addTarget(self, action: #selector(eggPressed), for: .touchUpInside)
    return element
  }()
  
  private lazy var hardImage: UIImageView = {
    let element = UIImageView()
    element.image = UIImage(named: "hard_egg")
    element.contentMode = .scaleAspectFit
    return element
  }()
  
  private lazy var timerView: UIView = {
    let element = UIView()
    return element
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.6957606673, green: 0.8809950948, blue: 0.9896888137, alpha: 1)
    addViews()
    setConstraints()
  }
  
  @objc private func eggPressed(_ sender: UIButton) {
    guard let result = sender.currentTitle else { return }
    guard let totalResult = eggTime[result] else { return }
    counter = totalResult
    
    Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
  }
  
  @objc func updateTimer() {
    timeLabel.text = "\(counter)"
    
    if counter > 0 {
      counter -= 1
    }
  }
}

extension EggViewController {
  private func addViews() {
    view.addSubview(verticalStack)
    
    verticalStack.addArrangedSubview(labelView)
    verticalStack.addArrangedSubview(eggsStackView)
    verticalStack.addArrangedSubview(timerView)
    
    labelView.addSubview(questionLabel)
    timerView.addSubview(timeLabel)
    
    eggsStackView.addArrangedSubview(softView)
    eggsStackView.addArrangedSubview(mediumView)
    eggsStackView.addArrangedSubview(hardView)
    
    softView.addSubview(softImage)
    softView.addSubview(softButton)
    
    mediumView.addSubview(mediumImage)
    mediumView.addSubview(mediumButton)
    
    hardView.addSubview(hardImage)
    hardView.addSubview(hardButton)
  }
  
  private func setConstraints() {
    verticalStack.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(20)
    }
    
    questionLabel.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    timeLabel.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    softButton.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    softImage.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    mediumButton.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    mediumImage.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    hardButton.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    hardImage.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
}

//  MARK: - Show Canvas
struct ContentViewController: UIViewControllerRepresentable {
  
  typealias UIViewControllerType = EggViewController
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    return EggViewController()
  }
  
  func updateUIViewController(_ uiViewController: EggViewController, context: Context) {}
}

struct ContentViewController_Previews: PreviewProvider {
  static var previews: some View {
    ContentViewController()
      .edgesIgnoringSafeArea(.all)
      .colorScheme(.light) // or .dark
  }
}
