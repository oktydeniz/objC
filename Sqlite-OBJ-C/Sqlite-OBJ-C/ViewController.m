//
//  ViewController.m
//  Sqlite-OBJ-C
//
//  Created by oktay on 26.06.2022.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupDB];
}

-(void)setupDB{
    EGODatabase *db = [EGODatabase databaseWithPath:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/database.sqlite3"]];
    
    //if [db open]
    EGODatabaseResult *result = [db executeQuery:@"CREATE TABLE IF NOT EXISTS KISI ('ID' INTEGER PRIMARY KEY NOT NULL UNIQUE , 'ISIM' VARCHAR(50), 'YAS' INTEGER, 'DOGUMTARIHI' INTEGER )"];
    
    NSDate *date =  [NSDate date];
    
    result = [db executeQuery:@" INSERT INTO KISI (ISIM,YAS,DOGUMTARIHI) VALUES (?,?,?)" parameters:@[@"Oktay Deniz",[NSNumber numberWithInt:24],[NSNumber numberWithInt:date.timeIntervalSince1970]]];
    
    result = [db executeQuery:@"INSERT INTO KISI (ISIM,YAS) VALUES ('Oktay',25)"];
    
    result = [db executeQuery:@"SELECT * FROM KISI"];
    //NSLog(@"Kisiler : %@", [result count]);
    
    for(EGODatabaseRow *row in result){
        
        NSLog(@"name : %@ age: %@ ", [row stringForColumn:@"ISIM"], [row intForColumn:@"YAS"]);
        
    }
    
    
}


@end
