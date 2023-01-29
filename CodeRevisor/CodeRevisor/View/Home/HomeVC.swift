//
//  HomeVC.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 12/01/23.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK:- Outlet
    private var addLearning: UIBarButtonItem {
        let add = UIBarButtonItem(
            image: UIImage(systemName: "plus.app.fill"),
            style: .plain,
            target: self,
            action: #selector(addNewLeason))
        add.fontSize(size: 30).tintColor = .primaryText
        return add
    }
    
    private var settings: UIBarButtonItem {
        let setting = UIBarButtonItem(
            image: UIImage(systemName: "gearshape.fill"),
            style: .plain,
            target: self,
            action: #selector(openSettings))
        setting.tintColor = .primaryText
        return setting
    }
    
    private var collCategory : UICollectionView!
    let spacing: CGFloat = 12
    let spacingBetweenCell: CGFloat = 12
    let numberOfItemInCell:Int = 2
    
    //------------------------------------------------------
    
    //MARK:- Class Variable
    
    //------------------------------------------------------
    
    //MARK:- Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    //------------------------------------------------------
    
    //MARK:- Memory Management Method
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        debugPrint("‼️‼️‼️ deinit : \(self) ‼️‼️‼️")
    }
    //------------------------------------------------------
    
    //MARK:- Custom Method
    /**
     Basic view setup of the screen.
     */
    private func setUpView() {
        view.backgroundColor = .primaryBackground
        setupNavigation()
        setupCollectionView()
        addViews()
    }
    
    fileprivate func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = spacingBetweenCell
        layout.minimumLineSpacing = spacingBetweenCell
        collCategory = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collCategory.contentInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        collCategory.delegate = self
        collCategory.dataSource = self
        collCategory.showsVerticalScrollIndicator = false
        collCategory.showsHorizontalScrollIndicator = false
        collCategory.backGroundColor(color: .clear)
        collCategory.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
    }
    
    fileprivate func setupNavigation() {
        navigationItem.title = "HOME"
        navigationController?.setThemeNavigation()
        navigationItem.rightBarButtonItems = [settings, addLearning]
    }
    
    private func addViews() {
        view.addSubview(collCategory, anchors: [
            .leading(0), .trailing(0),
            .topMargin(0), .bottomMargin(0),
        ])
    }
    
    //------------------------------------------------------
    
    //MARK:- Action Method
    @objc private func addNewLeason() {
        debugPrint("Add button tapped")
    }
    
    @objc private func openSettings() {
        let second = SettingVC()
        self.navigationController?.push(viewController: second)
        debugPrint("Setting button tapped")
    }
    //------------------------------------------------------
}

// MARK: - Collection Delegates & Datasource
extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
        cell.configureCell(index: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let hSpace = (2 * spacing) + (CGFloat((numberOfItemInCell - 1)) * spacingBetweenCell)
        let width = (collectionView.bounds.width - hSpace) / CGFloat(numberOfItemInCell)
        
        return CGSize(width: width, height: width)
    }
}
