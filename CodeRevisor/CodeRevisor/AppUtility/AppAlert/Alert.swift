
import UIKit

class Alert {
    
    /// Shared instance
    static let shared = Alert()
    
    private let snackbar: TTGSnackbar = TTGSnackbar()
    
    ///Init
    private init() {
        
    }

}

// MARK: Snackbar
extension Alert {
    
    /// Show snack bar alert message
    ///
    /// - Parameters:
    ///   - message: Message for alert
    ///   - backGroundColor: Backgroud color for alert box
    ///   - duration: Alert display duration
    ///   - animation: Snack bar animation type
    func showSnackBar(_ message : String, isError: Bool = false, duration : TTGSnackbarDuration = .middle, animation : TTGSnackbarAnimationType = .slideFromTopBackToTop) {
        snackbar.message = message//.localized
        snackbar.duration = duration
        snackbar.messageTextColor = .white
        snackbar.messageTextFont = .customFont(ofType: .medium, withSize: 15)
        snackbar.layer.insertSublayer(snackbar.gradientLayer, at: 0)

        if isError {
            snackbar.backgroundColor = .red
        } else {
            snackbar.backgroundColor = .green
        }
        snackbar.layer.cornerRadius = 12
        
        snackbar.onTapBlock = { snackbar in
            snackbar.dismiss()
        }
        
        snackbar.onSwipeBlock = { (snackbar, direction) in
            if direction == .right {
                snackbar.animationType = .slideFromLeftToRight
            } else if direction == .left {
                snackbar.animationType = .slideFromRightToLeft
            } else if direction == .up {
                snackbar.animationType = .slideFromTopBackToTop
            } else if direction == .down {
                snackbar.animationType = .slideFromTopBackToTop
            }
            
            snackbar.dismiss()
        }
        snackbar.viewcornerRadius = 12.0
        
        // Change animation duration
        snackbar.animationDuration = 0.5
        
        // Animation type
        snackbar.animationType = animation
        snackbar.show()
    }
}

// MARK: UIAlertController
extension Alert {
    
    /// Show normal ok - cancel alert with action
    ///
    /// - Parameters:
    ///   - title: Alert title
    ///   - actionOkTitle: Ok action button title
    ///   - actionCancelTitle: Cancel action button title
    ///   - message: Alert message
    ///   - completion: Action completion return true if action is ok else false for cancel
    func showAlert(_ title : String = "DEMO", actionOkTitle : String = "OK" , actionCancelTitle : String = "" , message : String, completion: ((Bool) -> ())? ) {
        
        let alert : UIAlertController = UIAlertController(title: "", message: message , preferredStyle: .alert)
        
        let actionOk : UIAlertAction = UIAlertAction(title: actionOkTitle, style: .default) { (action) in
            if completion != nil {
                completion!(true)
            }
        }
        alert.addAction(actionOk)
        
        if actionCancelTitle != "" {
            let actionCancel : UIAlertAction = UIAlertAction(title: actionCancelTitle, style: .cancel) { (action) in }
            alert.addAction(actionCancel)
        }
        
        alert.view.tintColor = UIColor.black
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
    
    /// Show alert for multiple button action
    ///
    /// - Parameters:
    ///   - title: Alert title
    ///   - message: Alert message
    ///   - actionTitles: Array of button action title
    ///   - actions: Array of UIAlertAction actions
//    Bundle.appName()
    func showAlert(title: String = "DEMO", message: String, actionTitles:[String], actions:[((UIAlertAction) -> Void)]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        alert.view.tintColor = UIColor.black
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
}
