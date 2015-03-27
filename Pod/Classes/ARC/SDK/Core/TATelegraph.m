//
// TATelegraph.m
// Copyright (c) 2015, Hariton Batkov
// All rights reserved.

#import "TATelegraph.h"
#import "MTContext.h"
#import "MTDatacenterAddressSet.h"
#import "MTDatacenterAddress.h"
#import "MTRequestMessageService.h"
#import "MTProto.h"
#import "MTApiEnvironment.h"
#import "MTRequest.h"
#import "TGTelegraph.h"
#import "ASCommon.h"
@interface TATelegraph ()

-(instancetype)initWithApiId:(NSString *)apiID apiHash:(NSString *) apiHash datacenterAddress:(MTDatacenterAddress *)datacenterAddress;
@property (nonatomic, strong) TGTelegraph * telegraph;
@end

@implementation TATelegraph
static TATelegraph *sharedTelegraph;


+ (void) sendCodeToPhone:(NSString *) phone watcher:(id<ASWatcher>)watcher  {
    [[TATelegraph sharedTelegraph] sendCodeToPhone:phone watcher:watcher];
}

- (void) sendCodeToPhone:(NSString *) phone watcher:(id<ASWatcher>)watcher {
    [ActionStageInstance() requestActor:[NSString stringWithFormat:@"/tg/service/auth/sendCode/(%d)", 0]
                                options:[NSDictionary dictionaryWithObjectsAndKeys:phone, @"phoneNumber", nil]
                                watcher:watcher];
}
#pragma mark - Getters


#pragma mark - Initialization

+ (void) startWithApiId:(NSString *)apiID apiHash:(NSString *) apiHash {
    NSAssert([apiID length], @"You need to provide non-empty apiID");
    NSAssert([apiHash length], @"You need to provide non-empty apiHash");
    //Dispatching it once.
    static dispatch_once_t onceToken;
    NSAssert(!onceToken, @"You can't call startWithApiId:apiHash: twice");
    
    dispatch_once(&onceToken, ^{
        sharedTelegraph = [[self alloc] initWithApiId:apiID apiHash:apiHash];
    });
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
-(instancetype)initWithApiId:(NSString *)apiID apiHash:(NSString *) apiHash {
    if (self = [super init]) {
        self.telegraph = [[TGTelegraph alloc] init];
        [self.telegraph setApiId:apiID];
        [self.telegraph setApiHash:apiHash];
    }
    return self;
}
#pragma clang diagnostic pop

+ (instancetype) sharedTelegraph {
    NSAssert(sharedTelegraph, @"You need to call startWithApiId:apiHash:datacenterAddress: before start using telegraph");
    return sharedTelegraph;
}

@end
