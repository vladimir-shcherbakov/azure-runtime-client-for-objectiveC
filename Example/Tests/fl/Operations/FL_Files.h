/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import <AzureClientRuntime/AzureClientRuntime.h>
@class AZOperationError;

/**
 * An protocol provides access to all FL_Files operations
 */
@protocol FL_FilesProtocol

/**
 * Get file.
 *
 * @param callback A block where AZStream is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getFileWithCallback:(void(^)(AZStream*, AZOperationError*))callback;

/**
 * Get a large file.
 *
 * @param callback A block where AZStream is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getFileLargeWithCallback:(void(^)(AZStream*, AZOperationError*))callback;

/**
 * Get empty file.
 *
 * @param callback A block where AZStream is a result object and AZOperationError is nil, if the operation is successful
 */
- (void)getEmptyFileWithCallback:(void(^)(AZStream*, AZOperationError*))callback;

@end

/**
* The protocol implementation
*/
@class FL_AutoRestSwaggerBATFileServiceService;

@interface FL_Files : NSObject <FL_FilesProtocol>
@property (readonly) FL_AutoRestSwaggerBATFileServiceService *service;
- (instancetype)initWithService:(FL_AutoRestSwaggerBATFileServiceService *)service;
@end
