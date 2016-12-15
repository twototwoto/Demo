//
//  JSHanledWebViewController.m
//  OC&JS的交互
//
//  Created by 王永旺永旺 on 2016/12/14.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//
//

#import "JSHanledWebViewController.h"

//1.遵守协议
@interface JSHanledWebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation JSHanledWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //2.设置代理
    self.webView.delegate = self;
    [self loadWebView];
    
}

#pragma mark - 加载webView
- (void)loadWebView{
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.dianping.com/tuan/deal/66666"]]];
    //关闭webView的弹簧效果
    self.webView.scrollView.bounces = NO;
    //隐藏滚动条
    self.webView.scrollView.showsVerticalScrollIndicator = NO;


}

//3.实现相应代理方法
#pragma mark - Sent after a web view finishes loading a frame.
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSMutableString *jsStrM = [NSMutableString string];
    
    //参考w3c: http://www.w3school.com.cn/js/js_htmldom.asp
    //注意取出来的是个数组，注意指定下标
    //取到顶部的导航栏
    [jsStrM appendString:@"var header = document.getElementsByTagName('header')[0];"];
    [jsStrM appendString:@"header.parentNode.removeChild(header);"];
    
    //取到网页轮播器下的 立即购买
    [jsStrM appendString:@"var costBox = document.getElementsByClassName('cost-box')[0];"];
    [jsStrM appendString:@"costBox.parentNode.removeChild(costBox);"];
    
    //取到灰色的立即购买
    [jsStrM appendString:@"var buy = document.getElementsByClassName('buy-now btn-gray')[0];"];
    [jsStrM appendString:@"buy.parentNode.removeChild(buy);"];
    
    //取到底部的首页 点评团...
    [jsStrM appendString:@"var footer = document.getElementsByClassName('footer')[0];"];
    [jsStrM appendString:@"footer.parentNode.removeChild(footer);"];
    
    //取到黄色的立即购买按钮
    [jsStrM appendString:@"var footerBtn = document.getElementsByClassName('footer-btn-fix')[0];"];
    [jsStrM appendString:@"footerBtn.parentNode.removeChild(footerBtn);"];
    
    //The stringByEvaluatingJavaScriptFromString: method waits synchronously for JavaScript evaluation to complete.
    [webView stringByEvaluatingJavaScriptFromString:jsStrM];
    

}


- (void)test{
    
    
    //#import "JSHanledWebViewController.h"
    //
    //@interface JSHanledWebViewController ()<UIWebViewDelegate>
    //@property (weak, nonatomic) IBOutlet UIWebView *webView;
    //
    //@end
    //
    //@implementation JSHanledWebViewController
    //
    //- (void)viewDidLoad {
    //    [super viewDidLoad];
    //
    //    self.webView.delegate = self;
    //    [self loadWebView];
    //
    //}
    //
    //#pragma mark - 记载webView
    //- (void)loadWebView{
    //
    //    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.dianping.com/tuan/deal/66666"]]];
    //    //关闭webView的弹簧效果
    //    self.webView.scrollView.bounces = NO;
    //    //隐藏滚动条
    //    self.webView.scrollView.showsVerticalScrollIndicator = NO;
    //
    //
    //}
    //
    //- (void)webViewDidFinishLoad:(UIWebView *)webView{
    //
    //
    //    NSMutableString *jsStrM = [NSMutableString string];
    //
    //    //参考w3c: http://www.w3school.com.cn/js/js_htmldom.asp
    //    //注意取出来的是个数组，注意指定下标
    //    //处理顶部的导航栏
    //    [jsStrM appendString:@"var header = document.getElementsByTagName('header')[0];"];
    //    //删除标签
    //    [jsStrM appendString:@"header.parentNode.removeChild(header);"];
    //
    //    //删除网页轮播器下的立即购买
    //    [jsStrM appendString:@"var costBox = document.getElementsByClassName('cost-box')[0];"];
    //    //删除标签
    //    [jsStrM appendString:@"costBox.parentNode.removeChild(costBox);"];
    //
    //    //删除灰色的立即购买
    //    [jsStrM appendString:@"var buy = document.getElementsByClassName('buy-now btn-gray')[0];"];
    //    //删除标签
    //    [jsStrM appendString:@"buy.parentNode.removeChild(buy);"];
    //
    //    //取到底部的首页 点评团...
    //    [jsStrM appendString:@"var footer = document.getElementsByClassName('footer')[0];"];
    //    //删除标签
    //    [jsStrM appendString:@"footer.parentNode.removeChild(footer);"];
    //
    //    //取到黄色的立即购买按钮
    //    [jsStrM appendString:@"var footerBtn = document.getElementsByClassName('footer-btn-fix')[0];"];
    //    //删除标签
    //    [jsStrM appendString:@"footerBtn.parentNode.removeChild(footerBtn);"];
    //
    //    //如果想尝试一下通过id的方式获取到节点，并且删除可以试试
    //    //取到顶部的靓女轮播器
    //    //    [jsStrM appendString:@"var headbar = document.getElementsByClassName('headbar')[0];"];
    //    //    //删除标签
    //    //    [jsStrM appendString:@"headbar.parentNode.removeChild(headbar);"];
    //
    //
    //
    //    //    //取到顶部的靓女轮播器和更多的部分
    //    //    [jsStrM appendString:@"var contentGroup = document.getElementsByClassName('content group-info')[0];"];
    //    //    //删除标签
    //    //    [jsStrM appendString:@"contentGroup.parentNode.removeChild(contentGroup);"];
    //    
    //    
    //    
    //    
    //    
    //    [webView stringByEvaluatingJavaScriptFromString:jsStrM];
    //    
    //}
    //
    //
    //
    //@end
    
}

@end



