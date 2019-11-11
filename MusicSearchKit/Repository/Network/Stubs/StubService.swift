//
//  StubService.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

import Mockingjay
import UIKit

public class StubService {

    private init() { }
    /*
    static func stubSongListFail() {

        func builder404(request: URLRequest) -> Response {
            let response = HTTPURLResponse(url: request.url!, statusCode: 404, httpVersion: nil, headerFields: nil)!
            return .success(response, .noContent)

        }
        let endpoint = SongListEndpoint.search(term: "fail", limit: 20)
        MockingjayProtocol.addStub(
            matcher: http(endpoint.method.mockingjayMethod, uri: endpoint.fullpath),
            delay: 1,
            builder: builder404
        )
    }
    */
    static func stubSongList() {

        let bundle = Bundle(for: StubService.self)
        let endpoints: [SongListEndpoint] = [.search(term: "", limit: 20)]
        let image = UIImage(named: "artwork-demo.png", in: bundle, compatibleWith: nil)
        func builder(request: URLRequest) -> Response {
            let imageData: Data = (image?.pngData())!
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return .success(response, .content(imageData))
        }

        MockingjayProtocol.addStub(matcher: uri("https://itunes.apple.com/fake/artwork-demo.png"), builder: builder)

        for endpoint in endpoints {
            let fileName = endpoint.path.removeslashes
            let body = bundle.readJSONObject(for: fileName)
            MockingjayProtocol.addStub(
                matcher: http(endpoint.method.mockingjayMethod, uri: endpoint.fullpath),
                delay: 1,
                builder: json(body!, status: 200)
            )
        }
    }
    public static func stuball() {
        StubService.stubSongList()
    }
}
