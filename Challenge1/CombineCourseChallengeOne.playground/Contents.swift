import UIKit
import Combine

// This is a really simple challenge which goes over using higher order functions in combine with publishers
// The objective here is to make use of Higher order functions to make the publisher stream non-optional

["A", "B", "C", nil, "E"].publisher
    .replaceNil(with: "N/A")
    .compactMap({$0})
    .sink(receiveValue: {
        print($0)
    })
