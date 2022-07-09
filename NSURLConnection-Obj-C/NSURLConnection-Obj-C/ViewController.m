//
//  ViewController.m
//  NSURLConnection-Obj-C
//
//  Created by oktay on 26.06.2022.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    //if connected
    _data = [NSMutableData data];
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    //when we take the data
    
    [_data appendData:data];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    //finish data
    NSString *str = [[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
    NSLog(@" length :  %lu", (unsigned long)[_data length]);
    NSLog(@" content :  %@", str);
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@" Error :  %@", error);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
   // [self senkronDataURL];
    
    //asenkron get method
    NSURL *url = [NSURL URLWithString:@"https://www.google.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
    
    
    //post
    
    NSMutableURLRequest *postMutable = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    postMutable.HTTPMethod = @"POST";
    [postMutable setValue:@"application/json; charset=utf-8" forKey:@"Content-Type"];
    NSString *postStr = @"Json Value Str";;
    
    NSData *postData = [postStr dataUsingEncoding:NSUTF8StringEncoding];
    postMutable.HTTPBody = postData;
    NSURLConnection *postConnection = [[NSURLConnection alloc ] initWithRequest:postMutable delegate:self startImmediately:NO];
    
    [postConnection start];
    
    
}

-(void) senkronDataURL{
    NSURL *url = [NSURL URLWithString:@"https://www.google.com"];
    NSString *str = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:NULL];
    
    NSLog(@" %@", str);
    
}


@end
