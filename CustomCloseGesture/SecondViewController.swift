//
//  SecondViewController.swift
//  CustomCloseGesture
//
//  Created by Yuta S. on 2019/05/25.
//  Copyright © 2019 Yuta S. All rights reserved.
//
//

import UIKit

class SecondViewController: UIViewController {
    
    private let refreshCtl = UIRefreshControl()
    
    @IBOutlet weak var secondeViewScrollView: UIScrollView! {
        didSet {
            // 閉じる画像
            let deleteImg: UIImage = #imageLiteral(resourceName: "delete")
            let deleteImgView = UIImageView(image: deleteImg)
            deleteImgView.backgroundColor = .white
            deleteImgView.frame = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0)
            deleteImgView.contentMode = .scaleAspectFit
            refreshCtl.addSubview(deleteImgView)
            refreshCtl.bringSubviewToFront(deleteImgView)
            // 制約
            deleteImgView.translatesAutoresizingMaskIntoConstraints = false
            deleteImgView.widthAnchor.constraint(equalToConstant: 35).isActive = true
            deleteImgView.heightAnchor.constraint(equalToConstant: 35).isActive = true
            deleteImgView.centerXAnchor.constraint (equalTo: self.refreshCtl.safeAreaLayoutGuide.centerXAnchor).isActive = true
            deleteImgView.centerYAnchor.constraint(equalTo: self.refreshCtl.safeAreaLayoutGuide.centerYAnchor).isActive = true
            
            // 閉じるラベル
            let label = UILabel()
            label.text = "Close↓"
            label.textAlignment = .right
            label.textColor = .gray
            refreshCtl.addSubview(label)
            refreshCtl.bringSubviewToFront(label)
            // 制約
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerXAnchor.constraint (equalTo: self.refreshCtl.safeAreaLayoutGuide.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: self.refreshCtl.safeAreaLayoutGuide.centerYAnchor, constant: 28).isActive = true
            refreshCtl.addTarget(self, action: #selector(self.refresh(sender:)), for: .valueChanged)
            secondeViewScrollView.refreshControl = refreshCtl
            secondeViewScrollView.delegate = self
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func refresh(sender: UIRefreshControl) {
        self.dismiss(animated: true)
        self.refreshCtl.endRefreshing()
    }
}

extension SecondViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 上方向へのスクロールを無効化（引っ張って閉じるアニメーションのためだけなので）
        if scrollView.contentOffset.y > 0 {
            scrollView.contentOffset.y = 0
        }
    }
}
