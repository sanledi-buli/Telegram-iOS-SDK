#import "TGModernSendMessageActor.h"

#import "TLMetaScheme.h"

@interface TGModernSendBroadcastMessageActor : TGModernSendMessageActor

- (void)sendBroadcastSuccess:(TLmessages_StatedMessages *)statedMessages;
- (void)sendBroadcastFailed;

@end
