//
//  StubService.swift
//  SBrainKit
//
//  Created by Vitor S do Nascimento on 04-11-19.
//  Copyright © 2019 Second Brain Project. All rights reserved.
//

import Mockingjay
import UIKit

public class StubService {

    static func stubSongList() {

        let bundle = Bundle(for: StubService.self)
        let endpoints: [SongListEndpoint] = [.search(term: "something", limit: 20)]
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
