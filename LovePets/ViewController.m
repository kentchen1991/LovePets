//
//  ViewController.m
//  LovePets
//
//  Created by chenshaohai on 15/9/16.
//  Copyright (c) 2015年 zf. All rights reserved.
//

#import "ViewController.h"
#import "PetsLogger.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
/*safe release*/
#undef TT_RELEASE_SAFELY
#define TT_RELEASE_SAFELY(__REF) \
{\
if (nil != (__REF)) \
{\
__REF = nil;\
}\
}
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import "NSDictionary+AXNetworkingMethods.h"
#import "NSString+AXNetworkingMethods.h"
#import "AIFNetworking.h"
#import "TestManager.h"
#import "TestTwoManager.h"
#import "TestType.h"
#import "NavController.h"
#import "TestViewController.h"

#import "MyMigrater.h"
#import "SQLiteManager.h"
#import <UIImageView+WebCache.h>
@interface ViewController ()<RTAPIManagerApiCallBackDelegate,RTAPIManagerParamSourceDelegate,RTAPIManagerValidator,RTAPIManagerInterceptor>
{
    SQLiteManager *dbManager;
}
@property (strong, nonatomic) TestManager *manager;
@property (strong, nonatomic) TestTwoManager *TestTwomanager;
@property (strong, nonatomic) TestViewController *tt;
@property (retain, nonatomic) dispatch_queue_t serialQueue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.manager = [[TestManager alloc]init];
//    self.manager.delegate = self;
//    self.manager.paramSource = self;
//    self.manager.validator = self;
//    self.manager.interceptor = self;
//    [self.manager loadData];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self test];
//    });
  
//    dbManager = [[SQLiteManager alloc] initWithDatabaseNamed:@"prueba.db"];
//    dbManager.migrator = [[MyMigrater alloc] init];
//    [dbManager openDatabase];
//    [dbManager.migrator sqliteManagerShouldMigrate:dbManager];
//    [dbManager.migrator sqliteManagerPerformMigrate:dbManager];
    
//    NSLog(@"%@, %@",dbManager.migrator.migrateList,dbManager.migrator.versionList);
    
    [self prepareViewController];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self goToViewController];
    });
    
    //分支测试123
}

- (dispatch_queue_t)serialQueue
{
    if (!_serialQueue) {
        _serialQueue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);//创建串行队列
    }
    return _serialQueue;
}

- (void)prepareViewController
{
    dispatch_async([self serialQueue], ^{//把block中的任务放入串行队列中执行，这是第一个任务
        self.tt = [[TestViewController alloc] init];
//        sleep(2);//假装这个viewController创建起来很花时间。。其实view都还没加载，根本不花时间。
        NSLog(@"prepared");
    });
}

- (void)goToViewController
{
    dispatch_async([self serialQueue], ^{//第二个任务，推入viewController
        NSLog(@"go");
        dispatch_async(dispatch_get_main_queue(), ^{//涉及UI更新的操作，放入主线程中
            [self presentViewController:self.tt animated:YES completion:nil];
        });
    });
}



-(void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    
}
//-(void)test{
//    
//    TestViewController *tt=[[TestViewController alloc]
//                            init];
//    tt.view.backgroundColor=[UIColor redColor];
////    NavController *nav=[[NavController alloc]initWithRootViewController:tt];
//    [self presentViewController:tt animated:YES completion:nil];
//}
//RTAPIManagerParamSourceDelegate xx
- (NSDictionary *)paramsForApi:(RTAPIBaseManager *)manager{
    //AIFSignatureGenerator 签名生成改成在这里做处理
    NSDictionary *dict = nil;
    if ([manager isKindOfClass:[TestTwoManager class]]) {
        dict = @{@"sign":@"/admin/me/sign"};
        
    }else{
        NSString *key = @"aa=bcc=d9636464a87f7e8503c6456c3fb53e103";//加个拼接参数方法
        key =[key AX_md5];//9ba8294608b7b95d8ce4fde609d917d2
        dict = @{@"aa":@"b",@"cc":@"d",@"sig":key};
    }
  
    return dict;
    
}
//RTAPIManagerApiCallBackDelegate
- (void)managerCallAPIDidSuccess:(RTAPIBaseManager *)manager {
    id value = [manager fetchDataWithReformer:nil];
    NSLog(@"value== %@",value);
}
- (void)managerCallAPIDidFailed:(RTAPIBaseManager *)manager{
    
}
- (BOOL)manager:(RTAPIBaseManager *)manager isCorrectWithCallBackData:(NSDictionary *)data {
    return YES;
}
- (BOOL)manager:(RTAPIBaseManager *)manager isCorrectWithParamsData:(NSDictionary *)data {
    return YES;
}

- (void)manager:(RTAPIBaseManager *)manager afterCallingAPIWithParams:(NSDictionary *)params {
    
}

//- (void)test {
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.requestSerializer=[AFHTTPRequestSerializer serializer];//设置请求数据
//    manager.responseSerializer=[AFHTTPResponseSerializer serializer];//设置返回数据
//
//    __unsafe_unretained typeof(self)share=self;
//    NSString *urlStr = @"http://demo.dodokai.com/api.php";
//    NSString *key = @"aa=bcc=d9636464a87f7e8503c6456c3fb53e103";
//    key =[self md5FromString:key];//9ba8294608b7b95d8ce4fde609d917d2
////
//    NSDictionary *DICT =@{@"aa":@"b",@"cc":@"d"};//,@"sig":key
//    NSString *str = [DICT AIF_urlParamsStringSignature:YES]; //1f6f14a941bbe159e03c4ddd09918e4f
//    NSLog(@"%@",str);
//    NSDictionary *dict = @{@"aa":@"b",@"cc":@"d",@"sig":key
//                           };
//    [manager POST:urlStr parameters:dict success:^(AFHTTPRequestOperation * operation, id responseObject) {
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:1 error:NULL];
//        NSLog(@"%@",dict);
//        NSLog(@"dict===%@",dict);
//        
//    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
//        
//    }];
// 
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (NSString *)md5FromString:(NSString *)str
//{
//    if (str == nil) return nil;
//    const char *cStr = [str UTF8String];
//    unsigned char result[16];
//    CC_MD5(cStr, (int)strlen(cStr), result); // This is the md5 call
//    return [NSString stringWithFormat:
//            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
//            result[0], result[1], result[2], result[3],
//            result[4], result[5], result[6], result[7],
//            result[8], result[9], result[10], result[11],
//            result[12], result[13], result[14], result[15]
//            ];
//}


@end
