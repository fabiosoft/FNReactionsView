//
//  ViewController.swift
//  FNLiveReactions
//
//  Created by Fabio Nisci on 24/03/17.
//  Copyright © 2017 Fabio Nisci. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var reactionsView:FNReactionsView?

    override func viewDidLoad() {
        super.viewDidLoad()
        reactionsView = FNReactionsView()
        if let reactionsView = reactionsView{
            reactionsView.backgroundColor = .clear
            view.addSubview(reactionsView)
            
            reactionsView.snp.makeConstraints({ (make) in
                make.top.left.right.equalToSuperview()
                make.height.equalTo(300)
            })
        }
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }

    func handleTap(){
        let reactions = [#imageLiteral(resourceName: "love"), #imageLiteral(resourceName: "angry"), #imageLiteral(resourceName: "ill"), #imageLiteral(resourceName: "devil")]
        (0...10).forEach { (_) in
            let image = reactions[Int(arc4random_uniform(UInt32(reactions.count)))]
            reactionsView?.showReaction(image: image)
        }
    }
}
