//
//  MyMigrater.m
//  SQLiteManagerExample
//
//  Created by casa on 15/1/20.
//
//

#import "MyMigrater.h"
#import "SQLiteManager.h"

@implementation MyMigrater

@synthesize migrateList = _migrateList;
@synthesize versionList = _versionList;

#pragma mark - getters and setters
- (NSDictionary *)migrateList
{
    if (_migrateList == nil) {
        SQLiteManagerMigrateObject *migrate0_1 = [[SQLiteManagerMigrateObject alloc] init];
        migrate0_1.upSql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);", kIGLocalStorageTableNameSystemMessage];
        migrate0_1.downSql = [NSString stringWithFormat:@"DROP TABLE IF EXISTS %@;", kIGLocalStorageTableNameSystemMessage];
        
        SQLiteManagerMigrateObject *migrate0_2 = [[SQLiteManagerMigrateObject alloc] init];
        migrate0_2.upSql = [NSString stringWithFormat:@"INSERT INTO %@ (name) VALUES ('草纸白');", kIGLocalStorageTableNameSystemMessage];
        SQLiteManagerMigrateObject *migrate0_3 = [[SQLiteManagerMigrateObject alloc] init];
        
        migrate0_3.upSql = [NSString stringWithFormat:@"INSERT INTO %@ (name) VALUES ('赶羚羊');", kIGLocalStorageTableNameSystemMessage];
        _migrateList = @{@"0.2":migrate0_1, @"0.3":migrate0_2,@"0.4":migrate0_3};
    }
    return _migrateList;
}

- (NSArray *)versionList
{
    if (_versionList == nil) {
        _versionList = @[kSQLiteVersionDefaultVersion, @"0.2", @"0.3", @"0.4"];
    }
    return _versionList;
}

@end
