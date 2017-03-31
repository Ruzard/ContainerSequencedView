//
//  SeagueAnimator.swift
//  SampleContainerSequencedView
//
//

import Foundation
import AppKit

class SeagueAnimator : NSObject, NSViewControllerPresentationAnimator {
    
    func animatePresentation(of viewController: NSViewController, from fromViewController: NSViewController) {
        
        let parentVC = fromViewController.parent
        if (parentVC != nil) && parentVC is ContentManagerViewController {
            
            (parentVC as! ContentManagerViewController).push(viewController)
        } else if let cmvcHolder = fromViewController as? ContentManagerViewControllerHolder {
            let contentManagerController = cmvcHolder.retrieveContentManagerController()
            contentManagerController.push(viewController)
        }
    }
    
    
    func animateDismissal(of viewController: NSViewController, from fromViewController: NSViewController) {
        
        if let parentVC = viewController.parent as? ContentManagerViewController {
            parentVC.pop()
        }
    }
}
