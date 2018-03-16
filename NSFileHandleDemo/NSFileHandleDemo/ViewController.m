//
//  ViewController.m
//  NSFileHandleDemo
//
//  Created by chenronghang on 2018/3/16.
//  Copyright © 2018年 Baidu Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSFileHandle *fileHandle;
    NSString *_name;
}
@property (strong, nonatomic) IBOutlet UILabel *freeLable;
@property (strong, nonatomic) IBOutlet UILabel *totalLabel;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _indicatorView.hidesWhenStopped = YES;
    _indicatorView.hidden = YES;
    [self updateTotalSize];
    [self updateFreeSize];
}
- (IBAction)writeData:(id)sender
{
    _name = [[NSDate date]description];
    _indicatorView.hidden = NO;
<<<<<<< Updated upstream
=======
    _goBtn.enabled = NO;
>>>>>>> Stashed changes
    [_indicatorView startAnimating]; dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self writeDataToDoc];
        dispatch_async(dispatch_get_main_queue(),
                       ^{
                           [_indicatorView stopAnimating];
<<<<<<< Updated upstream
=======
                            _goBtn.enabled = YES;
>>>>>>> Stashed changes
                       });
    });
    
}

- (void)writeDataToDoc
{
<<<<<<< Updated upstream
    long  dataItemLen = 78*1024*1024;
    long  needWriteLength = [self getDiskFreeSize];
=======
    long  dataItemLen = 13.2*1024*1024;
    long buffer = 500*1024*1024;//预留空间
    long  needWriteLength = [self getDiskFreeSize]-buffer;
    if (needWriteLength<0) {
        needWriteLength = 0;
    }
>>>>>>> Stashed changes
    long num = needWriteLength/dataItemLen;
    @try {
        NSLog(@"^start....");
        for (int i=0; i<num+1;i++)
        {
            @autoreleasepool
            {
                NSLog(@"^%d",i);
<<<<<<< Updated upstream
                NSString *filePath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:[@"date.txt" stringByAppendingFormat:@"writeDataToDoc_%d",i]];
=======
                NSString *filePath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:[@"data.pdf" stringByAppendingFormat:@"%@_%d",_name,i]];
>>>>>>> Stashed changes
                NSFileManager *fm = [NSFileManager defaultManager];
                [fm createFileAtPath:filePath contents:nil attributes:nil];
                
                fileHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
                NSString *filepath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"data"];
                NSData *data = [NSData dataWithContentsOfFile:filepath];
                [fileHandle writeData:data];
                data = nil;
                [fileHandle closeFile];
                dispatch_async(dispatch_get_main_queue(),
                               ^{
                                   [self updateFreeSize];
                               });
            }
        }
        NSLog(@"^end....");
    } @catch (NSException *exception) {
        dispatch_async(dispatch_get_main_queue(),
                       ^{
                           [self updateFreeSize];
<<<<<<< Updated upstream
=======
                           _goBtn.enabled = YES;
>>>>>>> Stashed changes
                       });
    } @finally {
        
    }
}
- (long long)getDiskFreeSize {
    NSDictionary *fsAttr = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    unsigned long long diskSize = [[fsAttr objectForKey:NSFileSystemFreeSize] longLongValue];
    return diskSize;
}
- (long long)totalDiskspace {
    NSDictionary *fsAttr = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [fsAttr[NSFileSystemSize] longLongValue];
}

- (void)updateTotalSize
{
    float total = [self totalDiskspace]/1024.0f/1024.0f/1024.0f;
    NSString *size = [NSString stringWithFormat:@"%fGB",total];
    _totalLabel.text = size
    ;
}
- (void)updateFreeSize
{
    float total = [self getDiskFreeSize]/1024.0f/1024.0f/1024.0f;
    NSString *size = [NSString stringWithFormat:@"%fGB",total];
    _freeLable.text = size
    ;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
