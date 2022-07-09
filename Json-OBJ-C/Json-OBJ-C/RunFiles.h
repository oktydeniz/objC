//
//  InitFiles.h
//  Json-OBJ-C
//
//  Created by oktay on 26.06.2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RunFiles : NSObject

+(NSString *) readFromMainBundleWithResource:(NSString *)resource andType:(NSString *)type exception:(NSException *)exception;
+(NSString *) readFromDocDirectoryWithFileName:(NSString *)fileName exception:(NSException *)exception;
+(NSException *) writeToDocDirectoryWithFileName:(NSString *)fileName content:(NSString*) content;


@end

NS_ASSUME_NONNULL_END
