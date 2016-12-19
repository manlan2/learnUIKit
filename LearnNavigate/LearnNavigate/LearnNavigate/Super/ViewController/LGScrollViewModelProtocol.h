//
//  LGScrollViewModelProtocol
//  shop
//
//  Created by 唐开福 on 16/9/24.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#ifndef LGTableViewViewModelProtocol_h
#define LGTableViewViewModelProtocol_h

@protocol LGViewControllerRequestHandleProtocol <NSObject>

@required;
- (void)successRequestRemoteData:(id )data
                     requestPage:(NSUInteger)page
                requestParameter:(NSDictionary *)parameter
                   containerView:(UIScrollView *)containerView;


- (void)failRequestRemotedWithError:(NSError *)error
                        requestPage:(NSUInteger)page
                   requestParameter:(NSDictionary *)parameter
                      containerView:(UIScrollView *)containerView;

@end



@protocol LGContainerViewRequestProtocol <NSObject>
- (void)requestFirstPage;
- (void)requestNextPage;
- (void)requestWithPage:(NSUInteger)page;
- (void)requestWithParameter:(NSDictionary *)parameter;
- (void)request:(NSString *)urlString  WithParameter:(NSDictionary *)parameter; // 如果前面初始化的时候没有设置urlString, 就要设置，如果有就可以不用设置

@end

@protocol LGMultiContainerViewRequestProtocol <LGContainerViewRequestProtocol>
- (void)requestFirstpageWithContainerView:(UIScrollView *)containerView;
- (void)requestNextpageWithContainerView:(UIScrollView *)containerView;
- (void)requestWithPage:(NSUInteger)page withContainerView:(UIScrollView *)containerView;;
- (void)requestWithParameter:(NSDictionary *)parameter withContainerView:(UIScrollView *)containerView;
- (void)request:(NSString *)urlString  withParameter:(NSDictionary *)parameter withContainerView:(UIScrollView *)containerView;
@end

#endif /* LGTableViewViewModelProtocol_h */
