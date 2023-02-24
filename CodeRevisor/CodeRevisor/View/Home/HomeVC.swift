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
            action: #selector(addNewCategory))
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
    
    private var viewModel = HomeViewModel()
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
        setupViewModelObserver()
        addViews()
        viewModel.fetchAll()
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
        collCategory.register(CategoryHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategoryHeaderCell.identifier)
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
    
    private func setupViewModelObserver() {
        // Success list observer
        self.viewModel.result.bind { [weak self] (result) in
            switch result {
            case .success(_):
                break
            case .failure(_):
                break
            case .none: break
            }
            self?.collCategory.reloadData()
        }
    }
    //------------------------------------------------------
    
    //MARK:- Action Method
    @objc private func addNewCategory() {
        let nextvc = GeneralPopupVC()
        nextvc.modalPresentationStyle = .overCurrentContext
        nextvc.modalTransitionStyle = .crossDissolve
        self.present(nextvc, animated: true)
    }
    
    @objc private func openSettings() {
        let second = SettingVC()
        self.navigationController?.push(viewController: second)
        debugPrint("Setting button tapped")
    }
    //------------------------------------------------------
}

// MARK: - Collection Delegates
extension HomeVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextvc = QuestionVC(category: viewModel.listRow(for: indexPath.item))
//        let nextvc = QuestionVC()
//        nextvc.selectedCategory = viewModel.listRow(for: indexPath.item)
        self.navigationController?.pushViewController(nextvc, animated: true)
    }
}

// MARK: - Collection Datasource
extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if viewModel.numberOfListRow() == 0 {
            collectionView.setEmptyMessage(Constants.emptyCategoryCollectionMsg)
        } else {
            collectionView.restoreEmptyMessage()
        }
        return viewModel.numberOfListRow()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
        cell.configureCell(category: self.viewModel.listRow(for: indexPath.row))

        cell.btnDelete.indexPath = indexPath
        cell.btnDelete.addTarget(self, action: #selector(deleteCategory(_:)), for: .touchUpInside)

        cell.btnEdit.indexPath = indexPath
        cell.btnEdit.addTarget(self, action: #selector(editCategory(_:)), for: .touchUpInside)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let hSpace = (2 * spacing) + (CGFloat((numberOfItemInCell - 1)) * spacingBetweenCell)
        let width = (collectionView.bounds.width - hSpace) / CGFloat(numberOfItemInCell)

        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let hSpace = (2 * spacing) + (CGFloat((numberOfItemInCell - 1)) * spacingBetweenCell)
        let width = (collectionView.bounds.width - hSpace) / CGFloat(numberOfItemInCell)

        return CGSize(width: width/2, height: width/2)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader :
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategoryHeaderCell.identifier, for: indexPath) as? CategoryHeaderCell {
                header.addTapGestureRecognizer {
                    let nextvc = NewCategoryPopupVC()
                    nextvc.modalPresentationStyle = .overCurrentContext
                    nextvc.modalTransitionStyle = .crossDissolve
                    nextvc.newCreated = { [weak self] in
                        self?.viewModel.fetchAll()
                    }
                    self.present(nextvc, animated: true)
                }
                return header
            } else {
                assert(false, "Unexpected element kind")
            }
        default :
            assert(false, "Unexpected element kind")
        }
    }

    @objc private func deleteCategory(_ sender: Any) {
        viewModel.deleteCategory(index: (sender as? PlainButton)?.indexPath)
    }

    @objc private func editCategory(_ sender: Any) {
        if let i = (sender as? PlainButton)?.indexPath?.row {
            let nextvc = NewCategoryPopupVC()
            nextvc.modalPresentationStyle = .overCurrentContext
            nextvc.modalTransitionStyle = .crossDissolve
            nextvc.editCategory = viewModel.listRow(for: i)
            nextvc.newCreated = { [weak self] in
                self?.viewModel.fetchAll()
            }
            self.present(nextvc, animated: true)
        }
    }
}
