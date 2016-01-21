//
//  ErrorAnaly.h
//  BaseDevelop
//
//  Created by 新锐 on 16/1/18.
//
//

///*!
// @enum NSURL-related Error Codes
// @abstract Constants used by NSError to indicate errors in the NSURL domain
// */
//NS_ENUM(NSInteger)
//{
//    NSURLErrorUnknown = 			-1,
//    NSURLErrorCancelled = 			-999,
//    NSURLErrorBadURL = 				-1000,
//    NSURLErrorTimedOut = 			-1001,
//    NSURLErrorUnsupportedURL = 			-1002,
//    NSURLErrorCannotFindHost = 			-1003,
//    NSURLErrorCannotConnectToHost = 		-1004,
//    NSURLErrorNetworkConnectionLost = 		-1005,
//    NSURLErrorDNSLookupFailed = 		-1006,
//    NSURLErrorHTTPTooManyRedirects = 		-1007,
//    NSURLErrorResourceUnavailable = 		-1008,
//    NSURLErrorNotConnectedToInternet = 		-1009,
//    NSURLErrorRedirectToNonExistentLocation = 	-1010,
//    NSURLErrorBadServerResponse = 		-1011,
//    NSURLErrorUserCancelledAuthentication = 	-1012,
//    NSURLErrorUserAuthenticationRequired = 	-1013,
//    NSURLErrorZeroByteResource = 		-1014,
//    NSURLErrorCannotDecodeRawData =             -1015,
//    NSURLErrorCannotDecodeContentData =         -1016,
//    NSURLErrorCannotParseResponse =             -1017,
//    NSURLErrorAppTransportSecurityRequiresSecureConnection NS_ENUM_AVAILABLE(10_11, 9_0) = -1022,
//    NSURLErrorFileDoesNotExist = 		-1100,
//    NSURLErrorFileIsDirectory = 		-1101,
//    NSURLErrorNoPermissionsToReadFile = 	-1102,
//    NSURLErrorDataLengthExceedsMaximum NS_ENUM_AVAILABLE(10_5, 2_0) =	-1103,
//
//    // SSL errors
//    NSURLErrorSecureConnectionFailed = 		-1200,
//    NSURLErrorServerCertificateHasBadDate = 	-1201,
//    NSURLErrorServerCertificateUntrusted = 	-1202,
//    NSURLErrorServerCertificateHasUnknownRoot = -1203,
//    NSURLErrorServerCertificateNotYetValid = 	-1204,
//    NSURLErrorClientCertificateRejected = 	-1205,
//    NSURLErrorClientCertificateRequired =	-1206,
//    NSURLErrorCannotLoadFromNetwork = 		-2000,
//
//    // Download and file I/O errors
//    NSURLErrorCannotCreateFile = 		-3000,
//    NSURLErrorCannotOpenFile = 			-3001,
//    NSURLErrorCannotCloseFile = 		-3002,
//    NSURLErrorCannotWriteToFile = 		-3003,
//    NSURLErrorCannotRemoveFile = 		-3004,
//    NSURLErrorCannotMoveFile = 			-3005,
//    NSURLErrorDownloadDecodingFailedMidStream = -3006,
//    NSURLErrorDownloadDecodingFailedToComplete =-3007,
//
//    NSURLErrorInternationalRoamingOff NS_ENUM_AVAILABLE(10_7, 3_0) =         -1018,
//    NSURLErrorCallIsActive NS_ENUM_AVAILABLE(10_7, 3_0) =                    -1019,
//    NSURLErrorDataNotAllowed NS_ENUM_AVAILABLE(10_7, 3_0) =                  -1020,
//    NSURLErrorRequestBodyStreamExhausted NS_ENUM_AVAILABLE(10_7, 3_0) =      -1021,
//
//    NSURLErrorBackgroundSessionRequiresSharedContainer NS_ENUM_AVAILABLE(10_10, 8_0) = -995,
//    NSURLErrorBackgroundSessionInUseByAnotherProcess NS_ENUM_AVAILABLE(10_10, 8_0) = -996,
//    NSURLErrorBackgroundSessionWasDisconnected NS_ENUM_AVAILABLE(10_10, 8_0)= -997,
//};

#import <Foundation/Foundation.h>

@interface ErrorAnaly : NSObject

+ (instancetype)shared;

/**
 *  通过error获取错误的状态
 *
 *  @param  error   需要解析的内容
 *
 *  @return 错误的状态
 */
- (NSString *)stateWithError:(NSError *)error;

@end
