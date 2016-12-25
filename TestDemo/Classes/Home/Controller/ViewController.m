//
//  ViewController.m
//  TestDemo
//
//  Created by ClearWB on 16/9/5.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+Dispatch.h"
#import "RegexKitLite.h"
/**
 *  项目名-Swift.h
 */
#import "TestDemo-Swift.h"


#import "UIViewController+Animation.h"
#import "ZHLCircleView.h"

#import <VBFPopFlatButton.h>
#import <VBFDoubleSegment.h>

#import <AVFoundation/AVFoundation.h>
#import "ReaderViewController.h"
#import "Animator.h"
#define TICK   CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define TOCK   NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)
@interface ViewController ()<UINavigationControllerDelegate>

@property (nonatomic,strong) UIColor  *strokeColor;
@property (nonatomic,strong) CAShapeLayer  *progressLayer;

@property (nonatomic,strong) NSTimer  *timer;
@property (nonatomic,strong) ZHLCircleView *circleView;

@property (nonatomic,strong) VBFPopFlatButton  *flatRoundedButton;
@end



@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self basicAnimation];
//    [self keyframeAnimation];
//    [self transitionAnimation];
    self.view.backgroundColor = [UIColor whiteColor];  // TODO: zhushi
//    [self.view roundRectWithCorners:UIRectCornerTopRight|UIRectCornerBottomRight cornerRadii:30];
//    [self cancelTask];

//    self.circleView = [[ZHLCircleView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [self.view addSubview:self.circleView];


//[NSObject mj_keyValuesArrayWithObjectArray:<#(NSArray *)#>]
//    [self mj_keyValuesWithKeys:<#(NSArray *)#>]
    

    NSLog(@"test");


    
    
}
#pragma mark - click
- (IBAction)button1Click:(id)sender {
    //
}
- (IBAction)button2click:(id)sender {

}


-(void)flatRoundedButtonPressed:(VBFPopFlatButton *)button{
//    static int a =buttonAddType;
//    if (a > 20) a= 0;
    int a = arc4random()%22;
    [button animateToType: a];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ReaderViewController *vc = [ReaderViewController new] ;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UINavigationControllerDelegate
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    return [Animator new];
}

-(void)xib{
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ZHLXibView" owner:self options:nil];
    UIView *tmpCustomView = [nib objectAtIndex:0];
    [self.view addSubview:tmpCustomView];
    
    [tmpCustomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(20, 0, 0, 0));
    }];
}



-(void)avplayer{
    AVAsset *asset = [AVAsset assetWithURL:[NSURL URLWithString:@"http://123.57.72.124:8050/open/wf/ad4e48da1832432a937860f03e9cb034.mp4?token=1db18e7270794909b6777a03f93a6e67"]];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];
    AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    [self.view.layer addSublayer:playerLayer];
    playerLayer.frame = self.view.layer.bounds;
    [player play];

}

@end
