//
//  ViewController.m
//  DosyaIslemleriOBJ-C
//
//  Created by oktay on 23.06.2022.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //okuma
    NSString *exception = nil;
    NSString *content = [InitFile initWithFileName:@"info" type:@"txt" exception:exception];
    if(!content) { NSLog(@"Error : %@", exception);}
    else {
        NSLog(@"Content : %@", content);
    }
    
    //yazma
    
    //dokumanlarin yerini return eder
    NSArray  *dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *doc = dirPath[0];
    NSLog(@"Path : %@",doc);
    NSMutableString *path = [[NSMutableString alloc] initWithString:doc];
    NSString *newContent = @"NEw Content String";
    [path appendString:@"/info.txt"];
    
    NSError *err;
    [newContent writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&err];
    if(err) { NSLog(@"Error");}
    else {
        NSLog(@"path : %@", path);
    }
    
    
    
    
    
    
    
}


@end
