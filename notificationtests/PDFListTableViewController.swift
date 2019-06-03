//
//  PDFListTableViewController.swift
//  notificationtests
//
//  Created by Pedro Vinicius Cuêlho do Nascimento on 30/05/2019.
//  Copyright © 2019 Pedro Nascimento. All rights reserved.
//

import UIKit

class PDFListTableViewController: UITableViewController {

    var pdfList = [PDF]()

    override func viewDidLoad() {
        super.viewDidLoad()
        addRefreshControl()
        loadPDFs()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let message = "Não há nada aqui ainda... :( \n Puxe para atualizar a lista"
        
        self.tableView.defineMessageForEmptyTableView(numberOfItems: pdfList.count,
                                                      emptyMessage: message)
        return pdfList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PDFCell", for: indexPath)

        cell.textLabel?.text = self.pdfList[indexPath.row].name

        return cell
    }

    @objc fileprivate func loadPDFs() {
        PDFProvider.getPDFs() { success, result in
            guard success else {
                if let erro = result as? Error {
                    Utils.alert(title: "Erro!", message: erro.localizedDescription)
                }
                return
            }

            if let pdfArray = result as? Array<PDF> {
                self.pdfList = pdfArray
                self.refreshControl?.endRefreshing()
                self.tableView.reloadData()
            }
        }
    }

    fileprivate func addRefreshControl() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(loadPDFs), for: .valueChanged)
    }
}
