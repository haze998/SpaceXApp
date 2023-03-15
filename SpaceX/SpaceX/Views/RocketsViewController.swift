//
//  RocketsViewController.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 08.03.2023.
//

import SnapKit
import UIKit
import SwiftUI

class RocketsViewController: UIViewController {

    var index = Int()
    init(index: Int = Int()) {
        super.init(nibName: nil, bundle: nil)
        self.index = index
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var lable: UILabel = {
        let label = UILabel()
        label.text = "Rockets"
        label.textColor = .white
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }
    
    private func setupUI() {
        
    }
    
    private func setupConstraints() {
        view.addSubview(lable)
        lable.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

// MARK: - Canvas Preview
struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        RocketsViewController().showPreview()
    }
}
