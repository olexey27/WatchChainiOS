//
//  ViewController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 10.05.23.
//

import UIKit
import Firebase

class HomeController: UIViewController {

    // MARK: - Variables
    private let coins: [Coin] = [
        Coin(id: 1, name: "Bitcoin", maxSupply: 200, rank: 1, pricingData: PricingData(CAD: CAD(price: 24962, market_cap: 852_164_659_250))),
Coin(id: 1027, name: "Ethereum", maxSupply: nil, rank: 2, pricingData: PricingData(CAD: CAD(price: 1283.92, market_cap: 158_055_024_432))),
    Coin(id: 825, name: "Tether", maxSupply: nil, rank: 3, pricingData: PricingData(CAD: CAD(price: 1, market_cap: 82_975_822_367))),
    Coin(id: 1839, name: "BNB", maxSupply: nil, rank: 4, pricingData: PricingData(CAD: CAD(price: 314.14, market_cap: 82_975_822_367))),
    Coin(id: 3408, name: "USD Coin", maxSupply: nil, rank: 5, pricingData: PricingData(CAD: CAD(price: 1, market_cap: 29_273_726_815))),
    Coin(id: 52, name: "XRP", maxSupply: nil, rank: 6, pricingData: PricingData(CAD: CAD(price: 0.46, market_cap: 23_951_277_936))),
    Coin(id: 2010, name: "Cardano", maxSupply: nil, rank: 7, pricingData: PricingData(CAD: CAD(price: 0.37, market_cap: 12_923_025_998))),
    Coin(id: 74, name: "Dogecoin", maxSupply: nil, rank: 8, pricingData: PricingData(CAD: CAD(price: 0.07, market_cap: 10_168_614_434))),
    Coin(id: 3890, name: "Polygon", maxSupply: nil, rank: 9, pricingData: PricingData(CAD: CAD(price: 0.88, market_cap: 8_250_827_470))),
    Coin(id: 5426, name: "Solana", maxSupply: nil, rank: 10, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 1958, name: "TRON", maxSupply: nil, rank: 11, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 2, name: "Litecoin", maxSupply: nil, rank: 12, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 6636, name: "Polkadot", maxSupply: nil, rank: 13, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 4687, name: "Binance USD", maxSupply: nil, rank: 14, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 5994, name: "Shiba Inu", maxSupply: nil, rank: 15, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 5805, name: "Avalanche", maxSupply: nil, rank: 16, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 4943, name: "Dai", maxSupply: nil, rank: 17, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 3717, name: "Wrapped Bitcoin", maxSupply: nil, rank: 18, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 1975, name: "Chainlink", maxSupply: nil, rank: 19, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 3957, name: "UNUS SED LEO", maxSupply: nil, rank: 20, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 3794, name: "Cosmos", maxSupply: nil, rank: 21, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 7083, name: "Uniswap", maxSupply: nil, rank: 22, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 328, name: "Monero", maxSupply: nil, rank: 23, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 3897, name: "OKB", maxSupply: nil, rank: 24, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 1321, name: "Ethereum Classic", maxSupply: nil, rank: 25, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 512, name: "Stellar", maxSupply: nil, rank: 26, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 11419, name: "Toncoin", maxSupply: nil, rank: 27, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 1831, name: "Bitcoin Cash", maxSupply: nil, rank: 28, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 8916, name: "Internet Computer", maxSupply: nil, rank: 29, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 2563, name: "TrueUSD", maxSupply: nil, rank: 30, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 2280, name: "Filecoin", maxSupply: nil, rank: 31, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 8000, name: "Lido DAO", maxSupply: nil, rank: 32, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 21794, name: "Aptos", maxSupply: nil, rank: 33, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 4642, name: "Hedera", maxSupply: nil, rank: 34, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 3635, name: "Cronos", maxSupply: nil, rank: 35, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 11841, name: "Arbitrum", maxSupply: nil, rank: 36, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 6535, name: "NEAR Protocol", maxSupply: nil, rank: 37, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 3077, name: "VeChain", maxSupply: nil, rank: 38, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 18876, name: "ApeCoin", maxSupply: nil, rank: 39, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),
    Coin(id: 3155, name: "Quant", maxSupply: nil, rank: 40, pricingData: PricingData(CAD: CAD(price: 19.99, market_cap: 7_920_237_376))),]
    
    
    // MARK: - UI Components
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .systemBackground
        tv.register(CoinCell.self, forCellReuseIdentifier: CoinCell.identifier)
        return tv
    }()
    
    
    // MARK: - LifeCycle
    /*init(_ viewModel: HomeControllerViewModel = HomeControllerViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    // MARK: - UI Setup
    private func setupUI() {
        self.navigationItem.title = "Market"
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
}


// MARK: - TableView Functions
extension HomeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinCell.identifier, for: indexPath) as? CoinCell else {
            fatalError("Unable to dequeue CoinCell in HomeController")
        }
        let coin = self.coins[indexPath.row]
        cell.configure(with: coin)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let coin = self.coins[indexPath.row]
        let vm = ViewCryptoControllerViewModel(coin)
        let vc = ViewCryptoController(vm)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
