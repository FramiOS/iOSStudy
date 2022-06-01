//
//  CarouselEffectViewController.swift
//  ComponentStudy
//
//  Created by ZUMIN YOU on 2022/05/31.
//

import UIKit

class CarouselEffectViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let cellWidth = UIScreen.main.bounds.width - 70
    let cellHeight = UIScreen.main.bounds.height - 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 7
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 34, bottom: 0, right: 34)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 34, bottom: 0, right: 34)
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = .fast
        collectionView.register(UINib(nibName: "CaraouselCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CaraouselCollectionViewCell")
    }

}

extension CarouselEffectViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CaraouselCollectionViewCell", for: indexPath) as? CaraouselCollectionViewCell
        cell?.idx = "\(indexPath.item)"
        return cell ?? UICollectionViewCell()
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        
        let contentLeftInset = scrollView.contentInset.left
        let cellWithSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        let index = (targetContentOffset.pointee.x + contentLeftInset) / cellWithSpacing
        let roundedIndex: CGFloat = round(index)

        let adjustOffsetX = roundedIndex * cellWithSpacing - contentLeftInset
        let adjustCGPoint = CGPoint(x: adjustOffsetX, y: scrollView.contentInset.top)
        
        if scrollView.contentOffset.x < targetContentOffset.pointee.x {
            // 왼쪽 방향으로 이동 - 새 컨텐츠 방향
            if scrollView.contentOffset.x > adjustOffsetX {
                targetContentOffset.pointee = scrollView.contentOffset
                scrollView.setContentOffset(adjustCGPoint, animated: true)
            } else {
                targetContentOffset.pointee = adjustCGPoint
            }
        } else {
            // 오른쪽 방향으로 이동 - 이전 컨텐츠 방향
            if scrollView.contentOffset.x < adjustOffsetX {
                targetContentOffset.pointee = scrollView.contentOffset
                scrollView.setContentOffset(adjustCGPoint, animated: true)
            } else {
                targetContentOffset.pointee = adjustCGPoint
            }
        }

    }
    
    
}

