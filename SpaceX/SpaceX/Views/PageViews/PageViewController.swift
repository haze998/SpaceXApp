//
//  PageViewController.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 15.03.2023.
//

import UIKit

class PageViewController: UIPageViewController {
    
    // Array of ViewControllers wich will be scrolling
    private var arrOfControllers = [UIViewController]()
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // pageVC delegate
        delegate = self
        // pageVC data source
        dataSource = self
        
        for i in 0...3 {
            let vc = RocketsViewController(index: i)
            arrOfControllers.append(vc)
        }
        
        // set vc as initial
        setViewControllers([arrOfControllers[0]], direction: .forward, animated: true)
    }

}

// MARK: - DataSource
extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = arrOfControllers.firstIndex(of: viewController) else { return UIViewController() }
        if index > 0 {
            return arrOfControllers[index - 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = arrOfControllers.firstIndex(of: viewController) else { return UIViewController() }
        if index < arrOfControllers.count - 1 {
            return arrOfControllers[index + 1]
        }
        return nil
    }
}

// MARK: - Delegate
extension PageViewController: UIPageViewControllerDelegate {
    
    // Amount of page controll indicator dots
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        arrOfControllers.count
    }
    // The selected item reflected in the page indicator
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
}
