//
//  ContentManagerViewController.swift
//  SampleContainerSequencedView
//
//

import Cocoa

class ContentManagerViewController: NSViewController {
    
    @IBOutlet weak var subViewControllerManager: NSView!
    
    private var viewControllerStack: [NSViewController] = []
    
    var currentViewController: NSViewController?
    
    func showViewController(_ viewController: NSViewController) {
        
        addChildViewController(viewController)
        viewController.view.frame = (currentViewController?.view.frame)!
        view.addSubview(viewController.view)
        currentViewController = viewController
    }
    
    func removeCurrentViewControllerFromView() {
        
        currentViewController?.view.removeFromSuperview()
        currentViewController?.removeFromParentViewController()
    }

    func push(_ viewController: NSViewController) {
        
        removeCurrentViewControllerFromView()
        viewControllerStack.append(viewController)
        showViewController(viewController)
    }

    func pop() {
        
        if viewControllerStack.count > 1 {
            removeCurrentViewControllerFromView()
            viewControllerStack.removeLast()
            showViewController(viewControllerStack.last!)
        }
    }
    
    func popToRoot() {
        while viewControllerStack.count > 1 {
            pop()
        }
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        
        currentViewController = (segue.destinationController as! NSViewController)
        viewControllerStack.append(segue.destinationController as! NSViewController)
    }
    
}
