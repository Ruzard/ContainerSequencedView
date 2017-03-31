//
//  SeagueBetweenEmbedded.swift
//  SampleContainerSequencedView
//
//

import Cocoa

class SegueBetweenEmbedded: NSStoryboardSegue {
    override func perform() {
        if let vc = sourceController as? NSViewController {
            vc.presentViewController(destinationController as! NSViewController, animator: SeagueAnimator())
        }
    }
}
