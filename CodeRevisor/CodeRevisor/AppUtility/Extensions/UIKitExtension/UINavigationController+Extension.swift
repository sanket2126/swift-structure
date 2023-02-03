//
//  GExtension+UINavigationController.swift
//  CodeRevisor
//
//  Created by Sanket on 22/09/20.
//  Copyright © 2020 Sanket. All rights reserved.
//

import UIKit

extension UINavigationController : UIGestureRecognizerDelegate {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
        self.modalPresentationStyle = .overFullScreen
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        navigationItem.setHidesBackButton(true, animated: true)
        setThemeNavigation()
    }
    
    func clearNavigation(font: UIFont = UIFont.customFont(ofType: .bold, withSize: 20.0), textColor: UIColor = .white, navigationColor: UIColor = .clear, largeTitleColor: UIColor = .white, showShadow: Bool = true) {
        
        isNavigationBarHidden = false
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.font : font]
        
        navigationBar.backgroundColor = navigationColor
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.isOpaque = true
        navigationBar.layer.shadowColor = UIColor.clear.cgColor
        
        navigationBar.shadowImage = UIImage()
        navigationBar.setValue(true, forKey: "hidesShadow")
        
        if let statusBarView = UIApplication.shared.statusBarUIView {
            statusBarView.backgroundColor = navigationColor
        }
        
        //add shdow
        if showShadow {
            navigationBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.16).cgColor
            navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            navigationBar.layer.shadowRadius = 1.0
            navigationBar.layer.shadowOpacity = 0.5
            navigationBar.layer.masksToBounds = false
        }
        
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: largeTitleColor, NSAttributedString.Key.font : UIFont.customFont(ofType: .bold, withSize: 30.0)]
    }
    
    func setThemeNavigation(nav: UIColor = .primaryBackground, showShadow: Bool = false) {
        clearNavigation(textColor: .primaryText, navigationColor: nav,showShadow: showShadow)
    }
    
    func setWhiteNavigation(showShadow: Bool = false) {
        clearNavigation(textColor: .black, navigationColor: .white,showShadow: showShadow)
    }
    
    func setClearNavigation() {
        clearNavigation(textColor: .black, navigationColor: .clear,showShadow: false)
    }
    
    func setLargeNavigation (_ isLarge : Bool = false) {
        if isLarge {
            self.navigationBar.prefersLargeTitles = true
            self.navigationItem.largeTitleDisplayMode = .automatic
            
        } else {
            self.navigationBar.prefersLargeTitles = false
            self.navigationItem.largeTitleDisplayMode = .never
        }
    }
    
//    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        if let topVC = UIApplication.topViewController() {
//            for vc in kDisablePopBackVCS{
//                if topVC.isKind(of: vc as! AnyClass){
//                    return false
//                }
//            }
//        }
//        return true
//    }
}

public extension UINavigationController {

    /**
     Pop current view controller to previous view controller.

     - parameter type:     transition animation type.
     - parameter duration: transition animation duration.
     */
    func pop(transitionType type: String = CATransitionType.moveIn.rawValue, duration: CFTimeInterval = 0.5) {
        self.addTransition(transitionType: type, duration: duration)
        self.popViewController(animated: false)
    }

    /**
     Push a new view controller on the view controllers's stack.

     - parameter vc:       view controller to push.
     - parameter type:     transition animation type.
     - parameter duration: transition animation duration.
     */
    func push(viewController vc: UIViewController, transitionType type: String = CATransitionType.moveIn.rawValue, duration: CFTimeInterval = 0.5) {
        self.addTransition(transitionType: type, duration: duration)
        self.pushViewController(vc, animated: false)
    }

    private func addTransition(transitionType type: String = CATransitionType.fade.rawValue, duration: CFTimeInterval = 0.3) {
        let transition = CATransition()
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType(rawValue: type)
        self.view.layer.add(transition, forKey: nil)
    }

}
