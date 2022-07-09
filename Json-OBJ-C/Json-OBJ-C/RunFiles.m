//
//  InitFiles.m
//  Json-OBJ-C
//
//  Created by oktay on 26.06.2022.
//

#import "RunFiles.h"

@implementation RunFiles


+(NSString *)readFromMainBundleWithResource:(NSString *)resource andType:(NSString *)type exception:(NSException *)exception {
    
    NSString *icerik = nil;
    @try {
        NSString *path = [[NSBundle mainBundle] pathForResource:resource ofType:type];
        if( path ){
            icerik  = [NSString stringWithContentsOfFile:path
                                                encoding:NSUTF8StringEncoding
                                                   error:NULL];
        }
        else {
            exception = [[NSException alloc] init];
        }
    }
    @catch (NSException *hata) {
        exception = hata;
    }
    @finally {
        return icerik;
    }
}

+(NSString *) readFromDocDirectoryWithFileName:(NSString *) fileName exception:(NSException *) exception{

    NSString *icerik = nil;
    @try {
        NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docsDir = dirPaths[0];
        NSMutableString *path = [NSMutableString stringWithFormat:@"%@/%@",docsDir,fileName];
        if( !path ) {
            exception = [[NSException alloc] init];
        }
        else {
            icerik = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
        }
    }
    @catch (NSException *hata) {
        exception = hata;
    }
    @finally {
        return icerik;
    }
}

+(NSException *)writeToDocDirectoryWithFileName:(NSString *)fileName content:(NSString *)content {
    NSException *exception = nil;
    @try {
        NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docsDir = dirPaths[0];
        NSMutableString *path = [NSMutableString stringWithFormat:@"%@/%@",docsDir,fileName];
        
        if( !content ) { exception = [[NSException alloc] init]; }
        else {
        [content writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:NULL];
        }
    }
    @catch (NSException *hata) {
        exception = hata;
    }
    @finally {
        return exception;
    }
}


@end
