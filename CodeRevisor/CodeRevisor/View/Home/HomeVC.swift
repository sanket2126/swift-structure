//
//  HomeVC.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 12/01/23.
//

import UIKit

class HomeVC: UIViewController {
    
    private var circleView: UIView {
        let view = UIView()
        view.backgroundColor = .magenta
        view.layer.cornerRadius = 50
        return view
    }
    
    private var addLearning: UIBarButtonItem {
        let add = UIBarButtonItem(image: UIImage(named: "plus.app.fill"), style: .plain, target: self, action: #selector(addNewLeason))
        add.tintColor = .systemRed
        return add
    }
    private var settings: UIBarButtonItem {
//        let ad = UIButton(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 30, height: 30)))
//        ad.setImage(UIImage(named: "gearshape.fill"), for: .normal)
//        ad.tintColor = .red
//        ad.actions(forTarget: #selector(openSettings), forControlEvent: .touchUpInside)
//        let add = UIBarButtonItem(customView: ad)
//        add.activate(anchors: [.width(30),.height(30)])
        
        let save = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        save.setImage(UIImage(named: "gearshape.fill"), for: .normal)
//        save.addTarget(self, action: #selector(btnSave(sender:)), for: .touchUpInside)
        let saveButton = UIBarButtonItem(customView: save)
        saveButton.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true
        saveButton.customView?.heightAnchor.constraint(equalTo: saveButton.customView!.widthAnchor, multiplier: 1).isActive = true
//        navigationItem.rightBarButtonItem = saveButton
        
        return saveButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "HOME"
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.backgroundColor = .gray
        navigationController?.isNavigationBarHidden = false
        if let statusBarView = UIApplication.shared.statusBarUIView {
            statusBarView.backgroundColor = .gray
        }
        self.navigationItem.rightBarButtonItem = settings
        view.backgroundColor = .white
        addViews()
    }
    
    @objc func addNewLeason() {
        debugPrint("Add button tapped")
    }
    @objc func openSettings() {
        debugPrint("Setting button tapped")
    }
    
    private func addViews() {
        view.addSubview(circleView, anchors: [
            .centerX(0), .centerY(0),
            .width(100), .height(100)
        ])
    }
}
