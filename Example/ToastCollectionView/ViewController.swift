//
//  ViewController.swift
//  ToastCollectionView
//
//  Created by gottingoscar@gmail.com on 06/13/2018.
//  Copyright (c) 2018 gottingoscar@gmail.com. All rights reserved.
//

import UIKit
import ToastCollectionView

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: ToastCollectionView!
    
    let data = [
        DummyData(color: UIColor(hex: 0x74b9ff), name: "Blue"),
        DummyData(color: UIColor(hex: 0xa29bfe), name: "Purple"),
        DummyData(color: UIColor(hex: 0xfd79a8), name: "Pink"),
        DummyData(color: UIColor(hex: 0x00b894), name: "Green"),
        DummyData(color: UIColor(hex: 0x00cec9), name: "Turquoise"),
        DummyData(color: UIColor(hex: 0xfdcb6e), name: "Yellow"),
        DummyData(color: UIColor(hex: 0xe17055), name: "Orange"),
        DummyData(color: UIColor(hex: 0xff7675), name: "Red")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.maxPositionForComponent = 75.0
        self.collectionView.offsetToComponent = 30
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let data = self.data[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExampleCell", for: indexPath) as! ExampleCell
        cell.configureCell(with: data)
        
        // Pre raise visible cells
        if indexPath.item == 0 || indexPath.item == 1 {
            cell.preRaiseToastView(toPosition: 75.0)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.bounds.width
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
