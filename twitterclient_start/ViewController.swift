//
//  ViewController.swift
//  twitterclient_start
//
//  Created by Brian Voong on 2/15/16.
//  Copyright © 2016 letsbuildthatapp. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    static let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Twitter Home"
        
        collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView?.alwaysBounceVertical = true
        collectionView?.registerClass(StatusCell.self, forCellWithReuseIdentifier: ViewController.cellId)
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let statusCell = collectionView.dequeueReusableCellWithReuseIdentifier(ViewController.cellId, forIndexPath: indexPath) as! StatusCell
        statusCell.statusTextView.text = "Twitter Status Update \(indexPath.item)"
        return statusCell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.width, 80)
    }

}

class StatusCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.editable = false
        return textView
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    func setupViews() {
        addSubview(statusTextView)
        addSubview(dividerView)
        
        // constraints for statusTextView
        addConstraintsWithFormat("H:|[v0]|", views: statusTextView)
        addConstraintsWithFormat("V:|[v0]|", views: statusTextView)
        
        // constraints for dividerView
        addConstraintsWithFormat("H:|-8-[v0]|", views: dividerView)
        addConstraintsWithFormat("V:[v0(1)]|", views: dividerView)
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerate() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

