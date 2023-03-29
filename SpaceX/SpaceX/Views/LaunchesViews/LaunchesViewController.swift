//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 15.03.2023.
//

import UIKit
import SnapKit

class LaunchesViewController: UIViewController {
    
    private let viewModel = LaunchesViewModel()
    
    private lazy var launchesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        launchesCollectionView.delegate = self
        launchesCollectionView.dataSource = self
        launchesCollectionView.register(LaunchesCollectionViewCell.self, forCellWithReuseIdentifier: LaunchesCollectionViewCell.id)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.fetchedLaunches {
            self.launchesCollectionView.reloadData()
        }
    }
    
    private func setupUI() {
        title = "Launches"
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.tintColor = .white
        view.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection? in
            return self.launchesCollectionView.launchesSection()
        }
    }
    
    private func setupConstraints() {
        view.addSubview(launchesCollectionView)
        
        launchesCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension LaunchesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.listOfLaunches.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchesCollectionViewCell.id, for: indexPath) as? LaunchesCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(with: viewModel.listOfLaunches[indexPath.row])
        return cell
    }
}
