//
//  FNReactionsView.swift
//  FNLiveReactions
//
//  Created by Fabio Nisci on 24/03/17.
//  Copyright © 2017 Fabio Nisci. All rights reserved.
//

import UIKit

class FNReactionsView: UIView{
    
    func showReaction(image: UIImage){
        let reactionImageView = UIImageView(image: image)
        reactionImageView.contentMode = .scaleAspectFit
        let dimension = 20 + drand48() * 10 //reaction emoji size (20-30)
        reactionImageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.delegate = self
        animation.path = customPath().cgPath
        animation.duration = 2 + drand48() * 3 //animation duration (2-3)
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.setValue(reactionImageView, forKey: "imageView")
        
        reactionImageView.layer.add(animation, forKey: nil)
        addSubview(reactionImageView)
    }
    
    
    fileprivate func customPath() -> UIBezierPath{
        //     /-\
        // ---/   \----\   /------
        //              \_/
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: self.frame.size.height / 2))
        let endPoint = CGPoint(x: self.frame.size.width, y: self.frame.size.height / 2)
        let minimumheight = self.frame.size.height * (10/100) // 10%
        let maximumheight = self.frame.size.height * (90/100) // 90%
        let minimumX = self.frame.size.width * (40/100) // 40%
        let maximumX = self.frame.size.width * (60/100) // 60%
        let randomYShift = CGFloat(Double(minimumheight) + drand48() * Double(maximumheight))
        let cp1 = CGPoint(x: minimumX, y: minimumheight - randomYShift)
        let cp2 = CGPoint(x: maximumX, y: maximumheight + randomYShift)
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        return path
    }
}

extension FNReactionsView: CAAnimationDelegate{
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if let imageView = anim.value(forKey: "imageView") as? UIImageView{
            imageView.removeFromSuperview()
        }
    }
}
