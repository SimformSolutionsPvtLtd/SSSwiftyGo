import UIKit
import CryptoKit

private var publicKey =  "32fc6898f70089e7cff870253405956b"
private var privateKey =  "e7196fcd4c52a473538f4377f65405d77b04fdf7"
private var timeStamp = String(Date().timeIntervalSince1970)
private var hash = MD5(data: "\(timeStamp)\(privateKey)\(publicKey)")

func characterUrl() -> URL {
    return URL(string: "https://gateway.marvel.com:443/v1/public/characters?limit=10&ts=\(timeStamp)&apikey=\(publicKey)&hash=\(hash)")!
}

func comicsUrl() -> URL {
    return URL(string: "https://gateway.marvel.com:443/v1/public/comics?limit=10&ts=\(timeStamp)&apikey=\(publicKey)&hash=\(hash)")!
}

func seriesUrl() -> URL {
    return URL(string: "https://gateway.marvel.com:443/v1/public/series?limit=10&ts=\(timeStamp)&apikey=\(publicKey)&hash=\(hash)")!
}

func eventUrl() -> URL {
    return URL(string: "https://gateway.marvel.com:443/v1/public/events?limit=10&ts=\(timeStamp)&apikey=\(publicKey)&hash=\(hash)")!
}

private func MD5(data: String) -> String {
    let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
    
    return hash.map {
        String(format: "%02hhx", $0)
    }.joined()
}
