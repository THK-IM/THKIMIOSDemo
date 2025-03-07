//
//  ViewController.swift
//  THKIMDemo
//
//  Created by think on 2025/3/7.
//

import RxSwift
import THKIMSDK
import UIKit

class ViewController: UIViewController {

    private let disposeBg = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        IMManager.shared.initIM(token: "3a2e0af2-d9f3-43c6-b8a0-ce5dcb503ad2", uId: 12)
            .compose(RxTransformer.shared.io2Main())
            .subscribe { [weak self] _ in
                self?.initIMResult()
            }.disposed(by: self.disposeBg)

    }

    private func initIMResult() {
        let mainVc = MainViewController()
        let window = AppUtils.getWindow()
        window?.rootViewController = mainVc
    }

}
