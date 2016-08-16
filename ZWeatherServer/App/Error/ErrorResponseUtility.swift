import Vapor
import HTTP

class ErrorResponseUtility {

    static func getErrorResponse(errorType: ErrorResponseType) -> Response {
        do {
            var errorData: JSON? = nil
            let status = Status.ok
            
            switch errorType {
            case ErrorResponseType.ERROR_PARAM:
                errorData = try JSON(node: [
                    "error": [
                        "code": 4,
                        "desc": "request rejected",
                        "sub_error": [
                            "code": 4001,
                            "desc": "param error"
                            ]
                        ]
                    ])
            case ErrorResponseType.ERROR_INTERNAL:
                errorData = try JSON(node: [
                    "error": [
                        "code": 5,
                        "desc": "internal error",
                        "sub_error": [
                            "code": 5001,
                            "desc": "internal database error"
                            ]
                        ]
                    ])
            case ErrorResponseType.ERROR_ACCOUNT_NO_EXISTED:
                errorData = try JSON(node: [
                    "error": [
                        "code": 4,
                        "desc": "request rejected",
                        "sub_error": [
                            "code": 4002,
                            "desc": "account no existed"
                        ]
                    ]
                    ])
            case ErrorResponseType.ERROR_ACCOUNT_OR_PWD:
                errorData = try JSON(node: [
                    "error": [
                        "code": 4,
                        "desc": "request rejected",
                        "sub_error": [
                            "code": 4003,
                            "desc": "account or password error"
                        ]
                    ]
                    ])
            default:
                errorData = try JSON(node: [
                    "error": [
                        "code": 5,
                        "desc": "internal error",
                        "sub_error": [
                            "code": 5000,
                            "desc": "internal unknown error"
                            ]
                        ]
                    ])
            }
            
            return try Response(status: status, json: errorData!)
        } catch {
        
        }

        return Response()
    }
    
}
