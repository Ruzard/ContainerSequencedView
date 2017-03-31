//
//  ViewController.swift
//  SampleContainerSequencedView
//
//

import Cocoa

class ViewController: NSViewController {
    
    var vcController: ContentManagerViewController?
    
    @IBAction func pushViewController(_ sender: Any) {
        if let secondScrenVc = storyboard?.instantiateController(withIdentifier: "BackForwardStoryboardID") {
            vcController?.push(secondScrenVc as! NSViewController)
        }
    }
    
    @IBAction func popViewController(_ sender: Any) {
        vcController?.pop()
    }
    
    @IBAction func popToRootViewController(_ sender: Any) {
        vcController?.popToRoot()
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.destinationController is ContentManagerViewController {
            vcController = (segue.destinationController as! ContentManagerViewController)
        }
    }

    func retreiveContentManagerController() -> ContentManagerViewController? {
        return self.vcController
    }

}

